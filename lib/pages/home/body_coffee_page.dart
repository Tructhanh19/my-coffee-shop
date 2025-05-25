import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/dimensions.dart';
import 'package:coffee_shop/widgets/app_column.dart';
import 'package:coffee_shop/widgets/big_text.dart';
import 'package:coffee_shop/widgets/icon_and_text.dart';
import 'package:coffee_shop/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BodyCoffeePage extends StatefulWidget {
  const BodyCoffeePage({super.key});

  @override
  State<BodyCoffeePage> createState() => _BodyCoffeePageState();
}

class _BodyCoffeePageState extends State<BodyCoffeePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0; //giá trị của trang hiện tại
  double _scaleFactor = 0.8; //tỷ lệ thu phóng của trang
  double _height = Dimensions.pageViewContainer; //chiều cao của trang
  @override
  void initState() {
    // khởi tạo giá trị ban đầu
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current value is " +_currPageValue.toString());
      }); //lấy giá trị của trang hiện tại
    });
  }

  @override
  void dispose() {
    // giải phóng bộ nhớ khi không sử dụng nữa
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          // color: Colors.yellow,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buidPageItem(position);
            },
          ),
        ),
        // dots indicator section
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        // popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Coffee"),
              ),
            ],
          ),
        ),
        // list of food and images
        ListView.builder(
          physics: NeverScrollableScrollPhysics(), // không cho phép cuộn
          shrinkWrap: true, // thu nhỏ kích thước của ListView
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  // image section
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        image: AssetImage("assets/image/coffee1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // text section
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width15,
                          right: Dimensions.width15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Coffee Organic in DakLak"),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: "With Organic Coffee Beans"),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndText(
                                  icon: Icons.circle,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndText(
                                  icon: Icons.location_on,
                                  text: "1.7km",
                                  iconColor: AppColors.iconColor2,
                                ),
                                IconAndText(
                                  icon: Icons.access_time_rounded,
                                  text: "32min",
                                  iconColor: AppColors.mainColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buidPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity(); // tạo ma trận đơn vị
    if (index == _currPageValue.floor()) {
      var currScale =
          1 -
          (_currPageValue - index) *
              (1 - _scaleFactor); // tính toán trạng thái hiện tại
      var currTrans =
          _height * (1 - currScale) / 2; // tính toán khoảng cách dịch chuyển
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor +
          (_currPageValue - index + 1) *
              (1 - _scaleFactor); // tính toán trạng thái tiếp theo
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          1 -
          (_currPageValue - index) *
              (1 - _scaleFactor); // tính toán trạng thái tiếp theo
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale =
          0.8; // nếu không phải trang hiện tại thì tỷ lệ thu phóng là 0.8
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                image: AssetImage("assets/image/coffee1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width40,
                right: Dimensions.width40,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5), // đổ bóng xuống dưới
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0), // đổ bóng sang trái
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                ),
                child: AppColumn(text: "Coffee Organic"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
