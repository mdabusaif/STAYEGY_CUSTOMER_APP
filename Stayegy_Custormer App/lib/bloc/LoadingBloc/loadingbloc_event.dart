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
  final NotificationDetails notification;

  SendBookingRequestEvent({@required this.bookingDetails, @required this.hotelId, @required this.notification});

  @override
  List<Object> get props => [bookingDetails, hotelId, notification];
}

class LoadBookStatusEvent extends LoadingBlocEvent {}

class LoadNotificationEvent extends LoadingBlocEvent {}

class DeleteSeenNotificationsEvent extends LoadingBlocEvent {
  final List notificatons;

  DeleteSeenNotificationsEvent({@required this.notificatons});

  @override
  List<Object> get props => [notificatons];
}
