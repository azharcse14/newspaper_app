import 'package:flutter/material.dart';

class DateFliterUtility {
  static final ValueNotifier<DateTime> index = ValueNotifier(DateTime.now());
}

class TimeFliterUtility {
  static final ValueNotifier<String> index = ValueNotifier('');
}

class WorkmanshipRatingUtility {
  static final ValueNotifier<double> index = ValueNotifier(0);
}

class CleanlinessRatingUtility {
  static final ValueNotifier<double> index = ValueNotifier(0);
}

class OnTimeRatingUtility {
  static final ValueNotifier<double> index = ValueNotifier(0);
}

class ValueForMoneyRatingUtility {
  static final ValueNotifier<double> index = ValueNotifier(0);
}
