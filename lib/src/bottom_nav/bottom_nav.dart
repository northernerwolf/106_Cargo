import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../design/app_colors.dart';
import '../screens/explore/explore.dart';
import '../screens/initial/initial.dart';
import '../screens/profile/profile.dart';

class BottomNavAll extends StatefulWidget {
  const BottomNavAll({super.key});

  @override
  State<BottomNavAll> createState() => _BottomNavAllState();
}

class _BottomNavAllState extends State<BottomNavAll> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _NavScreens() {
    return [
      const InitialScreen(),
      const ExploreScreen(),
      const ProfileScreen()
    ];
  }

  int selectedIndex = 0;
  int index = 0;
  bool icon = false;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cube_box),
        // CustomIcon(
        //   title: 'assets/icons/box.svg',
        //   height: 20,
        //   width: 20,
        //   color: AppColors.mainColor,
        // ),
        // inactiveIcon: CustomIcon(
        //   title: 'assets/icons/box.svg',
        //   height: 20.8,
        //   width: 20.77,
        //   color: CupertinoColors.systemGrey,
        // ),
        title: ("Sargyt"),
        // textStyle: const TextStyle(
        //     fontWeight: FontWeight.w600,
        //     fontStyle: FontStyle.normal,
        //     fontFamily: 'Rubik',
        //     fontSize: 12),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.compass),
        // CustomIcon(
        //     title: 'assets/icons/compass.svg',
        //     height: 20.8,
        //     width: 20.77,
        //     color: AppColors.mainColor),
        // inactiveIcon: CustomIcon(
        //     title: 'assets/icons/compass.svg',
        //     height: 20.8,
        //     width: 20.77,
        //     color: AppColors.disableColor),
        title: ("Gözleg"),
        // textStyle: const TextStyle(

        //     fontWeight: FontWeight.w600,
        //     fontStyle: FontStyle.normal,
        //     fontFamily: 'Rubik',
        //     fontSize: 12),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        // CustomIcon(
        //     title: 'assets/icons/phone.svg',
        //     height: 20.8,
        //     width: 20.77,
        //     color: AppColors.mainColor),
        // inactiveIcon: CustomIcon(
        //     title: 'assets/icons/phone.svg',
        //     height: 20.8,
        //     width: 20.77,
        //     color: AppColors.disableColor),
        title: ("Profil"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _NavScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: 68,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: const NavBarDecoration(
          boxShadow: CupertinoContextMenu.kEndBoxShadow,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
