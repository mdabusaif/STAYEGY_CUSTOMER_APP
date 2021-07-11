import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/container/gradient_text.dart';

class TearmsAndConditionPage extends StatefulWidget {
  @override
  _TearmsAndConditionPageState createState() => _TearmsAndConditionPageState();
}

class _TearmsAndConditionPageState extends State<TearmsAndConditionPage> {
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
                'images/T&C.png',
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
                )
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
