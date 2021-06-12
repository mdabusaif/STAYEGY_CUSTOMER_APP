import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingStatusPage extends StatefulWidget {
  @override
  _BookingStatusPageState createState() => _BookingStatusPageState();
}

class _BookingStatusPageState extends State<BookingStatusPage> {
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
                  'BOOKED',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'HISTORY',
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
            child: Text('NO BOOKINGS ACTIVE!'),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Text('NO BOOKING HISTORY!'),
          ),
        ]),
      ),
    );
  }
}
