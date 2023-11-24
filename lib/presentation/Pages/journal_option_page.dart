import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/presentation/Pages/capture_page.dart';
import 'package:zenwave/presentation/Pages/journal_list_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';

class JournalOptionPage extends StatelessWidget {
  const JournalOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: BASE_COLOR,elevation: 0,),
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Center(
            child: PhysicalModel(
              color: SECONDARY_COLOR,
              elevation: Elevetion,
              borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                child: Container(
                  width: double.infinity,
                  height: 550,
                  color: SECONDARY_COLOR,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text('Journaling',style: TextStyle(color: PRIMARY_COLOR,fontSize: 45),),
                      SizedBox(height: 40,),
                      CustomisableButton(JOURNAL_OPTIONPAGE_BUTTON_WIDTH!, HOME_BUTTONS_HEIGHT!, BASE_COLOR, PRIMARY_COLOR, 'Personal', HOME_BUTTONS_FONTSIZE!, true,go: JournalListPage('Personal'),HowToGO: 'push',),
                      CustomisableButton(JOURNAL_OPTIONPAGE_BUTTON_WIDTH!, HOME_BUTTONS_HEIGHT!, BASE_COLOR, PRIMARY_COLOR, 'Gratitude', HOME_BUTTONS_FONTSIZE!, true,go: JournalListPage('Gratitude'),HowToGO: 'push',),
                      CustomisableButton(JOURNAL_OPTIONPAGE_BUTTON_WIDTH!, HOME_BUTTONS_HEIGHT!, BASE_COLOR, PRIMARY_COLOR, 'Capture', HOME_BUTTONS_FONTSIZE!, true,go: CapturePage(),HowToGO: 'push',),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}