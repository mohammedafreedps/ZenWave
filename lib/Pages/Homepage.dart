import 'dart:async';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(Duration(microseconds: 500), () {
        setState(() {
          getIsRated();
        });
       });
    });
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
                    ? UsernmaeStamp("Afreed", PreferencePage())
                    : CustomisableButton(
                        double.infinity,
                        bigButtonHeight,
                        primaryColor,
                        baseColor,
                        'Rate your day',
                        bigButtonFontSize,
                        true,
                        go: MoodRatingPage(),
                        HowToGO: 'push',
                      ),
                Dividers(),
                GestureDetector(
                    onTap: () {
                      print('Graph tapped');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MoodGraphDetails();
                      }));
                    },
                    child: GraphSpace("This Week")),
                Dividers(),
                CustomisableButton(
                  double.infinity,
                  bigButtonHeight,
                  secondaryColor,
                  primaryColor,
                  "Mindfulness Exercises",
                  20,
                  true,
                  go: MindfulnessExercises(),
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
                  go: JournalOptionPage(),
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
                  go: FocusTimeSetterPage(),
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
