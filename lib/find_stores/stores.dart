import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_button.dart';
import 'package:ingredient_inspire_recipe_recommender/find_stores/searchstores.dart';
import 'package:ingredient_inspire_recipe_recommender/find_stores/storeslist.dart';

import '../models/store.dart';
class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  bool isLoading= false;

  Future<void> _onSearchButtonPressed(
      ) async{
    print('sending request');
    var response = await sendStoresRequest();
    var decodedResponse = json.decode(response);
    String displayResult= "None";

    if (response.isNotEmpty) {
      displayResult= json.encode(decodedResponse);
    }
    // print(displayResult);
    Map<String, dynamic> jsonResponse = json.decode(response);
    String recipesJsonString = jsonResponse['Supermarkets'];

    // Parse the "Recipes" JSON string to get the list of recipe objects
    List<dynamic> stores = json.decode(recipesJsonString);

    // Create a list to store the recipes as dictionaries
    List<Store> storeList = [];

    // Iterate over the recipes to build the dictionary
    for (var store in stores) {
      String address = store['address'];
      double distance = store['distance'];

      // Create a Recipe for the current recipe
      Store s= Store(address: address, distance: distance);
      storeList.add(s);

    }


    setState(() {
      isLoading = false; // Reset loading state
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoresListPage(storeList: storeList),),
    );

    // use these images
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(
    //         displayResult
    //     )
    // )
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find nearby stores'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(text: 'Locate stores!', onTap: isLoading ? null : () async {
              await _onSearchButtonPressed();
            }),
          ],
        ),
      ),
    );
  }
}
