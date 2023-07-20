import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: AppColors.profilColor, size: 30),
        // automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Biz barada',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 10,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomIcon(
                        title: 'assets/icons/phone.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.profilColor),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '+99361 00 00 66 Batyr',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      CustomIcon(
                          title: 'assets/icons/phone.svg',
                          height: 24,
                          width: 24,
                          color: AppColors.profilColor),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '+99365 67 77 67 Kakajan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      CustomIcon(
                          title: 'assets/icons/phone.svg',
                          height: 24,
                          width: 24,
                          color: AppColors.profilColor),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '+99365 49 94 46 Berdi',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Container(
                    color: AppColors.profilColor.withOpacity(0.1),
                    width: double.infinity,
                    height: 1.5,
                  ),
                ),
                Row(
                  children: [
                    CustomIcon(
                        title: 'assets/icons/mail.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.profilColor),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'cargotm@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Container(
                    color: AppColors.profilColor.withOpacity(0.1),
                    width: double.infinity,
                    height: 1.5,
                  ),
                ),
                Row(
                  children: [
                    CustomIcon(
                        title: 'assets/icons/map_pin.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.profilColor),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Türkmenistan, Aşgabat şäheri, \n Berkarar söwda merkezi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
