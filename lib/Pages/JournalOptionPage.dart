import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/GratitudeJournalList.dart';
import 'package:zenwave/Pages/PersonalJournalList.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';

class JournalOptionPage extends StatelessWidget {
  const JournalOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: baseColor,elevation: 0,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Center(
            child: PhysicalModel(
              color: secondaryColor,
              elevation: Elevetion,
              borderRadius: BorderRadius.circular(clipBorderRadious),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(clipBorderRadious),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text('Journaling',style: TextStyle(color: primaryColor,fontSize: 45),),
                      SizedBox(height: 40,),
                      CustomisableButton(300, 80, baseColor, primaryColor, 'Personal', 25, true,go: PersonalJournalLists(),HowToGO: 'push',),
                      CustomisableButton(300, 80, baseColor, primaryColor, 'Gratitude', 25, true,go: GratitudejournalList(),HowToGO: 'push',)
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