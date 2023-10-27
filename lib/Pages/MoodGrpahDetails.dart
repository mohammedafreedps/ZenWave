import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Widgets/GraphSpace.dart';

class MoodGraphDetails extends StatefulWidget {
  const MoodGraphDetails({super.key});

  @override
  State<MoodGraphDetails> createState() => _MoodGraphDetailsState();
}

class _MoodGraphDetailsState extends State<MoodGraphDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        width: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 300,
                  child: GraphSpace('This Week')),
                  SizedBox(
                  height: 300,
                  child: GraphSpace('This Month')),
                  SizedBox(
                  height: 300,
                  child: GraphSpace('This Year')),
              ],
            )),
        ),
      ),
    );
  }
}
