import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constant/appColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('cart_item_product')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection('items')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something is wrong!'));
              }
              // if (snapshot == null) {
              //   return const Center(child: CircularProgressIndicator());
              // }
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];
                    return Card(
                      elevation: 1,
                      child: ListTile(
                        leading: Text(
                          _documentSnapshot['products_name'],
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.deepOrange),
                        ),
                        title: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // FirebaseFirestore.instance
                                //     .collection('cart_item_product')
                                //     .doc(FirebaseAuth
                                //         .instance.currentUser!.email)
                                //     .collection('items')
                                //     .doc(_documentSnapshot.id)
                                //     .add();
                              },
                              child: Icon(
                                Icons.add_circle,
                                size: 28.sp,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('cart_item_product')
                                    .doc(FirebaseAuth
                                        .instance.currentUser!.email)
                                    .collection('items')
                                    .doc(_documentSnapshot.id)
                                    .delete();
                              },
                              child: Icon(
                                Icons.remove_circle,
                                size: 28.sp,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          'BDT ${_documentSnapshot['products_price']}/=',
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.deepOrange),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
