import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Pages/home_page.dart';

loginValidation(BuildContext context, String userName) {
  if (userName.isNotEmpty) {
    saveUserName(userName.trim());
    saveIsUserLogin(true);
    navigateTo(
        context: context, goLike: 'pushReplacement', goPage: const HomePage());
  }
}
