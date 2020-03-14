import 'package:flutter/material.dart';
import 'package:shop_app/models/Meal.dart';
import 'package:shop_app/widgets/screens/meals/MealItem.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget._favoriteMeals.length==0? Center(
        child: Text('favorites'),
      ): ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          var mealItem = MealItem(
            meal: widget._favoriteMeals[index],
        //    dropMeal: _dropItem,
          );
          return mealItem;
        },
        itemCount: widget._favoriteMeals.length,
      ),
    );
  }
}
