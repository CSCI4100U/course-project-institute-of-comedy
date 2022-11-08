import 'package:flutter/material.dart';
import 'package:zamazon/customSearchDelegate.dart';

PreferredSizeWidget createAppBar(BuildContext context, String zamazonLogo) {
  return AppBar(
    title: Image.network(
      zamazonLogo, //VERY GOOD LOGO
      width: 125,
    ),
    actions: [
      // Send to shopping cart when tapped
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ShoppingCart');
        },
        icon: const Icon(Icons.shopping_cart),
      ),

      // Show search bar when tapped
      IconButton(
          onPressed: () async {
            // when a user taps a result, it will be returned here.
            var result = await showSearch(
                context: context, delegate: CustomSearchDelegate());
          },
          icon: const Icon(Icons.search)),
    ],
  );
}
