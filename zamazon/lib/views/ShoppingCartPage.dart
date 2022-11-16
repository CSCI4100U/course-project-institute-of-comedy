import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/widgets/proceedToCheckOut.dart';
import '../models/shoppingCartWishListModel.dart';
import 'package:zamazon/widgets/buildCartItem.dart';
import '../models/userModel.dart';
import '../themes.dart';

//IN PROGRESS, users should be able to add/remove items to their shopping carts
// and they will be displayed in this page. IN PROGRESS, checking out items.

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // List<Product>? productList;

  final SCWLModel _scwlModel = SCWLModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder(
        stream: SCWLModel().getUserShoppingCartWishList("shoppingCart"),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
              extendBody: true,
              appBar: AppBar(
                iconTheme: Theme.of(context).iconTheme,
                backgroundColor: Colors.transparent,
                foregroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                title: Text(widget.title!),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      //Access the Wishlist Page
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/WishList');
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: snapshot.data.isNotEmpty
                  ? ProceedToCheckOutWidget(
                      checkOutItems: snapshot.data,
                    )
                  : Container(
                      height: 0,
                    ),
              body: snapshot.data.isEmpty
                  ? const Center(
                      child: Text(
                      "Your Shopping Cart is Empty.",
                      style: TextStyle(fontSize: 25),
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return BuildCartItem(
                              scwlItem: snapshot.data[index],
                              width: width,
                            );
                          }),
                    ));
        });
  }
}
