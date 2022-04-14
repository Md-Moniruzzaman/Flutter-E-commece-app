import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/constant/appColors.dart';
import 'package:ecommerce_app/widgets/default_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _carouselImages = [];
  final List _productslist = [];
  var _dotposition = 0;
  var inputText = '';

  // fetchCarouselImg() async {
  //   QuerySnapshot qn =
  //       await FirebaseFirestore.instance.collection('carousel_slider').get();
  //   setState(() {
  //     for (int i = 0; i < qn.docs.length; i++) {
  //       _carouselImages.add(qn.docs[i]['img_path']);
  //       // print(qn.docs[i]['img_path']);
  //     }
  //     // return qn.docs;
  //   });
  // }

  // // Fetching Products from firebase
  // fetchProducs() async {
  //   QuerySnapshot qn =
  //       await FirebaseFirestore.instance.collection('products').get();
  //   setState(() {
  //     for (int i = 0; i < qn.docs.length; i++) {
  //       _productslist.add({
  //         "products_name": qn.docs[i]['products_name'],
  //         "products_description": qn.docs[i]['products_description'],
  //         "products_price": qn.docs[i]['products_price'],
  //         "products_img": qn.docs[i]['products_img'],
  //       });
  //       // print(qn.docs[i]['img_path']);
  //     }
  //     // return qn.docs;
  //   });
  // }

  // @override
  // void initState() {
  //   fetchCarouselImg();
  //   fetchProducs();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            fillColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: 'Search here...',
                          ),
                          onChanged: (val) {
                            setState(() {
                              inputText = val;
                              print(inputText);
                            });
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        color: AppColors.deepOrange,
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              DefaultHomeScreen()
              // AspectRatio(
              //   aspectRatio: 2.5,
              //   child: CarouselSlider(
              //     items: _carouselImages
              //         .map(
              //           (item) => Padding(
              //             padding: const EdgeInsets.all(7),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: NetworkImage(item),
              //                       fit: BoxFit.fitWidth)),
              //             ),
              //           ),
              //         )
              //         .toList(),
              //     options: CarouselOptions(
              //         autoPlay: false,
              //         viewportFraction: 0.8,
              //         enlargeCenterPage: true,
              //         enlargeStrategy: CenterPageEnlargeStrategy.height,
              //         onPageChanged: (val, carouselPageChangeReason) {
              //           setState(() {
              //             _dotposition = val;
              //           });
              //         }),
              //   ),
              // ),
              // DotsIndicator(
              //   dotsCount: _carouselImages.isEmpty ? 1 : _carouselImages.length,
              //   position: _dotposition.toDouble(),
              //   decorator: const DotsDecorator(
              //       activeColor: AppColors.deepOrange,
              //       color: Colors.grey,
              //       size: Size(10, 10),
              //       activeSize: Size(12, 12)),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 20,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const Text(
              //           'Products',
              //           style: TextStyle(
              //             color: AppColors.deepOrange,
              //             fontSize: 18,
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap: () {},
              //           child: const Text(
              //             'View All >',
              //             style: TextStyle(
              //               color: AppColors.deepOrange,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 180,
              //   child: GridView.builder(
              //     itemCount: _productslist.length,
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 1, childAspectRatio: 1),
              //     itemBuilder: (_, index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 5.0),
              //           child: Card(
              //             elevation: 3,
              //             color: Colors.white,
              //             child: AspectRatio(
              //               aspectRatio: 1.5,
              //               child: Column(children: [
              //                 Image.network(
              //                     _productslist[index]['products_img'][0],
              //                     fit: BoxFit.cover),
              //                 Text(
              //                     'Price: ${_productslist[index]['products_name']}'),
              //                 Text(
              //                     'Price: ${_productslist[index]['products_price']}'),
              //               ]),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 20,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const Text(
              //           'Products',
              //           style: TextStyle(
              //             color: AppColors.deepOrange,
              //             fontSize: 18,
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap: () {},
              //           child: const Text(
              //             'View All >',
              //             style: TextStyle(
              //               color: AppColors.deepOrange,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 180,
              //   child: GridView.builder(
              //     itemCount: _productslist.length,
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 1, childAspectRatio: 1),
              //     itemBuilder: (_, index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 5.0),
              //           child: Card(
              //             elevation: 3,
              //             color: Colors.white,
              //             child: AspectRatio(
              //               aspectRatio: 3.5,
              //               child: Column(children: [
              //                 Image.network(
              //                     _productslist[index]['products_img'][0],
              //                     fit: BoxFit.cover),
              //                 Text(
              //                     'Price: ${_productslist[index]['products_name']}'),
              //                 Text(
              //                     'Price: ${_productslist[index]['products_price']}'),
              //               ]),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
