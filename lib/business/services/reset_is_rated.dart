
import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/shared_preference.dart';

void resetisRated(){
  String _currentTime = TimeOfDay.now().toString();
  if (_currentTime == TimeOfDay(hour: 23, minute: 0)) {
    saveIsRated(false);
  }
}