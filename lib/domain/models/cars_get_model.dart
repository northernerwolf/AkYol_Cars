class CarDataModel {
  int pages;
  int page;
  List<CarItemModel> data;

  CarDataModel({
    required this.pages,
    required this.page,
    required this.data,
  });

  factory CarDataModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonDataList = json['data'] ?? [];
    List<CarItemModel> carItems =
        jsonDataList.map((item) => CarItemModel.fromJson(item)).toList();

    return CarDataModel(
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      data: carItems,
    );
  }
}

class CarItemModel {
  int id;
  bool change;
  bool credit;
  int price;
  int year;
  String time;
  CarModel model;
  CarMark mark;
  CarLocation location;
  List<String> image;

  CarItemModel({
    required this.id,
    required this.change,
    required this.credit,
    required this.price,
    required this.year,
    required this.time,
    required this.model,
    required this.mark,
    required this.location,
    required this.image,
  });

  factory CarItemModel.fromJson(Map<String, dynamic> json) {
    return CarItemModel(
      id: json['id'],
      change: json['change'],
      credit: json['credit'],
      price: json['price'],
      year: json['year'],
      time: json['time'],
      model: CarModel.fromJson(json['model']),
      mark: CarMark.fromJson(json['mark']),
      location: CarLocation.fromJson(json['location']),
      image: List<String>.from(json['image'] ?? ''),
    );
  }
}

class CarModel {
  int id;
  String name;

  CarModel({
    required this.id,
    required this.name,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CarMark {
  int id;
  String name;

  CarMark({
    required this.id,
    required this.name,
  });

  factory CarMark.fromJson(Map<String, dynamic> json) {
    return CarMark(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CarLocation {
  int id;
  String name;
  Welayat welayat;

  CarLocation({
    required this.id,
    required this.name,
    required this.welayat,
  });

  factory CarLocation.fromJson(Map<String, dynamic> json) {
    return CarLocation(
      id: json['id'],
      name: json['name'],
      welayat: Welayat.fromJson(json['welayat']),
    );
  }
}

class Welayat {
  int id;
  String name;

  Welayat({
    required this.id,
    required this.name,
  });

  factory Welayat.fromJson(Map<String, dynamic> json) {
    return Welayat(
      id: json['id'],
      name: json['name'],
    );
  }
}
