import 'package:flutter/material.dart';
import 'package:textify_demo/services/auth/AuthService.dart';
import 'package:textify_demo/services/auth/authGate.dart';
import 'package:textify_demo/component/my_button.dart';
import 'package:textify_demo/component/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController= TextEditingController();

   final TextEditingController _pwController= TextEditingController();
      final TextEditingController _confirmPwController= TextEditingController();
void Function()?onTap;
   RegisterPage({super.key,required this.onTap});
   void register(BuildContext context)async{
   if(_confirmPwController.text==_pwController.text){
    try{
       final auth = Authservice();
    auth.CreateAnAccount(_emailController.text, _pwController.text);
    } catch (e){
      showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(e.toString()),
    ),);
    }
   }
   else{
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text("password same nhi hn bhai"),
      )
    );
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
            Text("Let's create an account for you",
            style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
            ),
            SizedBox(height: 50,),
            MyTextfield(hintText: "Email",obscureText: false,controller: _emailController,),
            SizedBox(height: 10,),
               MyTextfield(hintText: "Password",obscureText: true,controller: _pwController,),
                SizedBox(height: 10,),
               MyTextfield(hintText: "Confirm password",obscureText: true,controller: _confirmPwController,),
                SizedBox(height: 25,),
               MyButton(text: "Register",onTap: ()=>register(context),),
                 SizedBox(height: 25,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Already have an account ?",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                     GestureDetector(
                      onTap: onTap,
                      child: Text("Login now",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),))
                   ],
                 )


          ],
        ),
      ),
    );
  }
}