import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/colors.dart';
import 'navigation_helper.dart';

enum FeedbackType { info, success, error, alert }

class FeedBackHelper {
  static void showSnackBar({
    required BuildContext context,
    required String title,
    FeedbackType type = FeedbackType.info,
  }) {
    showFlash(
      context: context,
      duration: Duration(
          milliseconds:
              type == FeedbackType.error || type == FeedbackType.success
                  ? 3000
                  : 1000),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          backgroundColor: type == FeedbackType.success
              ? kGreenColor
              : type == FeedbackType.error || type == FeedbackType.alert
                  ? kAccentColor
                  : kWhiteColor,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              title,
              style: TextStyle(
                fontFamily: AppConstants.fontFamily,
                color: type == FeedbackType.success
                    ? kWhiteColor
                    : type == FeedbackType.error || type == FeedbackType.alert
                        ? kWhiteColor
                        : kBlackColor,
              ),
            ),
          ),
        );
      },
    );
  }

  static void showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Nav.pop(context);
                },
              ),
            ],
          );
        });
  }
}
