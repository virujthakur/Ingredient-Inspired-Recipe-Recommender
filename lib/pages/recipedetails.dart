import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
;
import 'package:flutter/widgets.dart';

import '../models/recipe.dart';
class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //recipe image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                            tag: widget.recipe.name,
                            child: Image.asset(widget.recipe.imagePath)
                        )
                    ),
                  ),
                ]
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //recipe name
                  Text(widget.recipe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),

                  //recipe description
                  Text(widget.recipe.description.toString()),

                  //recipe cooking time
                  Text(widget.recipe.cookingTime),
                ],
              ),
            )
            //others
          ],
        ),
      ),
    );
  }
}
