class SettingModel {
  String? mode;
  String? languages;
  int? privateAccount;
  int? showAacl;
  int? showAnswer;
  int? showQuestion;
  int? notification;
  int? notificationLike;
  int? notificationComment;
  int? notificationAnswer;
  int? notificationCorrect;

  SettingModel(
      {this.mode = '1',
      this.languages,
      this.privateAccount,
      this.showAacl,
      this.showAnswer,
      this.showQuestion,
      this.notification,
      this.notificationLike,
      this.notificationComment,
      this.notificationAnswer,
      this.notificationCorrect});

  SettingModel.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    languages = json['languages'];
    privateAccount = json['private_account'];
    showAacl = json['show_aacl'];
    showAnswer = json['show_answer'];
    showQuestion = json['show_question'];
    notification = json['notification'];
    notificationLike = json['notification_like'];
    notificationComment = json['notification_comment'];
    notificationAnswer = json['notification_answer'];
    notificationCorrect = json['notification_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mode'] = mode;
    data['languages'] = languages;
    data['private_account'] = privateAccount;
    data['show_aacl'] = showAacl;
    data['show_answer'] = showAnswer;
    data['show_question'] = showQuestion;
    data['notification'] = notification;
    data['notification_like'] = notificationLike;
    data['notification_comment'] = notificationComment;
    data['notification_answer'] = notificationAnswer;
    data['notification_correct'] = notificationCorrect;
    return data;
  }
}
