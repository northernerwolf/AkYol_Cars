import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmcars_clone/data/api/api.dart';

class LoginRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> loginRepository(
    BuildContext context,
    String phone,
    String password,
  ) async {
    final response = await apiDataSource.postLogin(
      context,
      phone,
      password,
    );
    return response;
  }
}
