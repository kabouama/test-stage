import 'package:flutter/material.dart';
import 'package:flutter_stage/src/signIn.dart';
import 'package:flutter_stage/src/signUp.dart';

class LogSub extends StatefulWidget {
  @override
  _LogSubState createState() => _LogSubState();
}

class _LogSubState extends State<LogSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription / Connexion'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: NavigateToSignUp,
            child: Text('Inscription'),
          ),
          RaisedButton(
            onPressed: NavigateToSignIn,
            child: Text('Connexion'),
          ),
        ],
      )
    );
  }

  void NavigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
    //------ fullscreenDialog: true -> permet de mettre la page avec fermutre X et non un retour
  }

  void NavigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}