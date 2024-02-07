class ErrorModel {
  String type;
  dynamic value;
  String msg;
  String path;
  String location;

  ErrorModel({
    required this.type,
    required this.value,
    required this.msg,
    required this.path,
    required this.location,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      type: json['type'],
      value: json['value'],
      msg: json['msg'],
      path: json['path'],
      location: json['location'],
    );
  }
}
