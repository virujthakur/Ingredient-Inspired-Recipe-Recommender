import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
const List<String> scopes = <String>[
  'email',
  'profile'
];

class GoogleSignInApi{
  static const _clientIDWeb = '890460009804-jde1dgseb2qcfm4b99ncramhstd9cooj.apps.googleusercontent.com';
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId: _clientIDWeb,
    scopes: scopes,
  );

  static GoogleSignInAccount? _user;

  static bool _isAuthorized= false;

  static String _contactText= '';

  static void setAccount(GoogleSignInAccount? value)
  {
    _user= value;
  }

  static void setAuthorization(bool value)
  {
      _isAuthorized = value;
  }

  static GoogleSignInAccount? getAccount()
  {
    return _user;
  }

  static bool getAuthourization(){
    return _isAuthorized;
  }


  static GoogleSignIn getGoogleSignInInstance()
  {
    return _googleSignIn;
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

}