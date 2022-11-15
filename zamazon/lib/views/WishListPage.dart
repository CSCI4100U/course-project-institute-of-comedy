import 'package:flutter/material.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/models/shoppingCartWishListModel.dart';

import '../models/Product.dart';
import '../widgets/numberPickerDialog.dart';
import '../widgets/ratingWidget.dart';
import 'ProductPage.dart';

// IN PROGRESS, similar to shopping cart page, except users will only be able to
// add wishlist items to shopping cart, they will not be able to check out items
// from this page.

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  //TODO
  // might track shopping cart and wishlist using provider?
  // List<Product> wishList = ...

  final SCWLModel _scwlModel = SCWLModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder(
        stream: SCWLModel().getUserShoppingCartWishList("wishList"),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                title: Text(widget.title!),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/ShoppingCart');
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  )
                ],
              ),
              body: snapshot.data.isEmpty
                  ? const Center(
                      child: Text(
                      "Your Wish List is Empty.",
                      style: TextStyle(fontSize: 25),
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      // TODO: add more information to each product in list
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            ShoppingCartWishListItem scwlItem =
                                snapshot.data[index];
                            return buildWishListItem(scwlItem, width);
                          }),
                    ));
        });
  }

  Widget buildWishListItem(ShoppingCartWishListItem scwlItem, double width) {
    return InkWell(
      onTap: () async {
        Navigator.pushNamed(
          context,
          "/ProductPage",
          arguments: {
            'title': 'Product',
            'product': await SCWLModel().getProduct(scwlItem.productId!)
          },
        );
      },
      // change these if needed
      // splashColor : Colors.blue,
      // highlightColor: Colors.black,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _scwlModel.deleteCartWishList(scwlItem);
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: width - 110,
                  ),
                  // TODO: add real trashcan icon
                  const Icon(Icons.delete)
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width / 2.5,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    // productList[index].imageUrlList![0],
                    'https://imgur.com/u5fYc4r.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        scwlItem.title!,
                        style: const TextStyle(fontSize: 17),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${scwlItem.totalPrice!}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              fixedSize: Size(width / 2, 20)),
                          onPressed: () async {
                            int? value = await showNumberPickerDialog(
                                context, scwlItem.sizeSelection!);
                            if (value != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Added to Cart")));
                              Product product = await SCWLModel()
                                  .getProduct(scwlItem.productId!);
                              _scwlModel.addToCartWishList(
                                  product, "shoppingCart",
                                  size: value);
                            }
                          },
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.black),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
