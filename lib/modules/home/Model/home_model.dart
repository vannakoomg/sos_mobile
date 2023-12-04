class QuestionModelData {
  List<QuestionModel>? data;
  Meta? meta;

  QuestionModelData({this.data, this.meta});

  QuestionModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuestionModel>[];
      json['data'].forEach((v) {
        data!.add(QuestionModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class QuestionModel {
  int? id;
  String? title;
  String? description;
  List<String>? tags;
  String? action;
  int? amountAnswers;
  int? amountComments;
  String? createdAt;

  QuestionModel(
      {this.id,
      this.title,
      this.description,
      this.tags,
      this.action,
      this.amountAnswers,
      this.amountComments,
      this.createdAt});

  QuestionModel.fromJson(Map<String, dynamic> json) {
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

class Meta {
  int? lastPage;

  Meta({this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_page'] = lastPage;
    return data;
  }
}
