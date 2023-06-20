import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import '../connection/api.dart';

class dataService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future sendData(
    BuildContext context,
    String BMI,
    String PhysicalHealth,
    String MentalHealth,
    String SleepTime,
    String smokingValue,
    String AlcoholDrinkingValue,
    String StrokeValue,
    String DiffWalkingValue,
    String SexValue,
    String AgeCategoryValue,
    String RaceValue,
    String PhysicalActivityValue,
    String GenHealthValue,
    String AsthmaValue,
    String KidneyDiseaseValue,
    String SkinCancerValue,
  ) async {
    Map<String, dynamic> data = {
      'BMI': BMI.toString(),
      'PhysicalHealth': PhysicalHealth.toString(),
      'MentalHealth': MentalHealth.toString(),
      'SleepTime': SleepTime.toString(),
      'smokingValue': smokingValue.toString(),
      'AlcoholDrinkingValue': AlcoholDrinkingValue.toString(),
      'StrokeValue': StrokeValue.toString(),
      'DiffWalkingValue': DiffWalkingValue.toString(),
      'SexValue': SexValue.toString(),
      'AgeCategoryValue': AgeCategoryValue.toString(),
      'RaceValue': RaceValue.toString(),
      'PhysicalActivityValue': PhysicalActivityValue.toString(),
      'GenHealthValue': GenHealthValue.toString(),
      'AsthmaValue': AsthmaValue.toString(),
      'KidneyDiseaseValue': SkinCancerValue.toString(),
      'SkinCancerValue': SkinCancerValue.toString(),
    };
    final response = await api.post('app.py', data);
    return response;
  }
}
