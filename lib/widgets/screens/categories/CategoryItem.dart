import 'package:flutter/material.dart';
import 'package:shop_app/widgets/screens/meals/MealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {Key key, @required this.title, @required this.color, @required this.id})
      : super(key: key);

  void selectCategory(ctx) {
    Navigator.of(ctx)
        .pushNamed(MealScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        colors: [color.withOpacity(0.7), color],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
    return InkWell(
      onTap: () => {selectCategory(context)},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: boxDecoration,
      ),
    );
  }
}
