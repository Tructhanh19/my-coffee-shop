import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/dimensions.dart';
import 'package:coffee_shop/widgets/app_column.dart';
import 'package:coffee_shop/widgets/app_icon.dart';
import 'package:coffee_shop/widgets/big_text.dart';
import 'package:coffee_shop/widgets/expandable_text.dart';
import 'package:coffee_shop/widgets/icon_and_text.dart';
import 'package:coffee_shop/widgets/small_text.dart';
import 'package:flutter/material.dart';

class DetailPopularCoffee extends StatelessWidget {
  const DetailPopularCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/coffee1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          // introduction of the coffee
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Coffee Organic"),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height10),
                  // exandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text:
                            "Our pure coffee beans are meticulously handpicked from the fertile and lush highlands of DakLak, one of Vietnam’s most celebrated coffee regions. The unique combination of rich volcanic soil, ideal altitude, and a temperate climate creates perfect growing conditions that nurture the beans to develop their full-bodied flavor and captivating aroma. Each coffee cherry is carefully selected at peak ripeness, ensuring the highest quality and consistency. DakLak’s coffee beans are renowned worldwide for their bold, robust taste balanced by subtle notes of chocolate and caramel, delivering a smooth and satisfying finish with every sip. Sourced sustainably and processed with utmost care, our coffee embodies the rich heritage and passion of local farmers. Whether brewed as a strong espresso or a delicate drip coffee, our 100% natural beans offer an authentic and unforgettable coffee experience for connoisseurs and casual drinkers alike. Discover the true essence of Vietnamese coffee with every cup — pure, rich, and crafted to perfection.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                right: Dimensions.width20,
                left: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                right: Dimensions.width20,
                left: Dimensions.width20,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
