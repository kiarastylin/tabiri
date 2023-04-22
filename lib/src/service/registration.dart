import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tabiri/routes/route-names.dart';

import '../connection/dio/api.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> registration(BuildContext context, String email, String password,
      String fullname, String region) async {
    Map<String, dynamic> data = {
      'email': email.toString(),
      'fullname': fullname.toString(),
      'region': region.toString(),
      'password': password.toString(),
    };
    final response = await api.post('registration.php', data);
    print(response);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    // await prefs.setString('role', response['role']);
    Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (_) => false);
  }
}
