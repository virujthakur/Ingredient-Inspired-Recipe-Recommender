import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
class UserHome extends StatelessWidget {
  const UserHome({super.key});
  static const List<String> sampleImages = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            FanCarouselImageSlider(
              imagesLink: sampleImages,
              isAssets: true,
              autoPlay: true,
              userCanDrag: true,
              sliderHeight: 300,
              indicatorActiveColor: Colors.amberAccent,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Ingredient Inspired Recipe Recommender, Your Culinary Guide!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
