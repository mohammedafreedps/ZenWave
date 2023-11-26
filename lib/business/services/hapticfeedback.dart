import 'package:flutter/services.dart';
import 'package:zenwave/data/DB/shared_preference.dart';

void hapticFeedback(String type)  {
  if (hapticOn) {
    switch (type) {
      case 'l':
        HapticFeedback.lightImpact();
        break;
      case 'm':
        HapticFeedback.mediumImpact();
        break;
      case 'h':
        HapticFeedback.heavyImpact();
        break;
      case 's':
        HapticFeedback.selectionClick();
        break;
      default:
    }
  }
}
