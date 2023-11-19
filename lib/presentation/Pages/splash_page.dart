import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Pages/home_page.dart';
import 'package:zenwave/presentation/Pages/info_page.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    print(IsUserLogin);
    super.initState();
    if (IsUserLogin == true) {
             Timer(Duration(seconds: 1), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      }));
    });
    }
    if (IsUserLogin == false) {
       Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return InfoPage();
      }));
    });
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: PRIMARY_COLOR,
        child: Center(
          child:  LogoImage(120)
        ),
      ),
    );
  }
}