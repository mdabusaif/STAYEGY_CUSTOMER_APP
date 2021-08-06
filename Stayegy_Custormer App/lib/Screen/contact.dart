import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(slivers: [
          SliverAppBar(
            floating: false,
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Image.asset(
                'images/Contact.png',
                fit: BoxFit.fill,
              ),
            ),
            leading: IconButton(
              padding: EdgeInsets.only(right: 10),
              iconSize: 5,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: ("Contact with "),
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffa2a2a2),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "STAYEGY ",
                            style: GoogleFonts.roboto(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff191919),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: "via",
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffa2a2a2),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/cell.png',
                                      scale: 3,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'images/mail.png',
                                      scale: 3,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'images/mess.png',
                                      scale: 3,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'images/whats.png',
                                      scale: 3,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '0130142875',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff191919),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('user.contact@stayegy.com',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff191919),
                                          decoration: TextDecoration.none,
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('messanger/stayegy',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff191919),
                                          decoration: TextDecoration.none,
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text('01345125746',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff191919),
                                          decoration: TextDecoration.none,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Office',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffa2a2a2),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'House no 27/11/48/2',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffa2a2a2),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'Road 4B Aftabnagar',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffa2a2a2),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'Dhaka 1212',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffa2a2a2),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
