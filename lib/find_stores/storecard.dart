import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/models/store.dart';

class StoreCard extends StatelessWidget {
  final Store store;
  const StoreCard({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                // text store details
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ // Add widgets to display store information here
                    Text(store.address,
                      style: const TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold
                      ),), // Example
                    Text('${store.distance} KM'), // Example

                  ],
                ),
              ),

              const SizedBox(width: 15,),

              //shop icon image
              Icon(Icons.shopping_bag_outlined)
            ],
          ),
        ),

        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 25,
          endIndent: 25,
        )
      ],
    );
  }
}
