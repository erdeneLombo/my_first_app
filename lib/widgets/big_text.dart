import 'package:flutter/material.dart';
import 'package:my_first_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  TextOverflow overFlow;
  BigText({
    super.key,
    this.color = Colors.black87,
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.size =0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
