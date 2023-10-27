import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/GratitudeJournalList.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/ProgressCircle.dart';

class MindfulnessExercises extends StatefulWidget {
  const MindfulnessExercises({super.key});

  @override
  State<MindfulnessExercises> createState() => _MindfulnessExercisesState();
}

class _MindfulnessExercisesState extends State<MindfulnessExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: PhysicalModel(
                  color: secondaryColor,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(clipBorderRadious),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(clipBorderRadious),
                    child: Container(
                      padding: EdgeInsets.all(PagePadding),
                      width: 450,
                      height: 750,
                      color: secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomisableButton(250, 60, baseColor, primaryColor,
                              'Box Breathing', 20, true),
                              SizedBox(height: 10,),
                          CustomisableButton(250, 60, baseColor, primaryColor,
                              '4-7-8 Technique', 20, true),
                              SizedBox(height: 40,),
                          Text(
                            'data',
                            style: TextStyle(color: primaryColor, fontSize: 25),
                          ),
                          SizedBox(height: 40,),
                          Stack(
                            children: [
                              PhysicalModel(
                                color: secondaryColor,
                                elevation: Elevetion,
                                borderRadius: BorderRadius.circular(clipBorderRadious+60),
                                child: ProgressCircle(250, 250, 0.9)),
                              Positioned(
                                  top: 40,
                                  left: 109,
                                  child: Text(
                                    '10',
                                    style: TextStyle(
                                        fontSize: 30, color: primaryColor),
                                  )),
                              Positioned(
                                  top: 108,
                                  left: 60,
                                  child: Text(
                                    'Breateh in',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 30),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                          SizedBox(height: 40,),
                          CustomisableButton(
                              160, 60, baseColor, primaryColor, 'STOP', 20, true)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomisableButton(double.infinity, bigButtonHeight, secondaryColor, primaryColor, 'Gratitude Journaling', bigButtonFontSize, true,go: GratitudejournalList(),HowToGO: 'pushReplace',)
            ],
          ),
        ),
      ),
    );
  }
}
