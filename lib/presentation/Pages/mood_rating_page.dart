import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/moodTracking.dart';
import 'package:zenwave/data/DB/shared_preference.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/home_page.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/divider.dart';
import 'package:zenwave/presentation/Widgets/rating_imot.dart';

class MoodRatingPage extends StatefulWidget {
  final Function refresh;
  const MoodRatingPage(this.refresh);

  @override
  State<MoodRatingPage> createState() => _MoodRatingPageState();
}

class _MoodRatingPageState extends State<MoodRatingPage> {
  @override
  Widget build(BuildContext context) {
    clickPopper() {
      navigateTo(
          context: context, goLike: 'pushReplacement', goPage: const HomePage());
    }

    void veryGood() {
      clickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(
          DateTime.now().toString(), moodTracking(DateTime.now(), 3));
    }

    void good() {
      clickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(
          DateTime.now().toString(), moodTracking(DateTime.now(), 2));
    }

    void bad() {
      clickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(
          DateTime.now().toString(), moodTracking(DateTime.now(), 1));
    }

    void veryBad() {
      clickPopper();
      saveIsRated(true);
      widget.refresh();
      moodTrackerBox.put(
          DateTime.now().toString(), moodTracking(DateTime.now(), 0));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: const IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        color: BASE_COLOR,
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        child: Padding(
          padding: const EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Dividers(),
              const cusText(
                content: 'How was your day ?',
                fontSize: 30,
                color: PRIMARY_COLOR,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingImot(RATING_IMAGE[0], veryGood),
                        RatingImot(RATING_IMAGE[1], good),
                        RatingImot(RATING_IMAGE[2], bad),
                        RatingImot(RATING_IMAGE[3], veryBad),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cusText(
                          content: 'Very Good',
                          color: PRIMARY_COLOR,
                        ),
                        cusText(
                          content: 'Good',
                          color: PRIMARY_COLOR,
                        ),
                        cusText(
                          content: 'Bad',
                          color: PRIMARY_COLOR,
                        ),
                        cusText(
                          content: 'Very Bad',
                          color: PRIMARY_COLOR,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Dividers(),
              CustomisableButton(
                double.infinity,
                BIG_BUTTON_HEIGHT,
                PRIMARY_COLOR,
                BASE_COLOR,
                'Return without rating',
                BIG_BUTTON_FONT_SIZE,
                true,
                go: const HomePage(),
                HowToGO: 'pushReplace',
              )
            ],
          ),
        ),
      ),
    );
  }
}
