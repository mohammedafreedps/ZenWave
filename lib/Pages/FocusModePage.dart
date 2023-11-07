import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/ProgressCircle.dart';

class FocusModePage extends StatefulWidget {
  // const FocusModePage({super.key});
  final Duration _focusTime;
  FocusModePage(this._focusTime);

  @override
  State<FocusModePage> createState() => _FocusModePageState();
}

class _FocusModePageState extends State<FocusModePage> {
  @override
  void initState() {
    super.initState();
    DuratingToString();
  }

  double _progressBar = 0.0;

  String TimeIndcator = '';

  Timer? focusTimer;
  Timer? focusProgressBar;
  Timer? resetTime;

  bool _isActive = false;
  bool _isBackLock = true;

  DuratingToString() {
    TimeIndcator = widget._focusTime.inMinutes.toString();
  }

  @override
  Widget build(BuildContext context) {
    StopfocusTimers() {
      if (focusTimer != null && focusProgressBar != null) {
        setState(() {
          _isActive = false;
          _progressBar = 0.0;
          _isBackLock = true;
        });
        resetTime = Timer(Duration(seconds: 2), () {
          setState(() {
            TimeIndcator = widget._focusTime.inMinutes.toString();
          });
        });

        print('timer stoped');
        focusTimer!.cancel();
        focusProgressBar!.cancel();
      }
    }

    StartFocusTimer() {
      int timeShow = widget
          ._focusTime.inMinutes;

      focusProgressBar = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _progressBar += 1 / widget._focusTime.inSeconds;
        });
      });

      print('timer started');
      focusTimer = Timer.periodic(Duration(minutes: 1), (timer) {
        setState(() {
          timeShow = timeShow - 1;
        });

        if (timeShow == 0) {
          print('if worked');
          StopfocusTimers();
        }

        // Update the TimeIndcator
        setState(() {
          TimeIndcator = timeShow.toString();
        });
      });
    }

    StartFocus() {
      setState(() {
        _isActive = true;
      });
      _isBackLock = false;
      print('startfocus pressed');
      StartFocusTimer();
    }

    @override
    void dispose() {
      StopfocusTimers();
      if (resetTime != null) {
        resetTime!.cancel();
      }
      super.dispose();
    }

    return WillPopScope(
      onWillPop: ()async{
        return _isBackLock;
      },
      child: Scaffold(
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
                        _isActive == false ?
                        CustomisableButton(
                          190,
                          60,
                          baseColor,
                          primaryColor,
                          'SET TIME',
                          20,
                          true,
                          HowToGO: 'pop',
                        ):
                        CustomisableButton(
                          190,
                          60,
                          baseColor,
                          primaryColor,
                          'SET TIME',
                          20,
                          false,
                        ),
                        
                        Stack(
                          children: [
                            ProgressCircle(250, 250, _progressBar),
                            Positioned(
                                top: 60,
                                left: TimeIndcator.length == 2 ? 80 : 105,
                                child: Text(
                                  TimeIndcator,
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
                        _isActive == false
                            ? CustomisableButton(
                                190,
                                60,
                                baseColor,
                                primaryColor,
                                'FOCUS',
                                20,
                                true,
                                toPerform: StartFocus,
                              )
                            : CustomisableButton(
                                190,
                                60,
                                baseColor,
                                primaryColor,
                                '',
                                20,
                                false,
                                toPerform: StopfocusTimers,
                              )
                      ],
                    ),
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
