part of 'loadingbloc_bloc.dart';

abstract class LoadingBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchStartEvent extends LoadingBlocEvent {
  final String cityName;

  SearchStartEvent({@required this.cityName});

  @override
  List<Object> get props => [cityName];
}

class SendBookingRequestEvent extends LoadingBlocEvent {
  final BookingDetails bookingDetails;
  final String hotelId;

  SendBookingRequestEvent({@required this.bookingDetails, @required this.hotelId});

  @override
  List<Object> get props => [bookingDetails, hotelId];
}

class LoadBookStatusEvent extends LoadingBlocEvent {}

class LoadNotificationEvent extends LoadingBlocEvent {}
