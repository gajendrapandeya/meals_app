import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import 'package:meals_app/screens/favourite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Favourites'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
