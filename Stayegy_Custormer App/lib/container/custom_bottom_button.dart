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
  });

  final bool disabled;
  final VoidCallback onTap;
  final String text;
  Color disabledColor = Colors.black12;
  Color activeColor = Color(0xff191919);
  Color textDisabledColor = Colors.black;
  Color textActiveColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: disabled == true ? disabledColor : activeColor,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(top: 13, bottom: 13),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: disabled == true ? textDisabledColor : textActiveColor,
          ),
        ),
      ),
    );
  }
}
