import 'package:flutter/material.dart';
import 'package:shop_app/widgets/screens/FavoritesScreen.dart';
import 'package:shop_app/widgets/screens/categories/CategoryScreen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreen(title: 'categories'),
            FavoritesScreen([]),
          ],
        ),
      ),
    );
  }
}
