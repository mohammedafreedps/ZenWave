import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Pages/Infopage.dart';
import 'package:zenwave/Widgets/Logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return InfoPage();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: primaryColor,
        child: Center(
          child:  LogoImage(120)
        ),
      ),
    );
  }
}