import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/container/gradient_text.dart';

class TearmsAndConditionPage extends StatefulWidget {
  @override
  _TearmsAndConditionPageState createState() => _TearmsAndConditionPageState();
}

class _TearmsAndConditionPageState extends State<TearmsAndConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: Colors.white,
                child: Hero(
                  tag: 'image',
                  child: Image.asset(
                    'images/T&C.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10,
          left: 10,
          child: Container(
            height: 30,
            width: 370,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Color(0xff191919)),
            child: Align(
              alignment: Alignment.center,
              child: GradientText(
                'BACK TO HOME',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffb88746),
                    Color(0xfffdf5a6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
