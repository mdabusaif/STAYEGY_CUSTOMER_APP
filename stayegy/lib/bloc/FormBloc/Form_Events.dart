import 'package:equatable/equatable.dart';

abstract class FormEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class phoneNumberCheckEvent extends FormEvents {
  final String phoneNumber;

  phoneNumberCheckEvent({this.phoneNumber});
}

class zeroRemovalEvent extends FormEvents {
  final String phoneNumber;

  zeroRemovalEvent({this.phoneNumber});
}
