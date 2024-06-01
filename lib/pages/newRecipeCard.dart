import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function()? onTap;

  const NewRecipeCard({
    Key? key,
    required this.recipe,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  // text recipe details
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ // Add widgets to display recipe information here
                      Text(recipe.name,
                      style: const TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold
                      ),), // Example
                      Text(recipe.description.toString()), // Example
                      const SizedBox(height: 10,),
                      Text(recipe.cookingTime.toString()),

                    ],
                  ),
                ),

                const SizedBox(width: 15,),

                //recipe image
                Hero(
                  tag: recipe.name,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(recipe.imagePath, height: 100,)
                  ),
                )
              ],
            ),
          ),
        ),

        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 25,
          endIndent: 25,
        )
      ],
    );
  }
}
