import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kargo_app/src/screens/initial/pages/search_info.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../../auth/login/login_screen.dart';
import '../../auth/register/register_screen.dart';

import '../model/search_model.dart';
import '../repository/search_repository.dart';
import '../repository/ticket_repository.dart';

class SearchScreen extends StatefulWidget {
  final FocusNode focusNode;
  const SearchScreen({required this.focusNode, super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchRepository apiService = SearchRepository();
  final TextEditingController searchController = TextEditingController();

  SearchModel? searchResult;

  void performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResult = null;
      });
      return;
    }
    try {
      final results = await apiService.seaching(query);
      setState(() {
        searchResult = results;
      });
    } catch (error) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(widget.focusNode);
    int t = 0;

    int? l = searchResult?.points.length;
    if (searchResult?.points != null) {
      for (var i = 0; i < searchResult!.points.length; i++) {
        if (searchResult!.points[i].isCurrent != 0) {
          t = i;
        }
      }
    }

    // var name = widget.model.ticketCode;
    // name = name.replaceAll('', '\u200B');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
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
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
            toolbarHeight: 50,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 0,
                      bottom: 10,
                    ),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 105,
                      decoration: BoxDecoration(
                          color: AppColors.searchColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: CustomIcon(
                                title: 'assets/icons/searchnormal1.svg',
                                height: 20,
                                width: 20,
                                color: AppColors.profilColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 200,
                                child: TextFormField(
                                  controller: searchController,
                                  focusNode: widget.focusNode,
                                  // onChanged: performSearch,
                                  onFieldSubmitted: performSearch,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: 'search'.tr(),
                                    hintStyle: const TextStyle(fontSize: 15),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('cancel'.tr()))
                  // IconButton(
                  //     padding: new EdgeInsets.all(0.0),
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     icon:
                  //     Icon(
                  //       Icons.arrow_back,
                  //       size: 33,
                  //       color: AppColors.profilColor,
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: searchResult != null
            ? Selector<SearchRepository, bool>(
                selector: (context, search) => search.isLoading,
                builder: (_, isLoading, __) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: isLoading == true
                        ? const CircularProgressIndicator()
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.borderColor, width: 1),
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
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            Text(
                                              searchResult?.ticketCode ?? '',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     CustomIcon(
                                        //         title: 'assets/icons/boxh.svg',
                                        //         height: 20,
                                        //         width: 20,
                                        //         color: AppColors.authTextColor),
                                        //     Text(
                                        //       'box'.trs,
                                        //       style: const TextStyle(
                                        //           color: Colors.black,
                                        //           fontSize: 16,
                                        //           fontFamily: 'Roboto',
                                        //           fontStyle: FontStyle.normal,
                                        //           fontWeight: FontWeight.w400),
                                        //     ),
                                        //     Text(
                                        //       searchResult?.summarySeats
                                        //               .toString() ??
                                        //           '',
                                        //       style: const TextStyle(
                                        //           color: Colors.black,
                                        //           fontSize: 16,
                                        //           fontFamily: 'Roboto',
                                        //           fontStyle: FontStyle.normal,
                                        //           fontWeight: FontWeight.w400),
                                        //     ),
                                        //   ],
                                        // ),
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
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 0),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searchResult?.date ?? '',
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .authTextColor,
                                                          fontSize: 14,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        searchResult
                                                                ?.pointFrom ??
                                                            '',
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.5),
                                                      child: Center(
                                                        child: Container(
                                                          height: 35,
                                                          width: 35,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: AppColors
                                                                .searchColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: CustomIcon(
                                                                title:
                                                                    'assets/icons/arrow_right.svg',
                                                                height: 20,
                                                                width: 20,
                                                                color: AppColors
                                                                    .authTextColor),
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
                                                    searchResult?.pointTo ?? '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
                                    child: searchResult!.points.isNotEmpty
                                        ? SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: searchResult
                                                            ?.points.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (con, index) {
                                                          // if () {
                                                          // t = index;
                                                          // }

                                                          if (searchResult
                                                                  ?.points !=
                                                              null) {
                                                            return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Visibility(
                                                                    visible: index ==
                                                                            0
                                                                        ? false
                                                                        : true,
                                                                    child: Row(
                                                                        children: [
                                                                          Row(
                                                                            children:
                                                                                List.generate(
                                                                              1,
                                                                              (ii) => Padding(
                                                                                  padding: const EdgeInsets.only(left: 3, right: 3, top: 7, bottom: 5),
                                                                                  child: Container(
                                                                                    height: 2.5,
                                                                                    width: MediaQuery.of(context).size.width / 9 - 5,
                                                                                    color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                  index != t
                                                                      ? Container(
                                                                          height:
                                                                              12,
                                                                          width:
                                                                              12,
                                                                          decoration: BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey),
                                                                        )
                                                                      : Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: [
                                                                            Center(
                                                                              child: Container(
                                                                                height: 40,
                                                                                width: 40,
                                                                                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor.withOpacity(0.1)),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 28,
                                                                              width: 28,
                                                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(4.0),
                                                                                child: CustomIcon(
                                                                                  title: t == 0
                                                                                      ? 'assets/icons/home.svg'
                                                                                      : t == searchResult!.points.length
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
                                                          } else {
                                                            return Container();
                                                          }
                                                        }),
                                                  ),
                                                )
                                              ],
                                            )
                                            // : const Text('Fucking'),
                                            )
                                        : SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Center(
                                                        child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0, right: 0),
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 6,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (con, index) {
                                                        return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Visibility(
                                                                visible:
                                                                    index == 0
                                                                        ? false
                                                                        : true,
                                                                child: Row(
                                                                    children: [
                                                                      FittedBox(
                                                                        child:
                                                                            Row(
                                                                          children:
                                                                              List.generate(
                                                                            1,
                                                                            (ii) => Padding(
                                                                                padding: const EdgeInsets.only(left: 3, right: 3, top: 7, bottom: 5),
                                                                                child: Container(
                                                                                  height: 2.5,
                                                                                  width: MediaQuery.of(context).size.width / 9 - 5,
                                                                                  color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              ),
                                                              index != t
                                                                  ? Container(
                                                                      height:
                                                                          12,
                                                                      width: 12,
                                                                      decoration: BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          color: index <= t && t >= 0
                                                                              ? AppColors.mainColor
                                                                              : Colors.grey),
                                                                    )
                                                                  : Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor.withOpacity(0.1)),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              28,
                                                                          width:
                                                                              28,
                                                                          decoration: const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: AppColors.mainColor),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(4.0),
                                                                            child:
                                                                                CustomIcon(
                                                                              title: t == 0
                                                                                  ? 'assets/icons/home.svg'
                                                                                  : t == l! - 1
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
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 7, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // width: MediaQuery.of(context).size.width /
                                          //         4 -
                                          //     30,
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: SizedBox(
                                                  // width: MediaQuery.of(context).size.width / 4 - 25,
                                                  child: Text(
                                                    searchResult?.summarySeats
                                                            .toString() ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  searchResult?.summaryCube
                                                          .toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily: 'Roboto',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                searchResult?.summaryPrice
                                                        .toString() ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              // color: AppColors.initialButtonColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12,
                                                top: 10,
                                                bottom: 10,
                                                right: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomIcon(
                                                    title:
                                                        'assets/icons/map_pin.svg',
                                                    height: 18,
                                                    width: 18,
                                                    color: AppColors.mainColor),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  searchResult?.location ?? '',
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.mainColor,
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            SharedPreferences preferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            String? val =
                                                preferences.getString('token');

                                            if (val != null) {
                                              showDalogdOrder(searchResult!.id);
                                            } else {
                                              showDalogdLogin();
                                            }

                                            // Navigator.of(context)
                                            //     .push(MaterialPageRoute(
                                            //         builder: (context) => SearchInfo(
                                            //               model: searchResult,
                                            //             )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10,
                                                    top: 10),
                                                child: Text(
                                                  'add_order'.tr(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SearchInfo(
                                                          model: searchResult,
                                                        )));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10,
                                                  top: 10),
                                              child: Text(
                                                'more_info'.tr(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                          ),
                  );
                })
            : Center(
                child: Lottie.asset(
                'assets/icons/search.json',
                width: MediaQuery.of(context).size.width - 100,
                height: 230,
                fit: BoxFit.fill,
              )),
      ),
    );
  }

  Future showDalogdOrder(int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'add_order_permision'.tr(),
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
                      InkWell(
                        onTap: () async {
                          TicketsRepository().tickedId(context, id);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Center(
                            child: Text(
                              'yes'.tr(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3 - 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                'no'.tr(),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future showDalogdLogin() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          title: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.info_sharp,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'add_order_alart'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Center(
                            child: Text(
                              'login'.tr(),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3 - 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.mainColor),
                            child: Center(
                              child: Text(
                                'create_account'.tr(),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
