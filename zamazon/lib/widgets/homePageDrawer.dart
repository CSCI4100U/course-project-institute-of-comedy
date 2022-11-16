import 'package:flutter/material.dart';
import 'package:zamazon/globals.dart';
import 'package:zamazon/notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
import 'package:zamazon/authentication/authFunctions.dart';

// helper function, to create a drawer. I made it a seperate file for cleanliness.

class HomePageDrawerWidget extends StatelessWidget {
  HomePageDrawerWidget({super.key});

  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      )),
      child: Column(
        children: [
          DrawerHeader(
            child: Image.network(zamazonLogo),
          ),
          const Divider(
            thickness: 2,
          ),

          //TODO USER PROFILE
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            // Takes to wish list page
            onTap: () => Navigator.pushNamed(context, '/Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Shopping Cart'),
            // Takes to wish list page
            onTap: () => Navigator.pushNamed(context, '/ShoppingCart'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Wish List'),
            // Takes to wish list page
            onTap: () => Navigator.pushNamed(context, '/WishList'),
          ),
          const Spacer(),
          const Divider(
            thickness: 2,
          ),
          const Divider(
            thickness: 0.6,
          ),

          //TODO SETTINGS
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings - WIP'),
            onTap: () => Navigator.pushNamed(context, '/SettingsPage'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              _auth.signOut().then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Bye!!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              });
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
