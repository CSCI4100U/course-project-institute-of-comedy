import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/links.dart';
import 'package:zamazon/notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:zamazon/authentication/authFunctions.dart';

class CreateDrawer extends StatelessWidget {
  CreateDrawer({super.key});

  final _notifications = Notifications();

  // JUST FOR TESTING NOTIFICATIONS, WILL BE CHANGED LATER
  final String? title = 'titleeee';
  final String? body = 'boooooody';
  final String? payload = 'payloooooad';

  @override
  Widget build(BuildContext context) {
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
          // ListTile(
          //   leading: const Icon(Icons.notification_add),
          //   title: const Text('Test Notify Now'),
          //   // Takes to wish list page
          //   onTap: () {
          //     _notifications.sendNotificationNow(title!, body!, payload!);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.notifications_active),
          //   title: const Text('Test Notify Later'),
          //   // Takes to wish list page
          //   onTap: () {
          //     var when = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
          //     _notifications.sendNotificationLater(
          //         title!, body!, payload!, when);
          //   },
          // ),
          //const Spacer(),
          //const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              signOut().then((value) {
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
        ],
      ),
    );
  }
}
