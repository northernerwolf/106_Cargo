import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargo_app/src/application/settings_singleton.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:kargo_app/src/screens/initial/notifications/notifications.dart';
import 'package:kargo_app/src/screens/initial/pages/search_screen.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import '../auth/login/login_screen.dart';
import '../auth/register/register_screen.dart';
import 'components/cart_main.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    fetchData();
    showNotfi();
    super.initState();
  }

  fetchData() async {
    await Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  showNotfi() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message ddbsbsbsbsbdbsbsbs");
      print(event.notification!.body);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(10),
        elevation: 0,
        content: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Notifications()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset('assets/images/logo.png')),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      child: Container(
                        color: AppColors.borderColor,
                        height: 60,
                        width: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.notification?.title ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            event.notification?.body ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            //  Card(
            //   // color: Colors.grey.shade500,
            //   child: ListTile(
            //     title: Text(event.notification?.title ?? ''),
            //     subtitle: Text(event.notification?.body ?? ''),
            //   ),
            // ),
            ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 50,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 0,
                      bottom: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                            color: AppColors.searchColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: CustomIcon(
                                  title: 'assets/icons/searchnormal1.svg',
                                  height: 20,
                                  width: 20,
                                  color: AppColors.profilColor),
                            ),
                            // SizedBox(
                            //     height: 40,
                            //     width: MediaQuery.of(context).size.width - 120,
                            //     child: TextFormField()),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'search'.trs,
                                style: const TextStyle(
                                    color: AppColors.profilColor,
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const Notifications()));
                  //   },
                  //   icon: const Badge(
                  //     child: Icon(
                  //       CupertinoIcons.bell,
                  //       color: Colors.black,
                  //       size: 25,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 4.0,
        onRefresh: () async {
          fetchData();
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Image.asset(
                      'assets/images/anmation.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              Consumer<SettingsSingleton>(builder: (_, settings, __) {
                settings.checkAuthStatus();
                if (settings.isAuthenticated == true) {
                  if (order.orders.isNotEmpty) {
                    return ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 0, left: 0, right: 0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: order.orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: CartMain(
                                model: order.orders[index],
                              ));
                        });
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Center(
                              child: Lottie.asset(
                            'assets/icons/no_data.json',
                            width: MediaQuery.of(context).size.width - 130,
                            height: 200,
                            fit: BoxFit.fill,
                          )),
                          TextButton(
                              onPressed: () async {
                                fetchData();
                                setState(() {});
                              },
                              child: Text('Maglumady täzele'))
                        ],
                      ),
                    );
                  }
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                        child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 20, bottom: 20),
                          child: Text(
                            'create_account_info'.trs,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColors.profilColor,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'login'.trs,
                              style: const TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 8, right: 8),
                            child: Text(
                              'create_account'.trs,
                              style: const TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    )),
                  );
                }
              })
            ],
          ),
        )),
      ),
    );
  }
}
