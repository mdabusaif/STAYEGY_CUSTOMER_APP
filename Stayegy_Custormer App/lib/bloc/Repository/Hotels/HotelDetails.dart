class Hotel {
  String hid;
  String name;
  String address;
  int price;
  int discountedPrice;
  List facilities;
  Map images;

  Hotel({
    this.hid,
    this.name,
    this.address,
    this.price,
    this.discountedPrice,
    this.facilities,
    this.images,
  });

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'address': address,
        'price': price,
        'discountedPrice': discountedPrice,
        'facilities': facilities,
        'images': images,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    address = hotelMap["address"];
    price = hotelMap["price"];
    discountedPrice = hotelMap["discountedPrice"];
    facilities = hotelMap["facilities"];
    images = hotelMap["images"];
  }
}
