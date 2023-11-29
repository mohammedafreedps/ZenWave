import 'package:shared_preferences/shared_preferences.dart';

bool? isRated;
String UserNameFromSP = '';
bool? IsUserLogin;
bool hapticOn = false;

Future<void> saveIsRated(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isRated', value);
}

Future<bool> getIsRated() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isRated = prefs.getBool('isRated') ?? false;
  return isRated!;
}

Future<void> saveIsUserLogin(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isUserLogin', value);
}

Future<bool> getIsUserLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  IsUserLogin = prefs.getBool('isUserLogin')?? false;
  return IsUserLogin!;
}

Future<void> saveUserName(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('UserName', value);
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserNameFromSP = prefs.getString('UserName')?? '';
  return UserNameFromSP;
}

Future<void> setHapticFeedback(bool option)async{
  SharedPreferences  prefs = await SharedPreferences.getInstance();
  prefs.setBool('hapticFeedback',option);
}
Future<bool> isHapticFeedback()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('hapticFeedback') != null) {
    hapticOn = prefs.getBool('hapticFeedback')!;
  }
  return hapticOn;
}