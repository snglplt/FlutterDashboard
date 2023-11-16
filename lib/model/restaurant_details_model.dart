class RestaurantDetailsModel {
  String? id;
  String? name;
  String? address;
  String? review;
  String? bookmark;
  String? images;
  String? image;

  RestaurantDetailsModel({this.id, this.name, this.address, this.review, this.bookmark, this.images, this.image});

  RestaurantDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    review = json['review'];
    bookmark = json['bookmark'];
    images = json['images'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['review'] = review;
    data['bookmark'] = bookmark;
    data['images'] = images;
    data['image'] = image;
    return data;
  }
}
