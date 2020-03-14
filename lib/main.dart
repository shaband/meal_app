import 'package:flutter/material.dart';
import 'package:shop_app/db/dummy_data.dart';
import 'package:shop_app/models/Meal.dart';
import 'package:shop_app/widgets/layout/SecondTabsScreen.dart';
import 'package:shop_app/widgets/screens/FiltersScreen.dart';
import 'package:shop_app/widgets/screens/meals/MealDetailScreen.dart';
import 'package:shop_app/widgets/screens/meals/MealsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  Map<String, bool> _filters = {
    "isGlutenFree": false,
    "isVegan": false,
    "isVegetarian": false,
    "isLactoseFree": false,
  };
  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _meals = DUMMY_MEALS.where((Meal meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((Meal meal) => meal.id == mealId);
    setState(() {
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget Function(BuildContext)> routes =
        <String, WidgetBuilder>{
      '/': (ctx) => SecondTabsScreen(_favoriteMeals),
      MealScreen.routeName: (ctx) => MealScreen(_meals),
      MealDetailScreen.routeName: (ctx) =>
          MealDetailScreen(_isFavorite, _toggleFavorite),
      FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
    };
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Relway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
              ),
            ),
      ),
      /*      home: CategoryScreen(
        title: 'shop App',
      ), */
      initialRoute: '/',
      routes: routes,
    );
  }
}
