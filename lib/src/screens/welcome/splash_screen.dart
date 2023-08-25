import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargo_app/src/core/send_token.dart';

import '../../bottom_nav/bottom_nav_screen.dart';
import '../../core/firebase_setup.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    FirebaseSetup();
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.immersive,
    // );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const BottomNavScreen(),
      ));
    });
    sendToken();
  }

  sendToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    print(token);
    print('ebofboqufboqfboqbfqofbu');

    SendFcmTokenRepository().sendToken(token!);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
