import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmcars_clone/core/constants.dart';

class MyApiDataSource {
  static Dio dio = Dio();
  Future<Response?> postRegister(BuildContext context, String phone,
      String password, String passwordConf) async {
    print('${Constants.baseUrl}user/registry');
    try {
      final response = await dio.post(
        '${Constants.baseUrl}user/registry',
        data: jsonEncode({
          "phone": phone,
          "password": password,
          "password_conf": passwordConf,
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {}
      return e.response;
    }
  }

  Future<Response?> postLogin(
      BuildContext context, String phone, String password) async {
    try {
      final response = await dio.post(
        '${Constants.baseUrl}user/login',
        data: jsonEncode({
          "phone": phone,
          "password": password,
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {}
      return e.response;
    }
  }

  Future<Response> postPassword(String password, String password_conf) async {
    final response =
        await dio.post('${Constants.baseUrl}/user/password', data: {
      "password": password,
      "password_conf": password_conf,
    });
    return response;
  }

  Future<Response?> getUser(BuildContext context, String token) async {
    final header = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await dio.get(
        '${Constants.baseUrl}user/profile',
        // data: jsonEncode({
        //   "token": token,
        // }),
        options: Options(headers: {
          'headers': header,
        }),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {}
      return e.response;
    }
  }

  Future<Response?> getCarsModels() async {
    // final headers = {
    //   'Authorization': '$token',
    // };
    try {
      final response = await dio.get(
        '${Constants.baseUrl}mark',
        // data: jsonEncode({
        //   "token": token,
        // }),
        // options: Options(headers: {
        //   'headers': headers,
        // }),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {}
      return e.response;
    }
  }

  Future<Response?> getCatigorys() async {
    // final headers = {
    //   'Authorization': '$token',
    // };
    try {
      final response = await dio.get(
        '${Constants.baseUrl}car/category',
        // data: jsonEncode({
        //   "token": token,
        // }),
        // options: Options(headers: {
        //   'headers': headers,
        // }),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {}
      return e.response;
    }
  }
}
