import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:stayegy_host/container/bottom_button.dart';

class otp_page extends StatefulWidget {
  @override
  _otp_pageState createState() => _otp_pageState();
}

// ignore: camel_case_types
class _otp_pageState extends State<otp_page> {
  String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(90, 150, 70, 0),
            child: Image.asset('images/stayegy host logo.png'),
          ),
          SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            // OTPTextField is a dart package: "otp_text_field: ^1.0.1"
            // Link: https://pub.dev/packages/otp_text_field
            child: OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 35,
              style: TextStyle(fontSize: 35),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (code) {
                otp = code;
                print("Entered otp: " + code);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: BottomButton(
              text: 'SUBMIT',
              disabled: false,
              onTap: () {
                FocusScope.of(context).unfocus();
                print(otp);
              },
            ),
          ),
          Text(
            "Didn't receive the code? Resend the code in 00:59",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
