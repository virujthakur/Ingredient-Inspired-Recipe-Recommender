import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ingredient_inspire_recipe_recommender/components/my_navbar.dart';
import 'package:ingredient_inspire_recipe_recommender/image_picker_util.dart';
import 'package:ingredient_inspire_recipe_recommender/login/GoogleSignInApi.dart';
import 'package:ingredient_inspire_recipe_recommender/login/loginpage.dart';
import 'package:ingredient_inspire_recipe_recommender/login/profilepage.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/home.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/likes.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/recipes.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/search.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages= [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _pages = [
        UserHome(),
        const LikesPage(),
        const ImagePickerUtil(title: 'Get Recipes from images'),
        SettingsPage()
      ];
    });
  }
  // final List<Widget> _pages = [const UserHome(), const RecipesPage(recipeList: [],), const TakePictureScreen(camera: firstCamera), const SearchPage(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    void navigateBottomBar(int index)
    {
      setState(() {
        _selectedIndex= index;
      });
    }

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyNavbar(
        selectedIndex: _selectedIndex,
        navigateBottomBar: navigateBottomBar,
      ),
    );
  }
}
