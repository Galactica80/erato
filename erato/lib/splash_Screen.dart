import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
  decoration: BoxDecoration(
    image: DecorationImage(
      image:  AssetImage('assets/splashscreen.png'),
      fit: BoxFit.cover,

    ),
  ),
);
  }
}