import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_button.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_navbar.dart';
import 'package:ingredient_inspire_recipe_recommender/login/GoogleSignInApi.dart';
import 'package:ingredient_inspire_recipe_recommender/login/loginpage.dart';

import '../homepage.dart';
import '../sign_in_button/mobile.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GoogleSignInAccount? _currentUser = GoogleSignInApi.getAccount();
  bool _isAuthorized = GoogleSignInApi.getAuthourization();
  String _contactText = '';
  final _googleSignIn = GoogleSignInApi.getGoogleSignInInstance();

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
// #docregion CanAccessScopes
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, on web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }
// #enddocregion CanAccessScopes

      GoogleSignInApi.setAccount(account);
      GoogleSignInApi.setAuthorization(isAuthorized);
      setState(() {
        _currentUser= account;
        _isAuthorized= true;
      });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (GoogleSignInApi.getAuthourization()) {
        //TODO call api
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }

  // Prompts the user to authorize `scopes`.
  //
  // This action is **required** in platforms that don't perform Authentication
  // and Authorization at the same time (like the web).
  //
  // On the web, this must be called from an user interaction (button click).
  // #docregion RequestScopes
  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    // #enddocregion RequestScopes
    GoogleSignInApi.setAuthorization(isAuthorized);
    setState(() {
      _isAuthorized = true;
    });
    // #docregion RequestScopes
    if (isAuthorized) {
      //TODO call api
    }
    // #enddocregion RequestScopes
  }

  Future<void> signOutFromGoogle() async{
    _googleSignIn.signOut();
    GoogleSignInApi.setAccount(null);
    GoogleSignInApi.setAuthorization(false);
    print(GoogleSignInApi.getAccount());
    setState(() {
      _currentUser=  null;
      _isAuthorized = false;

    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
  }

  void goBackToLoginScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void goToHomeScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget _buildBody() {
    final GoogleSignInAccount? user = GoogleSignInApi.getAccount();
    // print(user);
    if (user != null) {
      // The user is Authenticated
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: user,
              ),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            const SizedBox(height: 50,),
            const Text('Signed in successfully.'),
            if (_isAuthorized) ...<Widget>[
              const SizedBox(height: 50,),
              // The user has Authorized all required scopes
              Text(_contactText),
              MyButton(
                onTap: (){},
                text: 'Refresh',
              ),
            ],
            if (!_isAuthorized) ...<Widget>[
              const SizedBox(height: 50,),
              // The user has NOT Authorized all required scopes.
              // (Mobile users may never see this button!)
              const Text('Additional permissions needed to read your contacts.'),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: _handleAuthorizeScopes,
                child: const Text('REQUEST PERMISSIONS'),
              ),
            ],
            if (_isAuthorized) ...<Widget>[
              const SizedBox(height: 50,),
              // The user has NOT Authorized all required scopes.
              // (Mobile users may never see this button!)
              const Text('Please continue to home screen'),
              MyButton(
                onTap: goToHomeScreen,
                text: 'Home Screen',
              ),
            ],
            const SizedBox(height: 50,),
            MyButton(
              onTap: signOutFromGoogle,
              text: 'Sign Out',
            ),
          ],
        ),
      );
    } else {
      // The user is NOT Authenticated
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('You are not currently signed in.'),
          // This method is used to separate mobile from web code with conditional exports.
          // See: src/sign_in_button.dart
          const SizedBox(height: 50,),
          MyButton(onTap: goBackToLoginScreen, text: 'Sign In',)
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        )
    );
  }
}
