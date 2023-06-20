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
  var smoking, smokingValue;
  var AlcoholDrinking, AlcoholDrinkingValue;
  var Stroke, StrokeValue;
  var DiffWalking, DiffWalkingValue;
  var Sex, SexValue;
  var AgeCategory, AgeCategoryValue;
  var Race, RaceValue;
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
                  'Data entered during prediction is not saved or used, and the accuracy of predictions cannot be guaranteed. This model should not replace medical advice. If you have symptoms or concerns, consult a qualified medical professional. This tool provides informational purposes only and does not substitute a professional medical diagnosis.',
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
                  smoking = newValue;
                });
                if (smoking == 'Yes') {
                  setState(() {
                    smokingValue = 1.toString();
                  });
                } else {
                  setState(() {
                    smokingValue = 0.toString();
                  });
                }
              },
              options: ['Select', 'Yes', 'No'],
              value: smoking ?? 'Select',
            ),
            AppDropdownTextFormField(
              labelText: 'Heavy Alcohol Consumption Calculated Variable',
              options: ['Select', 'Yes', 'No'],
              value: AlcoholDrinking ?? 'Select',
              onChanged: (newValue) {
                setState(() {
                  AlcoholDrinking = newValue;
                });
                if (smoking == 'Yes') {
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
                if (smoking == 'Yes') {
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
                if (smoking == 'Yes') {
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
                if (smoking == 'Yes') {
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
                if (smoking == 'Yes') {
                  setState(() {
                    AsthmaValue = 1.toString();
                  });
                } else {
                  setState(() {
                    Asthma = 0.toString();
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
                if (smoking == 'Yes') {
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
                if (smoking == 'Yes') {
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
                    Navigator.pushNamed(context, RouteNames.results);
                    try {
                      final response = await _dataService.login(context);
                      AppSnackbar(
                        isError:
                            response.toString() == 'success' ? false : true,
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
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
