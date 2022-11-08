import 'package:flutter/material.dart';
import 'package:zamazon/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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

  bool _isAddToCartButtonPressed = false;
  int? _selectedSizeValue;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(); // for pageView
    // for back to top button
    ScrollController scrollController = ScrollController();
    double fontSize = 17;
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Brand: ${product.manufacturer}",
                        style: TextStyle(fontSize: fontSize)),
                    Row(
                      children: [
                        // creates star rating widget
                        // requires to be run with "flutter run --no-sound-null-safety"
                        RatingBar.builder(
                            initialRating:
                                double.parse(product.rating!.substring(0, 3)),
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 20,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (_) {}),
                        Text(
                          "${product.numReviews}",
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("${product.title}",
                      style: TextStyle(fontSize: fontSize))),
              // using SizedBox for spacing purposes
              SizedBox(
                height: 250,
                // width: 100,
                child: PageView(
                  controller: controller,
                  children: product.imageUrlList!
                      .map((e) => Image.network(e))
                      .toList(),
                ),
              ),
              // if sizeSelection list isn't empty, creates size list widget
              product.sizeSelection!.isNotEmpty
                  ? buildSizeWidget(context)
                  : Container(
                      height: 0,
                    ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    // ${product.savings!.substring(18,21)}
                    child: Text("\$${product.price}",
                        style: const TextStyle(fontSize: 25)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    // ${product.savings!.substring(18,21)}
                    child: Text("${product.savings}",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.red)),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    // ${product.savings!.substring(18,21)}
                    child: const Text("Was: ",
                        style: TextStyle(
                            // fontSize: 25
                            // decoration: TextDecoration.lineThrough
                            )),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    // ${product.savings!.substring(18,21)} // percentage off
                    child: Text("\$${product.retailPrice}",
                        style: const TextStyle(
                            // fontSize: 25
                            decoration: TextDecoration.lineThrough)),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${product.warehouseAvailability}",
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              Center(child: buildAddToCartButton(context)),
              const Divider(
                height: 50,
                thickness: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
                  ),
                  // looping through productDetails and
                  // creating a row for each product detail
                  for (Map detail in product.productDetails!)
                    (Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text("${detail['name']}")),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text("${detail['value']}")))
                      ],
                    ))
                ],
              ),
              const Divider(
                height: 30,
                thickness: 2,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: fontSize),
                  )),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text("${product.productDescription}")),
              // button that scrolls back to top of page
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(325, 50)),
                  onPressed: () {
                    setState(() {
                      scrollController.animateTo(0.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    });
                  },
                  child: const Text("Back to Top"))
            ],
          ))
        ],
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _isAddToCartButtonPressed ? Colors.deepOrange[300] : Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        fixedSize: const Size(325, 40),
      ),
      // TODO: make "add to cart" and "remove from cart" functionality
      onPressed: () {
        setState(() {
          _isAddToCartButtonPressed = _isAddToCartButtonPressed ? false : true;
        });
      },
      child: _isAddToCartButtonPressed
          ? const Text("Remove from Cart",
              style: TextStyle(color: Colors.black))
          : const Text(
              "Add to Cart",
              style: TextStyle(color: Colors.black),
            ),
    );
  }

// builds the size list widget
  Widget buildSizeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(padding: const EdgeInsets.all(5), child: const Text("Size:")),
        // using SizedBox for spacing purposes
        SizedBox(
          height: 55,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.sizeSelection!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  // TODO: return the size to be shown elsewhere?
                  onTap: () {
                    setState(() {
                      _selectedSizeValue = index;
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: _selectedSizeValue == index
                              ? Colors.blue
                              : Colors.white
                          // borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                      child: Text("${product.sizeSelection![index]}")),
                );
              }),
        ),
      ],
    );
  }
}
