import 'package:flutter/material.dart';
import 'package:textify_demo/pages/login_page.dart';
import 'package:textify_demo/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglepage(){
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(onTap: togglepage,);
    } else {
      return RegisterPage(onTap: togglepage,);
    }
  }
}