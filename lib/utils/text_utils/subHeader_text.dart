import 'package:flutter/material.dart';
import '../dimensions.dart';

class SubHeaderText extends StatelessWidget {

  Color? color = const Color.fromRGBO(139, 139, 139, 1);
  final String text;
  double size;
  FontWeight fontWeight;
  TextOverflow overFlow;

   SubHeaderText({Key? key, this.color,
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w500,
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



