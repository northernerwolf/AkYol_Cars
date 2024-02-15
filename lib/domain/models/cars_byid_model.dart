class VehicleModel {
  int id;
  String description;
  double price;
  int year;
  double volume;
  String vid;
  int probeg;
  bool change;
  bool credit;
  String time;
  Mark mark;
  Model model;
  Color color;
  Kuzow kuzow;
  Priwod priwod;
  User user;
  Korobka korobka;
  Location location;
  List<Image> images;

  VehicleModel({
    required this.id,
    required this.description,
    required this.price,
    required this.year,
    required this.volume,
    required this.vid,
    required this.probeg,
    required this.change,
    required this.credit,
    required this.time,
    required this.mark,
    required this.model,
    required this.color,
    required this.kuzow,
    required this.priwod,
    required this.user,
    required this.korobka,
    required this.location,
    required this.images,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      description: json['description'],
      price: json['price'].toDouble(),
      year: json['year'],
      volume: json['volume'].toDouble(),
      vid: json['vid'],
      probeg: json['probeg'],
      change: json['change'],
      credit: json['credit'],
      time: json['time'],
      mark: Mark.fromJson(json['mark']),
      model: Model.fromJson(json['model']),
      color: Color.fromJson(json['Color']),
      kuzow: Kuzow.fromJson(json['kuzow']),
      priwod: Priwod.fromJson(json['priwod']),
      user: User.fromJson(json['user']),
      korobka: Korobka.fromJson(json['korobka']),
      location: Location.fromJson(json['location']),
      images: (json['images'] as List)
          .map((image) => Image.fromJson(image))
          .toList(),
    );
  }
}

class Mark {
  int id;
  String name;

  Mark({
    required this.id,
    required this.name,
  });

  factory Mark.fromJson(Map<String, dynamic> json) {
    return Mark(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Model {
  int id;
  String name;

  Model({
    required this.id,
    required this.name,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Color {
  int id;
  String name;

  Color({
    required this.id,
    required this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Kuzow {
  int id;
  String name;

  Kuzow({
    required this.id,
    required this.name,
  });

  factory Kuzow.fromJson(Map<String, dynamic> json) {
    return Kuzow(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Priwod {
  int id;
  String name;

  Priwod({
    required this.id,
    required this.name,
  });

  factory Priwod.fromJson(Map<String, dynamic> json) {
    return Priwod(
      id: json['id'],
      name: json['name'],
    );
  }
}

class User {
  int id;
  String phone;

  User({
    required this.id,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
    );
  }
}

class Korobka {
  int id;
  String name;

  Korobka({
    required this.id,
    required this.name,
  });

  factory Korobka.fromJson(Map<String, dynamic> json) {
    return Korobka(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Location {
  int id;
  String name;
  Welayat welayat;

  Location({
    required this.id,
    required this.name,
    required this.welayat,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
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

class Image {
  int id;
  String paths;

  Image({
    required this.id,
    required this.paths,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      paths: json['paths'],
    );
  }
}
