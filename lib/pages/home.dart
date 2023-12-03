import 'package:flutter/material.dart';
class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome To Ingredient Inspired Recipe Recommender : Your Culinary Guide!',
        style: TextStyle(
            fontSize: 40
        ),
      ),
    );
  }
}
