import 'package:flutter/material.dart';

class SharedPrefKeys {
  static const String languageCode = 'languageCode';
  static const String defaultCode = 'tk';
  static const String appLanguage = 'AppLanguage';
}

class Constants {
  static const baseUrl = "http://216.250.12.159:8080/api/v1/";
}

class AppConstants {
  static const Locale defaultLocale = Locale('tk');
  static const List<Locale> supportedLocales = [
    Locale('ru', 'RU'),
    Locale('tk', 'TM'),
  ];
}
