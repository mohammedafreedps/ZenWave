import 'package:flutter/material.dart';

double SCREEN_HEIGHT = 0;
double SCREEN_WIDTH = 0;

screenHeightInitializing(BuildContext context) {
  SCREEN_HEIGHT = MediaQuery.of(context).size.height;
  SCREEN_WIDTH = MediaQuery.of(context).size.width;
}
