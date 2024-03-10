class RecentSearchModel {
  int id;
  String name;
  int type;

  RecentSearchModel({required this.id, required this.name, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  factory RecentSearchModel.fromMap(Map<String, dynamic> map) {
    return RecentSearchModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
    );
  }
}
