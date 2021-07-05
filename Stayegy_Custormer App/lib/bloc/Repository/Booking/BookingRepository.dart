import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:random_string/random_string.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/constants/ConstantLists.dart';

class BookingRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> placeBooking({BookingDetails bookingDetails, String hotelID}) async {
    String bid = randomAlphaNumeric(8);
    print(bid);

    while (true) {
      final documentReference = await db.collection("bookings").where("bid", arrayContains: [bid]).get();
      if (documentReference.docs.isEmpty) {
        bookingDetails.bid = bid;

        await db.collection("bookings").doc().set(bookingDetails.toJason());
        await db.collection("hotels").doc(hotelID).update({
          'totalReaches': FieldValue.increment(1),
        });
        return bid;
      } else {
        bid = randomAlphaNumeric(8);
        print(bid);
      }
    }
  }

  Future<bool> checkIfBookingExists() async {
    final documentReference = await db.collection("bookings").where("uid", isEqualTo: userDetailsGlobal.uid).where("isCheckedIn", isEqualTo: false).where("status", whereIn: ["booked", "pending"]).get();

    print(documentReference.docs.length);
    if (documentReference.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<BookingDetails> getBookingStatus() async {
    final documentReference = await db.collection("bookings").where("uid", isEqualTo: userDetailsGlobal.uid).where("isCheckedIn", isEqualTo: false).where("status", whereIn: ["booked", "pending"]).get();
    BookingDetails bookingDetails;
    if (documentReference.docs.isEmpty) {
      return null;
    } else {
      bookingDetails = BookingDetails.fromMap(documentReference.docs.first.data());
      return bookingDetails;
    }
  }

  Future<List> getBookingHistory() async {
    final docref = await db.collection("bookings").where("uid", isEqualTo: userDetailsGlobal.uid).where("status", whereIn: ["cancelled", "completed"]).get();
    List historyList = [];

    print(docref.docs.length);
    for (int i = 0; i < docref.docs.length; i++) {
      historyList.add(BookingDetails.fromMap(docref.docs[i].data()));
    }

    return historyList;
  }
}
