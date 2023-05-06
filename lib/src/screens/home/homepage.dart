import 'package:flutter/material.dart';
import 'package:tabiri/src/service/data.dart';
import 'package:tabiri/src/utils/app_const.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';
import 'package:tabiri/src/widgets/app_button.dart';
import 'package:tabiri/src/widgets/app_dropdown.dart';
import 'package:tabiri/src/widgets/app_input_text.dart';
import 'package:tabiri/src/widgets/app_snackbar.dart';
import 'package:tabiri/src/widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final dataService _dataService = dataService();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  var value;

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        bgcolor: AppConst.secondary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.primary,
          centerTitle: true,
          title: AppText(
            txt: 'Heart prediction',
            size: 15,
            color: AppConst.secondary,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AppInputText(
                labelColor: AppConst.secondary,
                textfieldcontroller: age,
                isemail: false,
                fillcolor: AppConst.secondary,
                label: 'Age',
                obscure: false),
            AppInputText(
                labelColor: AppConst.secondary,
                textfieldcontroller: sex,
                isemail: false,
                fillcolor: AppConst.secondary,
                label: 'Sex',
                obscure: false),
            appDropdownTextFormField(
              labelText: 'Fruits',
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
              options: ['Apple', 'Banana', 'Orange'],
              value: 'Apple',
            ),
            AppButton(
                onPress: () async {
                  try {
                    final response = await _dataService.login(context);
                    AppSnackbar(
                      isError: response.toString() == 'success' ? false : true,
                      response: response.toString(),
                    ).show(context);
                  } catch (e) {
                    // handle login error
                    AppSnackbar(
                      isError: true,
                      response: e.toString(),
                    ).show(context);
                  }
                },
                label: 'Submit',
                borderRadius: 20,
                textColor: AppConst.secondary,
                bcolor: AppConst.primary)
          ],
        ));
  }
}
