import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification_page extends StatefulWidget {
  @override
  _notification_pageState createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            indicatorColor: Color(0xff191919),
            unselectedLabelColor: Color(0xffa2a2a2),
            labelColor: Color(0xff191919),
            onTap: (index) {},
            tabs: [
              Tab(
                child: Text(
                  'OFFERS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'NOTIFICATIONS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Text('Offers!'),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Text('Notifications!'),
          ),
        ]),
      ),
    );
  }
}
