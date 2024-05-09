import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_button.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_circle_icon.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_textfield.dart';
import 'package:ingredient_inspire_recipe_recommender/homepage.dart';
import 'package:ingredient_inspire_recipe_recommender/login/profilepage.dart';
import '../components/square_tile.dart';
import '../sign_in_button/mobile.dart';
import 'GoogleSignInApi.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController= TextEditingController();
  final passwordController= TextEditingController();
  final _googleSignIn = GoogleSignInApi.getGoogleSignInInstance();

  //meth
  void signUserInWithEmail(){

  }

  @override
  Widget build(BuildContext context) {
    Future<void> signInWithGoogle() async{
      _googleSignIn.signIn();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen(),),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              //logo
              MyCircularIcon(imagePath: 'assets/icons/icon_hd.png'),
          
              const SizedBox(
                height:50,
              ),
          
              //welcome back you have been missed
              Text(
                  'Welcome Back, You have been missed!',
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
          
              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
          
              //sign in button
              MyButton(onTap: signUserInWithEmail, text: 'Sign In',),
          
              const SizedBox(height: 50,),
          
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 50),
          
          // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  buildSignInButton(
                    onPressed: signInWithGoogle,
                  ),
          
                  const SizedBox(width: 25),
          
                  // apple button
                  const SquareTile(imagePath: 'assets/images/apple_logo.png')
                ],
              ),
          
            const SizedBox(height: 50),
          
          // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,)
            ]
          ),
        )
      ),
    );
  }
}
