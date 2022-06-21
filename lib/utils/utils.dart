import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:food/export.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Utilities {
  Utilities._();

  static Future<void> showMessage(
      {String? title, required String message}) async {
    Get.snackbar(title ?? "", message,
        isDismissible: true,
        animationDuration: const Duration(milliseconds: 500),
        backgroundGradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xff172B4D), Color(0xff18163C)]),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 23, right: 23),
        titleText: title != null
            ? TitleText(
                text: title,
                color: ColorsCustom.black,
                textAlign: TextAlign.start,
                fontSize: 16)
            : const SizedBox(),
        messageText: TitleText(
            text: message,
            textAlign: TextAlign.start,
            fontSize: 13,
            color: ColorsCustom.black),
        forwardAnimationCurve: Curves.easeOut,
        reverseAnimationCurve: Curves.easeOut,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 16);
    await Future.delayed(const Duration(seconds: 3));
  }

  static void showCustomDialog(
    BuildContext context, {
    required Widget child,
  }) =>
      showGeneralDialog(
          context: context,
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) => child,
          transitionBuilder: (_, anim, __, child) {
            Tween<Offset> tween;
            if (anim.status == AnimationStatus.reverse) {
              tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
            } else {
              tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
            }

            return SlideTransition(
                position: tween.animate(anim),
                child: FadeTransition(opacity: anim, child: child));
          });

  static noConnection() =>
      showMessage(title: "Error", message: "No internet connection");

  static debugPrintCustom(dynamic value) => debugPrint(value.toString());

  static bool isPhone() {
    try {
      return Platform.isIOS || Platform.isAndroid;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkIsConnectEstablish() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }

  static Future<void> initApp() async {
    await GetStorage.init();
    Get.put(HomeController());
  }
}

extension StringExtension on String? {
  bool isNotNullOrEmpty() => this != null && this!.isNotEmpty;

  String capitalizeFirst() => "${this![0].toUpperCase()}${this!.substring(1)}";
}
