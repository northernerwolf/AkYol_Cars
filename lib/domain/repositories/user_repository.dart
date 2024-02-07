import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmcars_clone/data/api/api.dart';

class UserRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> userRepository(
    BuildContext context,
    String token,
  ) async {
    final response = await apiDataSource.getUser(
      context,
      token,
    );
    return response;
  }
}
