class HomeModel {
  List<Data>? data;

  HomeModel({this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  List<String>? tags;
  String? action;
  int? amountAnswers;
  int? amountComments;
  String? createdAt;

  Data(
      {this.id,
      this.title,
      this.description,
      this.tags,
      this.action,
      this.amountAnswers,
      this.amountComments,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    action = json['action'];
    amountAnswers = json['amount_answers'];
    amountComments = json['amount_comments'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['tags'] = tags;
    data['action'] = action;
    data['amount_answers'] = amountAnswers;
    data['amount_comments'] = amountComments;
    data['created_at'] = createdAt;
    return data;
  }
}
