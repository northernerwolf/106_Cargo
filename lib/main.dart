import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kargo_app/firebase_options.dart';
import 'package:kargo_app/src/application/settings_singleton.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/initial/providers/invoice_providers.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/screens/auth/login/repository_login.dart';
import 'src/screens/auth/providers/me_provider.dart';
import 'src/screens/initial/providers/orders_byid_provider.dart';
import 'src/screens/initial/repository/search_repository.dart';
import 'src/screens/language/language.dart';
import 'src/screens/welcome/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // String? token = await FirebaseMessaging.instance.getToken();
  // debugPrint(token);
  var pref = await SharedPreferences.getInstance();
  SingletonSharedPreference(pref);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SettingsSingleton(),
      ),
      ChangeNotifierProvider(create: (_) => LoginRepository()),
      ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ChangeNotifierProvider(create: (_) => GetOrderByIdProvider()),
      ChangeNotifierProvider(create: (_) => GetMeProvider()),
      ChangeNotifierProvider(create: (_) => InvoiceProvider()),
      // ChangeNotifierProvider(create: (_) => SearchRepository()),
    ],
    child: const MyApp(),
  ));
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
    return Consumer<SettingsSingleton>(builder: (_, settings, __) {
      return MaterialApp(
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
        supportedLocales: AppConstants.supportedLocales,
        locale: settings.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          TmMaterialLocalizations.delegate,
          TmCupertinoLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
    });
  }
}
