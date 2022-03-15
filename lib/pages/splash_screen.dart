import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 125, 151),
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
