import 'package:flutter/material.dart';

class BookedTile extends StatefulWidget {
  @override
  _BookedTileState createState() => _BookedTileState();
}

class _BookedTileState extends State<BookedTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'STAYEGY 2483 Hotel White House',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'New Bus Stand,Goalchamot,Faridpur',
              style: TextStyle(fontSize: 12, height: 1),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Date of Travell',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Check in   :  10 July,2021 (12:00 PM)',
              style: TextStyle(fontSize: 12, height: 2),
            ),
            Text(
              'Check out   :  12 July,2021 (11:59 PM)',
              style: TextStyle(fontSize: 12, height: 2),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Rooms & Types',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '1 Single Room(AC)',
              style: TextStyle(fontSize: 12, height: 3),
            ),
            Text(
              '1 Semi-Double Room(Non-Ac)',
              style: TextStyle(fontSize: 12, height: 2),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  child: Image.asset(
                    'images/book page vector.png',
                    scale: 2.5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30, right: 25),
                  alignment: Alignment.center,
                  height: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Pending...',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
