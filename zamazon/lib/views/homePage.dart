import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:zamazon/zamazonLogo.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';

import '../widgets/createHomeProductView.dart';
import '../zamazonLogo.dart';

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
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
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
        appBar: createAppBar(context, zamazonLogo),
        drawer: createDrawer(context),
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
              featuredItem(context, productList),

              //Will build a horizontal listview of n products
              buildHomeProductView(context, productList),
                  // Container(height: 300,)
            ]))
          ],
        ),
      ),
    );
  }

  //TODO
  // Widget createAppbar()

  // TODO: add checkers for all values in case they do not exist
  Widget featuredItem(BuildContext context, List productList) {
    Random random = Random();

    // Product product = productList[random.nextInt(productList.length)];
    Product product = productList[0];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ProductPage",
            arguments: ProductPage(
              title: 'Product',
              product: product,
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(
              "${product.features![0]}",
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "${product.title}",
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "\$${product.dealPrice}",
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "${product.savings!.substring(18, 21)} off. Limited time offer",
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: 250,
              child: Image.network(featuredImgs[0]))
        ],
      ),
    );
  }
}
