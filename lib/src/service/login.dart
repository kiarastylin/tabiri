import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class loginService {
  Api api = Api();

  Future login(BuildContext context, String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    final response = await api.postAuth(context, 'auth/login.php', data);
    return response;
  }
}
