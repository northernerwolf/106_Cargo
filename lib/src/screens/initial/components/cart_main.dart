import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../model/orders_model.dart';
import '../pages/info_order.dart';
import '../providers/orders_provider.dart';

class CartMain extends StatefulWidget {
  final TripModel model;

  const CartMain({required this.model, super.key});

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final pointss = Provider.of<OrdersProvider>(context);
    int t = 0;
    int l = widget.model.points!.length;
    if (widget.model.points != null) {
      for (var i = 0; i < widget.model.points!.length; i++) {
        if (widget.model.points?[i].isCurrent != 0) {
          t = i;
        }
      }
    }

    var name = widget.model.ticketCode;
    name = name.replaceAll('', '\u200B');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Text(
                            'id'.tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 70,
                            child: Text(
                              name,
                              // maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      //  Padding(
                      //     padding: EdgeInsets.only(
                      //         left: MediaQuery.of(context).size.width / 2.5),
                      //     child: Row(
                      //       children: [
                      //         CustomIcon(
                      //             title: 'assets/icons/boxh.svg',
                      //             height: 20,
                      //             width: 20,
                      //             color: AppColors.authTextColor),
                      //         Text(
                      //           'box'.trs,
                      //           style: const TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 16,
                      //               fontFamily: 'Roboto',
                      //                fontStyle: FontStyle.normal,
                      //               fontWeight: FontWeight.w400),
                      //         ),
                      //         Text(
                      //           widget.model.summarySeats.toString(),
                      //           style: const TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 16,
                      //               fontFamily: 'Roboto',
                      //               fontStyle: FontStyle.normal,
                      //               fontWeight: FontWeight.w400),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     CustomIcon(
                  //         title: 'assets/icons/gps.svg',
                  //         height: 20,
                  //         width: 20,
                  //         color: AppColors.authTextColor),
                  //     const SizedBox(
                  //       width: 3,
                  //     ),
                  //     Text(
                  //       'gps'.trs,
                  //       style: const TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 16,
                  //           fontFamily: 'Roboto',
                  //           fontStyle: FontStyle.normal,
                  //           fontWeight: FontWeight.w400),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
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
                              SizedBox(
                                width: 150,
                                child: Text(
                                  widget.model.pointFrom,
                                  maxLines: 2,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 2 -
                                            40),
                                child: Center(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.mainColor.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomIcon(
                                          title: 'assets/icons/arrow_right.svg',
                                          height: 20,
                                          width: 20,
                                          color: AppColors.mainColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              widget.model.pointTo,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
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
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: widget.model.points!.isNotEmpty
                  ? SizedBox(
                      height: 40,
                      // width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.model.points?.length,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (con, index) {
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
                                                            left: 3,
                                                            right: 3,
                                                            top: 7,
                                                            bottom: 5),
                                                    child: Container(
                                                      height: 2.5,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  9 +
                                                              2,
                                                      color: index <= t &&
                                                              t >= 0
                                                          ? AppColors.mainColor
                                                          : Colors.grey,
                                                    )),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        index != t
                                            ? Container(
                                                height: 12,
                                                width: 12,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: index <= t && t >= 0
                                                        ? AppColors.mainColor
                                                        : Colors.grey),
                                              )
                                            : Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .mainColor
                                                              .withOpacity(
                                                                  0.1)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 28,
                                                    width: 28,
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
                                                            : t == l - 1
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
                                }),
                          )))
                        ],
                      ))
                  : SizedBox(
                      height: 40,
                      // width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (con, index) {
                                  return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Visibility(
                                          visible: index == 0 ? false : true,
                                          child: Row(children: [
                                            FittedBox(
                                              child: Row(
                                                children: List.generate(
                                                  1,
                                                  (ii) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 3,
                                                              top: 7,
                                                              bottom: 5),
                                                      child: Container(
                                                        height: 2.5,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                9 +
                                                            2,
                                                        color:
                                                            index <= t && t >= 0
                                                                ? AppColors
                                                                    .mainColor
                                                                : Colors.grey,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        index != t
                                            ? Container(
                                                height: 12,
                                                width: 12,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: index <= t && t >= 0
                                                        ? AppColors.mainColor
                                                        : Colors.grey),
                                              )
                                            : Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .mainColor
                                                              .withOpacity(
                                                                  0.1)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: AppColors
                                                                .mainColor),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: CustomIcon(
                                                        title: t == 0
                                                            ? 'assets/icons/home.svg'
                                                            : t == l - 1
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
                                }),
                          )))
                        ],
                      )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // width: MediaQuery.of(context).size.width / 4 - 30,
                    child: Row(
                      children: [
                        // CustomIcon(
                        //     title: 'assets/icons/boxh.svg',
                        //     height: 20,
                        //     width: 20,
                        //     color: Colors.black),
                        Text(
                          'place'.tr(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width / 4 - 25,
                            child: Text(
                              widget.model.summarySeats.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 4 - 25,
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //           height: 24,
                  //           width: 25,
                  //           child: Image.asset('assets/images/kg.png')),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 5),
                  //         child: Text(
                  //           widget.model.summaryKg.toString(),
                  //           style: const TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 16,
                  //               fontFamily: 'Roboto',
                  //               fontStyle: FontStyle.normal,
                  //               fontWeight: FontWeight.w400),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      children: [
                        // SizedBox(
                        //     height: 22,
                        //     width: 22,
                        //     child: Image.asset('assets/images/cube_new.png')),
                        Text(
                          'cub'.tr(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            widget.model.summaryCube.toString(),
                            style: const TextStyle(
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
                  SizedBox(
                    // width: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      children: [
                        // const Icon(Icons.attach_money, ),
                        Text(
                          'cost'.tr(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.model.summaryPrice.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: AppColors.initialButtonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 10, bottom: 10, right: 12),
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
                          Text(
                            widget.model.location,
                            style: const TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 12,
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 10),
                        child: Text(
                          'more_info'.tr(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
