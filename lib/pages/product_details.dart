import 'package:ecommerce_app/constant/appColors.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.deepOrange,
            size: 31,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: AppColors.deepOrange,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
