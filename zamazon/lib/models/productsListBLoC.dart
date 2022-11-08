import 'package:flutter/material.dart';
import 'package:zamazon/Product.dart';

class ProductsListBLoc with ChangeNotifier {
  List<Product> _products = [
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
    Product(
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
        currency: {"code": "USD", "symbol": "\$"}),
  ];

  List<Product> get products => _products;

  set products(newProductList) {
    _products = newProductList;
    notifyListeners();
  }

  addFriend(newFriend) {
    _products.add(newFriend);
    notifyListeners();
  }
}
