import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/data/DBFunction/inisialise_database.dart';
import 'package:zenwave/presentation/Pages/splash_page.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await initialiseDataBase();

  await getIsUserLogin();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(DevicePreview(enabled: false, builder: (context) => ZenWave()));
}

class ZenWave extends StatelessWidget {
  const ZenWave({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.fallback(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
