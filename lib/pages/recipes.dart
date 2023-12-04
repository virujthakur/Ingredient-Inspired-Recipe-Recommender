import 'package:flutter/material.dart';
import 'recipecard.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4/3
          ),
          itemBuilder: (context, index){
              return RecipeCard();
          }
      ),
    );
  }
}
