import 'package:flutter/material.dart';
import 'package:zamazon/createAppBar.dart';
import 'package:zamazon/createDrawer.dart';
import 'package:zamazon/customSearchDelegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  final zamazonLogo = 'https://i.imgur.com/Ty5m1io.png';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, widget.zamazonLogo),
      drawer: createDrawer(context),

      // featured item will be a random item that is displayed very big,
      // below that will be a horizontal list view of products.
      //TODO make it so once the end of the list is hit, more products will be loaded.
      body: CustomScrollView(
        slivers: const [
          //TODO
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
