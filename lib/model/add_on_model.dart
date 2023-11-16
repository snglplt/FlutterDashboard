class AddOnModel {
  List<AddOnQuantity>? addOnQuantity;
  List<AddOnQuantity>? addOnChoiceOfPreparations;

  AddOnModel({this.addOnQuantity, this.addOnChoiceOfPreparations});

  AddOnModel.fromJson(Map<String, dynamic> json) {
    if (json['add_on_quantity'] != null) {
      addOnQuantity = <AddOnQuantity>[];
      json['add_on_quantity'].forEach((v) {
        addOnQuantity!.add(AddOnQuantity.fromJson(v));
      });
    }
    if (json['add_on_choice_of_preparations'] != null) {
      addOnChoiceOfPreparations = <AddOnQuantity>[];
      json['add_on_choice_of_preparations'].forEach((v) {
        addOnChoiceOfPreparations!.add(AddOnQuantity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addOnQuantity != null) {
      data['add_on_quantity'] = addOnQuantity!.map((v) => v.toJson()).toList();
    }
    if (addOnChoiceOfPreparations != null) {
      data['add_on_choice_of_preparations'] = addOnChoiceOfPreparations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddOnQuantity {
  String? id;
  String? name;
  String? price;

  AddOnQuantity({this.id, this.name, this.price});

  AddOnQuantity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
