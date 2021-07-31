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
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(title: Text("notification $index"));
          }),
    );
  }
}
