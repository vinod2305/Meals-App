import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save),)
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal section.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-free',
                      'Only include gluten-free meals.', _glutenFree, (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-free',
                      'Only include lactose-free meals.',
                      _lactoseFree, (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include vegan meals.', _vegan, (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      'Only include vegetarian meals.', _vegetarian, (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
