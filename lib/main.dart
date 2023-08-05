import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/firebase_options.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/screens/auth/providers/me_provider.dart';
import 'src/screens/initial/providers/orders_byid_provider.dart';
import 'src/screens/language/language.dart';
import 'src/screens/welcome/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? token = await FirebaseMessaging.instance.getToken();
  debugPrint(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _getOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  Future<void> _setOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => GetOrderByIdProvider()),
        ChangeNotifierProvider(create: (_) => GetMeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder<bool>(
                future: _getOnboardingStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // Placeholder widget while checking the status
                  } else if (!snapshot.data!) {
                    _setOnboardingStatus();
                    return const LanguageScreen();
                  } else {
                    return const SpalshScreen();
                  }
                },
              ), // Replace with your main content screen widget
        },
      ),
    );
  }
}
