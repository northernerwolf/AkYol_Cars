import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmcars_clone/data/api/api.dart';

class CarsModelsRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> carsModelsRepository() async {
    final response = await apiDataSource.getCarsModels();
    return response;
  }
}

class CarsCatigorysRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> carsCatigorysRepository() async {
    final response = await apiDataSource.getCatigorys();
    return response;
  }
}

class CarsCatigorysByIdRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> carsCatigorysByIdRepository(String id) async {
    final response = await apiDataSource.getCatigorysById(id);
    return response;
  }
}
