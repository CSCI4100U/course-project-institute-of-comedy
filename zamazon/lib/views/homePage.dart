import 'package:flutter/material.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/widgets/createFeaturedItem.dart';

// Homepage of our digital store front. Presented after successful sign in/ sign up

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
      appBar: CreateAppBar(context),
      drawer: CreateDrawer(),

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
