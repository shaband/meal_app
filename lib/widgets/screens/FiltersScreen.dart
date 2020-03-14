import 'package:flutter/material.dart';
import 'package:shop_app/widgets/layout/Sidebar.dart';

class FiltersScreen extends StatefulWidget {
  Map<String, bool> _filters;
  Function _setFilters;
  FiltersScreen(this._filters, this._setFilters);
  static const String routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget._filters['isGlutenFree'];

    _isVegan = widget._filters['isVegan'];

    _isVegetarian = widget._filters['isVegetarian'];

    _isLactoseFree = widget._filters['isLactoseFree'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                setState(() {
                  Map<String, bool> filterData = {
                    "isGlutenFree": _isGlutenFree,
                    "isVegan": _isVegan,
                    "isVegetarian": _isVegetarian,
                    "isLactoseFree": _isVegetarian,
                  };
                  widget._setFilters(filterData);
                });
              })
        ],
      ),
      drawer: Sidebar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
              padding: EdgeInsets.all(20),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only Incude gluten-free meals',
                    _isGlutenFree,
                    (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'is vegan',
                    'Only Incude is vegan meals',
                    _isVegan,
                    (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'is vegetarian',
                    'Only Incude is vegetarian meals',
                    _isVegetarian,
                    (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only Incude Lactose-free meals',
                    _isLactoseFree,
                    (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(
      String title, String description, bool value, Function valueChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: valueChanged,
    );
  }
}
