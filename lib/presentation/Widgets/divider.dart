import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';

class Dividers extends StatelessWidget {
  const Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: DROPSHADOW_COLOR,
      thickness: 2,
    );
  }
}