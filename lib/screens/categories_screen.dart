import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delimeal'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (MediaQuery.of(context).size.width / 2),
              childAspectRatio: 1.5,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(id: catData.id, title: catData.title, color: catData.color))
              .toList()),
    );
  }
}
