import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Setuprepository {
  static Future<dynamic> getPerusahaan(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = "application/json";
    dio.options.headers['api-key'] = "123";
    // dio.options.headers['Access-Control-Allow-Origin'] = "*";
    // dio.options.headers['x-password'] = xpassword;
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("Data : $json");
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> getKantor(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> insertKantor(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> editKantor(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> deleteKantor(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> setup(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    print("REQUEST : $json");
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.post(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> updatesetup(
    String token,
    String url,
    String json,
  ) async {
    Dio dio = Dio();
    // dio.options.headers['x-username'] = xusername;
    dio.options.headers['api-key'] = "123";
    dio.options.headers['Content-Type'] = "application/json";
    // dio.options.headers['x-password'] = xpassword;
    if (kDebugMode) {
      print("ENDPOINT URL : $url");
    }
    final response = await dio.put(url, data: json);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }
}
