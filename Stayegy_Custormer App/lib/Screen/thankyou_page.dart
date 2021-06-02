import 'package:flutter/material.dart';
import 'package:stayegy/container/bottom_button.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'images/thank you page vector 2.png',
                          scale: 12,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'images/thank you page vector 1.png',
                              scale: 12,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Image.asset(
                              'images/thank you page vector 3.png',
                              scale: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Your booking has been placed ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff6b6b6b),
                                    height: 2)),
                            Text('Booking ID: #FFCSO4',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff6b6b6b),
                                    height: 2)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: BottomButton(
                    text: 'Back To Home', disabled: false, onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
