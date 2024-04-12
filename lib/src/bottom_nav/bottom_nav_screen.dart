import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/firebase_setup.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/auth/components/updata_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/about/about_us.dart';

import '../screens/initial/initial.dart';
import '../screens/profile/profile.dart';
import '../screens/profile/proofile_logout.dart';
import 'bottom_nav_bar_button.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  bool isvisible = false;
  bool? isSkippable = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    FirebaseSetup.init(context);
    super.initState();
    checkUser();
    checkAndUpdateSkippable();
    checkForUpdates();
  }

  int changer = 0;

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    if (val != null) {
      changer = 1;
    }
  }

  Future<void> checkForUpdates() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    remoteConfig.fetchAndActivate();
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });

    String getUpdateVersion() => remoteConfig.getString('update');

    String getMustUpdateVersion() => remoteConfig.getString('must_update');

    if (Constants.mustUpdate != getMustUpdateVersion()) {
      // ignore: use_build_context_synchronously
      showUpdateVersionMustDialog(context);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSkippable = prefs.getBool('isSkippable');

    if (isSkippable == false) {
      if (packageInfo.version != getUpdateVersion()) {
        // ignore: use_build_context_synchronously
        showUpdateVersionDialog(context, isSkippable!);
      }
    }
  }

  Future<void> checkAndUpdateSkippable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('lastUpdateCheck')) {
      int lastUpdateCheck = prefs.getInt('lastUpdateCheck') ?? 0;
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      if (currentTime - lastUpdateCheck >=
          const Duration(days: 3).inMilliseconds) {
        setState(() async {
          isSkippable = false;
          await prefs.setBool('isSkippable', isSkippable!);
        });
        await prefs.setInt('lastUpdateCheck', currentTime);
      }
    } else {
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt('lastUpdateCheck', currentTime);
    }
  }

  List page = [
    const InitialScreen(),
    // const ExploreScreen(),
    const AboutUs(),
    const ProfileLogOut()
  ];

  List page2 = [
    const InitialScreen(),
    // const ExploreScreen(),
    const AboutUs(),
    const ProfileScreen(),
  ];

  bool appbar = true;
  // static const appcastURL =
  //     'https://play.google.com/store/apps/details?id=guwanchaldurdyyewProduct.kargo_app&gl=GB&hl=en&_cb=1712558891358480';
  // final upgrader = Upgrader(
  //   storeController: UpgraderStoreController(
  //     onAndroid: () => UpgraderAppcastStore(appcastURL: appcastURL),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 0,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(0);
                    })),
            // Expanded(
            //     child: BottomNavbarButton(
            //         icon: false,
            //         index: 1,
            //         selectedIndex: selectedIndex,
            //         onTapp: () {
            //           onTapp(1);
            //         })),
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 1,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(1);
                    })),
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 2,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(2);
                    })),
          ],
        ),
      ),
      // body: PersistentTabView(
      //   context,
      //   confineInSafeArea: true,
      //   screens: [
      //     Center(
      //       child: page[selectedIndex],
      //     ),
      //   ],
      //   items: [

      //   ],
      // ),
      body: IndexedStack(
        // index: selectedIndex,
        children: [
          Center(
            child: changer == 1 ? page2[selectedIndex] : page[selectedIndex],
          ),
        ],
      ),
    );
  }

  // void showUpdateDialog(
  //     bool flexibleUpdateAllowed, bool immediateUpdateAllowed) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Update Available'),
  //         content: Text(
  //             'A new version of the app is available. Would you like to update now?'),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             child: Text('Later'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('Update'),
  //             onPressed: () {
  //               // Proceed with the update based on the type allowed
  //               if (immediateUpdateAllowed) {
  //                 InAppUpdate.performImmediateUpdate();
  //               } else if (flexibleUpdateAllowed) {
  //                 InAppUpdate.startFlexibleUpdate();
  //               }
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void onTapp(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }
}
