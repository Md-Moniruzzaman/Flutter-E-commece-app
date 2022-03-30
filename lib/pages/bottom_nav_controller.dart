import 'package:ecommerce_app/constant/appColors.dart';
import 'package:flutter/material.dart';

import '../bottomNapPages/cart_screen.dart';
import '../bottomNapPages/favorite_screen.dart';
import '../bottomNapPages/home_page.dart';
import '../bottomNapPages/profile_screen.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  var _currrentIndex = 0;

  final _pages = [
    Home(),
    Favorite(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('E-Commerce', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currrentIndex,
        elevation: 5,
        selectedItemColor: AppColors.deepOrange,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(color: AppColors.deepOrange, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: ('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currrentIndex = index;
            print(_currrentIndex);
          });
        },
      ),
      body: _pages[_currrentIndex],
    );
  }
}
