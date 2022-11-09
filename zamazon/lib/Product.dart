class Product {
  String? title;
  String? manufacturer;
  int? numReviews;
  String? rating;
  List? sizeSelection;
  String? seller;
  String? fulfiller;
  String? warehouseAvailability;
  double? retailPrice;
  double? price;
  double? shippingPrice;
  String? shippingPriceInfo;
  String? savings;
  List? features;
  List? imageUrlList;
  String? productDescription;
  List? productDetails;
  double? dealPrice;
  double? salePrice;
  List? reviews;
  List? categories;
  Map? currency;

  Product(
      {this.title,
      this.manufacturer,
      this.numReviews,
      this.rating,
      this.sizeSelection,
      this.seller,
      this.fulfiller,
      this.warehouseAvailability,
      this.retailPrice,
      this.price,
      this.shippingPrice,
      this.shippingPriceInfo,
      this.savings,
      this.features,
      this.imageUrlList,
      this.productDescription,
      this.productDetails,
      this.dealPrice,
      this.salePrice,
      this.reviews,
      this.categories,
      this.currency});

  Product.fromMap(Map map) {
    this.title = map['title'];
    this.manufacturer = map['manufacturer'];
    this.numReviews = map['numReviews'];
    this.rating = map['rating'];
    this.sizeSelection = map['sizeSelection'];
    this.seller = map['seller'];
    this.fulfiller = map['fulfiller'];
    this.warehouseAvailability = map['warehouseAvailability'];
    this.retailPrice = map['retailPrice'];
    this.price = map['price'];
    this.shippingPrice = map['shippingPrice'];
    this.shippingPriceInfo = map['shippingPriceInfo'];
    this.savings = map['savings'];
    this.features = map['features'];
    this.imageUrlList = map['imageUrlList'];
    this.productDescription = map['productDescription'];
    this.productDetails = map['productDetails'];
    this.dealPrice = map['dealPrice'];
    this.salePrice = map['salePrice'];
    this.reviews = map['reviews'];
    this.categories = map['categories'];
    this.currency = map['currency'];
  }

  Map<String, Object?> toMap() {
    return {
      'title': this.title,
      'manufacturer': this.manufacturer,
      'numReviews': this.numReviews,
      'rating': this.rating,
      'sizeSelection': this.sizeSelection,
      'seller': this.seller,
      'fulfiller': this.fulfiller,
      'warehouseAvailability': this.warehouseAvailability,
      'retailPrice': this.retailPrice,
      'price': this.price,
      'shippingPrice': this.shippingPrice,
      'shippingPriceInfo': this.shippingPriceInfo,
      'savings': this.savings,
      'features': this.features,
      'imageUrlList': this.imageUrlList,
      'productDescription': this.productDescription,
      'productDetails': this.productDetails,
      'dealPrice': this.dealPrice,
      'salePrice': this.salePrice,
      'reviews': this.reviews,
      'categories': this.categories,
      'currency': this.currency
    };
  }

  @override
  String toString() {
    return 'Product{'
        'title: $title, '
        'manufacturer: $manufacturer, '
        'numReviews: $numReviews, '
        'rating: $rating, '
        'sizeSelection: $sizeSelection, '
        'seller: $seller, '
        'fulfiller: $fulfiller, '
        'warehouseAvailability: $warehouseAvailability, '
        'retailPrice: $retailPrice, '
        'price: $price, '
        'shippingPrice: $shippingPrice, '
        'shippingPriceInfo: $shippingPriceInfo, '
        'savings: $savings, '
        'features: $features, '
        'imageUrlList: $imageUrlList, '
        'productDescription: $productDescription, '
        'productDetails: $productDetails, '
        'dealPrice: $dealPrice, '
        'salePrice: $salePrice, '
        'reviews: $reviews, '
        'categories: $categories, '
        'currency: $currency}';
  }
}
