class UserModel {
  String? id;
  String? name;
  String? image;
  String? email;
  String? phoneNumber;
  String? gender;

  UserModel({this.id, this.name, this.image, this.email, this.phoneNumber, this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    return data;
  }
}
