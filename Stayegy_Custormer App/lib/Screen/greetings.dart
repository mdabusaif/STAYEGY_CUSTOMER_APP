import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/container/gradient_text.dart';

class GreetingsPage extends StatefulWidget {
  @override
  _GreetingsPageState createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
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
                    'images/Greetings.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/welcome.png',
                scale: 12,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 60),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hi, Mr. Ahmed',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffa2a2a2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Thank you so much for choosing STAYEGY as your',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffa2a2a2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'travel companion. We are welcoming you to our',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffa2a2a2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'family and wishing a good life ahead. Stay safe and',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffa2a2a2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Stay Easy with STAYEGY.',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w200,
                          color: Color(0xffa2a2a2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Follow Us On',
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffa2a2a2),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/fb.png',
                      scale: 2,
                    ),
                    Image.asset(
                      'images/insta.png',
                      scale: 2,
                    ),
                    Image.asset(
                      'images/mess.png',
                      scale: 2,
                    ),
                  ],
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
