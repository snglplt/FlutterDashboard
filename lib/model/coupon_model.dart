class CouponModel {
  List<CouponList>? couponList;

  CouponModel({this.couponList});

  CouponModel.fromJson(Map<String, dynamic> json) {
    if (json['coupon_list'] != null) {
      couponList = <CouponList>[];
      json['coupon_list'].forEach((v) {
        couponList!.add(CouponList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (couponList != null) {
      data['coupon_list'] = couponList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponList {
  String? id;
  String? title;
  String? code;
  String? description;
  String? offValue;

  CouponList({this.id, this.title, this.code, this.description, this.offValue});

  CouponList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    description = json['description'];
    offValue = json['off_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['code'] = code;
    data['description'] = description;
    data['off_value'] = offValue;
    return data;
  }
}
