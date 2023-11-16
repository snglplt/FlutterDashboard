import 'package:selparteknolojidna/model/restaurant_model.dart';

class HomeModel {
  List<MealsOfTheDay>? mealsOfTheDay;
  List<PopularForBreakfast>? popularForBreakfast;
  List<RestaurantModel>? restaurantNearBy;

  HomeModel({this.mealsOfTheDay, this.popularForBreakfast, this.restaurantNearBy});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['meals_of_the_day'] != null) {
      mealsOfTheDay = <MealsOfTheDay>[];
      json['meals_of_the_day'].forEach((v) {
        mealsOfTheDay!.add(MealsOfTheDay.fromJson(v));
      });
    }
    if (json['popular_for_breakfast'] != null) {
      popularForBreakfast = <PopularForBreakfast>[];
      json['popular_for_breakfast'].forEach((v) {
        popularForBreakfast!.add(PopularForBreakfast.fromJson(v));
      });
    }
    if (json['restaurant_near_by'] != null) {
      restaurantNearBy = <RestaurantModel>[];
      json['restaurant_near_by'].forEach((v) {
        restaurantNearBy!.add(RestaurantModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mealsOfTheDay != null) {
      data['meals_of_the_day'] = mealsOfTheDay!.map((v) => v.toJson()).toList();
    }
    if (popularForBreakfast != null) {
      data['popular_for_breakfast'] = popularForBreakfast!.map((v) => v.toJson()).toList();
    }
    if (restaurantNearBy != null) {
      data['restaurant_near_by'] = restaurantNearBy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealsOfTheDay {
  String? id;
  String? name;
  String? time;
  String? review;
  String? image;

  MealsOfTheDay({this.id, this.name, this.time, this.review, this.image});

  MealsOfTheDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    review = json['review'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['review'] = review;
    data['image'] = image;
    return data;
  }
}

class PopularForBreakfast {
  String? id;
  String? name;
  String? address;
  String? price;
  String? review;
  String? time;
  String? image;

  PopularForBreakfast({this.id, this.name, this.address, this.price, this.review, this.time, this.image});

  PopularForBreakfast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    price = json['price'];
    review = json['review'];
    time = json['time'];
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
    data['image'] = image;
    return data;
  }
}
