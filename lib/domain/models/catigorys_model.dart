class CatigoryModel {
  int id;
  String name;

  CatigoryModel({
    required this.id,
    required this.name,
  });

  factory CatigoryModel.fromJson(Map<String, dynamic> json) {
    return CatigoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
