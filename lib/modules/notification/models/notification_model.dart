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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qusetion_id'] = this.qusetionId;
    data['profile_id'] = this.profileId;
    data['name'] = this.name;
    data['title'] = this.title;
    data['time'] = this.time;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}
