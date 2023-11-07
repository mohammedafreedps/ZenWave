import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/sharedPreference.dart';
import 'package:zenwave/Pages/Homepage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/Logo.dart';
import 'package:zenwave/Widgets/TextFieldfilled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userName = TextEditingController();

  _validation(){
    if (_userName.text.isNotEmpty) {
      saveUserName(_userName.text);
      print('validation else case'+_userName.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return HomePage();
      }));
    }else{
      print('validation else case'+_userName.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Center(
          child: PhysicalModel(
            color: secondaryColor,
            elevation: Elevetion,
            borderRadius: BorderRadius.circular(clipBorderRadious),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(clipBorderRadious),
              child: Container(
                width: 430,
                height: 450,
                color: secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LogoImage(90),
                    TextFieldFilled(_userName),
                    CustomisableButton(170, 60, primaryColor, baseColor, 'Save', 20, false,toPerform: _validation,)
                  ]
                ),
              ),
            ),
          ),
        ),
      )
      
    );
  }
}
