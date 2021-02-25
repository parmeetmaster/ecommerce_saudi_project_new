// To parse this JSON data, do
//
//     final productDescriptionModel = productDescriptionModelFromJson(jsonString);

import 'dart:convert';

ProductDescriptionModel productDescriptionModelFromJson(String str) => ProductDescriptionModel.fromJson(json.decode(str));

String productDescriptionModelToJson(ProductDescriptionModel data) => json.encode(data.toJson());

class ProductDescriptionModel {
  ProductDescriptionModel({
    this.error,
    this.asin,
    this.title,
    this.images,
    this.fullLink,
    this.description,
    this.prices,
    this.reviews,
    this.coupon,
    this.prime,
    this.amazonChoice,
    this.outOfStock,
    this.dealInfo,
    this.category,
    this.subCategories,
    this.soldBy,
    this.shippedBy,
    this.brand,
  });

  bool error;
  String asin;
  String title;
  List<String> images;
  String fullLink;
  String description;
  Prices prices;
  Reviews reviews;
  Coupon coupon;
  bool prime;
  bool amazonChoice;
  bool outOfStock;
  DealInfo dealInfo;
  String category;
  String subCategories;
  String soldBy;
  String shippedBy;
  String brand;

  factory ProductDescriptionModel.fromJson(Map<String, dynamic> json) => ProductDescriptionModel(
    error: json["error"],
    asin: json["asin"],
    title: json["title"],
    images: List<String>.from(json["images"].map((x) => x)),
    fullLink: json["full_link"],
    description: json["description"],
    prices: Prices.fromJson(json["prices"]),
    reviews: Reviews.fromJson(json["reviews"]),
    coupon: Coupon.fromJson(json["coupon"]),
    prime: json["prime"],
    amazonChoice: json["amazon_choice"],
    outOfStock: json["out_of_stock"],
    dealInfo: DealInfo.fromJson(json["deal_info"]),
    category: json["category"],
    subCategories: json["sub_categories"],
    soldBy: json["sold_by"],
    shippedBy: json["shipped_by"],
    brand: json["brand"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "asin": asin,
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
    "full_link": fullLink,
    "description": description,
    "prices": prices.toJson(),
    "reviews": reviews.toJson(),
    "coupon": coupon.toJson(),
    "prime": prime,
    "amazon_choice": amazonChoice,
    "out_of_stock": outOfStock,
    "deal_info": dealInfo.toJson(),
    "category": category,
    "sub_categories": subCategories,
    "sold_by": soldBy,
    "shipped_by": shippedBy,
    "brand": brand,
  };
}

class Coupon {
  Coupon({
    this.couponCode,
    this.couponDiscount,
    this.boxCoupon,
    this.boxCouponDiscount,
  });

  String couponCode;
  int couponDiscount;
  bool boxCoupon;
  int boxCouponDiscount;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    couponCode: json["coupon_code"],
    couponDiscount: json["coupon_discount"],
    boxCoupon: json["box_coupon"],
    boxCouponDiscount: json["box_coupon_discount"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_code": couponCode,
    "coupon_discount": couponDiscount,
    "box_coupon": boxCoupon,
    "box_coupon_discount": boxCouponDiscount,
  };
}

class DealInfo {
  DealInfo({
    this.dealId,
    this.lightningDeal,
    this.requestedPerc,
    this.timestampEnd,
  });

  String dealId;
  bool lightningDeal;
  int requestedPerc;
  int timestampEnd;

  factory DealInfo.fromJson(Map<String, dynamic> json) => DealInfo(
    dealId: json["deal_id"],
    lightningDeal: json["lightning_deal"],
    requestedPerc: json["requested_perc"],
    timestampEnd: json["timestamp_end"],
  );

  Map<String, dynamic> toJson() => {
    "deal_id": dealId,
    "lightning_deal": lightningDeal,
    "requested_perc": requestedPerc,
    "timestamp_end": timestampEnd,
  };
}

class Prices {
  Prices({
    this.currentPrice,
    this.previousPrice,
    this.checkoutDiscount,
    this.primeOnlyDiscount,
    this.currency,
  });

  int currentPrice;
  int previousPrice;
  int checkoutDiscount;
  int primeOnlyDiscount;
  String currency;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    currentPrice: json["current_price"],
    previousPrice: json["previous_price"],
    checkoutDiscount: json["checkout_discount"],
    primeOnlyDiscount: json["prime_only_discount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "current_price": currentPrice,
    "previous_price": previousPrice,
    "checkout_discount": checkoutDiscount,
    "prime_only_discount": primeOnlyDiscount,
    "currency": currency,
  };
}

class Reviews {
  Reviews({
    this.totalReviews,
    this.stars,
  });

  int totalReviews;
  double stars;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    totalReviews: json["total_reviews"],
    stars: json["stars"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "total_reviews": totalReviews,
    "stars": stars,
  };
}
