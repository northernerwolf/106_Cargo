import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:provider/provider.dart';

import '../../../application/settings_singleton.dart';
import '../../../design/app_colors.dart';
import '../components/custom_radio_button.dart';

class LanguageChange extends StatefulWidget {
  const LanguageChange({super.key});

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  int _value = 1;

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
            centerTitle: true,
            iconTheme:
                const IconThemeData(color: AppColors.profilColor, size: 30),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Text(
              'laguage'.trs,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Container(
            height: 330,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: Text(
                      // 'Dil saýlaň',
                      'app_title'.trs,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Selector<SettingsSingleton, String>(
                    selector: (_, settings) => settings.locale.languageCode,
                    builder: (_, locale, __) {
                      return InkWell(
                        onTap: () async {
                          setState(() {});
                          await SettingsSingleton().changeLocale('tk');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 40),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: locale == 'tk'
                                            ? AppColors.mainColor
                                            : Colors.grey,
                                        width: 1.5),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: locale == 'tk'
                                            ? AppColors.mainColor
                                            : Colors.white,
                                        border: Border.all(
                                            color: locale == 'tk'
                                                ? AppColors.mainColor
                                                : Colors.grey,
                                            width: 1.5),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset('assets/images/turkman.png'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Türkmen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Selector<SettingsSingleton, String>(
                    selector: (_, settings) => settings.locale.languageCode,
                    builder: (_, locale, __) {
                      return InkWell(
                        onTap: () async {
                          setState(() {});
                          await SettingsSingleton().changeLocale('ru');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: locale == 'ru'
                                            ? AppColors.mainColor
                                            : Colors.grey,
                                        width: 1.5),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: locale == 'ru'
                                                ? AppColors.mainColor
                                                : Colors.grey,
                                            width: 1.5),
                                        color: locale == 'ru'
                                            ? AppColors.mainColor
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset('assets/images/russian.png'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Русский',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Selector<SettingsSingleton, String>(
                    selector: (_, settings) => settings.locale.languageCode,
                    builder: (_, locale, __) {
                      return InkWell(
                        onTap: () async {
                          setState(() {});
                          await SettingsSingleton().changeLocale('en');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: locale == 'en'
                                            ? AppColors.mainColor
                                            : Colors.grey,
                                        width: 1.5),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: locale == 'en'
                                                ? AppColors.mainColor
                                                : Colors.grey,
                                            width: 1.5),
                                        color: locale == 'en'
                                            ? AppColors.mainColor
                                            : Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                    'assets/images/united-kingdom.png'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'English',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, right: 20, left: 20, bottom: 30),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'save'.trs,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  PopupMenuItem<String>(
//           value: 'assets/images/turkmenistan.png',
//           onTap: () async {
// await SettingsSingleton().changeLocale('tk');
// setState(() {});
//           },
//           child: Row(
//             children: [
//               Image.asset(
//                 'assets/images/turkmenistan.png',
//                 width: 40.0,
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text(
//                   'Türkmen',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontFamily: 'Rubik',
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'assets/images/russia.png',
//           onTap: () async {
//             await SettingsSingleton().changeLocale('ru');
//             setState(() {});
//           },
//           child: Row(
//             children: [
//               Image.asset('assets/images/russia.png', width: 40.0),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text(
//                   'Руский',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontFamily: 'Rubik',
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'assets/images/united-kingdom.png',
//           onTap: () async {
//             await SettingsSingleton().changeLocale(
//               'en',
//             );
//             setState(() {});
//           },
//           child: Row(
//             children: [
//               Image.asset('assets/images/united-kingdom.png', width: 40.0),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text(
//                   'English',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontFamily: 'Rubik',
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//         ),
