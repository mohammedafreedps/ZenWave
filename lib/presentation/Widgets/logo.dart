import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  // const LogoImage({super.key});
  final double Width;
  LogoImage(this.Width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      child: Image.asset('assets/logo/Zen Wave.png'),
    );
  }
}