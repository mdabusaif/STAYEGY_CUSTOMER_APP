import 'package:flutter/material.dart';
import 'package:stayegy/container/gradient_creation.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFF191919),
      child: GradientCreate(
        child: Text(
          'STAYEGY',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
