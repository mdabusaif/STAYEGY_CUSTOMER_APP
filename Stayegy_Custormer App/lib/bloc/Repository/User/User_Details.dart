class UserDetails {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String gender;
  String picURL;

  void valueSetter({String name, String email, String phoneNumber, String gender, String picUrl}) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.gender = gender;
    this.picURL = picUrl;
  }

  UserDetails({this.name = "", this.phoneNumber = "", this.gender = "", this.picURL = "", this.email = ""});

  Map<String, dynamic> toJason() => {
        'uid': uid,
        'name': name,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'avatarPicURL': picURL,
        'email': email,
      };

  UserDetails.fromMap(Map<String, dynamic> userDetails) {
    uid = userDetails["uid"];
    name = userDetails["name"];
    phoneNumber = userDetails["phoneNumber"];
    gender = userDetails["gender"];
    picURL = userDetails["avatarPicURL"];
    email = userDetails["email"];
  }
}
