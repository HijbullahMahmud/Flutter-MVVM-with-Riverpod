// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import '../view/home_view/home_view.dart';
import 'constant.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showDialogFlash({String title = '', String? content = ''}) {
  navigatorKey.currentContext!.showFlash(
      builder: (BuildContext context, FlashController controller) {
    return FadeTransition(
      opacity: controller.controller,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(),
        ),
        contentPadding: const EdgeInsets.only(
            left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        content: Text(content!, style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: controller.dismiss,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: controller.dismiss,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  });
}

void checkInternetConnectivity(WidgetRef ref) {
  final connectivity = Connectivity();
  connectivity.onConnectivityChanged.listen((event) {
    switch (event) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        ref.invalidate(homeViewFutureProvider);
        break;
      case ConnectivityResult.none:
        showDialogFlash(title: noConnection, content: noConnectionMessage);
        break;
      default:
        ConnectivityResult.mobile;
    }
  });
}

final internetNotifier = Provider((ref) => Connectivity());
