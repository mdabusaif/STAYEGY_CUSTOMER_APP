import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stayegy/container/custom_bottom_button.dart';
import 'package:stayegy/container/gradient_creation.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/left gradient.png',
                scale: 13,
                fit: BoxFit.fill,
              ),
            ),
            Column(
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
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: GradientCreate(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: CustomBottomButton(
                          fontSize: 18,
                          height: 40,
                          text: 'Back To Home',
                          disabled: false,
                          activeColor: Colors.transparent,
                          textActiveColor: Colors.white,
                          onTap: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          }),
                    ),
                  ),
                ),
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
    );
  }
}
