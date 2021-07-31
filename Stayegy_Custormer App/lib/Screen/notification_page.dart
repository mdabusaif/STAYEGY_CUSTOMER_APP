import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          leading: IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 5,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color(0xff191919),
              size: 30,
            ),
          ),
          title: Text(
            'Notifications',
            style: GoogleFonts.staatliches(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xFF191919),
                  width: 0.5,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/booked.png',
                        scale: 12,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      VerticalDivider(
                        thickness: 0.5,
                        color: Color(0xff191919),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Booked Placed',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Your booking has beddn placed at',
                                style: TextStyle(fontSize: 10, color: Color(0xff191919), fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'STAYEGY 142 Hotel Mirpur ',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff191919),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      '1 hour ago',
                      style: TextStyle(fontSize: 10, color: Color(0xff191919), fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
