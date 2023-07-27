import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';

class InfoOreder extends StatefulWidget {
  const InfoOreder({super.key});

  @override
  State<InfoOreder> createState() => _InfoOrederState();
}

class _InfoOrederState extends State<InfoOreder> {
  @override
  void initState() {
    super.initState();
  }

  void addNew() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: AppColors.profilColor, size: 30),
        // automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Sargyt maglumaty',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Image.asset(
                        'assets/images/urumchy.png',
                        height: 55,
                        width: MediaQuery.of(context).size.width - 70,
                        fit: BoxFit.fill,
                      ),
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
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
                  left: 15, right: 15, top: 30, bottom: 20),
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
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 6,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (con, index) {
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
                                                  right: 10,
                                                  top: 3,
                                                  bottom: 5),
                                              child: Container(
                                                height: 6,
                                                width: 3,
                                                color: index < 3
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
                                          color: index < 3
                                              ? AppColors.mainColor
                                              : Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '03.08.2023',
                                            style: TextStyle(
                                                color: AppColors.authTextColor,
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
                                                color: AppColors.authTextColor,
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Hytaý Urumçy ammar',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily: 'Montserrat',
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
                            // : Row(children: [
                            //     Container(
                            //       height: 10,
                            //       width: 10,
                            //       decoration: const BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: AppColors.mainColor),
                            //     ),
                            //     const Text('Fuck',
                            //         style: TextStyle(
                            //             color: AppColors.profilColor))
                            //   ]);
                          }),
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
    );
  }
}

class Model {
  final String address;
  // final double lat;
  // final double long;
  final Color color;
  //Other fields if needed....
  Model(this.address, this.color);
  //initialise other fields so on....
}
