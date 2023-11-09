import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/DeletedJournalList.dart';
import 'package:zenwave/Pages/FutureWorkPlanPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  bool _hide = false;
  Timer? _textDisable;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textDisable = Timer(Duration(seconds: 2), () {
      setState(() {
        _hide = true;
      });
     });
  }
  @override
  void dispose() {
    if (_textDisable != null) {
      _textDisable!.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: baseColor,
        title: Text(''),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: baseColor,
          child: Padding(
            padding: EdgeInsets.all(PagePadding),
            child: Column(
              children: [
                !_hide ? 
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text('Deleted journals will be here for 20 days and it will automatically delete after 20 days',textAlign: TextAlign.center,style: TextStyle(fontSize: 21,color: primaryColor),),
                  ),
                ) : SizedBox(height: 10,),
                CustomisableButton(double.infinity, bigButtonHeight, secondaryColor, primaryColor, 'Deleted Journals', bigButtonFontSize, true,go: DeletedJournalList(),HowToGO: 'push',),
                SizedBox(height: 40,),
                CustomisableButton(double.infinity, bigButtonHeight, secondaryColor, primaryColor, 'Plan Work', bigButtonFontSize, true,go: FutureWorkPlanPage(),HowToGO: 'push',)
              ],
            ),
          ),
        ),
    );
  }
}