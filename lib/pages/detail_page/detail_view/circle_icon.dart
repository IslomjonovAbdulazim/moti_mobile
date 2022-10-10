import 'package:flutter/material.dart';
import '../../../utils/dimensions.dart';

class CircleIcon extends StatelessWidget {
  final double size;
  final IconData iconData;
  const CircleIcon({Key? key, required this.size, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Center(
        child: Icon(iconData, color: Colors.black, size: Dimensions.iconSize24,),
      ),
    );
  }
}
