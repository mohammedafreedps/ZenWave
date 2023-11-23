import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          child: Container(
            color: BASE_COLOR,
            child: Padding(
              padding: EdgeInsets.all(PAGE_PADDING),
              child: cusText(content: PRIVACYPOLICY),
            ),
          ),
        ),
      ),
    );
  }
}