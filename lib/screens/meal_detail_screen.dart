import 'package:flutter/material.dart';
import 'package:meals_app/utils/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      width: 300.0,
      height: 200.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.0,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle('Ingredients', context),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              _buildSectionTitle('Steps', context),
              _buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(color: Colors.grey,height: 10.0, thickness: 1.0,)
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ));
  }
}
