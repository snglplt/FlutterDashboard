class ReviewModel {
  List<Rating>? rating;

  ReviewModel({this.rating});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rating != null) {
      data['rating'] = rating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rating {
  String? id;
  String? name;
  String? image;
  String? rating;

  Rating({this.id, this.name, this.image, this.rating});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['rating'] = rating;
    return data;
  }
}
