import 'package:flutter/material.dart';
import 'package:my_first_app/utils/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText({
    super.key,
    this.color = AppColors.textColor,
    required this.text,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: height,
      ),
    );
  }
}
