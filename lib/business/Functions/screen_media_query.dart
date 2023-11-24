import 'package:zenwave/presentation/Consts/screen_size.dart';

double? TOP_PART_HEIGHT;
double? SIZED_BOX_HEIGHT;
double? FONT_SIZE;
double? LOGIN_CONTAINER_HEIGHT;
double? LOGIN_CONTAINER_WIDTH;
double? LGOIN_BUTTON_HEIGHT;
double? LGOIN_BUTTON_WIDTH;
double? HOME_BUTTONS_WIDTH;
double? HOME_BUTTONS_HEIGHT;
double? HOME_BUTTONS_FONTSIZE;
double? PLANWORK_BUTTON_HEIGHT;
double? PLANWORK_BUTTON_WIDTH;
double? SETDAY_BUTTON_FONTSIZE;
double? JOURNAL_OPTIONPAGE_BUTTON_WIDTH;
double? JOURNAL_ADDPAGE_CONTAINER_WIDTH;
double? JOURNAL_ADDPAGE_CONTAINER_HEIGHT;
double? CAPTURE_ADDPAGE_CONTAINER_HEIGHT;
double? FOCUSMODE_CONTAINER_TOP_HEIGHT;
double? FOCUSMODE_CONTAINER_BOTTOM_HEIGHT;
double? FOCUSMODE_TIMER_CONTAINER_HEIGHT;
double? MINDFULLNESSPAGE_CONTAINER_HEIGHT;
screenResponsive() {
  //Info Page
  print('called ');
  TOP_PART_HEIGHT = SCREEN_HEIGHT * 0.5;
  SIZED_BOX_HEIGHT = SCREEN_HEIGHT * 0.15;
  FONT_SIZE = SCREEN_WIDTH * 0.05;

  //Login Page
  LOGIN_CONTAINER_HEIGHT = SCREEN_HEIGHT * 0.5;
  LOGIN_CONTAINER_WIDTH = SCREEN_WIDTH * 0.8;
  LGOIN_BUTTON_HEIGHT = SCREEN_HEIGHT * 0.07;
  LGOIN_BUTTON_WIDTH = SCREEN_WIDTH * 0.4;

  //Home Page / All customisable Buttons
  HOME_BUTTONS_HEIGHT = SCREEN_HEIGHT * 0.1;
  HOME_BUTTONS_WIDTH = SCREEN_WIDTH;
  HOME_BUTTONS_FONTSIZE = SCREEN_WIDTH * 0.05;

  //Plan Work
  PLANWORK_BUTTON_HEIGHT = SCREEN_HEIGHT * 0.07;
  PLANWORK_BUTTON_WIDTH = SCREEN_WIDTH * 0.3;
  SETDAY_BUTTON_FONTSIZE = SCREEN_WIDTH * 0.04;

  //Journal Option Page
  JOURNAL_OPTIONPAGE_BUTTON_WIDTH = SCREEN_WIDTH * 0.6;

  //Journal Add Page
  JOURNAL_ADDPAGE_CONTAINER_HEIGHT = SCREEN_HEIGHT * 0.7;
  JOURNAL_ADDPAGE_CONTAINER_WIDTH = SCREEN_WIDTH * 0.9;
  CAPTURE_ADDPAGE_CONTAINER_HEIGHT = SCREEN_HEIGHT * 0.7;

  //Focus Mode Page
  FOCUSMODE_CONTAINER_TOP_HEIGHT = SCREEN_HEIGHT *0.4;
  FOCUSMODE_CONTAINER_BOTTOM_HEIGHT = SCREEN_HEIGHT *0.3;
  FOCUSMODE_TIMER_CONTAINER_HEIGHT = SCREEN_HEIGHT * 0.7;

  //Mindfullness Exercises
  MINDFULLNESSPAGE_CONTAINER_HEIGHT = SCREEN_HEIGHT * 0.7;
}
