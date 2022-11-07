import 'package:flutter/material.dart';

/* Drawer will be on every page
  Drawer contains:
    homepage button,
    sign in button,
    wish list button,
  */
Widget createDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: const Text('Home Page'),
          // Takes to homepage if not already there
          onTap: () {},
        ),
        ListTile(
          title: const Text('Sign In'),
          // Takes to wish list page
          onTap: () {},
        ),
        ListTile(
          title: const Text('Wish List'),
          // Takes to wish list page
          onTap: () {},
        )
      ],
    ),
  );
}
