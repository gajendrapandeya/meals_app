import 'package:flutter/material.dart';
import 'package:meals_app/utils/routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String title, IconData iconData, VoidCallback? tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            height: 120.0,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          _buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          _buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Routes.FILTERS_SCREEN_ROUTE);
          }),
        ],
      ),
    );
  }
}
