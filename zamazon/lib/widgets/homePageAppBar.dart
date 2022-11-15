import 'package:flutter/material.dart';
import 'package:zamazon/widgets/customSearchDelegate.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:zamazon/globals.dart';

// helper function to create appbar. Used in multiple pages so I made it
// a class

class HomePageAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBarWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
      // title: Image.network(
      //   zamazonLogo, //VERY GOOD LOGO
      //   width: 125,
      // ),
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
              final nav = Navigator.of(context);
              final product = await showSearch(
                  context: context, delegate: CustomSearchDelegate());

              if (product != null) {
                nav.pushNamed(
                  "/ProductPage",
                  arguments: {
                    'title': 'Product',
                    'product': product,
                  },
                );
              }
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
