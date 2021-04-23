import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelRepositoy.dart';

part 'loadingbloc_event.dart';
part 'loadingbloc_state.dart';

class LoadingblocBloc extends Bloc<LoadingblocEvent, LoadingblocState> {
  final HotelRepository _hotelRepository;

  LoadingblocBloc({@required HotelRepository hotelRepository})
      : assert(hotelRepository != null),
        _hotelRepository = hotelRepository,
        super(LoadingblocInitial());

  @override
  Stream<LoadingblocState> mapEventToState(LoadingblocEvent event) async* {
    if (event is SearchStartEvent) {
      yield* _mapSearchStartEventToState(event, event.cityName);
    }
  }

  @override
  void onEvent(LoadingblocEvent event) {
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

  Stream<LoadingblocState> _mapSearchStartEventToState(
      LoadingblocEvent event, String cityName) async* {
    List<Hotel> _loadedHotels;
    _loadedHotels = null;
    _loadedHotels = await _hotelRepository.getSearchedList(cityName: cityName);
    yield SearchCompleteState(_loadedHotels);
  }
}
