import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stage/Pages/home.dart';
import 'package:flutter_stage/src/signIn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  String _email, _password, _passwordSecond;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  var passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Sign in'),
      ),
      body: Form (
        key: _formKey,
        child: Column(
          children: <Widget>[

            TextFormField(
              validator:  (input) {
                if (input.isEmpty) {
                  return 'Entrez une email svp';
                }
              },
              onSaved: (input) => _email = input,
              decoration:  InputDecoration(
                labelText: 'Email'
              ),
            ),

            TextFormField(
              key: passKey,
              validator:  (input) {
                if (input.length < 6) {
                  return 'Mot de passe doit contenir au moin 6 characteres';
                }
              },
              onSaved: (input) => _password = input,
              decoration:  InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),

            TextFormField(
              
              onSaved: (input) => _passwordSecond = input,
              decoration:  InputDecoration(
                labelText: 'Confirm Password'
              ),
              obscureText: true,
              validator:  (input) {
                var password = passKey.currentState.value;
                if (input != password)
                {
                  return 'Mot de passe differents';
                }
              },
            ),

            RaisedButton(
              onPressed: signIn,
              child: Text('Inscription'),
            )

          ],
        ),
      )
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    // print(formState);
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    if (formState.validate()){
      formState.save();
      try{
        AuthResult user =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.user .sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        print("erreur d'inscription");
        print(e.message);
      }
      
    }
  }
}