import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getApiKey() {
    log(_config['api_key_bing'] as String);
    return _config['api_key_bing'] as String;
  }
}
