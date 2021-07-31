import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookedTile extends StatelessWidget {
  final BookingDetails bookingDetails;

  BookedTile({@required this.bookingDetails});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order No: #${bookingDetails.bid}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 00,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${bookingDetails.hid} ${bookingDetails.hotelName}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              bookingDetails.hotelAddress,
              style: TextStyle(fontSize: 12, height: 2),
            ),
            GestureDetector(
              onTap: () async {
                print("Location Tapped");
                final url = bookingDetails.mapUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                width: 60,
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  top: 5,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      // Icons.location_on_outlined,
                      // Icons.location_on_sharp,
                      CupertinoIcons.location_solid,
                      size: 30,
                      color: Colors.red,
                    ),
                    Text(
                      "MAP",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Date of Travell',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Check in   :  ${DateFormat.yMMMMd().format(DateTime.parse(bookingDetails.startDate.toDate().toString()))} (12:00 PM)',
              style: TextStyle(fontSize: 12, height: 2),
            ),
            Text(
              'Check out   :  ${DateFormat.yMMMMd().format(DateTime.parse(bookingDetails.endDate.toDate().toString()))} (11:59 AM)',
              style: TextStyle(fontSize: 12, height: 2),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Rooms & Types',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            LimitedBox(
              maxHeight: 150,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookingDetails.selectedRooms.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        '1 ${bookingDetails.selectedRooms[index]}',
                        style: TextStyle(fontSize: 13, height: 2),
                      ),
                    );
                  }),
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
                        bookingDetails.status == 'pending' ? 'Pending...' : 'Booked',
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
