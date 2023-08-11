class ProfileModel {
  Data? data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullNameEn;
  String? fullNameKh;
  String? profile;
  String? bio;
  List<Questions>? questions;
  List<Answers>? answers;

  Data(
      {this.fullNameEn,
      this.fullNameKh,
      this.profile,
      this.bio,
      this.questions,
      this.answers});

  Data.fromJson(Map<String, dynamic> json) {
    fullNameEn = json['full_name_en'];
    fullNameKh = json['full_name_kh'];
    profile = json['profile'];
    bio = json['bio'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name_en'] = fullNameEn;
    data['full_name_kh'] = fullNameKh;
    data['profile'] = profile;
    data['bio'] = bio;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? title;
  String? description;
  List<String>? tags;
  String? action;
  int? amountAnswers;
  int? amountComments;
  String? createdAt;

  Questions(
      {this.id,
      this.title,
      this.description,
      this.tags,
      this.action,
      this.amountAnswers,
      this.amountComments,
      this.createdAt});

  Questions.fromJson(Map<String, dynamic> json) {
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

class Answers {
  Questions? question;
  String? description;
  String? image;
  int? amountComments;
  int? isCorrect;
  int? isReport;
  String? createdAt;

  Answers(
      {this.question,
      this.description,
      this.image,
      this.amountComments,
      this.isCorrect,
      this.isReport,
      this.createdAt});

  Answers.fromJson(Map<String, dynamic> json) {
    question =
        json['question'] != null ? Questions.fromJson(json['question']) : null;
    description = json['description'];
    image = json['image'];
    amountComments = json['amount_comments'];
    isCorrect = json['is_correct'];
    isReport = json['is_report'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['description'] = description;
    data['image'] = image;
    data['amount_comments'] = amountComments;
    data['is_correct'] = isCorrect;
    data['is_report'] = isReport;
    data['created_at'] = createdAt;
    return data;
  }
}
