import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/widgets/big_text.dart';
import 'package:coffee_shop/widgets/icon_and_text.dart';
import 'package:coffee_shop/widgets/small_text.dart';
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
  double _height = 220; //chiều cao của trang
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
    return Container(
      height: 320,
      // color: Colors.yellow,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buidPageItem(position);
        },
      ),
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
            height: 240,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
              height: 120,
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Coffee Organic"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10),
                        SmallText(text: "1287"),
                        SizedBox(width: 10),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    SizedBox(height: 20),
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
  }
}
