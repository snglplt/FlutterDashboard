class MyOrderListModel {
  List<OrderList>? orderList;

  MyOrderListModel({this.orderList});

  MyOrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['order_list'] != null) {
      orderList = <OrderList>[];
      json['order_list'].forEach((v) {
        orderList!.add(OrderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderList != null) {
      data['order_list'] = orderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderList {
  String? id;
  String? name;
  String? address;
  String? item;
  String? status;
  String? dateTime;
  String? amount;

  OrderList({this.id, this.name, this.address, this.item, this.status, this.dateTime, this.amount});

  OrderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    item = json['item'];
    status = json['status'];
    dateTime = json['date_time'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['item'] = item;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['amount'] = amount;
    return data;
  }
}
