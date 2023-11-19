import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Widgets/graph_space.dart';

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
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        width: double.infinity,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
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
