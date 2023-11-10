import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/futureTask/futureTask.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/moodTracking.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Pages/splash_page.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();

  await Hive.initFlutter();
  Hive.registerAdapter(personalJournalAdapter());
  personalJournalBox = await Hive.openBox<personalJournal>('personalJournalBox');
  Hive.registerAdapter(gratutudeJournalAdapter());
  gratitudeJournalBox = await Hive.openBox<gratutudeJournal>('gratitudeJournalBox');
  Hive.registerAdapter(deletedJournalAdapter());
  deletedJournalBox = await Hive.openBox<deletedJournal>('deletedJournalBox');
  Hive.registerAdapter(moodTrackingAdapter());
  moodTrackerBox = await Hive.openBox<moodTracking>('moodTrackingBox');
  Hive.registerAdapter(futureTaskAdapter());
  futureTaskBox = await Hive.openBox<futureTask>('futureTaskBox');

 
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
