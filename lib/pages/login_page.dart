import 'package:flutter/material.dart';
import 'package:textify_demo/services/auth/AuthService.dart';
import 'package:textify_demo/component/my_button.dart';
import 'package:textify_demo/component/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController= TextEditingController();

   final TextEditingController _pwController= TextEditingController();
  //  final TextEditingController _confirmPwController= TextEditingController();
  void Function()? onTap;
   LoginPage({super.key,required this.onTap});
   void login(BuildContext context) async{
   final authservice= Authservice();
   try{
    await authservice.signInWithEmailPassword(_emailController.text, _pwController.text);
   }
   catch (e){
    showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(e.toString()),
    ),);
   }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, size: 60,color: Theme.of(context).colorScheme.primary,),
            SizedBox(height: 50,),
            Text("Welcome back, you've been missed!",
            style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
            ),
            SizedBox(height: 50,),
            MyTextfield(hintText: "Email",obscureText: false,controller: _emailController,),
            SizedBox(height: 10,),
               MyTextfield(hintText: "Password",obscureText: true,controller: _pwController,),
                SizedBox(height: 25,),
               MyButton(text: "Login",onTap: ()=>login(context),),
                 SizedBox(height: 25,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Not a member ?",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                     GestureDetector(
                      onTap: onTap,
                      child: Text("Register Now",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),))
                   ],
                 )


          ],
        ),
      ),
    );
  }
}
