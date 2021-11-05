import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/screens/favourite_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Favourites'}
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
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
