import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:textify_demo/services/auth/loginOrRegister.dart';
import 'package:textify_demo/pages/home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot){
          if(snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegister();
          }
         }),
    );
  }
}