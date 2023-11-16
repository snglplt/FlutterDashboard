class Restaurant {
  List<RestaurantModel>? restaurants;

  Restaurant({this.restaurants});

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json['restaurant_near_by'] != null) {
      restaurants = <RestaurantModel>[];
      json['restaurant_near_by'].forEach((v) {
        restaurants!.add(RestaurantModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (restaurants != null) {
      data['restaurant_near_by'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantModel {
  String? id;
  String? name;
  String? address;
  String? price;
  String? review;
  String? time;
  String? discount;
  String? image;

  RestaurantModel({this.id, this.name, this.address, this.price, this.review, this.time, this.discount, this.image});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    price = json['price'];
    review = json['review'];
    time = json['time'];
    discount = json['discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['price'] = price;
    data['review'] = review;
    data['time'] = time;
    data['discount'] = discount;
    data['image'] = image;
    return data;
  }
}
