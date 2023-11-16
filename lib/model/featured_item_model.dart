class FeaturedItemModel {
  List<FeaturedItem>? featuredItem;

  FeaturedItemModel({this.featuredItem});

  FeaturedItemModel.fromJson(Map<String, dynamic> json) {
    if (json['featured_item'] != null) {
      featuredItem = <FeaturedItem>[];
      json['featured_item'].forEach((v) {
        featuredItem!.add(FeaturedItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredItem != null) {
      data['featured_item'] = featuredItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedItem {
  String? id;
  String? name;
  String? time;
  String? review;
  String? image;

  FeaturedItem({this.id, this.name, this.time, this.review, this.image});

  FeaturedItem.fromJson(Map<String, dynamic> json) {
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
