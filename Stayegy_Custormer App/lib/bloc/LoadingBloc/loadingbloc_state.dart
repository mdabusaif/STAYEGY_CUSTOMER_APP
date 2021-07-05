part of 'loadingbloc_bloc.dart';

abstract class LoadingBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingblocInitial extends LoadingBlocState {}

class LoadingDataState extends LoadingBlocState {
  @override
  List<Object> get props => [];
}

class SearchCompleteState extends LoadingBlocState {
  final List<Hotel> loadedHotels;

  SearchCompleteState(this.loadedHotels);

  @override
  List<Object> get props => [loadedHotels];
}

class ProcessingState extends LoadingBlocState {
  @override
  List<Object> get props => [];
}

class BookingRequestPlacedState extends LoadingBlocState {
  final String bookingID;

  BookingRequestPlacedState({this.bookingID});

  @override
  List<Object> get props => [bookingID];
}

class BookingExistsState extends LoadingBlocState {}

class LoadedBookingStatusState extends LoadingBlocState {
  final List historyList;
  final BookingDetails bookingDetails;

  LoadedBookingStatusState({@required this.bookingDetails, @required this.historyList});

  @override
  List<Object> get props => [historyList, bookingDetails];
}
