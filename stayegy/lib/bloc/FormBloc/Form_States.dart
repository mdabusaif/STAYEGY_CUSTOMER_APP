import 'package:equatable/equatable.dart';

abstract class FormStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends FormStates {}

class phoneNumberCheckedState extends FormStates {}

class phoneNumberNotCheckedState extends FormStates {}

class zeroCheckedState extends FormStates {
  String phoneNumber;

  zeroCheckedState(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
