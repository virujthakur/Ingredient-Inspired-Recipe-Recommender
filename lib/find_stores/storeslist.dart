import 'package:flutter/material.dart';
import 'package:ingredient_inspire_recipe_recommender/find_stores/storecard.dart';

import '../models/store.dart';

class StoresListPage extends StatelessWidget {
  final List<Store> storeList;
  StoresListPage({Key? key, required this.storeList}) : super(key: key);

  Widget buildBody() {
    if (storeList.length == 0) {
      return Column(
        children: [
          Text('No stores found, try again.')
        ],
      );
    }
    else {
      return ListView.builder(
          itemCount: storeList.length,
          itemBuilder: (context, index) {
            var storeData = storeList[index];
            return StoreCard(
              store: storeData,
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Stores'),
      ),
      body: buildBody()
    );
  }
}

