import 'package:flutter/material.dart';
import 'package:zamazon/globals.dart';
import 'package:zamazon/widgets/bottomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/widgets/featuredItemWidget.dart';
import 'package:zamazon/widgets/productViewWidget.dart';
import 'package:zamazon/controllers/userProfilePage.dart';
import 'package:zamazon/views/ShoppingCartPage.dart';
import 'package:zamazon/views/WishListPage.dart';

import 'package:zamazon/widgets/sliverAppBar.dart';

// Homepage of our digital store front. Presented after successful sign in/ sign up
//TODO make it so once the end of the list is hit, more products will be loaded.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // product list is loaded in initstate
  List<Product> productList = [];

  int navBarSelectedPage = 0;

  // to change the page
  void navBarOnClicked(int index) {
    setState(() {
      navBarSelectedPage = index;
    });

    // jump to top of page when page changes
    if (_controller.hasClients) {
      _controller.jumpTo(0.0);
    }
  }

  List<Widget> navPageTitles = [
    // app logo for homepage
    Image.network(
      zamazonLogo,
      width: 125,
    ),
    const Text('Profile'),
    const Text('Shopping Cart'),
    const Text('Wish List'),
  ];

  // loaded in initstate after the list of products is recieved
  List<Widget> navBarPages = [];

  final ScrollController _controller = ScrollController(
    keepScrollOffset: false,
  );

  @override
  Widget build(BuildContext context) {
    productList = Provider.of<List<Product>>(context);

    navBarPages = [
      // default body for the homepage scaffold, method located below build
      homePageBody(productList),
      const UserProfilePage(),
      const ShoppingCartPage(title: 'Shopping Cart'),
      const WishListPage(title: 'Wish List'),
    ];

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        // featured item will be a random item that is displayed very big,
        // below that will be a horizontal list view of products.
        // current page
        body: NestedScrollView(
          controller: _controller,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              MySliverAppBar(title: navPageTitles.elementAt(navBarSelectedPage))
            ];
          },
          body: navBarPages.elementAt(navBarSelectedPage),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedId: navBarSelectedPage,
          onTap: navBarOnClicked,
        ),
      ),
    );
  }

  // default body for the homepage scaffold
  Widget homePageBody(List<Product> products) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        //random featured item on sale
        FeaturedItemWidget(
          productList: productList,
        ),

        //horizontal listview of products
        ProductViewWidget(productList: productList),
        ProductViewWidget(productList: productList),
        ProductViewWidget(productList: productList),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
