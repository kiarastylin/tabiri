import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tabiri/routes/route-names.dart';

import '../connection/dio/api.dart';

class ApiService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> login(BuildContext context, String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await api.post('login', data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('role', response['role']);
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.home, (_) => false);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
