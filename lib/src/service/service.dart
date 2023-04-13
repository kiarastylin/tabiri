import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ApiService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  ));

  void _handleError(Response response) {
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch data");
    }
  }

  Future<bool> hasInternetConnection() async {
    try {
      Response response = await _dio.head(baseUrl);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> get(String endPoint) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      Response response = await _dio.get("$baseUrl/$endPoint");
      _handleError(response);
      return json.decode(response.toString());
    } catch (e) {
      throw Exception("Failed to fetch data");
    }
  }

  Future<dynamic> post(String endPoint, Map<String, dynamic> data) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      Response response = await _dio.post("$baseUrl/$endPoint", data: data);
      _handleError(response);
      return json.decode(response.toString());
    } catch (e) {
      throw Exception("Failed to post data");
    }
  }

  Future<dynamic> login(String username, String password) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    try {
      return await post('login', data);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
