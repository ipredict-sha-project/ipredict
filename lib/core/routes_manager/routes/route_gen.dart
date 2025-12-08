
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/features/auth/presentation/screens/forget_password.dart';
import 'package:ipredict/features/auth/presentation/screens/register_screen.dart';
import 'package:ipredict/features/layout/presentation/screens/layout_screen.dart';
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
      // case AppRouteName.event_details:
      //   {
      //     var event = settings.arguments as EventModel;
      //     return MaterialPageRoute(
      //       builder: (_) => EventDetails(eventModel: event),
      //     );
      //   }
      // case AppRouteName.addEvent:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return AddEventScreen();
      //     },
      //   );
      // case AppRouteName.editEvent:
      //   {
      //     var event = settings.arguments as EventModel;
      //     return MaterialPageRoute(
      //       builder: (_) => EditEvent(eventModel: event),
      //     );
      //   }

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
