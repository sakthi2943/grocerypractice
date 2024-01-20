import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocerypractice/data/grocery_data.dart';
import 'package:grocerypractice/features/home/models/home_product_dataModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
  }
  // Navigate Part

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.productList
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imgurl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('WishListPage Button Clicked');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('CartPage Button Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  // Add Part

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Add to Cart Button');
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      event, Emitter<HomeState> emit) {
    print('Add to WishList Button');
  }
}
