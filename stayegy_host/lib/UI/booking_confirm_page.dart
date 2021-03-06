import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingConfirmPage extends StatefulWidget {
  @override
  _BookingConfirmPageState createState() => _BookingConfirmPageState();
}

class _BookingConfirmPageState extends State<BookingConfirmPage> {
  String valueChoose;
  List listItem = [
    "Room 01",
    "Room 02",
    "Room 03",
    "Room 04",
    "Room 05",
    "Room 06",
    "Room 07",
    "Room 08",
    "Room 09",
    "Room 10",
    "Room 11",
    "Room 12",
    "Room 13",
    "Room 14",
    "Room 15",
    "Room 16",
    "Room 17",
    "Room 18",
    "Room 19",
    "Room 20",
    "Room 21",
    "Room 22",
    "Room 23",
    "Room 24",
    "Room 25",
    "Room 26",
    "Room 27",
    "Room 28",
    "Room 29",
    "Room 30"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 5,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            'images/stayegy host logo.png',
            scale: 6,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text('MR. XYZ Wants One Room',
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    height: 2,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text('Customer:',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  height: 3,
                                  fontWeight: FontWeight.bold)),
                          Text('Name: Rasel Morshed',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('Phone Number: 0191234567',
                              style: GoogleFonts.roboto(fontSize: 15)),
                          Text('Details:',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  height: 3,
                                  fontWeight: FontWeight.bold)),
                          Text('Date: 15-12-2021',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('Room Type: Sami-Dual/AC',
                              style: GoogleFonts.roboto(fontSize: 15)),
                          Text('Rooms:1',
                              style: GoogleFonts.roboto(fontSize: 15)),
                          Text('Days:2',
                              style: GoogleFonts.roboto(fontSize: 15)),
                          Text('Payment:',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  height: 3,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Room price:',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, height: 2)),
                              Text('1200tk',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, height: 2)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount:(20%)',
                                  style: GoogleFonts.roboto(fontSize: 15)),
                              Text('240tk',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, height: 2)),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Paid:',
                                  style: GoogleFonts.roboto(fontSize: 15)),
                              Text('960th',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, height: 2)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 30,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 5),
                            decoration: BoxDecoration(color: Color(0xffefefef)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Select Room Number',
                                    style: GoogleFonts.roboto(fontSize: 15)),
                                dropdownColor: Colors.grey,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 35,
                                isExpanded: true,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                },
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(
                                      valueItem,
                                      style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: Text(
                                'REJECT',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              alignment: Alignment.center,
                              color: Colors.black,
                              child: Text(
                                'CONFIRM',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
