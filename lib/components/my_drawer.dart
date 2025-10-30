import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';

import '../screens/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.food_bank_rounded,
              size: 96,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Divider(
              color: Colors.white54,
              thickness: 4,
            ),
          ),
          //home tile
          MyDrawerTile(
              textTile: "Home",
              iconTile: Icons.home,
              onTap: () => Navigator.pop(context)),
          MyDrawerTile(
              textTile: "Settings",
              iconTile: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }),
          Spacer(),
          MyDrawerTile(
              textTile: "Log Out",
              iconTile: Icons.logout_outlined,
              onTap: () {}),
          SizedBox(
            height: 24,
          )
          //setting tile

          //logout
        ],
      ),
    );
  }
}
