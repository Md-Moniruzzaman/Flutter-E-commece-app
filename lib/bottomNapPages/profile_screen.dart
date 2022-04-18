import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/widgets/custombutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _genderController;

  updateUserData() {
    CollectionReference _userReference =
        FirebaseFirestore.instance.collection('users');
    return _userReference.doc(FirebaseAuth.instance.currentUser!.email).update({
      'name': _nameController!.text,
      "gender": _genderController!.text,
      'phoneNumber': _phoneController!.text
    }).then((value) => print('Update successful'));
  }

  setsdataToTextField(data) {
    return Column(
      children: [
        TextFormField(
          controller: _nameController =
              TextEditingController(text: data['name']),
        ),
        TextFormField(
          controller: _phoneController =
              TextEditingController(text: data['gender']),
        ),
        TextFormField(
          controller: _genderController =
              TextEditingController(text: data['phoneNumber']),
        ),
        SizedBox(
          height: 10.h,
        ),
        customButton('Update', () => updateUserData())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return setsdataToTextField(data);
            },
          ),
        ),
      ),
    );
  }
}
