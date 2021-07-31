import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/bloc/LoadingBloc/loadingbloc_bloc.dart';
import 'package:stayegy/container/loading_Overlay.dart';
import 'package:stayegy/container/notificationTile.dart';

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
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<LoadingBloc, LoadingBlocState>(builder: (context, state) {
          return state is ProcessingState
              ? LoadingOverlay().buildWidget(context)
              : state is LoadedNotificationState
                  ? ListView.builder(
                      itemCount: state.notificationList.length,
                      itemBuilder: (context, index) {
                        return NotificationTile(
                          notificationDetails: state.notificationList[index],
                        );
                      })
                  : Container();
        }));
  }
}
