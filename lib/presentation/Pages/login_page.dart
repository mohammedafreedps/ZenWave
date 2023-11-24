import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/login_validation.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
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
                width: LOGIN_CONTAINER_WIDTH,
                height: LOGIN_CONTAINER_HEIGHT,
                color: SECONDARY_COLOR,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LogoImage(90),
                    TextFieldFilled(_userName),
                    CustomisableButton(LGOIN_BUTTON_WIDTH!, LGOIN_BUTTON_HEIGHT!, PRIMARY_COLOR, BASE_COLOR, 'Save',  LOGIN_CONTAINER_WIDTH!*0.05, false,toPerform: (){
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
