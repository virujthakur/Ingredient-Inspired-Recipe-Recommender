import 'package:flutter/material.dart';

class MyCircularIcon extends StatelessWidget {
  final String imagePath;

  const MyCircularIcon({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 300,
        fit: BoxFit.fill,
      ),
    );
  }
}
