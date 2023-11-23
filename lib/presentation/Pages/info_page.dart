import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/login_page.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      navigateTo(
          context: context, goLike: 'pushReplacement', goPage: const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Column(
          children: [
            PhysicalModel(
              color: PRIMARY_COLOR,
              elevation: Elevetion + 3,
              child: Container(
                width: SCREEN_WIDTH,
                height: 450,
                color: PRIMARY_COLOR,
                child: Center(child: LogoImage(120)),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            SizedBox(
                width: 390,
                child: cusText(
                  content: INFORTEXT,
                  textAlign: TextAlign.center,
                  fontSize: 21,
                )),
          ],
        ),
      ),
    );
  }
}
