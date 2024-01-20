import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerypractice/features/cart/ui/cart.dart';
import 'package:grocerypractice/features/home/bloc/home_bloc.dart';
import 'package:grocerypractice/features/home/ui/product_tile_widget.dart';
import 'package:grocerypractice/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialFetchEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishList()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final SuccessState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: const Text(
                      'Grocery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            homeBloc
                                .add(HomeProductWishListButtonNavigateEvent());
                          },
                          icon: const Icon(Icons.favorite_border_outlined)),
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeProductCartButtonNavigateEvent());
                          },
                          icon: const Icon(Icons.shopping_cart_outlined)),
                    ]),
                body: ListView.builder(
                    itemCount: SuccessState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          productDataModel: SuccessState.products[index]);
                    }));
          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text('Error')),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
