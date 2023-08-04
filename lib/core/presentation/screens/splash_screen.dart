import 'package:flutter/material.dart';

import '../widgets/splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1000)),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Splash();
        } else {
          return const SizedBox();
           // String token = injector<SharedPreferencesUtils>().getToken()??'';
           // print("my token =>$token");

        }
      }),
    );
  }
}
