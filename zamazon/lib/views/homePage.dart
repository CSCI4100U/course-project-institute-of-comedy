import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/widgets/createFeaturedItem.dart';

import '../widgets/createProductViewWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Product> productList = Provider.of<List<Product>>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [
          //   0.1,
          //   0.4,
          //   0.6,
          //   0.9,
          // ],
          colors: [
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500,
          ],
        ),
      ),
      child: Scaffold(
        appBar: CreateAppBar(context),
        drawer: CreateDrawer(),
        backgroundColor: Colors.transparent,
        // featured item will be a random item that is displayed very big,
        // below that will be a horizontal list view of products.
        //TODO make it so once the end of the list is hit, more products will be loaded.
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              //TODO

              //Will select a random item to be featured on sale?
              CreateFeaturedItem(productList: productList),

              //Will build a horizontal listview of n products
              CreateProductViewWidget(productList: productList),
                  // Container(height: 300,)
            ]))
          ],
        ),
      ),
    );
  }

  //TODO
  // Widget createAppbar()

}
