class ResultSearchModel {
  int? currentPage;
  List<ResultSearch>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  void nextPageUrl;
  String? path;
  int? perPage;
  void prevPageUrl;
  int? to;
  int? total;

  ResultSearchModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ResultSearchModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ResultSearch>[];
      json['data'].forEach((v) {
        data!.add(ResultSearch.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class ResultSearch {
  int? id;
  String? title;
  String? description;
  String? image;
  int? userId;
  int? isReport;
  String? createdAt;
  String? updatedAt;

  ResultSearch(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.userId,
      this.isReport,
      this.createdAt,
      this.updatedAt});

  ResultSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    userId = json['user_id'];
    isReport = json['is_report'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['user_id'] = userId;
    data['is_report'] = isReport;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
