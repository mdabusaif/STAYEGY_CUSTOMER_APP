import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';

class BookingRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> placeBooking({BookingDetails bookingDetails}) async {
    final documentReference = await db.collection("users").get();
  }
}
