import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/sharedPreference.dart';
import 'package:zenwave/presentation/Pages/focus_time_setter_page.dart';
import 'package:zenwave/presentation/Pages/journal_option_page.dart';
import 'package:zenwave/presentation/Pages/mindfullness_exersises_page.dart';
import 'package:zenwave/presentation/Pages/mood_graph_page.dart';
import 'package:zenwave/presentation/Pages/mood_rating_page.dart';
import 'package:zenwave/presentation/Pages/preference_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/divider.dart';
import 'package:zenwave/presentation/Widgets/graph_space.dart';
import 'package:zenwave/presentation/Widgets/username_stamp.dart';
import 'package:zenwave/business/services/resetisRated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _ratedChecker;
  @override
  void initState() {
     print(TimeOfDay.now());
    // TODO: implement initState
    super.initState();
    AndroidAlarmManager.periodic(const Duration(seconds: 1), 1, resetisRated);
    setState(() {
      _ratedChecker = Timer(const Duration(microseconds: 1000), () {
        setState(() {
         getIsRated();
         getUserName();
        });
      });
    });
  }

  @override
  void dispose() {
    if (_ratedChecker != null) {
      _ratedChecker!.cancel();
    }
    super.dispose();
  }

_Refresh(){
  setState(() {
    print('refreh worked');
  });
  getIsRated();
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenHeight,
          color: BASE_COLOR,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PAGE_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isRated == true
                    ? UsernmaeStamp(UserNameFromSP, const PreferencePage())
                    : CustomisableButton(
                        double.infinity,
                        BIG_BUTTON_HEIGHT,
                        PRIMARY_COLOR,
                        BASE_COLOR,
                        'Rate your day',
                        BIG_BUTTON_FONT_SIZE,
                        true,
                        go: MoodRatingPage(_Refresh),
                        HowToGO: 'push',
                      ),
                const Dividers(),
                GestureDetector(
                    onTap: () {
                      print('Graph tapped');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const MoodGraphDetails();
                      }));
                    },
                    child: GraphSpace("This Week")),
                const Dividers(),
                CustomisableButton(
                  double.infinity,
                  BIG_BUTTON_HEIGHT,
                  SECONDARY_COLOR,
                  PRIMARY_COLOR,
                  "Mindfulness Exercises",
                  20,
                  true,
                  go: const MindfulnessExercises(),
                  HowToGO: 'push',
                ),
                CustomisableButton(
                  double.infinity,
                  BIG_BUTTON_HEIGHT,
                  SECONDARY_COLOR,
                  PRIMARY_COLOR,
                  "Journaling",
                  20,
                  true,
                  go: const JournalOptionPage(),
                  HowToGO: 'push',
                ),
                CustomisableButton(
                  double.infinity,
                  BIG_BUTTON_HEIGHT,
                  SECONDARY_COLOR,
                  PRIMARY_COLOR,
                  "Focus Mode",
                  20,
                  true,
                  go: const FocusTimeSetterPage(),
                  HowToGO: 'push',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
