import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stage/Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

            RaisedButton(
              onPressed: signIn,
              child: Text('Connexion'),
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
        AuthResult user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        print("erreur de connexion");
        print(e.message);
      }
      
    }
  }
}