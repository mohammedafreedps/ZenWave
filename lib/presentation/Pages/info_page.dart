import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Pages/login_page.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return LoginPage();
      }));
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BASE_COLOR,
        child: Column(
          children: [
            PhysicalModel(
              color: PRIMARY_COLOR,
              elevation: Elevetion+3,
              child: Container(
                width: double.infinity,
                height: 450,
                color: PRIMARY_COLOR,
                child: Center(
                  child: LogoImage(120)
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            SizedBox(
              width: 390,
              child: Text('Zen Wave is your holistic mental wellness partner, offering a safe space to explore, understand, and enhance your emotional well-being. Its not just an app; its a companion on your journey to a healthier, happier you.',style: TextStyle(fontSize: 21,color: PRIMARY_COLOR),textAlign: TextAlign.center,),
            ),

          ],
        ),
      ),
    );
  }
}