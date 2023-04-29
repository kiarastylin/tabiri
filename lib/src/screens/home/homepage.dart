import 'package:flutter/material.dart';
import 'package:tabiri/src/service/data.dart';
import 'package:tabiri/src/utils/app_const.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';
import 'package:tabiri/src/widgets/app_button.dart';
import 'package:tabiri/src/widgets/app_input_text.dart';
import 'package:tabiri/src/widgets/app_snackbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final dataService _dataService = dataService();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      child: Column(
        children: [
          AppInputText(textfieldcontroller: age, isemail: false, fillcolor: AppConst.secondary, label: 'Age', obscure: false),
          AppInputText(textfieldcontroller: sex, isemail: false, fillcolor: AppConst.secondary, label: 'Sex', obscure: false),
          AppButton(onPress: () async{
                              try {
                                final response = await _dataService.login(
                                    context);
                                AppSnackbar(
                                  isError: response.toString() == 'success'
                                      ? false
                                      : true,
                                  response: response.toString(),
                                ).show(context);
                              } catch (e) {
                                // handle login error
                                AppSnackbar(
                                  isError: true,
                                  response: e.toString(),
                                ).show(context);
                              }
                            }, label: 'Submit', borderRadius: 20, textColor: AppConst.secondary, bcolor: AppConst.primary)
        ],
      )
    );
  }
}