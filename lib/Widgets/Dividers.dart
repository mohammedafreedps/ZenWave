import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';

class Dividers extends StatelessWidget {
  const Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: dropShadowColor,
      thickness: 2,
    );
  }
}