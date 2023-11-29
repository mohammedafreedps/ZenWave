import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';

class GraphSpace extends StatefulWidget {
  final String title;
  final double width;
  final double height;

  GraphSpace(this.title,this.height,this.width);

  @override
  State<GraphSpace> createState() => _GraphSpaceState();
}

class _GraphSpaceState extends State<GraphSpace> {
  double _width = double.infinity;
  double _height = 250;

  

  List<FlSpot> flSpots = [];

_loadData() {
  final List moodData = moodTrackerBox.values.toList();
  flSpots = moodData.map((data) {
    int dayOfWeek = data.date.weekday-1;
    return FlSpot(dayOfWeek.toDouble(), data.mood.toDouble());
  }).toList();
  if (mounted) {
    setState(() {});
  }
}





  Widget bottomtitles(double value, TitleMeta meta) {
    final title = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      title[value.toInt()],
      style:  TextStyle(
        color: const Color(0xFF435334),
        fontWeight: FontWeight.bold,
        fontSize: SCREEN_WIDTH*0.03,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Color(0xFF435334),
      fontWeight: FontWeight.bold,
      fontSize: SCREEN_WIDTH*0.03,
    );
    String text;
    if (value == 0) {
      text = 'Very Bad';
    } else if (value == 1) {
      text = 'Bad';
    } else if (value == 2) {
      text = 'Good';
    } else if (value == 3) {
      text = 'Very Good';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: SCREEN_WIDTH*0.03,
      child: Text(text, style: style),
    );
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: SECONDARY_COLOR,
      elevation: Elevetion,
      borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: SCREEN_WIDTH*0.05),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: _width,
              height: _height,
              color: SECONDARY_COLOR,
              child: SizedBox(
                height: 40,
                child: LineChart(LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: bottomtitles)),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 80,
                                getTitlesWidget: leftTitles))),
                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: PRIMARY_COLOR, width: 2),
                    ),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 3,
                    lineBarsData: [
                      LineChartBarData(
                        spots: flSpots,
                        isCurved: false,
                        color: PRIMARY_COLOR,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      )
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
