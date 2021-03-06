import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String _counntryCode, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //Container for logo
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(90, 200, 70, 0),
              child: Image.asset('images/stayegy host logo.png'),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                height: 358,
                padding: EdgeInsets.fromLTRB(30, 150, 30, 150),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd7d7d7),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Image.asset(
                            'images/BD Flag.png',
                            scale: 140,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Color(0xffd7d7d7),
                        thickness: 1,
                        width: 2,
                        indent: 8,
                        endIndent: 8,
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              _phoneNumber = value;
                            },

                            /// TODO: Decorate the textfield perfectly
                            decoration: InputDecoration(
                              hintText: 'Enter Number',
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Color(0xffd7d7d7),
                          //color: Colors.black,
                          margin: EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            child: Image.asset(
                              'images/next button.png',
                              scale: 2.5,
                              //color: Colors.black,
                            ),
                            onTap: () {
                              print('Pressed!');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
