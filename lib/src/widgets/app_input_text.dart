import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tabiri/src/widgets/app_text.dart';

class AppInputText extends StatelessWidget {
  final TextEditingController? textfieldcontroller;
  final String? label;
  final Icon? icon;
  final Color? fillcolor;
  final IconButton? suffixicon;
  final bool obscure;
  final Function? validate;
  final bool isemail;
  AppInputText({
    Key? key,
    required this.textfieldcontroller,
    required this.isemail,
    required this.fillcolor,
    this.icon,
    this.suffixicon,
    required this.label,
    required this.obscure,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      obscuringCharacter: '*',
      controller: textfieldcontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        label: Container(
          color: Colors.white,
          child: AppText(
            txt: label,
            size: 15,
            color: Colors.black,
          ),
        ),
        filled: true,
        fillColor: fillcolor,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: HexColor('#000000')),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: HexColor('#000000')),
        ),
        prefixIcon: icon,
        suffixIcon: suffixicon,
      ),
      validator: (value) {
        if (isemail) {
          if (value!.isNotEmpty) {
            return null;
          } else if (value.isEmpty) {
            return "THis field cannot be empty";
            ;
          }
        } else {
          if (value!.isNotEmpty) {
            return null;
          } else if (value.isEmpty) {
            return "THis field cannot be empty";
            ;
          }
        }
      },
    );
  }
}
