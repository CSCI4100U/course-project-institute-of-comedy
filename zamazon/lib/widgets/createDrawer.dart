import 'package:flutter/material.dart';
import 'package:zamazon/zamazonLogo.dart';
import 'package:zamazon/notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

/* Drawer will be on every page
  Drawer contains:
    homepage button,
    sign in button,
    wish list button,
  */
Widget createDrawer(BuildContext context) {
  final _notifications = Notifications();

  String? title = 'titleeee';
  String? body = 'boooooody';
  String? payload = 'payloooooad';

  _notifications.init();
  tz.initializeTimeZones();

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
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          // Takes to wish list page
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Sign In'),
          // Takes to wish list page
          onTap: () {
            Navigator.pushNamed(context, '/SignIn');
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Address'),
          // Takes to wish list page
          onTap: () {
            Navigator.pushNamed(context, '/CustomerAddress');
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Wish List'),
          // Takes to wish list page
          onTap: () {
            Navigator.pushNamed(context, '/WishList');
          },
        ),
        ListTile(
          leading: const Icon(Icons.notification_add),
          title: const Text('Test Notify Now'),
          // Takes to wish list page
          onTap: () {
            _notifications.sendNotificationNow(title, body, payload);
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications_active),
          title: const Text('Test Notify Later'),
          // Takes to wish list page
          onTap: () {
            var when = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
            _notifications.sendNotificationLater(title, body, payload, when);
          },
        ),
      ],
    ),
  );
}
