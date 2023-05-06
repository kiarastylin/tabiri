import 'package:flutter/material.dart';
import 'package:tabiri/src/utils/app_const.dart';

class appDropdownTextFormField extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final String value;
  final void Function(String?)? onChanged;

  appDropdownTextFormField({
    required this.labelText,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConst.black),
          ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          onChanged: onChanged,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
      ),
    );
  }
}
