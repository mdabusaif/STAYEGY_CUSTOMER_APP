import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingDetails.dart';
import 'package:stayegy/bloc/Repository/Booking/BookingRepository.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelRepositoy.dart';

part 'loadingbloc_event.dart';
part 'loadingbloc_state.dart';

class LoadingBloc extends Bloc<LoadingBlocEvent, LoadingBlocState> {
  final HotelRepository _hotelRepository;
  final BookingRepository _bookingRepository;

  LoadingBloc({@required HotelRepository hotelRepository, @required BookingRepository bookingRepository})
      : assert(hotelRepository != null),
        assert(bookingRepository != null),
        _hotelRepository = hotelRepository,
        _bookingRepository = bookingRepository,
        super(LoadingblocInitial());

  @override
  Stream<LoadingBlocState> mapEventToState(LoadingBlocEvent event) async* {
    if (event is SearchStartEvent) {
      yield* _mapSearchStartEventToState(event, event.cityName);
    } else if (event is SendBookingRequestEvent) {
      yield ProcessingState();

      if (await _bookingRepository.checkIfBookingExists()) {
        yield BookingExistsState();
      } else {
        String bookingId = await _bookingRepository.placeBooking(bookingDetails: event.bookingDetails, hotelID: event.hotelId);
        yield BookingRequestPlacedState(bookingID: bookingId);
      }
    } else if (event is LoadBookStatusEvent) {
      yield ProcessingState();

      BookingDetails bookingDetails = await _bookingRepository.getBookingStatus();
      List historyList = await _bookingRepository.getBookingHistory();

      yield LoadedBookingStatusState(bookingDetails: bookingDetails, historyList: historyList);
    }
  }

  @override
  void onEvent(LoadingBlocEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }

  @override
  Future<void> close() {
    print('Bloc Closed');
    return super.close();
  }

  Stream<LoadingBlocState> _mapSearchStartEventToState(LoadingBlocEvent event, String cityName) async* {
    List<Hotel> _loadedHotels;
    _loadedHotels = null;
    _loadedHotels = await _hotelRepository.getSearchedList(cityName: cityName);
    yield SearchCompleteState(_loadedHotels);
  }
}
