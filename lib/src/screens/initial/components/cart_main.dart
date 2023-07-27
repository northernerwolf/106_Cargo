import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../pages/info_order.dart';

class CartMain extends StatelessWidget {
  const CartMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'ID: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'BBB',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomIcon(
                          title: 'assets/icons/boxh.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.authTextColor),
                      const Text(
                        ' Guty: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        '3',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomIcon(
                          title: 'assets/icons/gps.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.authTextColor),
                      const Text(
                        'GPS',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '01.08.2023',
                        style: TextStyle(
                            color: AppColors.authTextColor,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Urumçy',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: AppColors.searchColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomIcon(
                          title: 'assets/icons/arrow_right.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.authTextColor),
                    ),
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Aşgabat',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Image.asset(
                'assets/images/road_steper.png',
                height: 55,
                width: MediaQuery.of(context).size.width - 70,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.initialButtonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 8, bottom: 8, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(
                              title: 'assets/icons/map_pin.svg',
                              height: 18,
                              width: 18,
                              color: AppColors.mainColor),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Urumçy',
                            style: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InfoOreder()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 10),
                        child: Text(
                          'Doly maglumat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
