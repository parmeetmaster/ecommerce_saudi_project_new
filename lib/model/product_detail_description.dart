/// error : false
/// asin : "B07JM1JQHG"
/// title : "Amazon Essentials Women's Drawstring Linen Wide Leg Pant"
/// images : ["https://images-na.ssl-images-amazon.com/images/I/81WIPwBsobL.jpg","https://images-na.ssl-images-amazon.com/images/I/A1SBIsJ7qWL.jpg","https://images-na.ssl-images-amazon.com/images/I/81ufGDqqtfL.jpg"]
/// full_link : "https://www.amazon.com/dp/B07JM1JQHG/?psc=1"
/// description : "100% Linen\nImported\nDrawstring closure\nMachine Wash\nThese lightweight linen pants are a must-have pick for laid-back looks\nShort inseam measures 28\"; regular inseam measures 30\"; long inseam measures 32\"\nSide and rear pockets, elastic waistband with drawstring\n"
/// prices : {"current_price":26.0,"previous_price":-1.0,"checkout_discount":-1.0,"prime_only_discount":-1.0,"currency":"$"}
/// reviews : {"total_reviews":1715,"stars":4.3}
/// coupon : {"coupon_code":"","coupon_discount":0.0,"box_coupon":false,"box_coupon_discount":0.0}
/// prime : true
/// amazon_choice : false
/// out_of_stock : false
/// deal_info : {"deal_id":"","lightning_deal":false,"requested_perc":-1,"timestamp_end":-1}
/// category : "ClothingShoesJewelry"
/// sub_categories : ""
/// sold_by : "Amazon"
/// shipped_by : "Amazon"
/// brand : "Visit the Amazon Essentials Store"

class ProductDetailDescription {
  bool _error;
  String _asin;
  String _title;
  List<String> _images;
  String _fullLink;
  String _description;
  Prices _prices;
  Reviews _reviews;
  Coupon _coupon;
  bool _prime;
  bool _amazonChoice;
  bool _outOfStock;
  Deal_info _dealInfo;
  String _category;
  String _subCategories;
  String _soldBy;
  String _shippedBy;
  String _brand;

  bool get error => _error;
  String get asin => _asin;
  String get title => _title;
  List<String> get images => _images;
  String get fullLink => _fullLink;
  String get description => _description;
  Prices get prices => _prices;
  Reviews get reviews => _reviews;
  Coupon get coupon => _coupon;
  bool get prime => _prime;
  bool get amazonChoice => _amazonChoice;
  bool get outOfStock => _outOfStock;
  Deal_info get dealInfo => _dealInfo;
  String get category => _category;
  String get subCategories => _subCategories;
  String get soldBy => _soldBy;
  String get shippedBy => _shippedBy;
  String get brand => _brand;

  ProductDetailDescription({
      bool error, 
      String asin, 
      String title, 
      List<String> images, 
      String fullLink, 
      String description, 
      Prices prices, 
      Reviews reviews, 
      Coupon coupon, 
      bool prime, 
      bool amazonChoice, 
      bool outOfStock, 
      Deal_info dealInfo, 
      String category, 
      String subCategories, 
      String soldBy, 
      String shippedBy, 
      String brand}){
    _error = error;
    _asin = asin;
    _title = title;
    _images = images;
    _fullLink = fullLink;
    _description = description;
    _prices = prices;
    _reviews = reviews;
    _coupon = coupon;
    _prime = prime;
    _amazonChoice = amazonChoice;
    _outOfStock = outOfStock;
    _dealInfo = dealInfo;
    _category = category;
    _subCategories = subCategories;
    _soldBy = soldBy;
    _shippedBy = shippedBy;
    _brand = brand;
}

  ProductDetailDescription.fromJson(dynamic json) {
    _error = json["error"];
    _asin = json["asin"];
    _title = json["title"];
    _images = json["images"] != null ? json["images"].cast<String>() : [];
    _fullLink = json["full_link"];
    _description = json["description"];
    _prices = json["prices"] != null ? Prices.fromJson(json["prices"]) : null;
    _reviews = json["reviews"] != null ? Reviews.fromJson(json["reviews"]) : null;
    _coupon = json["coupon"] != null ? Coupon.fromJson(json["coupon"]) : null;
    _prime = json["prime"];
    _amazonChoice = json["amazon_choice"];
    _outOfStock = json["out_of_stock"];
    _dealInfo = json["deal_info"] != null ? Deal_info.fromJson(json["dealInfo"]) : null;
    _category = json["category"];
    _subCategories = json["sub_categories"];
    _soldBy = json["sold_by"];
    _shippedBy = json["shipped_by"];
    _brand = json["brand"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["asin"] = _asin;
    map["title"] = _title;
    map["images"] = _images;
    map["full_link"] = _fullLink;
    map["description"] = _description;
    if (_prices != null) {
      map["prices"] = _prices.toJson();
    }
    if (_reviews != null) {
      map["reviews"] = _reviews.toJson();
    }
    if (_coupon != null) {
      map["coupon"] = _coupon.toJson();
    }
    map["prime"] = _prime;
    map["amazon_choice"] = _amazonChoice;
    map["out_of_stock"] = _outOfStock;
    if (_dealInfo != null) {
      map["deal_info"] = _dealInfo.toJson();
    }
    map["category"] = _category;
    map["sub_categories"] = _subCategories;
    map["sold_by"] = _soldBy;
    map["shipped_by"] = _shippedBy;
    map["brand"] = _brand;
    return map;
  }

}

/// deal_id : ""
/// lightning_deal : false
/// requested_perc : -1
/// timestamp_end : -1

class Deal_info {
  String _dealId;
  bool _lightningDeal;
  int _requestedPerc;
  int _timestampEnd;

  String get dealId => _dealId;
  bool get lightningDeal => _lightningDeal;
  int get requestedPerc => _requestedPerc;
  int get timestampEnd => _timestampEnd;

  Deal_info({
      String dealId, 
      bool lightningDeal, 
      int requestedPerc, 
      int timestampEnd}){
    _dealId = dealId;
    _lightningDeal = lightningDeal;
    _requestedPerc = requestedPerc;
    _timestampEnd = timestampEnd;
}

  Deal_info.fromJson(dynamic json) {
    _dealId = json["deal_id"];
    _lightningDeal = json["lightning_deal"];
    _requestedPerc = json["requested_perc"];
    _timestampEnd = json["timestamp_end"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["deal_id"] = _dealId;
    map["lightning_deal"] = _lightningDeal;
    map["requested_perc"] = _requestedPerc;
    map["timestamp_end"] = _timestampEnd;
    return map;
  }

}

/// coupon_code : ""
/// coupon_discount : 0.0
/// box_coupon : false
/// box_coupon_discount : 0.0

class Coupon {
  String _couponCode;
  double _couponDiscount;
  bool _boxCoupon;
  double _boxCouponDiscount;

  String get couponCode => _couponCode;
  double get couponDiscount => _couponDiscount;
  bool get boxCoupon => _boxCoupon;
  double get boxCouponDiscount => _boxCouponDiscount;

  Coupon({
      String couponCode, 
      double couponDiscount, 
      bool boxCoupon, 
      double boxCouponDiscount}){
    _couponCode = couponCode;
    _couponDiscount = couponDiscount;
    _boxCoupon = boxCoupon;
    _boxCouponDiscount = boxCouponDiscount;
}

  Coupon.fromJson(dynamic json) {
    _couponCode = json["coupon_code"];
    _couponDiscount = json["coupon_discount"];
    _boxCoupon = json["box_coupon"];
    _boxCouponDiscount = json["box_coupon_discount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coupon_code"] = _couponCode;
    map["coupon_discount"] = _couponDiscount;
    map["box_coupon"] = _boxCoupon;
    map["box_coupon_discount"] = _boxCouponDiscount;
    return map;
  }

}

/// total_reviews : 1715
/// stars : 4.3

class Reviews {
  int _totalReviews;
  double _stars;

  int get totalReviews => _totalReviews;
  double get stars => _stars;

  Reviews({
      int totalReviews, 
      double stars}){
    _totalReviews = totalReviews;
    _stars = stars;
}

  Reviews.fromJson(dynamic json) {
    _totalReviews = json["total_reviews"];
    _stars = json["stars"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total_reviews"] = _totalReviews;
    map["stars"] = _stars;
    return map;
  }

}

/// current_price : 26.0
/// previous_price : -1.0
/// checkout_discount : -1.0
/// prime_only_discount : -1.0
/// currency : "$"

class Prices {
  double _currentPrice;
  double _previousPrice;
  double _checkoutDiscount;
  double _primeOnlyDiscount;
  String _currency;

  double get currentPrice => _currentPrice;
  double get previousPrice => _previousPrice;
  double get checkoutDiscount => _checkoutDiscount;
  double get primeOnlyDiscount => _primeOnlyDiscount;
  String get currency => _currency;

  Prices({
      double currentPrice, 
      double previousPrice, 
      double checkoutDiscount, 
      double primeOnlyDiscount, 
      String currency}){
    _currentPrice = currentPrice;
    _previousPrice = previousPrice;
    _checkoutDiscount = checkoutDiscount;
    _primeOnlyDiscount = primeOnlyDiscount;
    _currency = currency;
}

  Prices.fromJson(dynamic json) {
    _currentPrice = json["current_price"];
    _previousPrice = json["previous_price"];
    _checkoutDiscount = json["checkout_discount"];
    _primeOnlyDiscount = json["prime_only_discount"];
    _currency = json["currency"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["current_price"] = _currentPrice;
    map["previous_price"] = _previousPrice;
    map["checkout_discount"] = _checkoutDiscount;
    map["prime_only_discount"] = _primeOnlyDiscount;
    map["currency"] = _currency;
    return map;
  }

}