import 'package:flutter/material.dart';

import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/cateogry_meals_screen.dart';
import './utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        Routes.CATEGORY_MEALS_SCREEN_ROUTE: (ctx) =>
            const CategoryMealsScreen(),
        Routes.MEAL_DETAIL_SCREEN_ROUTE: (ctx) => const MealDetailScreen(),
      },
      //used as a  404 page in web. If nothing found, this page will be rendered
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoryMealsScreen());
      },
    );
  }
}
