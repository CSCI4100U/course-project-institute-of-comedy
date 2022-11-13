import 'package:flutter/material.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/views/ProductPage.dart';

// helper function, to create a big banner for a randomly featured item.

Widget featuredItem(BuildContext context, List productList) {
  if (productList.isNotEmpty) {
    // Product product = productList[random.nextInt(productList.length)];
    Product product = productList[0];

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ProductPage",
            arguments: ProductPage(
              title: 'Product',
              product: product,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // stops: [
            //   0.1,
            //   0.4,
            //   0.6,
            //   0.9,
            // ],
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade400,
              Colors.blue.shade500,
              Colors.blue.shade600,
              Colors.blue.shade700,
            ],
          ),
        ),
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
      ),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
