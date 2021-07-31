import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/Screen/accountDetails_Page.dart';
import 'package:stayegy/Screen/bookingStatusPage.dart';
import 'package:stayegy/Screen/contact.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy/constants/ConstantLists.dart';
import 'package:stayegy/container/drawer_Data.dart';
import 'package:stayegy/container/gradient_creation.dart';
import 'package:stayegy/container/gradient_text.dart';

class Appdrawer extends StatelessWidget {
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
                  alignment: Alignment.centerLeft,
                  child: GradientText(
                    'Mr. ${userDetailsGlobal.name}',
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
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => AccountDetailsPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/booking_icon.png',
                  textData: 'Bookings',
                  onTap: () {
                    BlocProvider.of<LoadingBloc>(context).add(LoadBookStatusEvent());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingStatusPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/contact icon.png',
                  textData: 'Contact',
                  width: 12,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => ContactPage()));
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
