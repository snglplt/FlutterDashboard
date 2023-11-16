class AddressListModel {
  List<AddressList>? addressList;

  AddressListModel({this.addressList});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    if (json['address_list'] != null) {
      addressList = <AddressList>[];
      json['address_list'].forEach((v) {
        addressList!.add(AddressList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addressList != null) {
      data['address_list'] = addressList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressList {
  String? id;
  String? address;
  String? area;
  String? landmark;
  String? saveAs;

  AddressList({this.id, this.address, this.area, this.landmark, this.saveAs});

  AddressList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    area = json['area'];
    landmark = json['landmark'];
    saveAs = json['save_as'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['area'] = area;
    data['landmark'] = landmark;
    data['save_as'] = saveAs;
    return data;
  }
}
