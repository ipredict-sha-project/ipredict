
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/features/auth/presentation/screens/forget_password.dart';
import 'package:ipredict/features/auth/presentation/screens/register_screen.dart';
import 'package:ipredict/features/layout/presentation/screens/layout_screen.dart';
import 'package:ipredict/features/layout/presentation/tabs/alerts-tab/screens/alerts_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/devices-tab/screens/devices_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/home-tab/screens/home_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/sensors-tab/screens/sensors_details.dart';
import 'package:ipredict/features/layout/presentation/tabs/sensors-tab/screens/sensors_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/settings-tab/screens/settings_tab.dart';
import 'package:ipredict/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:ipredict/features/splach/presentation/screens/splach_screen.dart';

import '../../../features/auth/presentation/screens/login_screen.dart';
import 'app_route_name.dart';

class RouteGen {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splach:
        return MaterialPageRoute(
          builder: (context) {
            return Splashscreen();
          },
        );
      case AppRouteName.onboarding:
        return PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (context, animation, secondaryAnimation) {
            return OnboardingScreen();
          },
        );
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );
      case AppRouteName.register:
        return MaterialPageRoute(
          builder: (context) {
            return RegisterScreen();
          },
        );
      case AppRouteName.forgetpassword:
        return MaterialPageRoute(
          builder: (context) {
            return ForgetPasswordScreen();
          },
        );
      case AppRouteName.layout:
        return MaterialPageRoute(
          builder: (context) {
            return LayoutScreen();
          },
        );
        case AppRouteName.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeTab();
          },
        );
        case AppRouteName.sensor:
        return MaterialPageRoute(
          builder: (context) {
            return SensorsTab();
          },
        );
        case AppRouteName.device:
        return MaterialPageRoute(
          builder: (context) {
            return DevicesTab();
          },
        );
        case AppRouteName.alerts:
        return MaterialPageRoute(
          builder: (context) {
            return AlertsTab();
          },
        );
        case AppRouteName.setting:
        return MaterialPageRoute(
          builder: (context) {
            return SettingsTab();
          },
        );
        case AppRouteName.sensor_details:
        return MaterialPageRoute(
          builder: (context) {
            return SensorsDetails();
          },
        );


      default:
        return MaterialPageRoute(
          builder: (context) {
            return NotFoundScreen();
          },
        );
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
