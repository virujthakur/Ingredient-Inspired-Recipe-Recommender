import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/initialscreen.dart';
import 'homepage.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          )),
    );
  }
}
