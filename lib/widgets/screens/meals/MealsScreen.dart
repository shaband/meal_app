import 'package:flutter/material.dart';
import 'package:shop_app/models/Meal.dart';
import 'package:shop_app/widgets/screens/meals/MealItem.dart';

class MealScreen extends StatefulWidget {
  final List<Meal> _openMeals;

  MealScreen(this._openMeals);
  static const String routeName = '/category-item';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> _mealsInCategory;
  Map<String, String> _args;
  bool _loadedBefore = false;

  @override
  void didChangeDependencies() {
    if (!_loadedBefore) {
      _args = ModalRoute.of(context).settings.arguments as Map<String, String>;
      List<Meal> meals = widget._openMeals;
      _mealsInCategory = meals.where((Meal meal) {
        return meal.categories.contains(_args['id']);
      }).toList();
      _loadedBefore = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_args['title']),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          var mealItem = MealItem(
            meal: _mealsInCategory[index],
            //    dropMeal: _dropItem,
          );
          return mealItem;
        },
        itemCount: _mealsInCategory.length,
      ),
    );
  }
}
