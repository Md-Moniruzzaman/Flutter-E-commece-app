import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/constant/appColors.dart';
import 'package:ecommerce_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  final _product;
  ProductDetails(this._product);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var dotposition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.deepOrange,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
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
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 2.5,
                    child: CarouselSlider(
                      items: widget._product['products_img']
                          .map<Widget>(
                            (item) => Padding(
                              padding: const EdgeInsets.all(7),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(item),
                                        fit: BoxFit.fitWidth)),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: false,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, carouselPageChangeReason) {
                            setState(() {
                              dotposition = val;
                            });
                          }),
                    ),
                  ),
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount:
                        widget._product.isEmpty ? 1 : widget._product.length,
                    position: dotposition.toDouble(),
                    decorator: const DotsDecorator(
                        activeColor: AppColors.deepOrange,
                        color: Colors.grey,
                        size: Size(10, 10),
                        activeSize: Size(12, 12)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Product Name: ${widget._product["products_name"]}',
                  style: TextStyle(fontSize: 18, color: AppColors.deepOrange),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Product Price: ${widget._product["products_price"]}',
                  style: TextStyle(fontSize: 18, color: AppColors.deepOrange),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Product Description: ${widget._product["products_description"]}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: customButton('Add To Card', () => null),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
