class BannerModel {
  List<Banners>? banner;

  BannerModel({this.banner});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = <Banners>[];
      json['banner'].forEach((v) {
        banner!.add(Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  String? id;
  String? title;
  String? image;

  Banners({this.id, this.title, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
