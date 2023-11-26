import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/home_page.dart';
import 'package:zenwave/presentation/Pages/info_page.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    screenResponsive();
    getIsRated();
    getUserName();
    super.initState();
    if (IsUserLogin == true) {
      isHapticFeedback();
      Timer(Duration(seconds: 1), () {
        navigateTo(
            context: context, goLike: 'pushReplacement', goPage: HomePage());
      });
    }
    if (IsUserLogin == false) {
      Timer(Duration(seconds: 3), () {
        navigateTo(
            context: context, goLike: 'pushReplacement', goPage: InfoPage());
      });
    }
  }

  @override
  void didChangeDependencies() {
    screenHeightInitializing(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: PRIMARY_COLOR,
        child: Center(child: LogoImage(120)),
      ),
    );
  }
}
