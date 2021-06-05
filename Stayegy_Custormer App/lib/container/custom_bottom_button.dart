import 'package:flutter/material.dart';
import 'package:stayegy/container/gradient_text.dart';

class CustomBottomButton extends StatelessWidget {
  CustomBottomButton({
    @required this.text,
    @required this.disabled,
    @required this.onTap,
    this.activeColor,
    this.disabledColor,
    this.textActiveColor,
    this.textDisabledColor,
    this.margin,
    this.padding,
    this.height,
    this.fontSize,
  });

  final bool disabled;
  final VoidCallback onTap;
  final String text;
  Color disabledColor = Colors.black12;
  Color activeColor = Color(0xff191919);
  Color textDisabledColor = Colors.black;
  Color textActiveColor = Colors.redAccent;
  EdgeInsets margin = EdgeInsets.only(top: 10, bottom: 10);
  EdgeInsets padding = EdgeInsets.only(top: 13, bottom: 13);
  final double height;
  double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: disabled == true ? disabledColor : activeColor,
        width: MediaQuery.of(context).size.width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: disabled == true ? textDisabledColor : textActiveColor,
          ),
        ),
      ),
    );
  }
}
