import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AnwserInQuestionModel {
  List<AnwserInQuestion>? data;
  Meta? meta;

  AnwserInQuestionModel({this.data, this.meta});

  AnwserInQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AnwserInQuestion>[];
      json['data'].forEach((v) {
        data!.add(AnwserInQuestion.fromJson(v));
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

class AnwserInQuestion {
  String? description;
  String? image;
  int? amountComments;
  int? isCorrect;
  int? isReport;
  String? createdAt;
  bool? isPosted;
  AnwserInQuestion(
      {this.description,
      this.image,
      this.amountComments,
      this.isCorrect,
      this.isReport,
      this.isPosted,
      this.createdAt});

  AnwserInQuestion.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];
    isPosted = json['isPosted'];
    amountComments = json['amount_comments'];
    isCorrect = json['is_correct'];
    isReport = json['is_report'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['image'] = image;
    data['isPosted'];
    data['amount_comments'] = amountComments;
    data['is_correct'] = isCorrect;
    data['is_report'] = isReport;
    data['created_at'] = createdAt;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
