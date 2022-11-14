import 'package:flutter/material.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/widgets/checkoutWidget.dart';

import '../models/Product.dart';
import '../models/shoppingCartWishListModel.dart';
import '../models/userModel.dart';

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
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                title: Text(widget.title!),
                actions: [
                  IconButton(
                      //Access the Wishlist Page
                      onPressed: () {
                        Navigator.pushNamed(context, '/WishList');
                      },
                      icon: const Icon(Icons.favorite))
                ],
              ),
              bottomNavigationBar: snapshot.data.isNotEmpty
                  ? const CheckoutWidget()
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
                      // TODO: add more information to each product in list
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return buildCartItem(snapshot.data[index], width);
                          }),
                    ));
        });
  }

  Widget buildCartItem(ShoppingCartWishListItem scwlItem, double width) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Dismissible(
          // TODO: change this to a read ID
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
                const Icon(Icons.delete)
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                  Container(
                      height: 30,
                      margin: const EdgeInsets.only(top: 5),
                      child: buildQuantityWidget(scwlItem))
                  // DropdownButton<int>(
                  //     value: size,
                  //     items: productList[index]
                  //         .sizeSelection!
                  //         .cast<int>()
                  //         .map<DropdownMenuItem<int>>((int value) {
                  //       return DropdownMenuItem<int>(
                  //         value: value,
                  //         child: Text("Qty: $value"),
                  //       );
                  //     }).toList(),
                  //     onChanged: (int? value){
                  //       setState(() {
                  //         size = value!;
                  //       });
                  //     })
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${scwlItem.title}",
                      style: const TextStyle(fontSize: 17),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$${scwlItem.totalPrice}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    scwlItem.size != 0
                        ? Text.rich(TextSpan(children: [
                            const TextSpan(
                                text: "Size: ",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: "${scwlItem.size}",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ]))
                        : Container(
                            height: 0,
                          ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget buildQuantityWidget(ShoppingCartWishListItem scwlItem) {
    return Row(
      children: [
        OutlinedButton(
            onPressed: () {
              if (scwlItem.quantity! > 1) {
                scwlItem.quantity = scwlItem.quantity! - 1;
                scwlItem.totalPrice =
                    scwlItem.pricePerUnit! * scwlItem.quantity!;
                _scwlModel.updateCartWishList(scwlItem);
              }
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              foregroundColor: Colors.black,
            ),
            child: const Icon(Icons.remove)),
        Text("Qty: ${scwlItem.quantity}"),
        OutlinedButton(
            onPressed: () {
              if (scwlItem.quantity! < 99) {
                scwlItem.quantity = scwlItem.quantity! + 1;
                scwlItem.totalPrice =
                    scwlItem.pricePerUnit! * scwlItem.quantity!;
                _scwlModel.updateCartWishList(scwlItem);
              }
            },
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              foregroundColor: Colors.black,
            ),
            child: const Icon(Icons.add)),
      ],
    );
  }
}
