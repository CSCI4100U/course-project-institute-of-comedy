import 'package:flutter/material.dart';
import 'package:zamazon/Product.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  Product product = Product(
      title : "Product title descriptions",
      manufacturer : "Sony",
      numReviews : 19,
      rating : "4.4 out of 5 stars",
      sizeSelection : [1,2,3,4,5,6,7,8,9,10,11,12,13,14],
      seller : "Sony",
      fulfiller : "Amazon",
      warehouseAvailability : "In Stock.",
      retailPrice : 137.55,
      price : 77.42,
      shippingPrice : 3.12,
      shippingPriceInfo : "free",
      savings : "You Save: \$59.58 (43%)",
      features : [
        "Premium SOLID Stainless Steel"
      ],
      imageUrlList : [
        "https://images-na.ssl-images-amazon.com/images/I/71itkDwgyyL._SL1500_.jpg",
        "https://images-na.ssl-images-amazon.com/images/I/716b2w17%2BPL._SL1500_.jpg"
      ],
      productDescription : "PS4 Pro 4K TV GAMING & MORE The most advanced "
          "PlayStation system ever. PS4 Pro is designed to take your"
          " favorite PS4 games and add to them with more power for graphics",
      productDetails : [
        {
          "name": "Item Weight",
          "value": "2.46 Kg"
        },
        {
          "name": "Amazon Bestsellers Rank",
          "value": "392,852 in Home & Kitchen (See Top 100 in Home & Kitchen) #336 in Dinner Sets"
        }
      ],
      dealPrice : 71.42,
      salePrice : 0.0,
      reviews : [
        {
          "text": "Purchased New, received Used, already registered to another owner, with a game disc in the tray.",
          "date": "Reviewed in the United States on September 11, 2018",
          "rating": "1.0 out of 5 stars",
          "title": "Used Goods.",
          "userName": "John Redman",
          "url": "/gp/customer-reviews/RDHY3HUVO55FH/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01LOP8EZC"
        }
      ],
      currency : {
        "code": "USD",
        "symbol": "\$"
      }
  );

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(); // for pageview
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brand: ${product.manufacturer}"),
                        Text("${product.numReviews}"),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                      child: Text("${product.title}")
                  ),
                  Container(
                    height: 250,
                    // width: 100,
                    child: PageView(
                      controller: controller,
                      children: product.imageUrlList!.map((e) => Image.network(e)).toList(),
                    ),
                  ),
                  // if sizeselection list isn't empty, creates size list widget
                  product.sizeSelection!.isNotEmpty ? buildSizeWidget(context)
                      : Container(height: 0,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // ${product.savings!.substring(18,21)}
                        child: Text("\$${product.price}",
                                style: TextStyle(
                                  fontSize: 25
                                )),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        // ${product.savings!.substring(18,21)}
                        child: Text("${product.savings}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.red
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10,0,0,10),
                        // ${product.savings!.substring(18,21)}
                        child: Text("Was: ",
                            style: TextStyle(
                                // fontSize: 25
                              // decoration: TextDecoration.lineThrough
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0,0,10,10),
                        // ${product.savings!.substring(18,21)}
                        child: Text("\$${product.retailPrice}",
                            style: TextStyle(
                                // fontSize: 25
                              decoration: TextDecoration.lineThrough
                            )),
                      ),
                    ],
                  ),
                ]
              )
          )
        ],
      ),
    );

    
  }

  // builds the size list widget
  Widget buildSizeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(5),
            child: Text("Size:")
        ),
        Container(
          height: 55,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.sizeSelection!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black
                      ),
                      // borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text("${product.sizeSelection![index]}")
                );
              }
          ),
        ),
      ],
    );

  }
}
