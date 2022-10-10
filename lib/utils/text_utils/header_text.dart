import 'package:flutter/material.dart';
import '../dimensions.dart';

class HeaderText extends StatelessWidget {
  Color? color = const Color(0xFF332d2b);
  final String text;
  double size;
  FontWeight fontWeight;
  TextOverflow overFlow;
  String? fontFamily;
  TextAlign? textAlign;

  HeaderText({Key? key, this.color,
    required this.text,

    this.overFlow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w500,
    this.size = 0,this.fontFamily, this.textAlign = TextAlign.left}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontFamily: fontFamily ?? "Poppins",
          fontSize:size == 0 ? Dimensions.font20 : size),
    );
  }
}
