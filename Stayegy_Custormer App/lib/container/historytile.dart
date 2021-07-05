import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:intl/intl.dart';

class HistoryTile extends StatelessWidget {
  final BookingDetails bookingDetails;

  HistoryTile({@required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        color: Color(0xffefefef),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: bookingDetails.status == "cancelled" ? Colors.red : Color(0xFFEEA41A),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        bookingDetails.status == "cancelled" ? "Cancelled" : "Completed",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              Text(
                '${bookingDetails.hid} ${bookingDetails.hotelName}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 2),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/calendar.png',
                            scale: 11,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${DateFormat.yMMMMd().format(DateTime.parse(bookingDetails.startDate.toDate().toString()))}  -  ${DateFormat.yMMMMd().format(DateTime.parse(bookingDetails.endDate.toDate().toString()))}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/key.png',
                                  scale: 10,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${bookingDetails.selectedRooms.length} Rooms',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '৳ ${bookingDetails.totalDiscountedPrice}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
