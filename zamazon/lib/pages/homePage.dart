import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/widgets/createDrawer.dart';
import 'package:zamazon/customSearchDelegate.dart';
import 'package:zamazon/zamazonLogo.dart';
import 'package:zamazon/notifications.dart';

import '../Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product product = Product(
      title: "Product title descriptions",
      manufacturer: "Sony",
      numReviews: 19,
      rating: "4.4 out of 5 stars",
      sizeSelection: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
      seller: "Sony",
      fulfiller: "Amazon",
      warehouseAvailability: "In Stock.",
      retailPrice: 137.55,
      price: 77.42,
      shippingPrice: 3.12,
      shippingPriceInfo: "free",
      savings: "You Save: \$59.58 (43%)",
      features: ["Premium SOLID Stainless Steel steel steel steel steel"],
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
        },
        {"name": "Screen Size", "value": "50 inches"},
        {"name": "Display Technology", "value": "LED"},
        {
          "name": "Included Components",
          "value":
              "Bluetooth magic remote control (with batteries), quick start guide, power cable e-manuel"
        },
        {
          "name": "Test",
          "value":
              "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
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
      currency: {"code": "USD", "symbol": "\$"});

  @override
  Widget build(BuildContext context) {
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
            featuredItem(context),

            //Will build a horizontal listview of n products
            //buildProductList(10)
          ]))
        ],
      ),
    );
  }

  //TODO
  // Widget createAppbar()
  // Widget buildProductList()

  // TODO: add checkers for all values in case they do not exist
  Widget featuredItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ProductPage");
      },
      child: Container(
        // can add decoration later if needed
        decoration: BoxDecoration(),
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
            SizedBox(width: 250, child: Image.network(product.imageUrlList![0]))
          ],
        ),
      ),
    );
  }
}
