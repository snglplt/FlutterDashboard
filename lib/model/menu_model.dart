class MenuModel {
  List<MenuList>? menuList;

  MenuModel({this.menuList});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu_list'] != null) {
      menuList = <MenuList>[];
      json['menu_list'].forEach((v) {
        menuList!.add(MenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menuList != null) {
      data['menu_list'] = menuList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuList {
  String? id;
  String? title;
  List<String>? menu;

  MenuList({this.id, this.title, this.menu});

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    menu = json['menu'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['menu'] = menu;
    return data;
  }
}
