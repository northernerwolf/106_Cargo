import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';

class InfoOreder extends StatefulWidget {
  const InfoOreder({super.key});

  @override
  State<InfoOreder> createState() => _InfoOrederState();
}

class _InfoOrederState extends State<InfoOreder> {
  List<Model> list = [];

  @override
  void initState() {
    super.initState();
    list.add(Model("Hyderabad", Colors.red));
    list.add(Model("Visakhapatnam", Colors.green));
    list.add(Model("Vijayawada", Colors.blue));
  }

  void addNew() {
    setState(() {
      list.add(Model("Karnool", Colors.black));
    });
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
              height: 265,
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
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'BBB',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
                                  fontSize: 18,
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
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Urumçy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
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
                              shape: BoxShape.circle),
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
                                  fontSize: 20,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 115,
                          decoration: BoxDecoration(
                              color: AppColors.initialButtonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIcon(
                                  title: 'assets/icons/map_pin.svg',
                                  height: 20,
                                  width: 20,
                                  color: AppColors.mainColor),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Urumçy',
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Doly maglumat',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
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
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (con, ind) {
                          return ind != 0
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                      Row(children: [
                                        Column(
                                          children: List.generate(
                                            3,
                                            (ii) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Container(
                                                  height: 3,
                                                  width: 2,
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          color: Colors.grey.withAlpha(60),
                                          height: 0.5,
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 20,
                                          ),
                                        ))
                                      ]),
                                      Row(children: [
                                        Icon(Icons.location_on,
                                            color: list[ind].color),
                                        Text(list[ind].address,
                                            style: TextStyle(
                                                color: list[ind].color))
                                      ])
                                    ])
                              : Row(children: [
                                  Icon(Icons.location_on,
                                      color: list[ind].color),
                                  Text(list[ind].address,
                                      style: TextStyle(color: list[ind].color))
                                ]);
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
