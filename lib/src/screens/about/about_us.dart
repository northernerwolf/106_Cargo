import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/custom_icon.dart';

import '../../design/app_colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
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
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Center(
              child: Text(
                'about'.tr(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 100, right: 100, bottom: 40),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                      title: 'assets/icons/phone.svg',
                      height: 24,
                      width: 24,
                      color: AppColors.profilColor),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '+8617699509372 Batyr',
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
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(
                        title: 'assets/icons/phone.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.profilColor),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '+8618690868865 Berdi',
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
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(
                        title: 'assets/icons/phone.svg',
                        height: 24,
                        width: 24,
                        color: AppColors.profilColor),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '+99361 00 00 66 Batyr  ',
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
                padding: const EdgeInsets.only(top: 5, left: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //     child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     // Padding(
      //     //   padding: const EdgeInsets.all(20.0),
      //     //   child: SizedBox(
      //     //     height: 210,
      //     //     width: MediaQuery.of(context).size.width - 40,
      //     //     child: Image.asset(
      //     //       'assets/images/delivery.png',
      //     //       fit: BoxFit.fill,
      //     //     ),
      //     //   ),
      //     // ),
      //     // GestureDetector(
      //     //   onTap: () {
      //     //     // final url = '';
      //     //     //                         if (await canLaunch(url)) {
      //     //     //                           await launch(url);
      //     //     //                         } else {
      //     //     //                           throw 'Could not launch $url';
      //     //     //                         }
      //     //   },
      //     //   child: const Padding(
      //     //     padding: EdgeInsets.only(left: 22),
      //     //     child: Text(
      //     //       'cargotm@gmail.com',
      //     //       style: TextStyle(
      //     //           color: Colors.black,
      //     //           fontSize: 18,
      //     //           fontFamily: 'Rubik',
      //     //           fontStyle: FontStyle.normal,
      //     //           fontWeight: FontWeight.w600),
      //     //     ),
      //     //   ),
      //     // ),
      //     // const Padding(
      //     //   padding: EdgeInsets.only(left: 22, top: 10),
      //     //   child: Text(
      //     //     'cargotm@gmail.com',
      //     //     style: TextStyle(
      //     //         color: Colors.black,
      //     //         fontSize: 16,
      //     //         fontFamily: 'Rubik',
      //     //         fontStyle: FontStyle.normal,
      //     //         fontWeight: FontWeight.w400),
      //     //   ),
      //     // )
      //   ],
      // )),
    );
  }
}
