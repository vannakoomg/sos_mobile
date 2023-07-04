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
  Kyc? kyc;
  String? fullNameKh;
  String? profile;
  String? bio;
  List<Questions>? questions;
  List<Answers>? answers;

  Data(
      {this.kyc,
      this.fullNameKh,
      this.profile,
      this.bio,
      this.questions,
      this.answers});

  Data.fromJson(Map<String, dynamic> json) {
    kyc = json['kyc'] != null ? Kyc.fromJson(json['kyc']) : null;
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
    if (kyc != null) {
      data['kyc'] = kyc!.toJson();
    }
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

class Kyc {
  String? question;
  String? likeQuestion;
  String? answers;
  String? likeAnswers;

  Kyc({this.question, this.likeQuestion, this.answers, this.likeAnswers});

  Kyc.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    likeQuestion = json['like_question'];
    answers = json['answers'];
    likeAnswers = json['like_answers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['like_question'] = likeQuestion;
    data['answers'] = answers;
    data['like_answers'] = likeAnswers;
    return data;
  }
}

class Questions {
  int? id;
  String? istrue;
  String? title;
  String? description;
  List<String>? tags;
  String? action;
  int? amountAnswers;
  int? amountComments;
  String? createdAt;

  Questions(
      {this.id,
      this.istrue,
      this.title,
      this.description,
      this.tags,
      this.action,
      this.amountAnswers,
      this.amountComments,
      this.createdAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    istrue = json['istrue'];
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
    data['istrue'] = istrue;
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
  int? id;
  String? title;
  String? description;
  List<String>? tags;
  String? action;
  int? amountAnswers;
  int? amountComments;
  String? createdAt;

  Answers(
      {this.id,
      this.title,
      this.description,
      this.tags,
      this.action,
      this.amountAnswers,
      this.amountComments,
      this.createdAt});

  Answers.fromJson(Map<String, dynamic> json) {
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
