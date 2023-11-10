import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Pages/gratitude_journal_list_page.dart';
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

  _startTimerBoxBreatheing() {
    _boxBreathingTimer = Timer.periodic(Duration(seconds: 4), (timer) {
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

  _startTimerTechnique() {
    _techniqueTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      progressionBar += 1 / 19;
      setState(() {
        if (_counter <= 4) {
          _instructionText = 'In';
        }

        if (_counter >= 4 && _counter <= 10) {
          _instructionText = 'Hold';
        }

        if (_counter >= 12 && _counter <= 19) {
          setState(() {
            _instructionText = 'Out';
          });
        }
        if (_counter == 20) {
          _counter = 0;
          stopTechnique();
        }
      });

      print(_counter);
    });
  }

  performSelected() {
  setState(() {
    _instructionText = 'Redy';
  });
    print('pass 1');
    _isSlelected = true;
    setState(() {
      if (_boxbreathing == false && _technique == false) {
      } else if (_boxbreathing != false && _technique == false) {
        _iStart = true;
        print('boxing');
        _startTimerBoxBreatheing();
      } else if (_boxbreathing == false && _technique != false) {
        _iStart = true;
        print('techinicking');
        _startTimerTechnique();
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
    setState(() {
      progressionBar = 0;
      _iStart = false;
      _counter = 0;
      _instructionText = '';
      _isSlelected = false;
      if (_techniqueTimer != null) {
        print('stopoping techniqe test ');
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
        width: double.infinity,
        height: double.infinity,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      width: 450,
                      height: 750,
                      color: SECONDARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomisableButton(
                            250,
                            60,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            'Box Breathing',
                            20,
                            true,
                            toPerform: boxBrathingSelected,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomisableButton(
                            250,
                            60,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            '4-7-8 Technique',
                            20,
                            true,
                            toPerform: techniqueSelected,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            _choice,
                            style: TextStyle(color: PRIMARY_COLOR, fontSize: 25),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Stack(
                            children: [
                              PhysicalModel(
                                  color: SECONDARY_COLOR,
                                  elevation: Elevetion,
                                  borderRadius: BorderRadius.circular(
                                      CLIP_BORDER_RADIOUS + 60),
                                  child:
                                      ProgressCircle(250, 250, progressionBar)),
                              Positioned(
                                  top: 95,
                                  left: 85,
                                  child: Text(
                                    'Breath' + '\n' + _instructionText,
                                    style: TextStyle(
                                        color: PRIMARY_COLOR, fontSize: 30),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          _iStart == false
                              ? CustomisableButton(
                                  160,
                                  60,
                                  BASE_COLOR,
                                  PRIMARY_COLOR,
                                  'START',
                                  20,
                                  true,
                                  toPerform: performSelected,
                                )
                              : CustomisableButton(
                                  160,
                                  60,
                                  BASE_COLOR,
                                  PRIMARY_COLOR,
                                  'STOP',
                                  20,
                                  false,
                                  toPerform: cancelSelected,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomisableButton(
                double.infinity,
                BIG_BUTTON_HEIGHT,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Gratitude Journaling',
                BIG_BUTTON_FONT_SIZE,
                true,
                go: GratitudejournalList(),
                HowToGO: 'pushReplace',
              )
            ],
          ),
        ),
      ),
    );
  }
}
