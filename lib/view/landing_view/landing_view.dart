import 'package:flutter/material.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../storage/storage.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';
import '../home_view/home_view.dart';
import 'landing_view_model.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final storage = ref.read(storageProvider);
      return Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('images/img1.png', height: 200),
              const SizedBox(height: 50),
              const Text('Weather forcast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 8),
              const Text('Discover the weather in your city.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                  )),
              const Spacer(),
              CustomButton(
                onPressed: () async {
                  return ref
                      .read(landingViewProvider.notifier)
                      .getUserLocation()
                      .then((value) {
                    if (value) {
                      storage.savePageValue(value);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HomeView()));
                    }
                  });
                },
                color: const Color(0xff4eda83),
                width: double.infinity,
                radius: 80,
                text: 'Get Started',
                child: ButtonLoader(
                    isLoading: ref.watch(landingViewProvider),
                    text: 'Get Started'),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
