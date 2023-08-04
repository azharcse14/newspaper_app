import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class NothingFound extends StatelessWidget {
  const NothingFound({
    Key? key,
    this.isSmall = false,
  }) : super(key: key);

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: isSmall ? 100 : MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/images/no-item.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'No item found',
            style: TextStyle(fontFamily: AppConstants.fontFamily, fontSize: isSmall ? 16  : 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
