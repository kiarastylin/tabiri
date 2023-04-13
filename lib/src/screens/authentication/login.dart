import 'package:flutter/material.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';
import 'package:tabiri/src/widgets/app_input_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  height: 55,
                  width: 340,
                  child: AppInputText(
                    textfieldcontroller: password,
                    icon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    label: 'Email',
                  )),
              Container(
                  height: 55,
                  width: 340,
                  child: AppInputText(
                    textfieldcontroller: password,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    label: 'Password',
                    obscure: dont_show_password,
                    suffixicon: IconButton(
                        onPressed: (() {
                          setState(() {
                            dont_show_password = !dont_show_password;
                          });
                        }),
                        icon: Icon(Icons.remove_red_eye)),
                  )),
            ],
          )),
    );
  }
}
