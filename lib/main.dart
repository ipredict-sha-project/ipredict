import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/features/auth/presentation/screens/login_screen.dart';
import 'package:ipredict/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:ipredict/features/splach/presentation/screens/splach_screen.dart';
import 'package:provider/provider.dart';

import 'core/manager/app_provider.dart';
import 'core/routes_manager/routes/route_gen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return MaterialApp(
      onGenerateRoute: RouteGen.onGenerateRoute,
      home: Splashscreen(),

    );
  }
}
