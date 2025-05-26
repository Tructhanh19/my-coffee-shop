import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/dimensions.dart';
import 'package:coffee_shop/widgets/app_icon.dart';
import 'package:coffee_shop/widgets/big_text.dart';
import 'package:coffee_shop/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class DetailRecommededCoffee extends StatelessWidget {
  const DetailRecommededCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [AppIcon(icon: Icons.clear), AppIcon(icon: Icons.shop)],
            ),
            bottom: PreferredSize(
              // tạo khoảng trống dưới thanh tiêu đề
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(text: "Coffee Organic")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true, // giữ thanh tiêu đề ở trên cùng khi cuộn
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/coffee1.jpg",
                width: double.maxFinite, // full width
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                  ),
                  child: ExpandableText(
                    // văn bản mở rộng
                    text:
                        "Our pure coffee beans are meticulously handpicked from the fertile and lush highlands of DakLak, one of Vietnam’s most celebrated coffee regions. The unique combination of rich volcanic soil, ideal altitude, and a temperate climate creates perfect growing conditions that nurture the beans to develop their full-bodied flavor and captivating aroma. Each coffee cherry is carefully selected at peak ripeness, ensuring the highest quality and consistency. \nDakLak’s coffee beans are renowned worldwide for their bold, robust taste balanced by subtle notes of chocolate and caramel, delivering a smooth and satisfying finish with every sip. Sourced sustainably and processed with utmost care, our coffee embodies the rich heritage and passion of local farmers. Whether brewed as a strong espresso or a delicate drip coffee, our 100% natural beans offer an authentic and unforgettable coffee experience for connoisseurs and casual drinkers alike. \nDiscover the true essence of Vietnamese coffee with every cup — pure, rich, and crafted to perfection. \nOur organic coffee beans are grown with the utmost respect for nature and the environment. Cultivated without the use of harmful pesticides, fertilizers, or chemicals, these beans are the result of sustainable farming practices that promote healthy soil, water conservation, and biodiversity. \nHarvested from certified organic farms, our coffee is a pure reflection of the land’s vitality. The beans are handpicked at the peak of ripeness, ensuring only the highest quality is brought to your cup. The result is a rich, smooth flavor profile with subtle notes of natural sweetness and a clean finish. \nBy choosing our organic coffee, you not only support healthier farming practices but also enjoy a more authentic and pure coffee experience. Feel good knowing your choice contributes to the well-being of the environment and the communities that cultivate it. \nBy choosing our organic coffee, you not only support healthier farming practices but also enjoy a more authentic and pure coffee experience. Feel good knowing your choice contributes to the well-being of the environment and the communities that cultivate it. Our pure coffee beans are meticulously handpicked from the fertile and lush highlands of DakLak, one of Vietnam’s most celebrated coffee regions. The unique combination of rich volcanic soil, ideal altitude, and a temperate climate creates perfect growing conditions that nurture the beans to develop their full-bodied flavor and captivating aroma. Our pure coffee beans are meticulously handpicked from the fertile and lush highlands of DakLak, one of Vietnam’s most celebrated coffee regions. The unique combination of rich volcanic soil, ideal altitude, and a temperate climate creates perfect growing conditions that nurture the beans to develop their full-bodied flavor and captivating aroma. \nOur pure coffee beans are meticulously handpicked from the fertile and lush highlands of DakLak, one of Vietnam’s most celebrated coffee regions. The unique combination of rich volcanic soil, ideal altitude, and a temperate climate creates perfect growing conditions that nurture the beans to develop their full-bodied flavor and captivating aroma.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$12.88 " + "X " + "0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    right: Dimensions.width20,
                    left: Dimensions.width20,
                  ),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
