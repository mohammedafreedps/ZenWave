import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/DB/journals.dart';
import 'package:zenwave/DB/moodtracker.dart';
import 'package:zenwave/Pages/Splashpage.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zenwave/services/resetisRated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(resetIsRated,isInDebugMode: true);

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
