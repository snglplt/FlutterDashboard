class ProductModel {
  List<ProductList>? productList;

  ProductModel({this.productList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['product_list'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? id;
  String? name;
  String? image;
  List<Product>? product;

  ProductList({this.id, this.name, this.image, this.product});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? image;
  String? review;
  String? totalReview;
  String? price;
  String? quantity;

  Product({this.id, this.name, this.image, this.review, this.totalReview, this.price, this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    review = json['review'];
    totalReview = json['total_review'];
    price = json['price'];
    quantity = json['quantity'] ?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['review'] = review;
    data['total_review'] = totalReview;
    data['price'] = price;
    return data;
  }
}
