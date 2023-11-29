import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
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
  textfieldConverter(String value) {
    if (value.isNotEmpty) {
      int? parsedValue = int.tryParse(value.trim());

      if (parsedValue != null) {
        setState(() {
          cusTime = int.parse(value.trim());
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
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PAGE_PADDING),
            child: Column(
              children: [
                PhysicalModel(
                  color: SECONDARY_COLOR,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                    child: Container(
                      width: SCREEN_WIDTH,
                      height: FOCUSMODE_CONTAINER_TOP_HEIGHT,
                      color: SECONDARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CustomisableButton(
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            '15 min',
                            SETDAY_BUTTON_FONTSIZE!,
                            true,
                            HowToGO: 'push',
                            go: FocusModePage(Duration(minutes: 15)),
                          ),
                          CustomisableButton(
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            '1 hr',
                            SETDAY_BUTTON_FONTSIZE!,
                            true,
                            HowToGO: 'push',
                            go: FocusModePage(Duration(hours: 1)),
                          ),
                          CustomisableButton(
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            '1hr 30min',
                            SETDAY_BUTTON_FONTSIZE!,
                            true,
                            HowToGO: 'push',
                            go: FocusModePage(Duration(hours: 1, minutes: 30)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                PhysicalModel(
                  color: SECONDARY_COLOR,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                    child: Container(
                      width: SCREEN_WIDTH,
                      height: FOCUSMODE_CONTAINER_BOTTOM_HEIGHT,
                      color: SECONDARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Custom Time',
                            style:
                                TextStyle(fontSize: FONT_SIZE, color: PRIMARY_COLOR,fontWeight: FontWeight.bold),
                          ),
                          Text('In miniuts',
                              style: TextStyle(
                                  fontSize: 15, color: PRIMARY_COLOR,)),
                          SizedBox(
                              width: SCREEN_WIDTH * 0.7,
                              child: TextFieldBorder(
                                CustomFocusTime,
                                onchangeof: textfieldConverter,
                              )),
                          CustomisableButton(PLANWORK_BUTTON_WIDTH!, PLANWORK_BUTTON_HEIGHT!, BASE_COLOR, PRIMARY_COLOR,
                              'SET TIMER', SETDAY_BUTTON_FONTSIZE!, true,
                              HowToGO: 'push',
                              go: FocusModePage(Duration(minutes: cusTime))),
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
    );
  }
}
