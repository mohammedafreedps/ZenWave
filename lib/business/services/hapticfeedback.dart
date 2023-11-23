import 'package:flutter/services.dart';
import 'package:zenwave/data/DB/shared_preference.dart';

hapticFeedback(String type)  {
  if (hapticOn) {
    print('haptic');
    switch (type) {
      case 'l':
        HapticFeedback.lightImpact();
        break;
      case 'm':
        HapticFeedback.mediumImpact();
        break;
      case 'h':
        print('heavy called');
        HapticFeedback.heavyImpact();
        break;
      case 's':
        HapticFeedback.selectionClick();
        break;
      default:
    }
  }
}
