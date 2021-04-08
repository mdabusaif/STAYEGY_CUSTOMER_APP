class Hotel {
  String hid;
  String name;
  String address;
  String price;
  Map images;

  Hotel({
    this.hid,
    this.name,
    this.address,
    this.price,
    this.images,
  });

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'address': address,
        'price': price,
        'images': images,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    address = hotelMap["address"];
    price = hotelMap["price"];
    images = hotelMap["images"];
  }
}
