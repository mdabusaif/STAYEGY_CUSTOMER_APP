import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/UI/appdrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => FlatButton(
            padding: EdgeInsets.all(18),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Center(
          child: Image.asset(
            'images/host logo.png',
            scale: 6,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: appdrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text('STAYEGY 7350 ',
                      style: GoogleFonts.staatliches(fontSize: 35)),
                  Text('Hotel Rajesthan ',
                      style: GoogleFonts.staatliches(fontSize: 20)),
                  Text('Goyalchamot, Faridpur ',
                      style: GoogleFonts.staatliches(
                          fontSize: 12, color: Colors.black45)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        color: Color(0xffefefef),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Text('New booking request from Mr.xyz ',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        color: Color(0xffefefef),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Text('Sami-dual bed || AC (2 days)    ',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        color: Color(0xffefefef),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Text('Sami-dual bed || AC (2 days)    ',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        color: Color(0xffefefef),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Text('Sami-dual bed || AC (2 days)    ',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15.00,
                      height: 15.00,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xff5aa469),
                        ),
                      ),
                    ),
                    Text('  Open'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.00,
                      height: 15.00,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xffec524b),
                        ),
                      ),
                    ),
                    Text('  Close'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.00,
                      height: 15.00,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xfffff3b2),
                        ),
                      ),
                    ),
                    Text('  Booked'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Expanded(
                child: GridView.count(
                    childAspectRatio: 5 / 3,
                    crossAxisCount: 4,
                    // crossAxisSpacing: 15,
                    // mainAxisSpacing: 0,
                    children: List.generate(60, (index) {
                      return Card(
                        margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                        color: Colors.green,
                        child: Center(
                            child: Text('Room $index',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
