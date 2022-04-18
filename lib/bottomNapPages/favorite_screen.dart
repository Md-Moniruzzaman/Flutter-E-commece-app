import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _genderController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
            ),
            TextFormField(
              controller: _phoneController,
            ),
            TextFormField(
              controller: _genderController,
            ),
          ],
        ),
      ),
    );
  }
}
