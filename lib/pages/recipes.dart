import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/models/recipe.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/newRecipeCard.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/recipedetails.dart';
import 'recipecard.dart';

class RecipesPage extends StatelessWidget {
  final List<Recipe> recipeList;
  RecipesPage({Key? key, required this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the screen size
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (context, index) {
            var recipeData = recipeList[index];
            return NewRecipeCard(
                recipe: recipeData,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetails(recipe: recipeData))));
          }),
    );
  }
}
