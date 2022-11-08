import 'package:flutter/material.dart';
import 'package:zamazon/models/productsListBLoC.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:zamazon/customSearchDelegate.dart';
import 'package:zamazon/zamazonLogo.dart';
import 'package:zamazon/notifications.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ProductsListBLoc productsListBLoc = context.watch<ProductsListBLoc>();

    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
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
