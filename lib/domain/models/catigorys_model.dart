class CatigoryModel {
  int id;
  String name;
  String image;

  CatigoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CatigoryModel.fromJson(Map<String, dynamic> json) {
    return CatigoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
