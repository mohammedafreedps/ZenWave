import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/login_validation.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';
import 'package:zenwave/presentation/Widgets/textfield_filled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final TextEditingController  _userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        color: BASE_COLOR,
        child: Center(
          child: PhysicalModel(
            color: SECONDARY_COLOR,
            elevation: Elevetion,
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
              child: Container(
                width: 430,
                height: 450,
                color: SECONDARY_COLOR,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LogoImage(90),
                    TextFieldFilled(_userName),
                    CustomisableButton(170, 60, PRIMARY_COLOR, BASE_COLOR, 'Save', 20, false,toPerform: (){
                      loginValidation(context, _userName.text);
                    })
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
