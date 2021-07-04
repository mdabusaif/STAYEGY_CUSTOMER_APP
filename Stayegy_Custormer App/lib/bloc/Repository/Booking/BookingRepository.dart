import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:random_string/random_string.dart';

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
}
