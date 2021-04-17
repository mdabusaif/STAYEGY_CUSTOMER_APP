import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/Screen/history_save_page.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy/container/drawer_Data.dart';
import 'package:stayegy/container/gradient_creation.dart';
import 'package:stayegy/container/gradient_text.dart';

class appdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 110, 20, 0),
        color: Color(0xff191919),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 190, 10),
                  child: GradientText(
                    'Mr. XYZ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffb88746),
                        Color(0xfffdf5a6),
                      ],
                    ),
                  ),
                ),
                GradientCreate(
                  child: Divider(
                    thickness: 0.85,
                    color: Colors.white,
                  ),
                ),
                drawer_data(
                  imagePath: 'images/account_icon.png',
                  textData: 'Account',
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => history_save_page()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/booking_icon.png',
                  textData: 'Bookings',
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => history_save_page()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/invite_icon.png',
                  textData: 'Invite & Earn',
                  width: 10,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => history_save_page()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/save_icon.png',
                  textData: 'Saved & History',
                  width: 12,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => history_save_page()));
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 60.0,
              child: drawer_data(
                imagePath: 'images/logout_icon.png',
                textData: 'LOG OUT',
                width: 10,
                onTap: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  print("Pressed! Logout!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
