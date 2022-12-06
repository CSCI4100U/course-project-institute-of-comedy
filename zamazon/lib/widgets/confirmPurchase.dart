import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/CusUser.dart';
import 'package:zamazon/notifications.dart';
import 'package:zamazon/widgets/genericSnackBar.dart';

import '../models/themeBLoC.dart';

class ConfirmPurchaseWidget extends StatelessWidget {
  ConfirmPurchaseWidget({
    super.key,
    required this.width,
    required this.sumOfCart,
    required this.user,
    required this.numOfItems,
  });

  final double width;
  final double sumOfCart;
  final CusUser user;
  final int numOfItems;

  final _notifications = Notifications();
  String notifBody = '';

  void _sendDeliveryNotif() async {
    _notifications.sendNotificationNow(
      'Your order has been delivered!',
      notifBody,
      'payloadpayloadpayload',
    );
  }

  @override
  Widget build(BuildContext context) {
    _notifications.init();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      // height: MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
          color: Provider.of<ThemeBLoC>(context).themeMode == ThemeMode.dark
              ? Colors.grey[500]
              : Colors.orange,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '${user.name}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Address:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${user.country},\n ${user.province},\n ${user.city}',
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Postal Code:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '${user.postal}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.black87,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                sumOfCart.toStringAsFixed(2),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(width - 100, 40),
              ),
              onPressed: () {
                // Pop to homepage
                Navigator.popUntil(context, (route) => route.isFirst);

                // Order confirmation snackbar
                showSnackBar(context, 'Order out for delivery!');

                // Send order delivered notification
                notifBody = 'Your order of $numOfItems item(s) has been '
                    'delivered to ${user.name} at ${user.country}, ${user.province}, ${user.city}, ${user.postal}';

                _sendDeliveryNotif();
              },
              child: const Text("Confirm Purchase",
                  style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
