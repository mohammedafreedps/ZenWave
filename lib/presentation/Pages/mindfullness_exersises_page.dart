import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/journal_list_page.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/progress_circle.dart';

class MindfulnessExercises extends StatefulWidget {
  const MindfulnessExercises({super.key});

  @override
  State<MindfulnessExercises> createState() => _MindfulnessExercisesState();
}

class _MindfulnessExercisesState extends State<MindfulnessExercises> {
  String _choice = '';
  String _instructionText = '';

  bool _boxbreathing = false;
  bool _technique = false;
  bool _iStart = false;
  bool _isSlelected = false;

  double progressionBar = 0.0;

  int _counter = 0;
  int test = 0;

  Timer? _boxBreathingTimer;
  Timer? _techniqueTimer;

  @override
  void dispose() {
    if (_boxBreathingTimer != null) {
      _boxBreathingTimer!.cancel();
    }
    if (_techniqueTimer != null) {
      _techniqueTimer!.cancel();
    }

    super.dispose();
  }

  boxBrathingSelected() {
    setState(() {
      if (_isSlelected == false) {
        _choice = 'Box Breathing';
        _boxbreathing = true;
        _technique = false;
      }
    });
  }

  techniqueSelected() {
    setState(() {
      if (_isSlelected == false) {
        _choice = '4-7-8 Technique';
        _boxbreathing = false;
        _technique = true;
      }
    });
  }

  startTimerBoxBreatheing() {
    _boxBreathingTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      hapticFeedback('m');
      setState(() {
        if (progressionBar <= 1) {
          progressionBar += 1 / 59;
        } else {
          print('ticker stopped');
          stopBoxBreathing();
        }
      });

      print('timer ticking');
      if (_instructionText == '') {
        setState(() {
          _instructionText = 'In';
        });
      } else if (_instructionText == 'In') {
        setState(() {
          _instructionText = 'Out';
        });
      } else {
        setState(() {
          _instructionText = 'In';
        });
      }
    });
    Timer(Duration(minutes: 4), () {
      stopBoxBreathing();
    });
  }

  startTimerTechnique() {
    _techniqueTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      progressionBar += 1 / 19;
      setState(() {
        if (_counter <= 4) {
          hapticFeedback('m');
          _instructionText = 'In';
        }

        if (_counter >= 4 && _counter <= 10) {
          hapticFeedback('m');
          _instructionText = 'Hold';
        }

        if (_counter >= 12 && _counter <= 19) {
          hapticFeedback('m');
          setState(() {
            _instructionText = 'Out';
          });
        }
        if (_counter == 20) {
          _counter = 0;
          stopTechnique();
        }
      });
    });
  }

  performSelected() {
    if (_boxbreathing == true) {
      _isSlelected = true;
    }
    if (_technique == true) {
      _isSlelected = true;
    }
    setState(() {
      if (_boxbreathing == false && _technique == false) {
      } else if (_boxbreathing != false && _technique == false) {
        _iStart = true;
        setState(() {
          _instructionText = 'Ready';
        });
        startTimerBoxBreatheing();
      } else if (_boxbreathing == false && _technique != false) {
        setState(() {
          _instructionText = 'Ready';
        });
        _iStart = true;
        startTimerTechnique();
      }
    });
  }

  cancelSelected() {
    if (_boxbreathing == true) {
      stopBoxBreathing();
    }
    if (_technique == true) {
      stopTechnique();
    }
  }

  stopBoxBreathing() {
    hapticFeedback('s');
    setState(() {
      _counter = 0;
      _iStart = false;
      _instructionText = '';
      _isSlelected = false;
      if (_boxBreathingTimer != null) {
        _boxBreathingTimer!.cancel();
      }
      progressionBar = 0.0;
    });
  }

  stopTechnique() {
    hapticFeedback('s');
    setState(() {
      progressionBar = 0;
      _iStart = false;
      _counter = 0;
      _instructionText = '';
      _isSlelected = false;
      if (_techniqueTimer != null) {
        _techniqueTimer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PAGE_PADDING),
          child: Column(
            children: [
              Center(
                child: PhysicalModel(
                  color: SECONDARY_COLOR,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                    child: Container(
                      padding: EdgeInsets.all(PAGE_PADDING),
                      width: SCREEN_WIDTH,
                      height: MINDFULLNESSPAGE_CONTAINER_HEIGHT,
                      color: SECONDARY_COLOR,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomisableButton(
                              HOME_BUTTONS_WIDTH!,
                              PLANWORK_BUTTON_HEIGHT!,
                              BASE_COLOR,
                              PRIMARY_COLOR,
                              'Box Breathing',
                              HOME_BUTTONS_FONTSIZE!,
                              true,
                              toPerform: boxBrathingSelected,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            CustomisableButton(
                              HOME_BUTTONS_WIDTH!,
                              PLANWORK_BUTTON_HEIGHT!,
                              BASE_COLOR,
                              PRIMARY_COLOR,
                              '4-7-8 Technique',
                              HOME_BUTTONS_FONTSIZE!,
                              true,
                              toPerform: techniqueSelected,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            cusText(
                              content: _choice,
                              fontSize: 25,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                PhysicalModel(
                                    color: SECONDARY_COLOR,
                                    elevation: Elevetion,
                                    borderRadius: BorderRadius.circular(
                                        CLIP_BORDER_RADIOUS + 60),
                                    child: ProgressCircle(
                                        250, 250, progressionBar)),
                                Positioned(
                                    top: 90,
                                    left: 80,
                                    child: cusText(
                                      content:
                                          'Breath' + '\n' + _instructionText,
                                      fontSize: 30,
                                      textAlign: TextAlign.center,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _iStart == false
                                ? CustomisableButton(
                                    PLANWORK_BUTTON_WIDTH!,
                                    PLANWORK_BUTTON_HEIGHT!,
                                    BASE_COLOR,
                                    PRIMARY_COLOR,
                                    'START',
                                    SETDAY_BUTTON_FONTSIZE!,
                                    true,
                                    toPerform: performSelected,
                                  )
                                : CustomisableButton(
                                    PLANWORK_BUTTON_WIDTH!,
                                    PLANWORK_BUTTON_HEIGHT!,
                                    BASE_COLOR,
                                    PRIMARY_COLOR,
                                    'STOP',
                                    SETDAY_BUTTON_FONTSIZE!,
                                    false,
                                    toPerform: cancelSelected,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomisableButton(
                HOME_BUTTONS_WIDTH!,
                HOME_BUTTONS_HEIGHT!,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Gratitude Journaling',
                HOME_BUTTONS_FONTSIZE!,
                true,
                go: JournalListPage('Gratitude'),
                HowToGO: 'pushReplace',
              )
            ],
          ),
        ),
      ),
    );
  }
}
