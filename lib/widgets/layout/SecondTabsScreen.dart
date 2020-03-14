import 'package:flutter/material.dart';
import 'package:shop_app/models/Meal.dart';
import 'package:shop_app/widgets/layout/sidebar.dart';
import 'package:shop_app/widgets/screens/FavoritesScreen.dart';
import 'package:shop_app/widgets/screens/categories/CategoryScreen.dart';

class SecondTabsScreen extends StatefulWidget {
  List<Meal> _favoriteMeals;


  SecondTabsScreen(this._favoriteMeals);
  @override
  _SecondTabsScreenState createState() => _SecondTabsScreenState();
}

class _SecondTabsScreenState extends State<SecondTabsScreen> {
  int _seletedTab = 0;
  List<Map<String, dynamic>> _screens;
  @override
  void initState() {
  _screens=  [
    {'screen': CategoryScreen(title: 'category'), 'title': 'categories'},
    {'screen': FavoritesScreen(widget._favoriteMeals), 'title': 'favourites'}
  ];
    super.initState();
  }
  void _changeTab(int index) {
    setState(() {
      _seletedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_seletedTab]['title']),
      ),
      drawer: Sidebar(),
      body: _screens[_seletedTab]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _seletedTab,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('favorites'),
          ),
        ],
      ),
    );
  }
}
