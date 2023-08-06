import 'package:flutter/material.dart';
import 'package:kargo_app/src/screens/initial/pages/invoice.dart';
import 'package:provider/provider.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../providers/orders_byid_provider.dart';
import 'order_image_view.dart';

class InfoOreder extends StatefulWidget {
  final int id;
  const InfoOreder({required this.id, super.key});

  @override
  State<InfoOreder> createState() => _InfoOrederState();
}

class _InfoOrederState extends State<InfoOreder> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<GetOrderByIdProvider>(context, listen: false)
        .getOrdersById(widget.id);
  }

  void addNew() {
    setState(() {});
  }

  int t = 0;

  @override
  Widget build(BuildContext context) {
    final orderById = Provider.of<GetOrderByIdProvider>(context);
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
            title: const Text(
              'Sargyt maglumaty',
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Container(
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
                height: 250,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
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
                                orderById.ordersById!.ticketCode,
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
                                orderById.ordersById!.summarySeats.toString(),
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderById.ordersById!.date,
                                style: const TextStyle(
                                    color: AppColors.authTextColor,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                orderById.ordersById!.pointFrom,
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
                                orderById.ordersById!.pointTo,
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          orderById.ordersById!.points.length,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (con, index) {
                                        if (orderById.ordersById!.points[index]
                                                .isCurrent !=
                                            0) {
                                          t = index;
                                        }
                                        return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Visibility(
                                                visible:
                                                    index == 0 ? false : true,
                                                child: Row(children: [
                                                  Row(
                                                    children: List.generate(
                                                      1,
                                                      (ii) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5,
                                                                  right: 5,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Container(
                                                            height: 3,
                                                            width: 30,
                                                            color: index <= t
                                                                ? AppColors
                                                                    .mainColor
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
                                                          shape:
                                                              BoxShape.circle,
                                                          color: index < t
                                                              ? AppColors
                                                                  .mainColor
                                                              : Colors.grey),
                                                    )
                                                  : Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .mainColor
                                                                    .withOpacity(
                                                                        0.1)),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .mainColor),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: CustomIcon(
                                                              title: t == 0
                                                                  ? 'assets/icons/home.svg'
                                                                  : t == 4
                                                                      ? 'assets/icons/check_circle.svg'
                                                                      : 'assets/icons/truck_delivery.svg',
                                                              height: 10,
                                                              width: 10,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                            ]);
                                      }),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  Text(
                                    orderById.ordersById!.pointTo,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 0),
              child: Text(
                'Harydy yzarlamak',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 20),
              child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 350,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: orderById.ordersById!.points.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (con, index) {
                              if (orderById
                                      .ordersById!.points[index].isCurrent !=
                                  0) {
                                t = index;
                              }
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Visibility(
                                      visible: index == 0 ? false : true,
                                      child: Row(children: [
                                        Column(
                                          children: List.generate(
                                            5,
                                            (ii) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,
                                                    right: 5,
                                                    top: 0,
                                                    bottom: 5),
                                                child: Container(
                                                  height: 6,
                                                  width: 3,
                                                  color: index <= t
                                                      ? AppColors.mainColor
                                                      : Colors.grey,
                                                )),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Row(children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index < t + 1
                                                ? AppColors.mainColor
                                                : Colors.grey),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              orderById.ordersById!
                                                  .points[index].date
                                                  .toString(),
                                              style: const TextStyle(
                                                  color:
                                                      AppColors.authTextColor,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CustomIcon(
                                                  title:
                                                      'assets/icons/truck_delivery.svg',
                                                  height: 24,
                                                  width: 24,
                                                  color:
                                                      AppColors.authTextColor,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    orderById.ordersById!
                                                        .points[index].point,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ])
                                  ]);
                            }),
                      ),
                    )
                    //       decoration: const BoxDecoration(
                    //         color: AppColors.mainColor,
                    //         shape: BoxShape.circle,
                    //       ),
                    //     ),
                    //     // const Dash(
                    //     //     direction: Axis.vertical,
                    //     //     length: 130,
                    //     //     dashLength: 5,
                    //     //     dashColor: Colors.grey),
                    //     Container(
                    //       height: 25,
                    //       width: 25,
                    //       decoration: BoxDecoration(
                    //           shape: BoxShape.rectangle,
                    //           border: Border.all(width: 2, color: Colors.red)),
                    //       child: Container(
                    //         height: 20,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Invoice()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor.withOpacity(0.1)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(
                            title: 'assets/icons/image.svg',
                            height: 22,
                            width: 22,
                            color: AppColors.mainColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Harydyň suraty',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrderImageView()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor),
                    child: const Center(
                      child: Text(
                        'Hasap-faktura',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
