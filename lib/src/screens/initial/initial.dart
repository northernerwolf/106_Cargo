import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kargo_app/src/application/settings_singleton.dart';

import 'package:kargo_app/src/screens/auth/components/login_components.dart';
import 'package:kargo_app/src/screens/initial/pages/search_screen.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import 'components/cart_main.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    showNotfi();
    fetchData();
    // FirebaseSetup.init(context);
    super.initState();
  }

  fetchData() async {
    await Provider.of<OrdersProvider>(context, listen: false)
        .getOrders(context);
  }

  showNotfi() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      if (event.notification!.body != null) {
        fetchData();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            builder: (context) => SearchScreen(
                                  focusNode: _focusNode,
                                )));
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'search'.tr(),
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
                      'assets/images/cargo_anim.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              Consumer<SettingsSingleton>(builder: (_, settings, __) {
                settings.checkAuthStatus();
                if (settings.isAuthenticated == true) {
                  return Consumer<OrdersProvider>(builder: (_, order, __) {
                    if (order.isLoading == true) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                            child: SpinKitFadingCircle(
                          color: Colors.grey,
                          size: 50.0,
                        )),
                      );
                    } else {
                      if (order.orders.isNotEmpty) {
                        return ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 0, left: 0, right: 0),
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
                                  child: Text('change_data'.tr()))
                            ],
                          ),
                        );
                      }
                    }
                  });
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height - 210,
                      child: const LoginComponents());
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 200),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10, right: 10),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.blueGrey.withOpacity(0.1),
                  //               spreadRadius: 5,
                  //               blurRadius: 7,
                  //               offset: const Offset(0, 3),
                  //             ),
                  //           ],
                  //           borderRadius: BorderRadius.circular(15)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(bottom: 20, top: 20),
                  //         child: Center(
                  //             child: Column(
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 40, right: 40, top: 20, bottom: 20),
                  //               child: Text(
                  //                 'create_account_info'.trs,
                  //                 textAlign: TextAlign.center,
                  //                 style: const TextStyle(
                  //                     color: AppColors.profilColor,
                  //                     fontSize: 14,
                  //                     fontFamily: 'Roboto',
                  //                     fontStyle: FontStyle.normal,
                  //                     fontWeight: FontWeight.w400),
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Navigator.of(context).push(MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const LoginScreen()));
                  //               },
                  //               child: Padding(
                  //                 padding: const EdgeInsets.only(top: 10),
                  //                 child: Text(
                  //                   'login'.trs,
                  //                   style: const TextStyle(
                  //                       color: AppColors.mainColor,
                  //                       fontSize: 16,
                  //                       fontFamily: 'Roboto',
                  //                       fontStyle: FontStyle.normal,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Navigator.of(context).push(MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const RegisterScreen()));
                  //               },
                  //               child: Padding(
                  //                 padding: const EdgeInsets.only(
                  //                     top: 10, left: 8, bottom: 8, right: 8),
                  //                 child: Text(
                  //                   'create_account'.trs,
                  //                   style: const TextStyle(
                  //                       color: AppColors.mainColor,
                  //                       fontSize: 16,
                  //                       fontFamily: 'Roboto',
                  //                       fontStyle: FontStyle.normal,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         )),
                  //       ),
                  //     ),
                  //   ),
                  // );
                }
              })
            ],
          ),
        )),
      ),
    );
  }
}
