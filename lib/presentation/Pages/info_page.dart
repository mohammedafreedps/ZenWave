import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
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
    screenResponsive();
    super.initState();
    Timer(const Duration(seconds: 1), () {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              PhysicalModel(
                color: PRIMARY_COLOR,
                elevation: Elevetion + 3,
                child: Container(
                  width: SCREEN_WIDTH,
                  height: TOP_PART_HEIGHT,
                  color: PRIMARY_COLOR,
                  child: Center(child: LogoImage(120)),
                ),
              ),
               SizedBox(
                height: SIZED_BOX_HEIGHT,
              ),
              SizedBox(
                  width: 390,
                  child: cusText(
                    content: INFORTEXT,
                    textAlign: TextAlign.center,
                    fontSize: FONT_SIZE,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
