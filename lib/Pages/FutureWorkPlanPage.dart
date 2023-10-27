import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/SetDayWorkPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';

class FutureWorkPlanPage extends StatefulWidget {
  const FutureWorkPlanPage({super.key});

  @override
  State<FutureWorkPlanPage> createState() => _FutureWorkPlanPageState();
}

class _FutureWorkPlanPageState extends State<FutureWorkPlanPage> {
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
          padding:  EdgeInsets.all(PagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomisableButton(double.infinity, 90, secondaryColor, primaryColor, 'Plan Day', bigButtonFontSize, true ,go: SetDayWorkPage(),HowToGO: 'push',),
              Center(
                child: Text('Add any thing for the future',style: TextStyle(color: primaryColor),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
