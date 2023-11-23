import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

changeUserName(BuildContext context, {Function? toPerform}) {
  TextEditingController _newName = TextEditingController();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Name'),
          actions: [
            TextFieldBorder(_newName),
            TextButton(
                onPressed: () async {
                  if (_newName.text.isNotEmpty) {
                    await saveUserName(_newName.text);
                    if (toPerform != null) {
                      toPerform();
                      navigateTo(context: context, goLike: 'pop');
                    }
                  }
                },
                child: Text('Save'))
          ],
        );
      });
}
