import 'package:coffee_shop/pages/home/body_coffee_page.dart';
import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/dimensions.dart';
import 'package:coffee_shop/widgets/big_text.dart';
import 'package:coffee_shop/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainCoffeePage extends StatefulWidget {
  const MainCoffeePage({super.key});

  @override
  State<MainCoffeePage> createState() => _MainCoffeePageState();
}

class _MainCoffeePageState extends State<MainCoffeePage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current width is " + MediaQuery.of(context).size.width.toString());

    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height15,
              ),
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Hi, Truc Thanh",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: "Viet Nam", color: Colors.black54),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius15,
                        ),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: BodyCoffeePage(),
          )),
        ],
      ),
    );
  }
}
