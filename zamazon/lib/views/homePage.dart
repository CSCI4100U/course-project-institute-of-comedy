import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:zamazon/zamazonLogo.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    //List<DocumentReference> wishList =
    //    Provider.of<List<DocumentReference>>(context);

    return Scaffold(
      appBar: createAppBar(context, zamazonLogo) as PreferredSizeWidget,
      drawer: createDrawer(context),

      // featured item will be a random item that is displayed very big,
      // below that will be a horizontal list view of products.
      //TODO make it so once the end of the list is hit, more products will be loaded.

      //REPLACE THIS WITH REAL BODY
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildtile(context, products[index]);
        },
      ),
    );
  }

  //TODO
  // Widget createAppbar()
  // Widget buildProductList()
  // Widget featuredItem()

  Widget _buildtile(BuildContext context, Product product) {
    print('id: ${product.id}, savings: ${product.savings}');

    return ListTile(
      title: Text(product.title!),
      subtitle: Text(product.price.toString()),
    );
  }
}
