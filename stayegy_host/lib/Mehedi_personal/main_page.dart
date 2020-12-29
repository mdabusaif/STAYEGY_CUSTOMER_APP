import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class main_page extends StatefulWidget {
  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          Image.asset(
            'images/host logo.png',
            scale: 6,
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: Drawer(),
      body:
          //GridView(),

          Column(
        children: [
          Row(
            // Heading Row-1
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  'STAYEGY 7350',
                  style: GoogleFonts.staatliches(fontSize: 40),
                ),
              )
            ],
          ),
          Row(
            // Heading Row-2
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hotel Rajsthan',
                style: GoogleFonts.staatliches(fontSize: 25),
              )
            ],
          ),
          Row(
            // Heading Row-3
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Goylachmot, Faridpur',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              )
            ],
          ),
          Padding(
            // Booking request Row
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Container(
              height: 65,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Text(
                          'New booking request from Mr.xyz',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Semi-double bed || AC (2 days)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            // Request cancellation row
            padding: const EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 0.0),
            child: Container(
              height: 65,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Text(
                          'Mr.xyz cancelled his booking',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Semi-double bed || AC (2 days)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            // Room's state indicator row
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.green[600],
                    ),
                  ),
                  Text(
                    '  OPEN',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.red[400],
                    ),
                  ),
                  Text(
                    '  CLOSE',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.yellow[300],
                    ),
                  ),
                  Text(
                    '  BOOKED',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            // Showing all the rooms
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Container(
              height: 248,
              width: 369,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 7.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 01', clr: Colors.red[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'Room 02', clr: Colors.red[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 03', clr: Colors.yellow[300]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 04', clr: Colors.yellow[300]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        RowWiseRoom(
                            roomNumber: 'ROOM 05', clr: Colors.yellow[300]),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'Room 06', clr: Colors.yellow[300]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 07', clr: Colors.yellow[300]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 08', clr: Colors.yellow[300]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        RowWiseRoom(
                            roomNumber: 'ROOM 09', clr: Colors.green[400]),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'Room 10', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 11', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 12', clr: Colors.green[400]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        RowWiseRoom(
                            roomNumber: 'ROOM 13', clr: Colors.green[400]),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'Room 14', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 15', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 16', clr: Colors.green[400]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        RowWiseRoom(
                            roomNumber: 'ROOM 17', clr: Colors.green[400]),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'Room 18', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 19', clr: Colors.green[400]),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                          child: RowWiseRoom(
                              roomNumber: 'ROOM 20', clr: Colors.green[400]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowWiseRoom extends StatelessWidget {
  final String roomNumber;
  final Color clr;

  RowWiseRoom({@required this.roomNumber, @required this.clr});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
      child: Container(
        height: 40,
        width: 83,
        color: clr,
        child: Center(
          child: Text(
            roomNumber,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
