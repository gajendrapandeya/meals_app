import 'package:flutter/material.dart';
import 'package:meals_app/screens/cateogry_meals_screen.dart';
import 'package:meals_app/utils/routes.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.CATEGORY_MEALS_SCREEN_ROUTE,
          arguments: {'id': id, 'title': title}),
      borderRadius: BorderRadius.circular(12.0),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(12.0)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
