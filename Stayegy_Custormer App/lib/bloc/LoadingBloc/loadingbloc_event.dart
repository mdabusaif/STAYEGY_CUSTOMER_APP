part of 'loadingbloc_bloc.dart';

abstract class LoadingblocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchStartEvent extends LoadingblocEvent {}
