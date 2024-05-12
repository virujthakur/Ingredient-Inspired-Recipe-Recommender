import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/login/loginpage.dart';

import '../components/my_button.dart';
import '../components/my_circle_icon.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser(){}

  @override
  Widget build(BuildContext context) {

    void navigateBackToSignIn(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  const MyCircularIcon(imagePath: 'assets/icons/icon_hd.png'),

                  const SizedBox(
                    height:50,
                  ),

                  //welcome back you have been missed
                  Text(
                    'Start your journey with us!',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  
                  const SizedBox(height: 20,),

                  //sign in button
                  MyButton(onTap: registerUser, text: 'Register',),
                  
                  const SizedBox(height: 20,),

                  Text(
                    'Already a user?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),

                  const SizedBox(height: 20,),

                  MyButton(onTap: navigateBackToSignIn, text: 'Sign In',),

                  const SizedBox(height: 20,),
                ]
            ),
          )
      ),
    );
  }
}
