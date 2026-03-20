import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes_manager/routes/app_route_name.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;

    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteName.layout,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteName.onboarding,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC2C0FF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              FadeInDownBig(
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: 182,
                  height: 218,
                  child: Image.asset("assets/logos/splach_logo.png"),
                ),
              ),
              const SizedBox(height: 5),
              FadeInUpBig(
                duration: const Duration(seconds: 2),
                child: const Text(
                  "iPredict ",
                  style: TextStyle(
                    color: Color(0xff043968),
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
