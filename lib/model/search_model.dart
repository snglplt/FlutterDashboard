class SearchModel {
  List<SearchHistory>? searchHistory;

  SearchModel({this.searchHistory});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['search_history'] != null) {
      searchHistory = <SearchHistory>[];
      json['search_history'].forEach((v) {
        searchHistory!.add(SearchHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchHistory != null) {
      data['search_history'] = searchHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchHistory {
  String? id;
  String? searchName;

  SearchHistory({this.id, this.searchName});

  SearchHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    searchName = json['search_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['search_name'] = searchName;
    return data;
  }
}
