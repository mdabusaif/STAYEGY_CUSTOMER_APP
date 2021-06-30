import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDetails {
  String userName;
  String hotelName;
  Timestamp startDate;
  Timestamp endDate;
  List<int> roomsPrice;
  List<int> roomsDiscountedPrice;
  List<String> selectedRooms;
  int totalPrice;
  int totalDiscountedPrice;
  int promoAmount;
  String userPhoneNumber;
  String hid;
  String uid;
  String status;
  String bid;
  List bookedRooms;
  bool isCheckedIn;

  BookingDetails({
    this.hotelName,
    this.startDate,
    this.endDate,
    this.userName,
    this.hid,
    this.promoAmount,
    this.roomsDiscountedPrice,
    this.roomsPrice,
    this.totalDiscountedPrice,
    this.totalPrice,
    this.userPhoneNumber,
    this.selectedRooms,
    this.uid,
    this.status,
    this.bid,
    this.bookedRooms,
    this.isCheckedIn,
  });

  Map<String, dynamic> toJason() => {
        'hotelName': hotelName,
        'startDate': startDate,
        'endDate': endDate,
        'userName': userName,
        'hid': hid,
        'promoAmount': promoAmount,
        'roomsDiscountedPrice': roomsDiscountedPrice,
        'roomsPrice': roomsPrice,
        'totalDiscountedPrice': totalDiscountedPrice,
        'totalPrice': totalPrice,
        'userPhoneNumber': userPhoneNumber,
        'selectedRooms': selectedRooms,
        'uid': uid,
        'status': status,
        'bid': bid,
        'bookedRooms': bookedRooms,
        'isCheckedIn': isCheckedIn,
      };

  BookingDetails.fromMap(Map<String, dynamic> bookingMap) {
    hotelName = bookingMap["hotelName"];
    startDate = bookingMap["startDate"];
    endDate = bookingMap["endDate"];
    promoAmount = bookingMap["promoAmount"];
    roomsDiscountedPrice = bookingMap["roomsDiscountedPrice"];
    totalDiscountedPrice = bookingMap["totalDiscountedPrice"];
    totalPrice = bookingMap["totalPrice"];
    selectedRooms = bookingMap["selectedRooms"];
    uid = bookingMap["uid"];
    status = bookingMap["status"];
    bid = bookingMap["bid"];
    bookedRooms = bookingMap["bookedRooms"];
    isCheckedIn = bookingMap["isCheckedIn"];
  }
}
