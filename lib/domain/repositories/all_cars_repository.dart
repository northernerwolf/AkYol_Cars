import 'package:dio/dio.dart';
import 'package:tmcars_clone/data/api/api.dart';

class AllCarsRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> allCarsRepository() async {
    final response = await apiDataSource.getCarsAll();
    return response;
  }
}

class AllCarsByIdRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> allCarsByIdRepository(String id) async {
    final response = await apiDataSource.getCarAllById(id);
    return response;
  }
}
