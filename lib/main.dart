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
import 'src/screens/language/language.dart';
import 'src/screens/welcome/splash_screen.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt("initScreen");
  await pref.setInt("initScreen", 1);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsSingleton>(builder: (_, settings, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => const SpalshScreen(),
          "first": (context) => const LanguageScreen(),
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
