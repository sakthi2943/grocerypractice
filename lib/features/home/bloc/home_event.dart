part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductWishListButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}
