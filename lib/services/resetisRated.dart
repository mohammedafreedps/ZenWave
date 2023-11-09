
import 'package:flutter/material.dart';
import 'package:zenwave/DB/sharedPreference.dart';

void resetisRated(){
  print('service reset mood');
  String _currentTime = TimeOfDay.now().toString();
  if (_currentTime == 'TimeOfDay(12:00)') {
    saveIsRated(false);
  }
  if (_currentTime == 'TimeOfDay(00:00)') {
    saveIsRated(false);
  }
}