import 'package:flutter/material.dart';
import 'package:zamazon/widgets/homePageAppBar.dart';
import 'package:zamazon/widgets/homePageDrawer.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/widgets/featuredItemWidget.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/widgets/productViewWidget.dart';

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

    return StreamBuilder(
        stream: UserModel().getUserInformation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      //testing user switching.
                      Text(snapshot.data.toString()),
                      //random featured item on sale
                      featuredItem(context, productList),

                      //horizontal listview of products
                      buildHomeProductView(context, productList),
                      // Container(height: 300,)
                    ]),
                  )
                ],
              ),
            ),
          );
        });
  }
}
