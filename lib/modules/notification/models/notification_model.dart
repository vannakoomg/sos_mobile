class NotificationModel {
  String? id;
  String? qusetionId;
  String? profileId;
  String? name;
  String? title;
  String? time;
  String? image;
  String? type;

  NotificationModel(
      {this.id,
      this.qusetionId,
      this.profileId,
      this.name,
      this.title,
      this.time,
      this.image,
      this.type});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qusetionId = json['qusetion_id'];
    profileId = json['profile_id'];
    name = json['name'];
    title = json['title'];
    time = json['time'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qusetion_id'] = qusetionId;
    data['profile_id'] = profileId;
    data['name'] = name;
    data['title'] = title;
    data['time'] = time;
    data['image'] = image;
    data['type'] = type;
    return data;
  }
}
