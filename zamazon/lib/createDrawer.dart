import 'package:flutter/material.dart';

/* Drawer will be on every page
  Drawer contains:
    homepage button,
    sign in button,
    wish list button,
  */
Widget createDrawer(BuildContext context) {
  final zamazonLogo = 'https://i.imgur.com/Ty5m1io.png';

  return Drawer(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    )),
    child: ListView(
      children: [
        DrawerHeader(
          child: Image.network(zamazonLogo),
        ),
        ListTile(
          leading: Icon(Icons.login),
          title: const Text('Sign In'),
          // Takes to wish list page
          onTap: () {
            Navigator.pushNamed(context, '/SignIn');
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: const Text('Wish List'),
          // Takes to wish list page
          onTap: () {
            Navigator.pushNamed(context, '/WishList');
          },
        )
      ],
    ),
  );
}
