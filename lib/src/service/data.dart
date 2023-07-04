import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class dataService {
  // static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();
  Future sendData(
    BuildContext context,
    String BMI,
    String SmokingValue,
    String AlcoholDrinkingValue,
    String StrokeValue,
    String PhysicalHealth,
    String MentalHealth,
    String DiffWalkingValue,
    String SexValue,
    String AgeCategoryValue,
    String RaceValue,
    String DiabeticValue,
    String PhysicalActivityValue,
    String GenHealthValue,
    String SleepTime,
    String AsthmaValue,
    String KidneyDiseaseValue,
    String SkinCancerValue,
  ) async {
    // print(baseUrl);
    print("Error occured");
    Map<String, dynamic> data = {
      'BMI': int.parse(BMI),
      'Smoking': int.parse(SmokingValue),
      'AlcoholDrinking': int.parse(AlcoholDrinkingValue),
      'Stroke': int.parse(StrokeValue),
      'PhysicalHealth': int.parse(PhysicalHealth),
      'MentalHealth': int.parse(MentalHealth),
      'DiffWalking': int.parse(DiffWalkingValue),
      'Sex': int.parse(SexValue),
      'AgeCategory': int.parse(AgeCategoryValue),
      'Race': int.parse(RaceValue),
      'Diabetic': int.parse(DiabeticValue),
      'PhysicalActivity': int.parse(PhysicalActivityValue),
      'GenHealth': int.parse(GenHealthValue),
      'SleepTime': int.parse(SleepTime),
      'Asthma': int.parse(AsthmaValue),
      'KidneyDisease': int.parse(SkinCancerValue),
      'SkinCancer': int.parse(SkinCancerValue),
    };
    final response = await api.post('', {'data': data});
    print(response);
    return response;
  }
}
