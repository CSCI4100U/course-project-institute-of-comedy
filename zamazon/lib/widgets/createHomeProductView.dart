import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/Product.dart';
import '../views/ProductPage.dart';
import 'createPriceWidget.dart';
import 'createRatingWidget.dart';

Widget buildHomeProductView(BuildContext context, List<Product> productList) {
  double height = MediaQuery.of(context).size.height;
  return Container(
      margin: const EdgeInsets.all(10),
      child: CarouselSlider.builder(
        itemCount: productList.length,
        options: CarouselOptions(
          height: height / 2.2,
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/ProductPage",
                          arguments: ProductPage(
                            title: 'Product',
                            product: productList[itemIndex],
                          )
                      );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        productList[itemIndex].imageUrlList![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "${productList[itemIndex].title}",
                      // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  CreateRatingWidget(product: productList[itemIndex]),
                  CreatePriceWidget(product: productList[itemIndex]) ,
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(fixedSize: Size(150, 20)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, "/ProductPage",
                  //           arguments: ProductPage(
                  //             title: 'Product',
                  //             product: productList[itemIndex],
                  //           ));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: const [
                  //         Text("See Product"),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Icon(Icons.open_in_new)
                  //       ],
                  //     ))
                ],
              ),
            ),
          );
        },
      ));
}
