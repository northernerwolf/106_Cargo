import 'package:flutter/material.dart';
import 'package:kargo_app/src/screens/profile/edit/contaacts.dart';
import 'package:kargo_app/src/screens/profile/edit/lanuage_chnage.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import 'edit/edit_profil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            title: const Center(
              child: Text(
                'Profil',
                style: TextStyle(
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
              borderRadius: BorderRadius.circular(25),
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
              padding: const EdgeInsets.only(left: 20, right: 30, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Batyr00',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditProfil()));
                        },
                        child: CustomIcon(
                            title: 'assets/icons/edit.svg',
                            height: 25,
                            width: 25,
                            color: AppColors.profilColor),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Batyr Ataşew',
                      style: TextStyle(
                          color: AppColors.profilColor,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '+993 63 44 45 23',
                      style: TextStyle(
                          color: AppColors.profilColor,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
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
                          'D45',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'ID: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'D45',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Dil ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        CustomIcon(
                            title: 'assets/icons/chevron_right.svg',
                            height: 24,
                            width: 24,
                            color: AppColors.profilColor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Habarlaşmak ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        CustomIcon(
                            title: 'assets/icons/chevron_right.svg',
                            height: 24,
                            width: 24,
                            color: AppColors.profilColor),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 20, left: 20, bottom: 30),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIcon(
                                  title: 'assets/icons/log_out.svg',
                                  height: 24,
                                  width: 24,
                                  color: Colors.white),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Ulgamdan çyk',
                                  style: TextStyle(
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
          ),
        ),
      )),
    );
  }
}
