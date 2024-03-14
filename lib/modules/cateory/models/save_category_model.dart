class SaveCategoryModel {
  List<Data>? data;

  SaveCategoryModel({this.data});

  SaveCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? cover;
  int? count;

  Data({this.id, this.name, this.count, this.cover});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['count'] = count;
    data['cover'] = cover;
    return data;
  }
}
