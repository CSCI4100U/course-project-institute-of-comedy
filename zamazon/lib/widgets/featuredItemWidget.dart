import 'package:flutter/material.dart';
import 'dart:math';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/views/ProductPage.dart';

// helper function, to create a big banner for a randomly featured item.

class FeaturedItemWidget extends StatelessWidget {
  const FeaturedItemWidget({Key? key, required this.productList})
      : super(key: key);

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    if (productList.isNotEmpty) {
      Product product = productList[random.nextInt(productList.length)];
      // Product product = productList[0];

      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/ProductPage",
            arguments: {
              'title': 'Product',
              'product': product,
            },
          );
        },
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
            Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product.imageUrlList![0]),
                ))
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
