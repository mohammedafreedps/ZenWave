import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/moodTracking.dart';
import 'package:zenwave/data/DB/sharedPreference.dart';
import 'package:zenwave/presentation/Pages/home_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/divider.dart';
import 'package:zenwave/presentation/Widgets/rating_imot.dart';

class MoodRatingPage extends StatefulWidget {
  final Function refresh;
  MoodRatingPage(this.refresh);

  @override
  State<MoodRatingPage> createState() => _MoodRatingPageState();
}

class _MoodRatingPageState extends State<MoodRatingPage> {
  @override
  Widget build(BuildContext context) {
    ClickPopper() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage() ));
    }

    void veryGood() {
      print('Very Good');
      ClickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(DateTime.now().toString(), moodTracking(DateTime.now(), 3));
    }

    void Good() {
      print('Good');
      ClickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(DateTime.now().toString(), moodTracking(DateTime.now(), 2));
    }

    void Bad() {
      print('Bad');
      ClickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(DateTime.now().toString(), moodTracking(DateTime.now(), 1));
    }

    void veryBad() {
      print('Very Bad');
      ClickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(DateTime.now().toString(), moodTracking(DateTime.now(), 0));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        color: BASE_COLOR,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dividers(),
              Text('How was your day ?',
                  style: TextStyle(color: PRIMARY_COLOR, fontSize: 30)),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingImot(RATING_IMAGE[0], veryGood),
                        RatingImot(RATING_IMAGE[1], Good),
                        RatingImot(RATING_IMAGE[2], Bad),
                        RatingImot(RATING_IMAGE[3], veryBad),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Very Good',
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                        Text('Good', style: TextStyle(color: PRIMARY_COLOR)),
                        Text('Bad', style: TextStyle(color: PRIMARY_COLOR)),
                        Text('Very Bad', style: TextStyle(color: PRIMARY_COLOR)),
                      ],
                    ),
                  ],
                ),
              ),
              Dividers(),
              CustomisableButton(
                double.infinity,
                BIG_BUTTON_HEIGHT,
                PRIMARY_COLOR,
                BASE_COLOR,
                'Return without rating',
                BIG_BUTTON_FONT_SIZE,
                true,
                go: HomePage(),
                HowToGO: 'pushReplace',
              )
            ],
          ),
        ),
      ),
    );
  }
}
