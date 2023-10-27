import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/FocusTimeSetterPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/ProgressCircle.dart';

class FocusModePage extends StatefulWidget {
  const FocusModePage({super.key});

  @override
  State<FocusModePage> createState() => _FocusModePageState();
}

class _FocusModePageState extends State<FocusModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baseColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        color: baseColor,
        width: double.infinity,
        height: double.infinity,
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
                  height: 630,
                  color: secondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomisableButton(190, 60, baseColor, primaryColor,
                          'SET TIME', 20, true,go: FocusTimeSetterPage(),HowToGO: 'push',),
                      Stack(
                        children: [
                          ProgressCircle(250, 250, 0.9),
                          Positioned(
                              top: 60,
                              left: 80,
                              child: Text(
                                '10',
                                style: TextStyle(
                                    fontSize: 85, color: primaryColor),
                              )),
                          Positioned(
                              top: 150,
                              left: 115,
                              child: Text(
                                'min',
                                style: TextStyle(
                                    fontSize: 15, color: primaryColor),
                              ))
                        ],
                      ),
                      CustomisableButton(190, 60, baseColor, primaryColor,
                          'FOCUS', 20, true),
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
