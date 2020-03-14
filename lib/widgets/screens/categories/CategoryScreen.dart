import 'package:flutter/material.dart';
import 'package:shop_app/db/dummy_data.dart';
import 'package:shop_app/widgets/screens/categories/CategoryItem.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  // static const String routeName = '/';
  const CategoryScreen({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildGridView();
    /* Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildGridView(),
    ); */
  }

  GridView buildGridView() {
    return GridView(
      children: DUMMY_CATEGORIES
          .map(
            (categoryItem) => CategoryItem(
              title: categoryItem.title,
              color: categoryItem.color,
              id: categoryItem.id,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
    );
  }
}
