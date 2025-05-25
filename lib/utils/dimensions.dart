import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView = screenHeight / 2.35; // (current height / 320 = 2.09)
  static double pageViewContainer =
      screenHeight / 3.42; // (current height / 220 = 3.42)
  static double pageViewTextContainer =
      screenHeight / 6.27; // (current height / 120 = 6.27)
  //dynamic height padding and margin
  static double height5 = screenHeight / 150.4; // (current height / 5 = 150.4)
  static double height10 = screenHeight / 75.2; // (current height / 10 = 75.2)
  static double height15 =
      screenHeight / 50.13; // (current height / 15 = 50.13)
  static double height20 = screenHeight / 37.6; // (current height / 20 = 37.6)
  static double height30 =
      screenHeight / 25.07; // (current height / 30 = 25.07)
  static double height45 =
      screenHeight / 16.78; // (current height / 45 = 16.78)

  //dynamic width padding and margin
  static double width5 = screenWidth / 150.4; // (current width / 5 = 150.4)
  static double width10 = screenWidth / 75.2; // (current width / 10 = 75.2)
  static double width15 = screenWidth / 50.13; // (current width / 15 = 50.13)
  static double width20 = screenWidth / 37.6; // (current width / 20 = 37.6)
  static double width30 = screenWidth / 25.07; // (current width / 30 = 25.07)
  static double width40 = screenWidth / 18.8; // (current width / 40 = 18.8)
  static double width45 = screenWidth / 16.78; // (current width / 45 = 16.78)

  //dynamic font size and radius
  static double font16 = screenHeight / 47.2; // (current height / 16 = 47.2)
  static double font20 = screenHeight / 37.6; // (current height / 20 = 37.6)
  static double font26 = screenHeight / 29.0; // (current height / 26 = 29.0)

  //radius
  static double radius20 = screenHeight / 37.6; // (current height / 20 = 37.6)
  static double radius30 =
      screenHeight / 25.07; // (current height / 30 = 25.07)
  static double radius15 =
      screenHeight / 50.13; // (current height / 15 = 50.13)

  //icon size
  static double iconSize24 =
      screenHeight / 31.25; // (current height / 24 = 31.25)
  static double iconSize16 =
      screenHeight / 47.2; // (current height / 16 = 47.2)

  //list view size
  static double listViewImgSize =
      screenWidth / 3.0; // (current width / 120 = 3.0)
  static double listViewTextContSize =
      screenWidth / 3.6; // (current width / 100 = 3.6)

  //popular food
  static double popularFoodImgSize =
      screenHeight / 2.15; // (current height / 350 = 2.15)

  //bottom height
  static double bottomHeightBar =
      screenHeight / 6.27; // (current height / 120 = 7.5)
}
