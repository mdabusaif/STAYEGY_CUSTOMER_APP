part of 'loadingbloc_bloc.dart';

abstract class LoadingblocState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingblocInitial extends LoadingblocState {}

class LoadingDataState extends LoadingblocState {
  @override
  List<Object> get props => [];
}

class SearchCompleteState extends LoadingblocState {
  final List<Hotel> loadedHotels;

  SearchCompleteState(this.loadedHotels);

  @override
  List<Object> get props => [loadedHotels];
}
