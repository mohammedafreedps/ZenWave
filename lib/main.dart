import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/captureMoments/capture_moments.dart';
import 'package:zenwave/data/DB/futureTask/future_task.dart';
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
  Hive.registerAdapter(captureMomentsAdapter());
  captureMomentsBox = await Hive.openBox<captureMoments>('captureMomentsBox');

 
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
