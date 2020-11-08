import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/container/slider.dart';

class details_page extends StatefulWidget {
  @override
  _details_pageState createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
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
            expandedHeight: 360,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(bottom: 0, top: 0),
              centerTitle: true,
              background: Container(
                child: ImageSliderDemo(
                  fit: BoxFit.cover,
                  aspectRatio: 4 / 4,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 80,
                color: Colors.white,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'STAYEGY 7350 Hotel Rajsthan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Puraton Bus Stand, Faridpur',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Date of Booking',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black,
                      height: 70,
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Facilities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        mainAxisSpacing: 100,
                        crossAxisCount: 3,
                        children: List.generate(10, (index) {
                          return Center(
                            child: Text('fac $index'),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
