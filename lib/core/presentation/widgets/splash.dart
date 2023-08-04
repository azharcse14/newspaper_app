import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Center(child: Image.asset('assets/images/logo.png')),
        ),
      ),
    );
  }
}
