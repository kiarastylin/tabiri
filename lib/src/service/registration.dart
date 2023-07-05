import 'package:flutter/material.dart';

import '../connection/api.dart';

class registrationService {
  Api api = Api();

  Future registration(BuildContext context, String email, String password,
      String fullname, String phone) async {
    Map<String, dynamic> data = {
      'email': email.toString(),
      'fullname': fullname.toString(),
      'password': password.toString(),
      'phone': phone.toString(),
    };
    print(data);
    final response = await api.postAuth(context, 'auth/registration.php', data);
    return response;
  }
}
