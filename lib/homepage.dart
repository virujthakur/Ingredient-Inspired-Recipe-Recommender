import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/home.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/likes.dart';
import 'package:ingredient_inspire_recipe_recommender/pages/recipecard.dart';
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

  void navigateBottomBar(int index)
  {
    setState(() {
      _selectedIndex= index;
    });
  }

  final List<Widget> _pages = [UserHome(), RecipesPage(), SearchPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        selectedIndex: _selectedIndex,
        onTabChange: navigateBottomBar,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home' ,
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search'),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          )
        ],
      ),
    );
  }
}
