import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/sharedPreference.dart';
import 'package:zenwave/Pages/FocusTimeSetterPage.dart';
import 'package:zenwave/Pages/JournalOptionPage.dart';
import 'package:zenwave/Pages/MindfulnessExercises.dart';
import 'package:zenwave/Pages/MoodGrpahDetails.dart';
import 'package:zenwave/Pages/MoodRatingPage.dart';
import 'package:zenwave/Pages/PreferencePage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/Dividers.dart';
import 'package:zenwave/Widgets/GraphSpace.dart';
import 'package:zenwave/Widgets/UsernameStamp.dart';
import 'package:zenwave/services/resetisRated.dart';

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
          color: baseColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isRated == true
                    ? UsernmaeStamp(UserNameFromSP, const PreferencePage())
                    : CustomisableButton(
                        double.infinity,
                        bigButtonHeight,
                        primaryColor,
                        baseColor,
                        'Rate your day',
                        bigButtonFontSize,
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
                  bigButtonHeight,
                  secondaryColor,
                  primaryColor,
                  "Mindfulness Exercises",
                  20,
                  true,
                  go: const MindfulnessExercises(),
                  HowToGO: 'push',
                ),
                CustomisableButton(
                  double.infinity,
                  bigButtonHeight,
                  secondaryColor,
                  primaryColor,
                  "Journaling",
                  20,
                  true,
                  go: const JournalOptionPage(),
                  HowToGO: 'push',
                ),
                CustomisableButton(
                  double.infinity,
                  bigButtonHeight,
                  secondaryColor,
                  primaryColor,
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
