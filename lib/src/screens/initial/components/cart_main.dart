import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../model/orders_model.dart';
import '../pages/info_order.dart';

class CartMain extends StatefulWidget {
  final TripModel model;

  const CartMain({required this.model, super.key});

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  int? t;
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
                    children: [
                      const Text(
                        'ID: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.model.ticketCode,
                        style: const TextStyle(
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
                      Text(
                        widget.model.summarySeats.toString(),
                        style: const TextStyle(
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
                      const SizedBox(
                        width: 3,
                      ),
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
                    children: [
                      Text(
                        widget.model.date,
                        style: const TextStyle(
                            color: AppColors.authTextColor,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.model.pointFrom,
                        style: const TextStyle(
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
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        widget.model.pointTo,
                        style: const TextStyle(
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
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 5),
              child: SizedBox(
                height: 60,
                child: widget.model.points != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.model.points!.length,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (con, index) {
                                if (widget.model.points![index].isCurrent !=
                                    0) {
                                  t = index;
                                }
                                return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Visibility(
                                        visible: index == 0 ? false : true,
                                        child: Row(children: [
                                          Row(
                                            children: List.generate(
                                              1,
                                              (ii) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Container(
                                                    height: 3,
                                                    width: 30,
                                                    color: index == t!
                                                        ? AppColors.mainColor
                                                        : Colors.grey,
                                                  )),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      index != t
                                          ? Container(
                                              height: 18,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index < t!
                                                      ? AppColors.mainColor
                                                      : Colors.grey),
                                            )
                                          : Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Center(
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .mainColor
                                                            .withOpacity(0.1)),
                                                  ),
                                                ),
                                                Container(
                                                  height: 32,
                                                  width: 32,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .mainColor),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: CustomIcon(
                                                      title: t == 0
                                                          ? 'assets/icons/home.svg'
                                                          : t ==
                                                                  widget
                                                                      .model
                                                                      .points!
                                                                      .last
                                                              ? 'assets/icons/check_circle.svg'
                                                              : 'assets/icons/truck_delivery.svg',
                                                      height: 10,
                                                      width: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                    ]);
                              })
                        ],
                      )
                    : const Text('Fucking'),
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
                          left: 12, top: 10, bottom: 10, right: 12),
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
                          builder: (context) => InfoOreder(
                                id: widget.model.id,
                              )));
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
            ),
          ],
        ),
      ),
    );
  }
}
