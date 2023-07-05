// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabiri/routes/route-names.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  var email;
  _navigatortohome() async {
    await getValidationData().whenComplete(() async {
      await Future.delayed(Duration(seconds: 1), () {});
      if (email == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (email != null) {
            Navigator.pushNamed(context, RouteNames.home);
      } 
    });
  }
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var e = sharedPreferences.get('email');
    setState(() {
      email = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#B22121'),
      body: Center(
          child: SpinKitPumpingHeart(
        duration: const Duration(seconds: 3),
        size: 100,
        color: HexColor('#000000'),
      )),
    );
  }
}
