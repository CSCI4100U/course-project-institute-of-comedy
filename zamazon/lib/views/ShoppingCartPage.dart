import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createCheckoutWidget.dart';

import '../models/Product.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // List<Product>? productList;

  int? size;
  int? quantity = 1;

  @override
  Widget build(BuildContext context) {
    List<Product> productList = [];

    productList.add(
      Product(
          title: "Prod1",
          manufacturer: "Sony",
          numReviews: 19,
          rating: "4.4 out of 5 stars",
          sizeSelection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
          seller: "Sony",
          fulfiller: "Amazon",
          warehouseAvailability: "In Stock.",
          retailPrice: 137.55,
          price: 77.42,
          shippingPrice: 3.12,
          shippingPriceInfo: "free",
          savings: "You Save: \$59.58 (43%)",
          features: ["Premium SOLID Stainless Steel"],
          imageUrlList: [
            "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
          ],
          productDescription: "PS4 Pro 4K TV GAMING & MORE The most advanced "
              "PlayStation system ever. PS4 Pro is designed to take your"
              " favorite PS4 games and add to them with more power for graphics",
          productDetails: [
            {"name": "Item Weight", "value": "2.46 Kg"},
            {
              "name": "Amazon Bestsellers Rank",
              "value":
                  "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
            }
          ],
          dealPrice: 71.42,
          salePrice: 0.0,
          reviews: [
            {
              "text":
                  "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
              "date": "Reviewed in the United States on September 11, 2018",
              "rating": "1.0 out of 5 stars",
              "title": "Used Goods.",
              "userName": "John Redman",
              "url":
                  "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
            }
          ],
          currency: {"code": "USD", "symbol": "\$"}),
    );

    productList.add(
      Product(
          title: "prod2",
          manufacturer: "Sony",
          numReviews: 19,
          rating: "4.4 out of 5 stars",
          sizeSelection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
          seller: "Sony",
          fulfiller: "Amazon",
          warehouseAvailability: "In Stock.",
          retailPrice: 137.55,
          price: 77.42,
          shippingPrice: 3.12,
          shippingPriceInfo: "free",
          savings: "You Save: \$59.58 (43%)",
          features: ["Premium SOLID Stainless Steel"],
          imageUrlList: [
            "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
          ],
          productDescription: "PS4 Pro 4K TV GAMING & MORE The most advanced "
              "PlayStation system ever. PS4 Pro is designed to take your"
              " favorite PS4 games and add to them with more power for graphics",
          productDetails: [
            {"name": "Item Weight", "value": "2.46 Kg"},
            {
              "name": "Amazon Bestsellers Rank",
              "value":
                  "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
            }
          ],
          dealPrice: 71.42,
          salePrice: 0.0,
          reviews: [
            {
              "text":
                  "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
              "date": "Reviewed in the United States on September 11, 2018",
              "rating": "1.0 out of 5 stars",
              "title": "Used Goods.",
              "userName": "John Redman",
              "url":
                  "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
            }
          ],
          currency: {"code": "USD", "symbol": "\$"}),
    );
    productList.add(
      Product(
          title: "prod3",
          manufacturer: "Sony",
          numReviews: 19,
          rating: "4.4 out of 5 stars",
          sizeSelection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
          seller: "Sony",
          fulfiller: "Amazon",
          warehouseAvailability: "In Stock.",
          retailPrice: 137.55,
          price: 77.42,
          shippingPrice: 3.12,
          shippingPriceInfo: "free",
          savings: "You Save: \$59.58 (43%)",
          features: ["Premium SOLID Stainless Steel"],
          imageUrlList: [
            "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
          ],
          productDescription: "PS4 Pro 4K TV GAMING & MORE The most advanced "
              "PlayStation system ever. PS4 Pro is designed to take your"
              " favorite PS4 games and add to them with more power for graphics",
          productDetails: [
            {"name": "Item Weight", "value": "2.46 Kg"},
            {
              "name": "Amazon Bestsellers Rank",
              "value":
                  "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
            }
          ],
          dealPrice: 71.42,
          salePrice: 0.0,
          reviews: [
            {
              "text":
                  "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
              "date": "Reviewed in the United States on September 11, 2018",
              "rating": "1.0 out of 5 stars",
              "title": "Used Goods.",
              "userName": "John Redman",
              "url":
                  "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
            }
          ],
          currency: {"code": "USD", "symbol": "\$"}),
    );
    productList.add(
      Product(
          title: "prod4",
          manufacturer: "Sony",
          numReviews: 19,
          rating: "4.4 out of 5 stars",
          sizeSelection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
          seller: "Sony",
          fulfiller: "Amazon",
          warehouseAvailability: "In Stock.",
          retailPrice: 137.55,
          price: 77.42,
          shippingPrice: 3.12,
          shippingPriceInfo: "free",
          savings: "You Save: \$59.58 (43%)",
          features: ["Premium SOLID Stainless Steel"],
          imageUrlList: [
            "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
          ],
          productDescription: "PS4 Pro 4K TV GAMING & MORE The most advanced "
              "PlayStation system ever. PS4 Pro is designed to take your"
              " favorite PS4 games and add to them with more power for graphics",
          productDetails: [
            {"name": "Item Weight", "value": "2.46 Kg"},
            {
              "name": "Amazon Bestsellers Rank",
              "value":
                  "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
            }
          ],
          dealPrice: 71.42,
          salePrice: 0.0,
          reviews: [
            {
              "text":
                  "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
              "date": "Reviewed in the United States on September 11, 2018",
              "rating": "1.0 out of 5 stars",
              "title": "Used Goods.",
              "userName": "John Redman",
              "url":
                  "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
            }
          ],
          currency: {"code": "USD", "symbol": "\$"}),
    );
    productList.add(
      Product(
          title: "prod5",
          manufacturer: "Sony",
          numReviews: 19,
          rating: "4.4 out of 5 stars",
          sizeSelection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
          seller: "Sony",
          fulfiller: "Amazon",
          warehouseAvailability: "In Stock.",
          retailPrice: 137.55,
          price: 77.42,
          shippingPrice: 3.12,
          shippingPriceInfo: "free",
          savings: "You Save: \$59.58 (43%)",
          features: ["Premium SOLID Stainless Steel"],
          imageUrlList: [
            "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
          ],
          productDescription: "PS4 Pro 4K TV GAMING & MORE The most advanced "
              "PlayStation system ever. PS4 Pro is designed to take your"
              " favorite PS4 games and add to them with more power for graphics",
          productDetails: [
            {"name": "Item Weight", "value": "2.46 Kg"},
            {
              "name": "Amazon Bestsellers Rank",
              "value":
                  "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
            }
          ],
          dealPrice: 71.42,
          salePrice: 0.0,
          reviews: [
            {
              "text":
                  "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
              "date": "Reviewed in the United States on September 11, 2018",
              "rating": "1.0 out of 5 stars",
              "title": "Used Goods.",
              "userName": "John Redman",
              "url":
                  "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
            }
          ],
          currency: {"code": "USD", "symbol": "\$"}),
    );

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<int> quantities = List<int>.generate(99, (i) => i + 1);

    return Scaffold(
        extendBody: true,
        appBar: AppBar(
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
        bottomNavigationBar: const CreateCheckoutWidget(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          // TODO: add more information to each product in list
          child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Dismissible(
                      // TODO: change this to a read ID
                      key: Key(productList[index].title!),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // TODO: implement this
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
                          Column(
                            children: [
                              Container(
                                width: width / 2.5,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                child: Row(
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity! > 1) {
                                              quantity = quantity! - 1;
                                            }
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          foregroundColor: Colors.black,
                                        ),
                                        child: const Icon(Icons.remove)),
                                    Text("Qty: $quantity"),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity! < 99) {
                                              quantity = quantity! + 1;
                                            }
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          foregroundColor: Colors.black,
                                        ),
                                        child: const Icon(Icons.add)),
                                  ],
                                ),
                              )
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
                                SizedBox(height: 5,),
                                const Text(
                                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                                  style: TextStyle(fontSize: 17),
                                  softWrap: false,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "\$${productList[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                size != 0
                                    ? Text.rich(TextSpan(children: [
                                        const TextSpan(
                                            text: "Size: ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: "$size",
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
              }),
        ));
  }
}
