class BookingDetails {
  String userName;
  String hotelName;
  Map<String, DateTime> dateRange;
  List<int> roomsPrice;
  List<int> roomsDiscountedPrice;
  List<String> selectedRooms;
  int totalPrice;
  int totalDiscountedPrice;
  int promoAmount;
  String userPhoneNumber;
  String hid;

  BookingDetails({
    this.hotelName,
    this.dateRange,
    this.userName,
    this.hid,
    this.promoAmount,
    this.roomsDiscountedPrice,
    this.roomsPrice,
    this.totalDiscountedPrice,
    this.totalPrice,
    this.userPhoneNumber,
    this.selectedRooms,
  });

  Map<String, dynamic> toJason() => {
        'hotelName': hotelName,
        'dateRange': dateRange,
        'userName': userName,
        'hid': hid,
        'promoAmount': promoAmount,
        'roomsDiscountedPrice': roomsDiscountedPrice,
        'roomsPrice': roomsPrice,
        'totalDiscountedPrice': totalDiscountedPrice,
        'totalPrice': totalPrice,
        'userPhoneNumber': userPhoneNumber,
        'selectedRooms': selectedRooms,
      };

  BookingDetails.fromMap(Map<String, dynamic> bookingMap) {
    hotelName = bookingMap["hotelName"];
    dateRange = bookingMap["hotelName"];
    promoAmount = bookingMap["hotelName"];
    roomsDiscountedPrice = bookingMap[""];
    totalDiscountedPrice = bookingMap["hotelName"];
    totalPrice = bookingMap["hotelName"];
    selectedRooms = bookingMap["selectedRooms"];
  }
}
