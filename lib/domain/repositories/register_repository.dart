import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/api/api.dart';

class RegisterRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response?> registerPost(BuildContext context, String phone,
      String password, String password_conf) async {
    final response = await apiDataSource.postRegister(
        context, phone, password, password_conf);
    return response;
  }
}
