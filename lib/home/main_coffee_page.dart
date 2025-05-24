import 'package:coffee_shop/home/body_coffee_page.dart';
import 'package:coffee_shop/utils/colors.dart';
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
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          BodyCoffeePage(),
        ],
      ),
    );
  }
}
