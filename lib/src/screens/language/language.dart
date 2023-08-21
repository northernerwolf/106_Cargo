import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:provider/provider.dart';

import '../../application/settings_singleton.dart';
import '../../design/app_colors.dart';
import '../welcome/welcome_page.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 340,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
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
                        'app_title'.trs,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
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
                                  child:
                                      Image.asset('assets/images/turkman.png'),
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
                                  child:
                                      Image.asset('assets/images/russian.png'),
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => WelcomePage(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 20, left: 20, bottom: 30),
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Dowam et',
                            style: TextStyle(
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
      ),
    );
  }
}
