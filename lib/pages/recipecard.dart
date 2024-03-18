import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String description;
  final String cookingTime;

  const RecipeCard({Key? key, required this.title, required this.description, required this.cookingTime}) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calculate the height and width based on available space
          double cardHeight = constraints.maxHeight;
          double cardWidth = constraints.maxWidth;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink.image(
                image: const AssetImage('assets/images/image1.jpg'),
                height: cardHeight * 0.4, // Adjust the image height as needed
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: cardHeight * 0.08, // Adjust the font size
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(fontSize: cardHeight * 0.04), // Adjust the font size
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: cardHeight* 0.2,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.watch_later_outlined),
                                    iconSize: cardHeight * 0.1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.cookingTime,
                                  style: TextStyle(fontSize: cardHeight * 0.04),
                                ),
                              )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

