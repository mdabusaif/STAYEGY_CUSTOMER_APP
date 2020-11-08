import 'package:flutter/material.dart';
import 'package:stayegy/container/gradient_text.dart';

class BottomButton extends StatelessWidget {
  BottomButton(
      {@required this.text, @required this.disabled, @required this.onTap});

  final bool disabled;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: disabled == true ? Colors.black12 : Color(0xff191919),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(top: 13, bottom: 13),
        alignment: Alignment.center,
        child: GradientText(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          gradient: disabled == true
              ? LinearGradient(colors: [Colors.white, Colors.white])
              : LinearGradient(colors: [Color(0xffb88746), Color(0xfffdf5a6)]),
        ),
      ),
    );
  }
}
