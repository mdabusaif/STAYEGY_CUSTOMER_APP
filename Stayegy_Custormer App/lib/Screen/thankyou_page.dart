import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/container/bottom_button.dart';
import 'package:stayegy/container/gradient_creation.dart';
import 'package:stayegy/container/gradient_text.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              color: Color(0xFF020101),
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'images/left gradient.png',
                      scale: 13,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'images/right gradient.png',
                      scale: 13,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/thank you.png',
                    scale: 14,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Your order has been placed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 8,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Booking ID:', textAlign: TextAlign.center, style: TextStyle(height: 1, color: Colors.white)),
                      GradientCreate(
                        child: Text('#FFCSO4', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: BottomButton(
                      text: 'Back To Home',
                      disabled: true,
                      onTap: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
