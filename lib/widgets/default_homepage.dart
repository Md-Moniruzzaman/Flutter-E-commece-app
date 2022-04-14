import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../constant/appColors.dart';

class DefaultHomeScreen extends StatefulWidget {
  const DefaultHomeScreen({Key? key}) : super(key: key);

  // DefaultHomeScreen({carouselImages, dotposition, productslist});

  @override
  State<DefaultHomeScreen> createState() => _DefaultHomeScreenState();
}

class _DefaultHomeScreenState extends State<DefaultHomeScreen> {
  final List productslist = [];
  final List<String> carouselImages = [];

  var dotposition = 0;
  fetchCarouselImg() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection('carousel_slider').get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        carouselImages.add(qn.docs[i]['img_path']);
        // print(qn.docs[i]['img_path']);
      }
      // return qn.docs;
    });
  }

  // Fetching Products from firebase
  fetchProducs() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection('products').get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        productslist.add({
          "products_name": qn.docs[i]['products_name'],
          "products_description": qn.docs[i]['products_description'],
          "products_price": qn.docs[i]['products_price'],
          "products_img": qn.docs[i]['products_img'],
        });
        // print(qn.docs[i]['img_path']);
      }
      // return qn.docs;
    });
  }

  @override
  void initState() {
    fetchCarouselImg();
    fetchProducs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2.5,
          child: CarouselSlider(
            items: carouselImages
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(7),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item), fit: BoxFit.fitWidth)),
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
        DotsIndicator(
          dotsCount: carouselImages.isEmpty ? 1 : carouselImages.length,
          position: dotposition.toDouble(),
          decorator: const DotsDecorator(
              activeColor: AppColors.deepOrange,
              color: Colors.grey,
              size: Size(10, 10),
              activeSize: Size(12, 12)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                    color: AppColors.deepOrange,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View All >',
                    style: TextStyle(
                      color: AppColors.deepOrange,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: GridView.builder(
            itemCount: productslist.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: Column(children: [
                        Image.network(productslist[index]['products_img'][0],
                            fit: BoxFit.cover),
                        Text('Price: ${productslist[index]['products_name']}'),
                        Text('Price: ${productslist[index]['products_price']}'),
                      ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                    color: AppColors.deepOrange,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View All >',
                    style: TextStyle(
                      color: AppColors.deepOrange,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: GridView.builder(
            itemCount: productslist.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: AspectRatio(
                      aspectRatio: 3.5,
                      child: Column(children: [
                        Image.network(productslist[index]['products_img'][0],
                            fit: BoxFit.cover),
                        Text('Price: ${productslist[index]['products_name']}'),
                        Text('Price: ${productslist[index]['products_price']}'),
                      ]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
