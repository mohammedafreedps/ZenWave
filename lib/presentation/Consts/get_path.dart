import 'package:path_provider/path_provider.dart';
import 'dart:io';
    
    Future<String> getAppImageDirectoryPath() async {
      final appDirectory = await getApplicationDocumentsDirectory();
      final imageDirectoryPath = '${appDirectory.path}/capture';
      Directory imageDirectory = Directory(imageDirectoryPath);
      if (!imageDirectory.existsSync()) {
        await imageDirectory.create();
      }
      return imageDirectoryPath;
    }