import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/identify_ingredients.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
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
        onPressed: () async {
          final images = controller.images;

          var response = await sendImagesRequest(images);
          var decodedResponse = json.decode(response);
          String displayResult= "None";

          if (response.isNotEmpty && response != null) {
            List<String> predictions = List<String>.from(decodedResponse['predictions']);
            // print(predictions);
            displayResult= predictions.join(',');
          }

          // use these images
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  displayResult
              )
          )
          );
        },
        child: Icon(Icons.rocket_launch),
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