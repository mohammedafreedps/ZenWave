import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/JournalOptionPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/TextFieldBorder.dart';

class JournalAddPage extends StatefulWidget {
  // const JournalAddPage({super.key});
  String setTo;
  String buttontext;
  

  JournalAddPage(this.setTo,this.buttontext);

  @override
  State<JournalAddPage> createState() => _JournalAddPageState();
}

class _JournalAddPageState extends State<JournalAddPage> {
  
  @override
  Widget build(BuildContext context) {
     saveTo(){
      if(widget.setTo == 'Personal'){
        print('Personal saved');
      }else if(widget.setTo == 'Gratitude'){
        print('Gratitude saved');
      }else if (widget.setTo == 'Deleted'){
        print('Deleted restored');
      }
    }
    TextEditingController jounalAddpageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baseColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.setTo,style: TextStyle(color: primaryColor,fontSize: 28),),),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 990,
            padding: EdgeInsets.all(PagePadding),
            color: baseColor,
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
                      padding: EdgeInsets.all(PagePadding+10),
                      width: double.infinity,
                      height: 780,
                      color: secondaryColor,
                      child: TextFieldBorder(jounalAddpageController)
                    ),
                  ),
                ),
                CustomisableButton(240, 69, secondaryColor, primaryColor, widget.buttontext, 20, true,toPerform: saveTo,go: JournalOptionPage(),HowToGO: 'pop',)
              ],
            ),
          ),
        ),
    );
  }
}