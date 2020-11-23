class UserDetails {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String avatarPicURL;

  UserDetails(
      {this.name = "",
      this.phoneNumber = "",
      this.gender = "",
      this.avatarPicURL = "",
      this.email = ""});

  Map<String, dynamic> toJason() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'avatarPicURL': avatarPicURL,
        'email': email,
      };
}
