import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:zamazon/imgurLinks.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/widgets/createFeaturedItem.dart';

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

    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      drawer: createDrawer(context),

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
            //buildProductList(10)
          ]))
        ],
      ),
    );
  }
}
