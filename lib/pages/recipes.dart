import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'recipecard.dart';

class RecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> recipeList;

  const RecipesPage({Key? key, required this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the screen size
    final screenWidth = MediaQuery.of(context).size.width;

    // Define grid settings
    int crossAxisCount;
    double aspectRatio;

    // If the screen width is larger than a certain threshold, set web layout
    if (screenWidth > 800) {
      crossAxisCount = 3;
      aspectRatio = 16 / 9;
    } else {
      // For mobile devices, keep the layout as is
      crossAxisCount = 2;
      aspectRatio = 4 / 3;
    }
    return WillPopScope(
        onWillPop: () async {
          // Check if we can pop a route from the Navigator stack
          if (Navigator.of(context).canPop()) {
            // If yes, pop the route and return false to prevent the default behavior
            Navigator.of(context).pop();
            return false;
          }
          // If no route to pop, return true to allow default behavior (exit the app or navigate back)
          return true;
        },
      child: Scaffold(
        body: GridView.builder(
            itemCount: recipeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio
            ),
            itemBuilder: (context, index){
                var recipeData= recipeList[index];
                return RecipeCard(title:recipeData['title'], description: recipeData['ingredients'].toString(), cookingTime: recipeData['cooking time'],);
            }
        ),
      ),
    );
  }
}
