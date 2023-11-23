import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/change_name.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/data/DBFunction/delete_all_data.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/focus_time_setter_page.dart';
import 'package:zenwave/presentation/Pages/journal_option_page.dart';
import 'package:zenwave/presentation/Pages/mindfullness_exersises_page.dart';
import 'package:zenwave/presentation/Pages/mood_rating_page.dart';
import 'package:zenwave/presentation/Pages/preference_page.dart';
import 'package:zenwave/presentation/Pages/privacy_policy_page.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';
import 'package:zenwave/presentation/Widgets/cusTextButton.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/divider.dart';
import 'package:zenwave/presentation/Widgets/graph_space.dart';
import 'package:zenwave/presentation/Widgets/username_stamp.dart';
import 'package:zenwave/business/services/reset_is_rated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _ratedChecker;

  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.periodic(const Duration(seconds: 1), 1, resetisRated);
    _ratedChecker = Timer(const Duration(microseconds: 1000), () {
      if (mounted) {
        setState(() {
          getIsRated();
          getUserName();
        });
      }
    });
  }

  @override
  void dispose() {
    _ratedChecker!.cancel();
    super.dispose();
  }

  _refresh() {
    if (mounted) {
      setState(() {});
      getIsRated();
      getUserName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cusText(
                    content: 'Haptic Feedback',
                    fontSize: 20,
                  ),
                  Switch(
                      activeColor: PRIMARY_COLOR,
                      activeTrackColor: SECONDARY_COLOR,
                      inactiveThumbColor: SECONDARY_COLOR,
                      inactiveTrackColor: PRIMARY_COLOR,
                      value: hapticOn,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          hapticOn = value;
                          setHapticFeedback(value);
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  cusTextButton(() {
                    changeUserName(context, toPerform: _refresh);
                  }, 'Change Name'),
                  cusTextButton(() {
                    navigateTo(context: context, goLike: 'push', goPage: PrivacyPolicy());
                  }, 'Privacy and Policy'),
                  cusTextButton(
                    () {
                      clearAllDataFromDB(context);
                    },
                    'Delete Everything',
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
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
                        go: MoodRatingPage(_refresh),
                        HowToGO: 'pushReplace',
                      ),
                const Dividers(),
                GraphSpace("This Week"),
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
