import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet_bloc/internet_bloc.dart';
import '../widgets/no_internet.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/bg-opac.png',
                    scale: 1.1,
                  ),
                ),
                state is NotConnected ? const NoInternet() : child,
              ],
            );
          },
        ),
      ),
    );
  }
}
