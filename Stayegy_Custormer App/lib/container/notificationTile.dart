import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stayegy/Screen/bookingStatusPage.dart';
import 'package:stayegy/bloc/Repository/Notificaions/Notification.dart';

class NotificationTile extends StatelessWidget {
  final NotificationDetails notificationDetails;

  final String bookPlacedIcon = 'images/bookplaced.png';
  final String bookPlacedtitle = 'Booking Placed';
  final String bookPlacedmsg = 'Your booking has been placed at ';

  final String bookAcceptedIcon = 'images/bookaccepted.png';
  final String bookAcceptedtitle = 'Booking Confirmed';
  final String bookAcceptedmsg = 'Your booking has been confirmed at ';

  final String checkInIcon = 'images/check in.png';
  final String checkIntitle = 'Checked In';
  final String checkInmsg = 'You just checked in at ';

  final String checkOutIcon = 'images/check out.png';
  final String checkOuttitle = 'Checked Out';
  final String checkOutmsg = 'You just checked Out from ';

  final String offerIcon = 'images/offericon.png';
  final String offertitle = 'New Offer!!!!';
  final String offermsg = 'New Offer is trending now! ';
  final String offermsg2 = 'Get it now from offer section ';

  NotificationTile({
    @required this.notificationDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notificationDetails.notificationType == 'offer') {
          Navigator.pop(context);
        } else {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingStatusPage()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: notificationDetails.seen ? Colors.white : Colors.lightBlue[50],
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Color(0xFF191919),
                width: 0.5,
              )),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      notificationDetails.notificationType == 'bookingPlaced'
                          ? bookPlacedIcon
                          : notificationDetails.notificationType == 'bookingAccepted'
                              ? bookAcceptedIcon
                              : notificationDetails.notificationType == 'checkedIn'
                                  ? checkInIcon
                                  : notificationDetails.notificationType == 'checkedOut'
                                      ? checkOutIcon
                                      : offerIcon,
                      scale: 12,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    VerticalDivider(
                      thickness: 0.5,
                      color: Color(0xff191919),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              notificationDetails.notificationType == 'bookingPlaced'
                                  ? bookPlacedtitle
                                  : notificationDetails.notificationType == 'bookingAccepted'
                                      ? bookAcceptedtitle
                                      : notificationDetails.notificationType == 'checkedIn'
                                          ? checkIntitle
                                          : notificationDetails.notificationType == 'checkedOut'
                                              ? checkOuttitle
                                              : offertitle,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              notificationDetails.notificationType == 'bookingPlaced'
                                  ? bookPlacedmsg
                                  : notificationDetails.notificationType == 'bookingAccepted'
                                      ? bookAcceptedmsg
                                      : notificationDetails.notificationType == 'checkedIn'
                                          ? checkInmsg
                                          : notificationDetails.notificationType == 'checkedOut'
                                              ? checkOutmsg
                                              : offermsg,
                              style: TextStyle(fontSize: 10, color: Color(0xff191919), fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              notificationDetails.notificationType == 'offer' ? offermsg2 : notificationDetails.hotel,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff191919),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    DateFormat('hh:mm a').format(notificationDetails.time.toDate()),
                    style: TextStyle(fontSize: 10, color: Color(0xff191919), fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
