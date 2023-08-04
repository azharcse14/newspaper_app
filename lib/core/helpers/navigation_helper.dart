import 'package:flutter/material.dart';

class Nav {
  static push(context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  static pushAndRemoveUntil(context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
      (route) => false,
    );
  }

  static pop(context) {
    Navigator.of(context).pop();
  }

  static pushAndRemoveUntilWithRootNavigator(context, Widget screen) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
      (route) => false,
    );
  }
}
