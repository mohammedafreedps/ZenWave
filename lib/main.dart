import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/data/DBFunction/inisialise_database.dart';
import 'package:zenwave/presentation/Pages/splash_page.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
     await AndroidAlarmManager.initialize();
  }
  initialiseDataBase();

  getIsUserLogin();
 
  runApp(const ZenWave());
}

class ZenWave extends StatelessWidget {
  const ZenWave({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.fallback(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
