import 'dart:io';

class BaseUrl {
  static String baseUrl = Platform.isAndroid ? 'http://10.0.2.2:5000' : 'http://127.0.0.1:5000';

  static String Get() {
    return baseUrl;
  }

  static SwitchToLocal() {
    baseUrl =
        Platform.isAndroid ? 'http://10.0.2.2:5000' : 'http://127.0.0.1:5000';
  }

  static SwitchToVPS() {
    baseUrl = 'http://147.45.75.109:80';
  }
}
