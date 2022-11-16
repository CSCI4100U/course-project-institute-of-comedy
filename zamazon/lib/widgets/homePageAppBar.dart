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
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).primaryColor,
      elevation: 0,
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

              nav.pushNamed("/ProductPage",
                  arguments: ProductPage(
                    title: 'Product',
                    product: product,
                  ));
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
