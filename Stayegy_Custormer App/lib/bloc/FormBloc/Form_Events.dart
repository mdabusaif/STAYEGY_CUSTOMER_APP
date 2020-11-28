import 'package:equatable/equatable.dart';

abstract class FormEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneNumberCheckEvent extends FormEvents {
  final String phoneNumber;

  PhoneNumberCheckEvent({this.phoneNumber});
}

class NameAndEmailValidationCheckEvent extends FormEvents {
  final String email;
  final String name;

  NameAndEmailValidationCheckEvent({this.name, this.email});
}

class GetImageEvent extends FormEvents {}
