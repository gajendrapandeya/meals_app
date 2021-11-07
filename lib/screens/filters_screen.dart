import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.currentFilter, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['lactose']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: const Text('Gluten-Free'),
                    value: _glutenFree,
                    subtitle: const Text('Includes only Gluten-Free meals.'),
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Lactose-Free'),
                    value: _lactoseFree,
                    subtitle: const Text('Includes only Lactose-Free meals.'),
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: const Text('Includes only Vegetarian meals.'),
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text('Vegan'),
                    value: _vegan,
                    subtitle: const Text('Includes only Vegan meals.'),
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    }),
              ],
            ))
          ],
        ));
  }
}
