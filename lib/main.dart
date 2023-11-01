import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/DB/journals.dart';
import 'package:zenwave/DB/moodtracker.dart';
import 'package:zenwave/Pages/Splashpage.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();



  await Hive.initFlutter();
  Hive.registerAdapter(moodtrackerAdapter());
  moodtrackerBox = await Hive.openBox<moodtracker>('moodtrackerBox');
  Hive.registerAdapter(PersonalJournalsAdapter());
  journalBox = await Hive.openBox<moodtracker>('journalBox');

 
  runApp(const ZenWave());
}

class ZenWave extends StatelessWidget {
  const ZenWave({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
