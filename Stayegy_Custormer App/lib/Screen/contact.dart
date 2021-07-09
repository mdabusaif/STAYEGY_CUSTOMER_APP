import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/container/gradient_text.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: Colors.white,
                child: Hero(
                  tag: 'image',
                  child: Image.asset(
                    'images/Contact.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                width: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/cell.png',
                          scale: 14,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('0130142875',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff191919),
                              decoration: TextDecoration.none,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/mail.png',
                          scale: 14,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('user.contact@stayegy.com',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff191919),
                              decoration: TextDecoration.none,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/mess.png',
                          scale: 20,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('messanger/stayegy',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff191919),
                              decoration: TextDecoration.none,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/whats.png',
                          scale: 180,
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Text('01345125746',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff191919),
                              decoration: TextDecoration.none,
                            ))
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
                        fontWeight: FontWeight.w200,
                        color: Color(0xffa2a2a2),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'House no 27/11/48/2',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Color(0xffa2a2a2),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'Road 4B Aftabnagar',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.w200,
                        color: Color(0xffa2a2a2),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'Dhaka 1212',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        height: 1.5,
                        fontWeight: FontWeight.w200,
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
        Positioned(
          bottom: 10,
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
