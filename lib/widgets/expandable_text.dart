import 'package:coffee_shop/utils/colors.dart';
import 'package:coffee_shop/utils/dimensions.dart';
import 'package:coffee_shop/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf; // phần đầu của văn bản chưa được mở rộng
  late String secondHalf; // phần còn lại của văn bản sau khi mở rộng
  bool hiddenText = true;
  double textHeight =
      Dimensions.screenHeight / 5.00; // Adjust this value as needed

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          secondHalf.isEmpty
              ? SmallText(text: firstHalf)
              : Column(
                children: [
                  SmallText(
                    color: AppColors.paraColor,
                    size: Dimensions.font16,
                    text:
                        hiddenText
                            ? (firstHalf + "...")
                            : (firstHalf + secondHalf),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText; // Chuyển đổi trạng thái ẩn/hiện
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: "Show more",
                          size: Dimensions.font16,
                          color: AppColors.mainColor,
                        ),
                        Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
