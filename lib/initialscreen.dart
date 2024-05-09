import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ingredient_inspire_recipe_recommender/homepage.dart';
import 'package:ingredient_inspire_recipe_recommender/login/loginpage.dart';

import 'login/GoogleSignInApi.dart';
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isUserPresent= GoogleSignInApi.getAccount() != null? true: false;

  Widget _buildScreen(){
    var _googleSignIn = GoogleSignInApi.getGoogleSignInInstance();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
// #docregion CanAccessScopes
      // In mobile, being authenticated means being authorized...
      bool isUserPresent = account != null;


      setState((){
        _isUserPresent = isUserPresent;
      });

      print(_isUserPresent);

// #enddocregion CanAccessScopes
    });

    print(_isUserPresent);
    if (_isUserPresent) {
      return HomePage();
    }
    else{
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildScreen();
  }
}
