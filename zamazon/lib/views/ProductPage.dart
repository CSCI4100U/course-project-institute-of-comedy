import 'package:flutter/material.dart';
import 'package:zamazon/models/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zamazon/models/productModel.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/links.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, this.title, required this.product})
      : super(key: key);

  final String? title;
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product? product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  bool _isAddToCartButtonPressed = false;
  int? _selectedSizeValue;
  ProductModel productModel = ProductModel();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(); // for pageView
    // for back to top button
    ScrollController scrollController = ScrollController();
    double fontSize = 17;
    return Scaffold(
      appBar: CreateAppBar(context),
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
                    Text("Brand: ${product!.manufacturer}",
                        style: TextStyle(fontSize: fontSize)),
                    Row(
                      children: [
                        // creates star rating widget
                        // requires to be run with "flutter run --no-sound-null-safety"
                        RatingBar.builder(
                            initialRating:
                                double.parse(product!.rating!.substring(0, 3)),
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 20,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (_) {}),
                        Text(
                          "${product!.numReviews}",
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("${product!.title}",
                      style: TextStyle(fontSize: fontSize))),
              // using SizedBox for spacing purposes
              SizedBox(
                height: 250,
                // width: 100,
                // page view to show images
                child: PageView(
                  controller: controller,
                  children: product!.imageUrlList!
                      .map<Widget>((e) => Image.network(e))
                      .toList(),
                ),
              ),
              // if sizeSelection list isn't empty, creates size list widget
              product!.sizeSelection!.isNotEmpty
                  ? buildSizeWidget(context)
                  : Container(
                      height: 0,
                    ),
              // TODO: add checker for deals/sales
              product!.dealPrice != 0.0
                  ? buildDealWidget(context)
                  : buildPriceWidget(context),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${product!.warehouseAvailability}",
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
                  for (Map detail in product!.productDetails!)
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
                  child: Text("${product!.productDescription}")),
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

  Widget buildDealWidget(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          buildPriceWidget(context),
          Container(
            padding: const EdgeInsets.all(10),
            // ${product!.savings!.substring(18,21)}
            child: Text("${product!.savings}",
                style: const TextStyle(fontSize: 25, color: Colors.red)),
          ),
        ],
      ),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            // ${product!.savings!.substring(18,21)}
            child: const Text("Was: ",
                style: TextStyle(
                    // fontSize: 25
                    // decoration: TextDecoration.lineThrough
                    )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
            // ${product!.savings!.substring(18,21)} // percentage off
            child: Text("\$${product!.retailPrice}",
                style: const TextStyle(
                    // fontSize: 25
                    decoration: TextDecoration.lineThrough)),
          ),
        ],
      )
    ]);
  }

  Widget buildPriceWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // ${product!.savings!.substring(18,21)}
      child: Text("\$${product!.price}", style: const TextStyle(fontSize: 25)),
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
        productModel.insertProduct(product!);
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
              itemCount: product!.sizeSelection!.length,
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
                      child: Text("${product!.sizeSelection![index]}")),
                );
              }),
        ),
      ],
    );
  }
}
