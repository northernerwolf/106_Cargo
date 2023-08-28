import 'package:flutter/material.dart';
import 'package:kargo_app/src/application/settings_singleton.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:kargo_app/src/screens/auth/providers/me_provider.dart';
import 'package:kargo_app/src/screens/profile/edit/contaacts.dart';
import 'package:kargo_app/src/screens/profile/edit/lanuage_chnage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import '../auth/login/repository_login.dart';
import 'edit/edit_profil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<GetMeProvider>(context, listen: false).getMeResponse();
  }

  @override
  Widget build(BuildContext context) {
    final meInfo = Provider.of<GetMeProvider>(context);
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
                'profile'.trs,
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height - 230,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.only(left: 20, right: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // const Text(
                        //   'Batyr00',
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 18,
                        //       fontFamily: 'Roboto',
                        //       fontStyle: FontStyle.normal,
                        //       fontWeight: FontWeight.w600),
                        // ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfil(
                                      model: meInfo.getMe!,
                                    )));
                          },
                          icon: CustomIcon(
                              title: 'assets/icons/edit.svg',
                              height: 22,
                              width: 22,
                              color: AppColors.profilColor),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '${meInfo.getMe?.firstName}  ${meInfo.getMe?.lastName}',
                        style: const TextStyle(
                            color: AppColors.profilColor,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '+993 ${meInfo.getMe?.phone}',
                        style: const TextStyle(
                            color: AppColors.profilColor,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 60,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 20, top: 0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // crossAxisSpacing: 12,

                              mainAxisExtent: 20,
                            ),
                            itemCount: meInfo.getMe?.tickets.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(
                                    'ID: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    meInfo.getMe?.tickets[index].code
                                            .toString() ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                        //  Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: const [

                        //     Padding(
                        //       padding: EdgeInsets.only(left: 50),
                        //       child: Text(
                        //         'ID: ',
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 16,
                        //             fontFamily: 'Roboto',
                        //             fontStyle: FontStyle.normal,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //     Text(
                        //       'D45',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 16,
                        //           fontFamily: 'Roboto',
                        //           fontStyle: FontStyle.normal,
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //   ],
                        // ),
                        ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, bottom: 15, right: 10),
                      child: Container(
                        color: AppColors.profilColor.withOpacity(0.1),
                        width: double.infinity,
                        height: 1.5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LanguageChange()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomIcon(
                                  title: 'assets/icons/globe.svg',
                                  height: 24,
                                  width: 24,
                                  color: AppColors.profilColor),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'laguage'.trs,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CustomIcon(
                                title: 'assets/icons/chevron_right.svg',
                                height: 24,
                                width: 24,
                                color: AppColors.profilColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                      child: Container(
                        color: AppColors.profilColor.withOpacity(0.1),
                        width: double.infinity,
                        height: 1.5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Contacts()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomIcon(
                                  title: 'assets/icons/mail.svg',
                                  height: 24,
                                  width: 24,
                                  color: AppColors.profilColor),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'contacty'.trs,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CustomIcon(
                                title: 'assets/icons/chevron_right.svg',
                                height: 24,
                                width: 24,
                                color: AppColors.profilColor),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDalogdExit();
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIcon(
                                    title: 'assets/icons/log_out.svg',
                                    height: 24,
                                    width: 24,
                                    color: Colors.white),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'log_out'.trs,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      )),
    );
  }

  Future showDalogdExit() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'log_out_info'.trs,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<SettingsSingleton>(builder: (_, settings, __) {
                      return InkWell(
                        onTap: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          String? val = preferences.getString('token');
                          preferences.remove('token');
                          print(val);
                          settings.logout();
                          LogOutRepository().logOut(context, val!);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[100]),
                          child: Center(
                            child: Text(
                              'yes'.trs,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      );
                    }),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.mainColor),
                        child: Center(
                          child: Text(
                            'no'.trs,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
