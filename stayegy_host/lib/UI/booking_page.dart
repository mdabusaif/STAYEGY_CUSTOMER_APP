import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/UI/booking_confirm_page.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
        title: Text(
          'Bookings',
          style: GoogleFonts.staatliches(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xff0c0c0c),
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
                    'Search by mobile number',
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
                  title: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => BookingConfirmPage())),
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
                      color: Color(0xffefefef),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mr. xyz is staying at Room \$ T007 ',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                          Text('Sami-dual bed || AC (2 days)',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
