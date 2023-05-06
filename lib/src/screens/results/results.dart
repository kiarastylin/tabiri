import 'package:flutter/material.dart';
import 'package:tabiri/src/widgets/app_base_screen.dart';

class results extends StatefulWidget {
  const results({super.key});

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height /3,
        child: Card(
          elevation: 4,
        ),
      ),
    ));
  }
}