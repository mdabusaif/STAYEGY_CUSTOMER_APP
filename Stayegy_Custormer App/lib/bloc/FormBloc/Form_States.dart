import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FormStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends FormStates {}

class PhoneNumberCheckedState extends FormStates {}

class PhoneNumberNotCheckedState extends FormStates {}

class NameFieldValidState extends FormStates {}

class NameFieldEmptyState extends FormStates {}

class EmailFieldValidState extends FormStates {}

class EmailFieldNotValidState extends FormStates {}

class EmailFieldEmptyState extends FormStates {}

class RegFormCanBeSubmittedState extends FormStates {}

class ImagePickedState extends FormStates {
  final pickedFile;

  ImagePickedState({@required this.pickedFile});

  @override
  List<Object> get props => [pickedFile];
}

class ImagePickedFailedState extends FormStates {}
