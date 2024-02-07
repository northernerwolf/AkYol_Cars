class CarModel {
  int id;
  String name;
  int count;
  String image;

  CarModel({
    required this.id,
    required this.name,
    required this.count,
    required this.image,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      count: json['count'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
