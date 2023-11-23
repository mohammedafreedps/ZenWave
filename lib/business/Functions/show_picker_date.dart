import 'package:flutter/material.dart';

Future<DateTime?> showPickerDate(BuildContext context, {Function? toPerform}) async {
  DateTime _selectedDate = DateTime.now();
  
  await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2040),
  ).then((value) {
    if (value != null) {
      _selectedDate = value;
      if (toPerform != null) {
        toPerform();
      }
    }
  });
  return _selectedDate;
}
