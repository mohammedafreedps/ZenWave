import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Pages/focus_mode_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class FocusTimeSetterPage extends StatefulWidget {
  const FocusTimeSetterPage({super.key});

  @override
  State<FocusTimeSetterPage> createState() => _FocusTimeSetterPageState();
}

class _FocusTimeSetterPageState extends State<FocusTimeSetterPage> {
  TextEditingController CustomFocusTime = TextEditingController();
  int cusTime = 1;
  textfieldConverter() {
    print('converter worked');
    if (CustomFocusTime.text.isNotEmpty) {
      int? parsedValue = int.tryParse(CustomFocusTime.text.trim());

      if (parsedValue != null) {
        setState(() {
          cusTime = int.parse(CustomFocusTime.text.trim());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BASE_COLOR,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 990,
          color: BASE_COLOR,
          child: Padding(
            padding: EdgeInsets.all(PAGE_PADDING),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PhysicalModel(
                      color: SECONDARY_COLOR,
                      elevation: Elevetion,
                      borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          color: SECONDARY_COLOR,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CustomisableButton(
                                160,
                                65,
                                BASE_COLOR,
                                PRIMARY_COLOR,
                                '15 min',
                                20,
                                true,
                                HowToGO: 'push',
                                go: FocusModePage(Duration(minutes: 15)),
                              ),
                              CustomisableButton(
                                160,
                                65,
                                BASE_COLOR,
                                PRIMARY_COLOR,
                                '1 hr',
                                20,
                                true,
                                HowToGO: 'push',
                                go: FocusModePage(Duration(hours: 1)),
                              ),
                              CustomisableButton(
                                160,
                                65,
                                BASE_COLOR,
                                PRIMARY_COLOR,
                                '1hr 30min',
                                20,
                                true,
                                HowToGO: 'push',
                                go: FocusModePage(
                                    Duration(hours: 1, minutes: 30)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PhysicalModel(
                      color: SECONDARY_COLOR,
                      elevation: Elevetion,
                      borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                        child: Container(
                          width: double.infinity,
                          height: 270,
                          color: SECONDARY_COLOR,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Custom Time',
                                style: TextStyle(
                                    fontSize: 35, color: PRIMARY_COLOR),
                              ),
                              Text('In miniuts',
                                  style: TextStyle(
                                      fontSize: 15, color: PRIMARY_COLOR)),
                              SizedBox(
                                  width: 360,
                                  child: TextFieldBorder(
                                    CustomFocusTime,
                                    onchangeof: textfieldConverter,
                                  )),
                              CustomisableButton(160, 65, BASE_COLOR,
                                  PRIMARY_COLOR, 'SET TIMER', 18, true,
                                  HowToGO: 'push',
                                  go: FocusModePage(
                                      Duration(minutes: cusTime))),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
