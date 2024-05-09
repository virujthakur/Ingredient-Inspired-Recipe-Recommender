import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_button.dart';
import 'package:ingredient_inspire_recipe_recommender/components/square_tile.dart';

import 'stub.dart';

/// Renders a SIGN IN button that calls `handleSignIn` onclick.
Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return SquareTile(
    imagePath: 'assets/images/google_logo.png',
    onPressed: onPressed,
  );
}