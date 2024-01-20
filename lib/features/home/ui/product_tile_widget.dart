import 'package:flutter/material.dart';
import 'package:grocerypractice/features/home/models/home_product_dataModel.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imgurl)),
              )),
          Text(productDataModel.name),
          Text(productDataModel.description),
        ]));
  }
}
