import 'dart:convert';
// Import the dart:js library
import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/identify_ingredients.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

import 'recipes.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = MultiImagePickerController(
    maxImages: 10,
    withReadStream: true,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
  );

  // @override
  // void initState() {
  //   super.initState();
  //   // Register a message handler to receive messages from JavaScript
  //     js.context['onBrowserBack'] = () {
  //     // Handle the back button action here
  //     // You can navigate back, or perform any other action
  //     // For example, pop the current route if it's a modal dialog
  //     if (Navigator.of(context).canPop()) {
  //       Navigator.of(context).pop();
  //     }
  //   };
  // }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MultiImagePickerView(
              onChange: (list) {
                debugPrint(list.toString());
              },
              controller: controller,
              padding: const EdgeInsets.all(10),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : () async {
          setState(() {
            isLoading = true; // Set loading state
          });
          final images = controller.images;

          var response = await sendImagesRequest(images);
          var decodedResponse = json.decode(response);
          String displayResult= "None";

          if (response.isNotEmpty) {
            displayResult= json.encode(decodedResponse);
          }
          // print(displayResult);
          Map<String, dynamic> jsonResponse = json.decode(response);
          String recipesJsonString = jsonResponse['Recipes'];

          // Parse the "Recipes" JSON string to get the list of recipe objects
          List<dynamic> recipes = json.decode(recipesJsonString);

          // Create a list to store the recipes as dictionaries
          List<Map<String, dynamic>> recipeList = [];

          // Iterate over the recipes to build the dictionary
          for (var recipe in recipes) {
            String title = recipe['title'];
            List<dynamic> ingredients = recipe['ingredients'];
            String cookingTime = recipe['cooking time'];

            // Create a dictionary for the current recipe
            Map<String, dynamic> recipeDict = {
              'title': title,
              'ingredients': ingredients,
              'cooking time' : cookingTime
            };

            // Add the recipe dictionary to the list
            recipeList.add(recipeDict);
          }


          setState(() {
            isLoading = false; // Reset loading state
          });

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RecipesPage(recipeList: recipeList),),
          );

          // use these images
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  displayResult
              )
          )
          );
        },
        child: isLoading ? const CircularProgressIndicator() : const Icon(Icons.rocket_launch),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}