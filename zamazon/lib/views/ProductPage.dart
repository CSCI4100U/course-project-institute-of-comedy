import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/models/productModel.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/models/shoppingCartWishListModel.dart';
import 'package:zamazon/widgets/defaultAppBar.dart';
import 'package:zamazon/widgets/genericSnackBar.dart';
import 'package:zamazon/widgets/ratingWidget.dart';

import 'package:zamazon/widgets/dealWidget.dart';
import 'package:zamazon/widgets/priceWidget.dart';

import '../widgets/sizePickerDialog.dart';

// When a product is tapped, user will be navigated to its respective
// page. This class is responsible for creating that page. From here, user's can
// add products to their shopping cart/wish list.

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
  int? _selectedSizeValue;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    _selectedSizeValue = product!.sizeSelection![0];
  }

  bool _isAddToCartButtonPressed = false;
  bool _isWishListButtonPressed = false;
  ProductModel productModel = ProductModel();
  final SCWLModel _scwlModel = SCWLModel();

  // TODO: let users rate product?

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(); // for pageView
    // for back to top button
    ScrollController scrollController = ScrollController();
    double fontSize = 17;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DefaultAppBar(
        context,
      ),
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
                        RatingWidget(product: product!),
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
              product!.dealPrice != 0.0
                  ? DealWidget(product: product!)
                  : PriceWidget(product: product!),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${product!.warehouseAvailability}",
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                buildAddToCartButton(context),
                // SizedBox(width: 20,),
                buildAddToWishListButton(context)
              ]),
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
                      FlutterI18n.translate(context, "ProductPage.detail"),
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
                    FlutterI18n.translate(context, "ProductPage.description"),
                    style: TextStyle(fontSize: fontSize),
                  )),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text("${product!.productDescription}")),
              const Divider(
                height: 30,
                thickness: 2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Text(
                  FlutterI18n.translate(context, "ProductPage.feature"),
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              for (String feature in product!.features!)
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: (Row(
                    children: [const Text("• "), Text(feature)],
                  )),
                ),
              // button that scrolls back to top of page
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.blueGrey),
                  onPressed: () {
                    setState(() {
                      scrollController.animateTo(0.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.keyboard_double_arrow_up),
                      Text(FlutterI18n.translate(context, "ProductPage.back_to_top")),
                    ],
                  ))
            ],
          ))
        ],
      ),
    );
  }

  //TODO DIFFERENT CLASS
  Widget buildAddToWishListButton(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(shape: const CircleBorder()),
        onPressed: () {
          setState(() {
            if (!_isWishListButtonPressed) {
              showSnackBar(context, FlutterI18n.translate(context, "ProductPage.added_to_wishlist"));
              _isWishListButtonPressed = true;
              _scwlModel.addToCartWishList(product!, "wishList");
            }
          });
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ));
    // : const Icon(Icons.favorite_border));
  }

  //TODO DIFFERENT CLASS
  Widget buildAddToCartButton(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          // _isAddToCartButtonPressed ? Colors.deepOrange[300] : Colors.yellow,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fixedSize: Size(width - 80, 40),
        ),
        onPressed: () async {
          //productModel.insertProduct(product!);  //testing
          // if (!_isAddToCartButtonPressed) {
          int? value =
              await showSizePickerDialog(context, product!.sizeSelection!);
          setState(() {
            _selectedSizeValue = value;
          });
          if (value != null) {
            if (!mounted) return;
            showSnackBar(context, FlutterI18n.translate(context, "ProductPage.added_to_cart"));
            _isAddToCartButtonPressed =
                _isAddToCartButtonPressed ? false : true;
            _scwlModel.addToCartWishList(product!, "shoppingCart",
                size: _selectedSizeValue!);
          }
        },
        child: Text(
          FlutterI18n.translate(context, "ProductPage.add_to_cart"),
          style: TextStyle(color: Colors.black),
        ));
  }
}
