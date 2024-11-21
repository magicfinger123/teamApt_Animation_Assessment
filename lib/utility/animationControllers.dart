import 'package:flutter/material.dart';

import 'constants.dart';



late AnimationController widthAniController1;//1.5 sec first
late Animation<double> widthAnimation1;

late AnimationController sizeAniController1;//1.5 sec first
late Animation<double> sizeAnimation1;

late AnimationController textController; //
late AnimationController textController2; //
late Animation<double> textOpacityAnimation;
late Animation<Offset> textSlideAnimation;

late AnimationController circleOrSquareController; //
late Animation<double> circleOrSquareAnimation;
late Animation<double> circleOrSquareTxtSizeAnimation;
late Animation<double> circleOrSquareTxtSizeAnimation2;
late Animation<int> circleOrSquareTxtAniCount1;
late Animation<int> circleOrSquareTxtAniCount2;

late AnimationController horizontalCircleController;
late Animation<double> horizontalCircleWidthAnimation;
late Animation<double> horizontalCircleWidthAnimation2;

late AnimationController slideBtmSheetController;
late Animation<Offset> slideBtmSheetAnimation;
late Animation<double> heightBtmSheetAnimation;

disposeHomeAnimationsControllers() {
  widthAniController1.dispose();
  sizeAniController1.dispose();
  textController.dispose();
  textController2.dispose();
  circleOrSquareController.dispose();
  horizontalCircleController.dispose();
  slideBtmSheetController.dispose();
  homeAnimationUsed = false;
}
