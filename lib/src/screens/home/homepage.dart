import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tabiri/routes/route-names.dart';
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
  TextEditingController BMI = TextEditingController();
  TextEditingController PhysicalHealth = TextEditingController();
  TextEditingController MentalHealth = TextEditingController();
  TextEditingController SleepTime = TextEditingController();
  var Smoking, SmokingValue;
  var AlcoholDrinking, AlcoholDrinkingValue;
  var Stroke, StrokeValue;
  var DiffWalking, DiffWalkingValue;
  var Sex, SexValue;
  var AgeCategory, AgeCategoryValue;
  var Race, RaceValue;
  var Diabetic, DiabeticValue;
  var PhysicalActivity, PhysicalActivityValue;
  var GenHealth, GenHealthValue;
  var Asthma, AsthmaValue;
  var KidneyDisease, KidneyDiseaseValue;
  var SkinCancer, SkinCancerValue;

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
            AppText(
              txt:
                  'Data not saved or used. Predictions not guaranteed. Not medical advice. Consult professional for concerns. Informational purposes only, not a medical diagnosis.',
              size: 15,
              color: AppConst.primary,
              weight: FontWeight.w900,
            ),
            SizedBox(
              height: 20,
            ),
            AppInputText(
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                textfieldcontroller: BMI,
                isemail: false,
                fillcolor: AppConst.secondary,
                label: 'Computed body mass index',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'Smoked at least 100 cigarettes',
              onChanged: (newValue) {
                setState(() {
                  Smoking = newValue;
                });
                if (Smoking == 'Yes') {
                  setState(() {
                    SmokingValue = 1.toString();
                  });
                } else {
                  setState(() {
                    SmokingValue = 0.toString();
                  });
                }
              },
              options: ['Select', 'Yes', 'No'],
              value: Smoking ?? 'Select',
            ),
            AppDropdownTextFormField(
              labelText: 'Heavy Alcohol Consumption',
              options: ['Select', 'Yes', 'No'],
              value: AlcoholDrinking ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  AlcoholDrinking = newValue;
                });
                if (AlcoholDrinking == 'Yes') {
                  setState(() {
                    AlcoholDrinkingValue = 1.toString();
                  });
                } else {
                  setState(() {
                    AlcoholDrinkingValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Ever Diagnosed with a stroke?',
              options: ['Select', 'Yes', 'No'],
              value: Stroke ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  Stroke = newValue;
                });
                if (Stroke == 'Yes') {
                  setState(() {
                    StrokeValue = 1.toString();
                  });
                } else {
                  setState(() {
                    StrokeValue = 0.toString();
                  });
                }
              },
            ),
            AppInputText(
                textfieldcontroller: PhysicalHealth,
                isemail: false,
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'Number of Days Physical Health Not Good',
                obscure: false),
            AppInputText(
                textfieldcontroller: MentalHealth,
                isemail: false,
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'Number of Days Mental Health Not Good',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'Difficulty walking or Climbing stairs',
              options: [
                'Select',
                'Yes',
                'No',
              ],
              value: DiffWalking ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  DiffWalking = newValue;
                });
                if (DiffWalking == 'Yes') {
                  setState(() {
                    DiffWalkingValue = 1.toString();
                  });
                } else {
                  setState(() {
                    DiffWalkingValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Are you male or female?',
              options: [
                'Select',
                'Male',
                'Female',
              ],
              value: Sex ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  Sex = newValue;
                });
                if (Sex == 'Male') {
                  setState(() {
                    SexValue = 1.toString();
                  });
                } else {
                  setState(() {
                    SexValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Reported age in five -year age categories ',
              options: [
                'Select',
                '18-24',
                '25-29',
                '30-34',
                '35-39',
                '40-44',
                '45-49',
                '50-54',
                '55-59',
                '60-64',
                '65-69',
                '70-74',
                '75-79',
                '80+'
              ],
              value: AgeCategory ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  AgeCategory = newValue;
                });
                if (AgeCategory == '18-24') {
                  setState(() {
                    AgeCategoryValue = 0.toString();
                  });
                } else if (AgeCategory == '25-29') {
                  AgeCategoryValue = 1.toString();
                } else if (AgeCategory == '30-34') {
                  AgeCategoryValue = 2.toString();
                } else if (AgeCategory == '35-39') {
                  AgeCategoryValue = 3.toString();
                } else if (AgeCategory == '40-44') {
                  AgeCategoryValue = 4.toString();
                } else if (AgeCategory == '45-49') {
                  AgeCategoryValue = 5.toString();
                } else if (AgeCategory == '50-54') {
                  AgeCategoryValue = 6.toString();
                } else if (AgeCategory == '55-59') {
                  AgeCategoryValue = 7.toString();
                } else if (AgeCategory == '60-64') {
                  AgeCategoryValue = 8.toString();
                } else if (AgeCategory == '65-69') {
                  AgeCategoryValue = 9.toString();
                } else if (AgeCategory == '70-74') {
                  AgeCategoryValue = 9.toString();
                } else if (AgeCategory == '75-79') {
                  AgeCategoryValue = 10.toString();
                } else if (AgeCategory == '80+') {
                  AgeCategoryValue = 11.toString();
                } else {
                  setState(() {
                    AgeCategoryValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Imputed race / ethnicity value',
              options: [
                'Select',
                'White',
                'Black',
                'Asian',
                'American Indian/Alaskan Native',
                'Hispanic',
                'Other'
              ],
              value: Race ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  Race = newValue;
                });
                if (Race == 'White') {
                  setState(() {
                    RaceValue = 5.toString();
                  });
                } else if (Race == 'Black') {
                  setState(() {
                    RaceValue = 4.toString();
                  });
                } else if (Race == 'Asian') {
                  setState(() {
                    RaceValue = 3.toString();
                  });
                } else if (Race == 'American Indian/Alaskan Native') {
                  setState(() {
                    RaceValue = 2.toString();
                  });
                } else if (Race == 'Hispanic') {
                  setState(() {
                    RaceValue = 1.toString();
                  });
                } else {
                  setState(() {
                    RaceValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Ever had Diabetes?',
              options: ['Select', 'Yes', 'No'],
              value: Diabetic ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  Diabetic = newValue;
                });
                if (Diabetic == 'Yes') {
                  setState(() {
                    DiabeticValue = 2.toString();
                  });
                } else {
                  setState(() {
                    DiabeticValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Exercise in past 30 days',
              options: [
                'Select',
                'Yes',
                'No',
              ],
              value: PhysicalActivity ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  PhysicalActivity = newValue;
                });
                if (PhysicalActivity == 'Yes') {
                  setState(() {
                    PhysicalActivityValue = 1.toString();
                  });
                } else {
                  setState(() {
                    PhysicalActivityValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'General Health',
              options: [
                'Select',
                'Excellent',
                'Very good',
                'Good',
                'Fair',
                'Poor'
              ],
              value: GenHealth ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  GenHealth = newValue;
                });
                if (GenHealth == 'Excellent') {
                  setState(() {
                    GenHealthValue = 4.toString();
                  });
                } else if (GenHealth == 'Very good') {
                  setState(() {
                    GenHealthValue = 3.toString();
                  });
                } else if (GenHealth == 'Good') {
                  setState(() {
                    GenHealthValue = 2.toString();
                  });
                } else if (GenHealth == 'Fair') {
                  setState(() {
                    GenHealthValue = 1.toString();
                  });
                } else {
                  setState(() {
                    GenHealthValue = 0.toString();
                  });
                }
              },
            ),
            AppInputText(
                textfieldcontroller: SleepTime,
                isemail: false,
                textinputtype: TextInputType.number,
                labelColor: AppConst.secondary,
                fillcolor: AppConst.secondary,
                label: 'How much time do you sleep?',
                obscure: false),
            AppDropdownTextFormField(
              labelText: 'Ever told you had asthma?',
              options: [
                'Select',
                'Yes',
                'No',
              ],
              value: Asthma ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  Asthma = newValue;
                });
                if (Asthma == 'Yes') {
                  setState(() {
                    AsthmaValue = 1.toString();
                  });
                } else {
                  setState(() {
                    AsthmaValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: 'Ever told you have kidney disease?',
              options: [
                'Select',
                'Yes',
                'No',
              ],
              value: KidneyDisease ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  KidneyDisease = newValue;
                });
                if (KidneyDisease == 'Yes') {
                  setState(() {
                    KidneyDiseaseValue = 1.toString();
                  });
                } else {
                  setState(() {
                    KidneyDiseaseValue = 0.toString();
                  });
                }
              },
            ),
            AppDropdownTextFormField(
              labelText: '(Ever told) you had skin cancer?',
              options: [
                'Select',
                'Yes',
                'No',
              ],
              value: SkinCancer ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  SkinCancer = newValue;
                });
                if (SkinCancer == 'Yes') {
                  setState(() {
                    SkinCancerValue = 1.toString();
                  });
                } else {
                  setState(() {
                    SkinCancerValue = 0.toString();
                  });
                }
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: AppButton(
                  onPress: () async {
                    try {
                      // print(_dataService)
                      final response = await _dataService.sendData(
                          context,
                          BMI.text.toString(),
                          PhysicalHealth.text.toString(),
                          MentalHealth.text.toString(),
                          SleepTime.text.toString(),
                          SmokingValue,
                          AlcoholDrinkingValue,
                          StrokeValue,
                          DiffWalkingValue,
                          SexValue,
                          AgeCategoryValue,
                          RaceValue,
                          DiabeticValue,
                          PhysicalActivityValue,
                          GenHealthValue,
                          AsthmaValue,
                          KidneyDiseaseValue,
                          SkinCancerValue);
                      Navigator.pushNamed(context, RouteNames.results,
                          arguments: response);
                      // AppSnackbar(
                      //   isError:
                      //       response.toString() == 'success' ? false : true,
                      //   response: response.toString(),
                      // ).show(context);
                    } catch (e) {
                      // handle login error
                      print("Error occured");
                      AppSnackbar(
                        isError: true,
                        response: e.toString(),
                      ).show(context);
                    }
                  },
                  label: 'Submit',
                  borderRadius: 20,
                  textColor: AppConst.secondary,
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
