import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/container/bottom_button.dart';
import 'package:stayegy/container/gradient_creation.dart';

class BookingConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0.5,
        centerTitle: true,
        title: Image.asset(
          'images/stayegy gold logo.png',
          scale: 3,
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //Information part start
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Thank you ',
                          style: TextStyle(
                            color: Color(0xff6b6b6b),
                            fontSize: 13,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Mr. XYZ, ',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                color: Color(0xff191919),
                              ),
                            ),
                            TextSpan(text: 'for staying with STAYEGY'),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_city_rounded,
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Selected Hotel ',
                            style: TextStyle(
                              color: Color(0xff6b6b6b),
                              fontSize: 11,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'STAYEGY007 Hotel Rajsthan',
                                  style: TextStyle(
                                    color: Color(0xff191919),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/dot.png',
                          scale: 11,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Check In Date 14th Feb 2021',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Check Out Date 16th Feb 2021',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Single | Non Ac',
                                  style: TextStyle(fontSize: 14, height: 2)),
                              Text('500',
                                  style: TextStyle(fontSize: 14, height: 2)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semi-Double | Ac',
                                  style: TextStyle(fontSize: 14, height: 3)),
                              Text('800',
                                  style: TextStyle(fontSize: 14, height: 3)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Double | Ac',
                                  style: TextStyle(fontSize: 14, height: 3)),
                              Text('1000',
                                  style: TextStyle(fontSize: 14, height: 3)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Color(0xffefefef),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                    Text('Payment Method',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('৳2000',
                                        style: TextStyle(
                                            fontSize: 18, height: 1.5)),
                                    Text('Pay at Hotel',
                                        style: TextStyle(
                                          fontSize: 12,
                                          height: 0.5,
                                        )),
                                  ],
                                ),
                                Text(
                                  'Payment Breakdown',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 4,
                                    color: Color(0xFFA1A1A1),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Subtitle',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                    Text('2300',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Discount',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                    Text('-300',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Promo',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                    Text('-0',
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 2,
                                            color: Color(0xff6b6b6b))),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total',
                                        style: TextStyle(
                                            fontSize: 12,
                                            //height: 0.5,
                                            color: Color(0xff6b6b6b))),
                                    Text('৳2000',
                                        style: TextStyle(
                                            fontSize: 12,
                                            //height: 0.5,
                                            color: Color(0xff6b6b6b))),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Icon(
                                        Icons.local_offer_rounded,
                                        size: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'ADD PROMO',
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 3,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 1,
            left: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child:
                  BottomButton(text: 'CONFIRM', disabled: false, onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
