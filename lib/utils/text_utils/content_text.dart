import 'package:flutter/material.dart';
import '../dimensions.dart';

class ContentText extends StatelessWidget {
  Color? color = const Color(0xFF808080);
  final String text;
  double size;
  FontWeight fontWeight;


  ContentText({Key? key, this.color,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.size = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(color: color, fontWeight: fontWeight,
          fontSize:size == 0 ? Dimensions.font14 : size),
    );
  }
}
