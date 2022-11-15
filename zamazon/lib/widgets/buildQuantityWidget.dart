import 'package:flutter/material.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/models/shoppingCartWishListModel.dart';

class BuildQuantityWidget extends StatelessWidget {
  BuildQuantityWidget({super.key, required this.scwlItem});

  ShoppingCartWishListItem scwlItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
            onPressed: () {
              if (scwlItem.quantity! > 1) {
                scwlItem.quantity = scwlItem.quantity! - 1;
                scwlItem.totalPrice =
                    scwlItem.pricePerUnit! * scwlItem.quantity!;
                SCWLModel().updateCartWishList(scwlItem);
              }
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              foregroundColor: Colors.black,
            ),
            child: const Icon(Icons.remove)),
        Text("Qty: ${scwlItem.quantity}"),
        OutlinedButton(
            onPressed: () {
              if (scwlItem.quantity! < 99) {
                scwlItem.quantity = scwlItem.quantity! + 1;
                scwlItem.totalPrice =
                    scwlItem.pricePerUnit! * scwlItem.quantity!;
                SCWLModel().updateCartWishList(scwlItem);
              }
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              foregroundColor: Colors.black,
            ),
            child: const Icon(Icons.add)),
      ],
    );
  }
}
