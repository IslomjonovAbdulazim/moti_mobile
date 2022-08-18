import 'package:flutter/material.dart';
import '../dimensions.dart';

class SubHeaderText extends StatelessWidget {

  Color? color = const Color(0xFF332d2b);
  final String text;
  double size;
  FontWeight fontWeight;
  TextOverflow overFlow;

   SubHeaderText({Key? key, this.color,
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w400,
    this.size = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(color: color, fontWeight: fontWeight,
          fontSize:size == 0 ? Dimensions.font16 : size),
    );
  }
}
class SUBBB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


