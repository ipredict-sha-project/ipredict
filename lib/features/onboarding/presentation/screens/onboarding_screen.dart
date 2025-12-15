import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/core/routes_manager/routes/app_route_name.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/manager/app_provider.dart';
import '../../../../core/theme/app_color.dart';
import '../../data/models/onboarding_model.dart';
import '../../theme/theme.dart';


class OnboardingScreen extends StatefulWidget {
  static const String route = 'onboarding_screen';

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  int currentindex = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      controller: pageController,
                      children: [
                        OnboardingModel(
                          image: 'assets/images/onboarding1.png',
                          title: 'Predict Machine \n Failures Early',
                          subtitle: 'Anticipate and address\nmachine issues before they\nlead to downtime',
                        ),
                        OnboardingModel(
                          image: 'assets/images/onboarding2.png',
                          title: 'Monitor Performance \n in Real Time',
                          subtitle: 'Keep track of machine\nconditions and operational\nstatus',
                        ),
                        OnboardingModel(
                          image: 'assets/images/onboarding3.png',
                          title: 'Reduce Downtime \n & Save Costs',
                          subtitle: 'Minimize equipment failures\nand optimize maintenance\nbudgets',
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: currentindex,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        activeDotColor: AppColor.blue,
                        dotHeight: 15,
                        dotWidth: 15,
                      ),
                    ),
                    SizedBox(height: 20,),
                    CupertinoButton(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.blue,
                      onPressed: () async {
                        if (currentindex == 2) {
                          SharedPreferences shared =
                          await SharedPreferences.getInstance();
                          shared.setBool(CashingKeys.showOnboarding, false);
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRouteName.login, (_) => false);
                        } else {
                          nextPage();
                        }
                      },
                        child: AnimatedCrossFade(firstChild: CupertinoActivityIndicator(
                          color: AppColor.white,
                        ), secondChild: Center(
                          child: Text(
                            currentindex == 2 ? 'Get Started' : 'Next',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ), crossFadeState: isLoading? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 300))
                    ),
                    SizedBox(height: 20,),
                    Visibility(
                      visible: currentindex != 0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColor.gray,
                          onPressed: () {
                            prevPage();
                          },
                          child: AnimatedCrossFade(firstChild: CupertinoActivityIndicator(
                            color: AppColor.white,
                          ), secondChild: Center(
                            child:  Text(
                              'Back',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ), crossFadeState: isLoading? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 300))
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void nextPage() {
    if (pageController.page?.toInt() == 4) {
      return;
    }
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void prevPage() {
    if (pageController.page?.toInt() == 0) {
      return;
    }
    pageController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
