import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../providers/orders_byid_provider.dart';
import 'invoice.dart';
import 'order_image_view.dart';

import 'package:photo_view/photo_view.dart';

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

  // int t = 0;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final orderById = Provider.of<GetOrderByIdProvider>(context);
    int t = 0;
    if (orderById.ordersById?.points != null) {
      for (var i = 0; i < orderById.ordersById!.points.length; i++) {
        if (orderById.ordersById?.points[i].isCurrent != 0) {
          t = i;
        }
      }
    }
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
              'order_info'.trs,
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
          child: RefreshIndicator(
        onRefresh: () async {
          fetchData();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Container(
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
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'id'.trs,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                                Builder(builder: (context) {
                                  final tripData = orderById.ordersById;
                                  if (tripData != null) {
                                    return Text(
                                      tripData.pointTo,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                    );
                                  } else {
                                    return Text("Null");
                                  }
                                }),
                              ],
                            ),
                            Row(
                              children: [
                                CustomIcon(
                                    title: 'assets/icons/boxh.svg',
                                    height: 20,
                                    width: 20,
                                    color: AppColors.authTextColor),
                                Text(
                                  'box'.trs,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                                Builder(builder: (context) {
                                  final ordersId = orderById.ordersById;
                                  if (ordersId != null) {
                                    return Text(
                                      ordersId.summarySeats.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                    );
                                  }
                                  {
                                    return Text('NULL');
                                  }
                                }),
                              ],
                            ),
                            Row(
                              children: [
                                CustomIcon(
                                    title: 'assets/icons/gps.svg',
                                    height: 20,
                                    width: 20,
                                    color: AppColors.authTextColor),
                                Text(
                                  'gps'.trs,
                                  style: const TextStyle(
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
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(builder: (context) {
                                      final ordersDate = orderById.ordersById;
                                      if (ordersDate != null) {
                                        return Text(
                                          ordersDate.date,
                                          style: const TextStyle(
                                              color: AppColors.authTextColor,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400),
                                        );
                                      } else {
                                        return Text('Null');
                                      }
                                    }),
                                    Builder(builder: (context) {
                                      final ponitForms = orderById.ordersById;
                                      if (ponitForms != null) {
                                        return Text(
                                          ponitForms.pointFrom,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                        );
                                      } else {
                                        return Text('Null');
                                      }
                                    }),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 170),
                                  child: Container(
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
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Builder(builder: (context) {
                                    final pointsTo = orderById.ordersById;
                                    if (pointsTo != null) {
                                      return Text(
                                        orderById.ordersById!.pointTo,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      );
                                    } else {
                                      return Text('Null');
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 0, top: 0),
                        child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Builder(builder: (context) {
                                      final pointsL = orderById.ordersById;
                                      if (pointsL == orderById.ordersById) {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: pointsL?.points.length,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (con, index) {
                                              // setState(() {
                                              //   orderById.loc;
                                              // });
                                              return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Visibility(
                                                      visible: index == 0
                                                          ? false
                                                          : true,
                                                      child: Row(children: [
                                                        Row(
                                                          children:
                                                              List.generate(
                                                            1,
                                                            (ii) => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 3,
                                                                        right:
                                                                            3,
                                                                        top: 7,
                                                                        bottom:
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  height: 2.5,
                                                                  width: 42,
                                                                  color: index <=
                                                                          t
                                                                      ? AppColors
                                                                          .mainColor
                                                                      : Colors
                                                                          .grey,
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
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: index < t
                                                                    ? AppColors
                                                                        .mainColor
                                                                    : Colors
                                                                        .grey),
                                                          )
                                                        : Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Center(
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 40,
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
                                                                height: 28,
                                                                width: 28,
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: AppColors
                                                                        .mainColor),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          4.0),
                                                                  child:
                                                                      CustomIcon(
                                                                    title: t ==
                                                                            0
                                                                        ? 'assets/icons/home.svg'
                                                                        : t == pointsL?.points.length
                                                                            ? 'assets/icons/check_circle.svg'
                                                                            : 'assets/icons/truck_delivery.svg',
                                                                    height: 10,
                                                                    width: 10,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                  ]);
                                            });
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 0),
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
                                    Builder(builder: (context) {
                                      final locations = orderById.ordersById;
                                      if (locations != null) {
                                        return Text(
                                          locations.location,
                                          style: const TextStyle(
                                              color: AppColors.mainColor,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                        );
                                      } else {
                                        return Text('Null');
                                      }
                                    }),
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
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  height: 120,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Builder(builder: (context) {
                      final imagesL = orderById.ordersById;
                      if (imagesL != null) {
                        return PageView.builder(
                          itemCount: imagesL.images.length,
                          controller: PageController(
                            viewportFraction: 0.3,
                            initialPage: 0,
                            keepPage: true,
                          ),
                          scrollDirection: Axis.horizontal,
                          reverse: false,
                          // onPageChanged: (int index) =>
                          //     setState(() => _index = index),
                          itemBuilder: (_, i) {
                            return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: PhotoViewGallery.builder(
                                          itemCount: orderById
                                              .ordersById!.images.length,
                                          builder: (BuildContext context,
                                              int index) {
                                            return PhotoViewGalleryPageOptions(
                                              imageProvider: NetworkImage(
                                                  orderById.ordersById!
                                                      .images[index]),
                                              minScale: PhotoViewComputedScale
                                                      .contained *
                                                  0.8,
                                              maxScale: PhotoViewComputedScale
                                                      .covered *
                                                  2,
                                            );
                                          },
                                          scrollPhysics:
                                              const BouncingScrollPhysics(),
                                          backgroundDecoration:
                                              const BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          loadingBuilder:
                                              (BuildContext context, event) =>
                                                  const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          onPageChanged: (int index) {
                                            setState(() {
                                              _selectedIndex = i;
                                            });
                                          },
                                          pageController: PageController(
                                              initialPage: _selectedIndex),
                                        ),
                                      );
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        orderById.ordersById!.images[i],
                                        fit: BoxFit.cover,
                                        // loadingBuilder:
                                        //     (context, child, loadingProgress) =>
                                        //         const SpinKitCircle(
                                        //   color: AppColors.mainColor,
                                        //   size: 50,
                                        // ),
                                      )),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text('Null');
                      }
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 20),
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
                        padding: EdgeInsets.only(left: 15, top: 10, bottom: 0),
                        child: Text(
                          'track_order'.trs,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 490,
                          child: Builder(builder: (context) {
                            final poitss = orderById.ordersById;
                            if (poitss != null) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: poitss.points.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (con, index) {
                                    return Stack(
                                      children: [
                                        Row(children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      orderById.ordersById!
                                                          .points[index].date
                                                          .toString(),
                                                      // '12.03.2333',
                                                      style: TextStyle(
                                                          color: index > t
                                                              ? AppColors
                                                                  .authTextColor
                                                              : AppColors
                                                                  .mainColor,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomIcon(
                                                          title:
                                                              'assets/icons/truck_delivery.svg',
                                                          height: 24,
                                                          width: 24,
                                                          color: index > t
                                                              ? AppColors
                                                                  .authTextColor
                                                              : AppColors
                                                                  .mainColor,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Text(
                                                            orderById
                                                                .ordersById!
                                                                .points[index]
                                                                .point,
                                                            style: TextStyle(
                                                                color: index > t
                                                                    ? Colors
                                                                        .black
                                                                    : AppColors
                                                                        .mainColor,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.5, right: 10),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 12,
                                                width: 12,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: index <= t
                                                        ? AppColors.mainColor
                                                        : Colors.grey),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Visibility(
                                                  visible: index ==
                                                          orderById
                                                                  .ordersById!
                                                                  .points
                                                                  .length -
                                                              1
                                                      ? false
                                                      : true,
                                                  child: Column(
                                                    children: List.generate(
                                                      5,
                                                      (ii) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4,
                                                                  right: 5,
                                                                  top: 0,
                                                                  bottom: 3),
                                                          child: Container(
                                                            height: 6,
                                                            width: 3,
                                                            color: index < t
                                                                ? AppColors
                                                                    .mainColor
                                                                : Colors.grey,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => const Invoice()));
                //   },
                //   child: Container(
                //     height: 50,
                //     width: MediaQuery.of(context).size.width / 2 - 25,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: AppColors.mainColor.withOpacity(0.1)),
                //     child: Center(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           CustomIcon(
                //             title: 'assets/icons/image.svg',
                //             height: 22,
                //             width: 22,
                //             color: AppColors.mainColor,
                //           ),
                //           const Padding(
                //             padding: EdgeInsets.only(left: 5),
                //             child: Text(
                //               'Harydyň suraty',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                   color: AppColors.mainColor,
                //                   fontSize: 16,
                //                   fontFamily: 'Roboto',
                //                   fontStyle: FontStyle.normal,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Invoice(
                                id: widget.id,
                              )));
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor),
                      child: Center(
                        child: Text(
                          'invoice'.trs,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500),
                        ),
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
