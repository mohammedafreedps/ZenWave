import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';

class ProgressCircle extends StatefulWidget {
  // const ProgressCircle({super.key});
  final double width;
  final double height;
  final double Progressvalue;

  ProgressCircle(this.width,this.height,this.Progressvalue);

  @override
  State<ProgressCircle> createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CircularProgressIndicator(
        value: widget.Progressvalue,
        valueColor: AlwaysStoppedAnimation(PRIMARY_COLOR),
        strokeWidth: 20,
        backgroundColor: BASE_COLOR,
      ),
    );
  }
}