import 'package:shared_preferences/shared_preferences.dart';

bool? isRated;

Future<void> saveIsRated(bool value) async {
  print('save data arrie sp $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isRated', value);
}

Future<bool> getIsRated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isRated = prefs.getBool('isRated') ?? false;
  print('current value in sp $isRated');
  return isRated!;
}
