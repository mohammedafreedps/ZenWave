import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/TextFieldBorder.dart';

class FocusTimeSetterPage extends StatefulWidget {
  const FocusTimeSetterPage({super.key});

  @override
  State<FocusTimeSetterPage> createState() => _FocusTimeSetterPageState();
}

class _FocusTimeSetterPageState extends State<FocusTimeSetterPage> {
  TextEditingController CustomFocusTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baseColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 990,
          color: baseColor,
          child: Padding(padding: EdgeInsets.all(PagePadding),
          child: Center(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PhysicalModel(
                  color: secondaryColor,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(clipBorderRadious),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(clipBorderRadious),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      color: secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 10,),
                          CustomisableButton(160, 65, baseColor, primaryColor, '15 min',20, true,HowToGO: 'pop',),
                          CustomisableButton(160, 65, baseColor, primaryColor, '1 hr',20, true,HowToGO: 'pop',),
                          CustomisableButton(160, 65, baseColor, primaryColor, '1hr 30min',20, true,HowToGO: 'pop',),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
                 PhysicalModel(
                  color: secondaryColor,
                  elevation: Elevetion,
                  borderRadius: BorderRadius.circular(clipBorderRadious),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(clipBorderRadious),
                    child: Container(
                      width: double.infinity,
                      height: 270,
                      color: secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text('Custom Time',style: TextStyle(fontSize: 35,color: primaryColor),),
                        Text('In miniuts',style: TextStyle(fontSize: 15,color: primaryColor)),
                        SizedBox(
                          width: 360,
                          child: TextFieldBorder(CustomFocusTime)),
                          CustomisableButton(160, 65, baseColor, primaryColor, 'SET TIMER',18, true,HowToGO: 'pop',),
                      ],),
                    ),
                  ),
                )
              ],
            ),
          ),),),
        ),
      ),
    );
  }
}
