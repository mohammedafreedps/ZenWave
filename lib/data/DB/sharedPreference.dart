import 'package:shared_preferences/shared_preferences.dart';

bool? isRated;
String UserNameFromSP = '';
bool? IsUserLogin;

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

Future<void> saveIsUserLogin(bool value) async {
  print('save name arrie sp $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isUserLogin', value);
}

Future<bool> getIsUserLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  IsUserLogin = prefs.getBool('isUserLogin')?? false;
  print('current name in sp $IsUserLogin');
  return IsUserLogin!;
}

Future<void> saveUserName(String value) async {
  print('save name arrie sp $value');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('UserName', value);
}

Future<String> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserNameFromSP = prefs.getString('UserName')?? '';
  print('current name in sp $UserNameFromSP');
  return UserNameFromSP;
}