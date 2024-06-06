import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/view/home_view/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter MVVM with Riverpod',
         navigatorKey: navigatorKey,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff17181f)),
        home: const HomeView(),
      ),
    );
  }
}
