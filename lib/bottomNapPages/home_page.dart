import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(fillColor: Colors.red),
            )
          ],
        ),
      )),
    );
  }
}
