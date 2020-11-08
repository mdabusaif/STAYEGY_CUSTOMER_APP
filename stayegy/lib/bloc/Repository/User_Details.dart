import 'dart:html';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final Url avatarPicURL;

  UserDetails(
      {this.name,
      this.phoneNumber,
      this.gender,
      this.avatarPicURL,
      this.email});

  @override
  List<Object> get props =>
      [this.name, this.phoneNumber, this.gender, this.avatarPicURL, this.email];
}
