import 'package:flutter/cupertino.dart';

class Recipe {
  final String name;
  final List<dynamic> description;
  final String imagePath;
  final String cookingTime;

  Recipe({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.cookingTime,
  });
}
