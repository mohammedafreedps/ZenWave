import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/delete_jounal_list_page.dart';
import 'package:zenwave/presentation/Pages/future_workplan_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Column(
            children: [
              CustomisableButton(
                HOME_BUTTONS_WIDTH!,
                HOME_BUTTONS_HEIGHT!,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Deleted Journals',
                HOME_BUTTONS_FONTSIZE!,
                true,
                go: DeletedJournalList(),
                HowToGO: 'push',
              ),
              SizedBox(
                height: 40,
              ),
              CustomisableButton(
                HOME_BUTTONS_WIDTH!,
                HOME_BUTTONS_HEIGHT!,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Plan Work',
                HOME_BUTTONS_FONTSIZE!,
                true,
                go: FutureWorkPlanPage(),
                HowToGO: 'push',
              )
            ],
          ),
        ),
      ),
    );
  }
}
