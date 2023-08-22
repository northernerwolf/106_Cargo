import 'package:flutter/material.dart';

class SharedPrefKeys {
  static const String languageCode = 'languageCode';
  static const String defaultCode = 'tk';
  static const String appLanguage = 'AppLanguage';
}

class Constants {
  static const baseUrl = "https://106cargo.com.tm/api";
}

class AppConstants {
  static const Locale defaultLocale = Locale('tk');
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
    Locale('tk', 'TM'),
  ];
}
