import 'package:flutter/material.dart';
import 'package:moti/utils/text_utils/content_text.dart';

import '../dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,  required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textheight = Dimensions.screenHeight/6.17;
  @override
  void initState() {
    super.initState();
    if(widget.text.length > textheight){
      firstHalf = widget.text.substring(0, textheight.toInt());
      secondHalf = widget.text.substring(textheight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?ContentText(text: firstHalf):Column(
        children: [
          ContentText(color: Colors.black.withOpacity(0.6), size: Dimensions.font16, text: hiddenText?(firstHalf+ "..."):(firstHalf + secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                ContentText(text: hiddenText? "Show more":"Show less", color: Theme.of(context).primaryColor,),
                Icon(hiddenText? Icons.arrow_drop_down: Icons.arrow_drop_up, color: Theme.of(context).primaryColor,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
