import 'package:flutter/material.dart';
import 'package:shop_app/widgets/screens/FiltersScreen.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Sidebar',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSideBarListTile(context, 'Meals', Icons.restaurant,
                () => {Navigator.of(context).pushReplacementNamed('/')}),
            SizedBox(
              height: 20,
            ),
            buildSideBarListTile(
                context,
                'Filters',
                Icons.settings,
                () => {
                      Navigator.of(context)
                          .pushReplacementNamed(FiltersScreen.routeName)
                    }),
          ],
        ),
      ),
    );
  }

  ListTile buildSideBarListTile(
      BuildContext context, String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: Theme.of(context).textTheme.title.fontFamily,
        ),
      ),
      onTap: tabHandler,
    );
  }
}
