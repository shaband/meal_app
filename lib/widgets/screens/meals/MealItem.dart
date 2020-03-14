import 'package:flutter/material.dart';
import 'package:shop_app/models/Meal.dart';
import 'package:shop_app/widgets/screens/meals/MealDetailScreen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
 // final Function dropMeal;
  MealItem({@required this.meal/* , @required this.dropMeal */});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 150,
                  child: Container(
                    width: 250,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        backgroundColor: Colors.black26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildRow(Icons.schedule, meal.duration),
                  buildRow(Icons.work, meal.complexityText),
                  buildRow(Icons.money_off, meal.affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(IconData icon, text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
        ),
        SizedBox(
          width: 6,
        ),
        Text('$text')
      ],
    );
  }

  void selectMeal(BuildContext context) {
    Map args = {"id": meal.id};
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: args)
        .then((item) {
    //  dropMeal(item);
    });
  }
}
