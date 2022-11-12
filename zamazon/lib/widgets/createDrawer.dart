import 'package:flutter/material.dart';
import 'package:zamazon/links.dart';
import 'package:zamazon/notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
import 'package:zamazon/authentication/authFunctions.dart';

// helper function, to create a drawer. I made it a seperate file for cleanliness.

class CreateDrawer extends StatelessWidget {
  CreateDrawer({super.key});

  final _notifications = Notifications();

  // JUST FOR TESTING NOTIFICATIONS, WILL BE CHANGED LATER
  final String? title = 'titleeee';
  final String? body = 'boooooody';
  final String? payload = 'payloooooad';

  @override
  Widget build(BuildContext context) {
    //_notifications.init();
    //tz.initializeTimeZones();

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
            title: const Text('Profile - WIP'),
            // Takes to wish list page
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Shopping Cart'),
            // Takes to wish list page
            onTap: () {
              Navigator.pushNamed(context, '/ShoppingCart');
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
          const Spacer(),
          const Divider(
            thickness: 2,
          ),
          const Divider(
            thickness: 0.55,
          ),

          //TODO SETTINGS
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings - WIP'),
            onTap: () {},
          ),
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
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
