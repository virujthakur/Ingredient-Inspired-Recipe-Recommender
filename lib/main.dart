import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/initialscreen.dart';
import 'package:ingredient_inspire_recipe_recommender/themes/themeprovider.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

void main()
{
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
