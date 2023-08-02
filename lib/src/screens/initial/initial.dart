import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargo_app/src/screens/initial/notifications/notifications.dart';
import 'package:kargo_app/src/screens/initial/pages/search_screen.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
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
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
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
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 10,
                      bottom: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 90,
                        decoration: BoxDecoration(
                            color: AppColors.searchColor,
                            borderRadius: BorderRadius.circular(15)),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Gözleg',
                                style: TextStyle(
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Notifications()));
                    },
                    icon: const Badge(
                      child: Icon(
                        CupertinoIcons.bell,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 115,
                  child: Image.asset(
                    'assets/images/anmation.gif',
                    fit: BoxFit.fill,
                  )),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 30, top: 20),
            //   child: Text(
            //     'Aktiw sargytlar',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 22,
            //         fontFamily: 'Roboto',
            //         fontStyle: FontStyle.normal,
            //         fontWeight: FontWeight.w700),
            //   ),
            // ),
            ListView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CartMain(
                        model: order.orders[index],
                      ));
                }),
          ],
        ),
      )),
    );
  }
}
