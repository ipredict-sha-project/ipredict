import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes_manager/routes/app_route_name.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC2C0FF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              FadeInDownBig(
                duration: Duration(seconds: 1),
                child: Container(
                  width: 182,
                  height: 218,
                  child: Image.asset("assets/logos/splach_logo.png"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FadeInUpBig(
                duration: Duration(seconds: 2),
                onFinish: (direction) {
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pushReplacementNamed(
                        context, AppRouteName.layout);
                  } else {
                    Navigator.pushReplacementNamed(
                        context, AppRouteName.onboarding);
                  }
                },
                child: Text(
                  "I Predict ",
                  style: TextStyle(
                      color: Color(0xff043968),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
