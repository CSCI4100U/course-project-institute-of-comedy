import 'package:flutter/material.dart';
import 'package:zamazon/createDrawer.dart';
import 'package:zamazon/customSearchDelegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://i.imgur.com/Ty5m1io.png', //VERY GOOD LOGO
          width: 125,
        ),
        actions: [
          // Send to shopping cart when tapped
          IconButton(
            onPressed: () {},
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
      ),
      drawer: createDrawer(),
      body: Column(
        children: const [
          //Will select a random item to be featured on sale?
          //featuredItem()

          //Will build a horizontal listview of n products
          //buildProductList(10)
        ],
      ),
    );
  }

  //TODO
  // Widget createAppbar()
  // Widget buildProductList()
  // Widget featuredItem()
}
