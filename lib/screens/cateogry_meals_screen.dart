import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
