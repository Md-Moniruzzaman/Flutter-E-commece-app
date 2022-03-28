import 'package:ecommerce_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/appColors.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];

  _selectDateFromPicker() {}

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: _nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your first name.';
        }
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return 'Please enter minimum 3 charecter.';
        }
        // return null;
      },
      onSaved: (value) {
        _nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        labelText: 'Name',
        labelStyle: TextStyle(fontSize: 18.sp),
        // hintText: 'First Name',

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Phone Numberfield
    final phoneNumberField = TextFormField(
      autofocus: true,
      controller: _phoneNumberController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your first name.';
        }
        if (!RegExp(r'^.{11,}$').hasMatch(value)) {
          return 'Please enter minimum 11 digits.';
        }
        // return null;
      },
      onSaved: (value) {
        _nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.contact_phone),
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        labelText: 'Phone Number',
        labelStyle: TextStyle(fontSize: 18.sp),
        // hintText: 'First Name',

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

// dob field
    final dobField = TextFormField(
      controller: _dobController,
      onSaved: (value) {
        _nameController.text = value!;
      },
      readOnly: true,
      decoration: InputDecoration(
        hintText: "date of birth",
        suffixIcon: IconButton(
          onPressed: () => _selectDateFromPicker(),
          icon: Icon(Icons.calendar_today_outlined),
        ),
      ),
    );

    // Gender selection Field
    final genderSelection = TextFormField(
      readOnly: true,
      controller: _genderController,
      onSaved: (value) {
        _nameController.text = value!;
      },
      decoration: InputDecoration(
        hintText: 'Gender',
        suffixIcon: DropdownButton(
          iconSize: 30.h,
          items: gender.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
              onTap: () {
                setState(() {
                  _genderController.text = value;
                });
              },
            );
          }).toList(),
          onChanged: (_) {},
        ),
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        labelText: 'Gender',
        labelStyle: TextStyle(fontSize: 18.sp),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Age field

    final ageField = TextFormField(
      autofocus: true,
      controller: _ageController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your age.';
        }

        return null;
      },
      onSaved: (value) {
        _nameController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        // prefixIcon: const Icon(Icons.),
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        labelText: 'Age',
        labelStyle: TextStyle(fontSize: 18.sp),
        // hintText: 'First Name',

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  "Submit the form to continue.",
                  style:
                      TextStyle(fontSize: 22.sp, color: AppColors.deepOrange),
                ),
                Text(
                  "We will not share your information with anyone.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFFBBBBBB),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                nameField,
                SizedBox(
                  height: 10.h,
                ),
                phoneNumberField,
                SizedBox(
                  height: 10.h,
                ),
                genderSelection,
                SizedBox(
                  height: 10.h,
                ),
                ageField,
                SizedBox(
                  height: 36.h,
                ),
                customButton("Submit", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
