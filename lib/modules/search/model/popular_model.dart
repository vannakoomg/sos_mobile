class PopularModel {
  List<Data>? data;
  int? statusCode;

  PopularModel({this.data, this.statusCode});

  PopularModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    return data;
  }
}

class Data {
  String? title;
  String? image;
  String? paramater;

  Data({this.title, this.image, this.paramater});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    paramater = json['paramater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['paramater'] = paramater;
    return data;
  }
}
