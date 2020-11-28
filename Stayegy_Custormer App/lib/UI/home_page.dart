import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/Models/card_model.dart';
import 'package:stayegy/UI/appdrawer.dart';
import 'package:stayegy/UI/notification_page.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => FlatButton(
            padding: EdgeInsets.all(18),
            child: Image.asset('images/App drawer.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Center(
          child: Image.asset(
            'images/stayegy gold logo.png',
            scale: 2.5,
            fit: BoxFit.fill,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(17),
            minWidth: 1,
            onPressed: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => notification_page())),
            child: Image.asset('images/Notification bell.png'),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: appdrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff191919),
            floating: true,
            pinned: false,
            automaticallyImplyLeading: false,
            title: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                height: 40,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                //color: Colors.white,
                child: Text(
                  'Search for Hotel, City or Location',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                selected: true,
                title: CardModel(),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
