class Hotel {
  String id;
  String hid;
  String name;
  String address;
  Map price;
  Map discountedPrice;
  List facilities;
  List images;

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
    id = hotelMap["id"];
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    address = hotelMap["address"];
    price = hotelMap["price"];
    discountedPrice = hotelMap["discountedPrice"];
    facilities = hotelMap["facilities"];
    images = hotelMap["images"];
  }
}
