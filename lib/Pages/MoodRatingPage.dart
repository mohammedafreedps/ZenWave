import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/sharedPreference.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/Dividers.dart';
import 'package:zenwave/Widgets/ratingImot.dart';

class MoodRatingPage extends StatefulWidget {
  const MoodRatingPage({super.key});

  @override
  State<MoodRatingPage> createState() => _MoodRatingPageState();
}

class _MoodRatingPageState extends State<MoodRatingPage> {
  @override
  Widget build(BuildContext context) {

    ClickPopper(){
      Navigator.pop(context);
    }

    void veryGood (){
      print('Very Good');
      ClickPopper();
      saveIsRated(true);
    }
        void Good (){
          print('Good');
          ClickPopper();
          saveIsRated(true);
    }
        void Bad (){
          print('Bad');
          ClickPopper();
          saveIsRated(true);
    }
        void veryBad (){
          print('Very Bad');
          ClickPopper();
          saveIsRated(true);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        color: baseColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dividers(),
              Text('How was your day ?',style: TextStyle(color: primaryColor,fontSize: 30)),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingImot(ratingimg[0],veryGood),
                        RatingImot(ratingimg[1],Good),
                        RatingImot(ratingimg[2],Bad),
                        RatingImot(ratingimg[3],veryBad),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Very Good',style: TextStyle(color: primaryColor),),
                        Text('Good',style: TextStyle(color: primaryColor)),
                        Text('Bad',style: TextStyle(color: primaryColor)),
                        Text('Very Bad',style: TextStyle(color: primaryColor)),
                      ],
                    ),
                  ],
                ),
              ),
              Dividers(),
              CustomisableButton(double.infinity, bigButtonHeight, primaryColor, baseColor, 'Return without rating', bigButtonFontSize, true,HowToGO: 'pop',)
            ],
          ),
        ),
      ),
    );
  }
}
