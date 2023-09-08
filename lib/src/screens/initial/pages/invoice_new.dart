import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/initial/providers/invoice_providers.dart';
import 'package:provider/provider.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../../design/custom_icon.dart';

class InvoiceNew extends StatefulWidget {
  int id;

  InvoiceNew({required this.id, super.key});

  @override
  State<InvoiceNew> createState() => _InvoiceNewState();
}

class _InvoiceNewState extends State<InvoiceNew> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<InvoiceProvider>(context, listen: false)
        .getInvoice(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<InvoiceProvider>(context);

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
              'order_info'.tr(),
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
          child: invoice.invoice != null
              ? Consumer<InvoiceProvider>(builder: (_, invoicess, __) {
                  if (invoicess.isLoading == false) {
                    return SizedBox(
                      child: Zoom(
                        initTotalZoomOut: true,
                        maxZoomWidth: 1640,
                        maxZoomHeight: 3000,
                        backgroundColor: Colors.white,
                        colorScrollBars: Colors.grey,
                        opacityScrollBars: 0.3,
                        scrollWeight: 5.0,
                        // centerOnScale: true,
                        enableScroll: true,
                        doubleTapZoom: true,
                        zoomSensibility: 0.05,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 100, right: 100, top: 0, bottom: 60),
                          child: SizedBox(
                            // width: MediaQuery.of,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 200,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/logo.png',
                                              height: 300,
                                              width: 450,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              children: [
                                                CustomIcon(
                                                    title:
                                                        'assets/icons/phone.svg',
                                                    height: 24,
                                                    width: 24,
                                                    color:
                                                        AppColors.profilColor),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    '+99361 00 00 66 Batyr',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 24,
                                                        fontFamily: 'Roboto',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                      title:
                                                          'assets/icons/phone.svg',
                                                      height: 24,
                                                      width: 24,
                                                      color: AppColors
                                                          .profilColor),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      '+99365 67 77 67 Kakajan',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                      title:
                                                          'assets/icons/phone.svg',
                                                      height: 24,
                                                      width: 24,
                                                      color: AppColors
                                                          .profilColor),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      '+99365 49 94 46 Berdi',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
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
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 60),
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'Urumçi-Türkmenistan \n 新疆乌鲁木齐市天山区延安路边疆宾馆106库房 \n 收货人：吴慧 +8618699106778 Наташа Урумчи',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            SizedBox(
                                              // width: 480,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'Guanjou-Urumçi-Türkmenistan \n +8618699106778 广州市 白云区 石井镇 \n 鸦岗大道 安发货运市场 A9栋69-70号 鑫唯达物流 \n 收货人: 吴劲松 +8613352898456 Гуанчжоу',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Container(
                                      height: 1.5,
                                      color: Colors.black,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          invoice.invoice?.date ?? "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          invoice.invoice?.ticketId ?? "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          invoice.invoice?.pointFrom ?? "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          invoice.invoice?.pointTo ?? "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            invoice.invoice?.providerPhone ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            invoice.invoice?.trackCode ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            invoice.invoice?.customersName ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Text(
                                          '+993${invoice.invoice?.customersPhone}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        right: 0,
                                        left: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 210,
                                          child: Text(
                                            'Harydyn ady',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 80),
                                          child: SizedBox(
                                            width: 140,
                                            child: Text(
                                              'Gap görnüş',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 195),
                                          child: Center(
                                            child: SizedBox(
                                              child: Text(
                                                'Ölçeg',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 185),
                                          child: SizedBox(
                                            width: 540,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 0),
                                                  child: SizedBox(
                                                    // width: 110,
                                                    child: Text(
                                                      'Ýer san',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 0),
                                                  child: SizedBox(
                                                    // width: 110,
                                                    child: Text(
                                                      'Kub',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 0),
                                                  child: Text(
                                                    'KG',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 24,
                                                        fontFamily: 'Roboto',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: SizedBox(
                                                    // width: 150,
                                                    child: Text(
                                                      textAlign: TextAlign.end,
                                                      'Baha',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          invoice.invoice!.cargoItems.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var name = invoice.invoice!
                                            .cargoItems[index].productName;
                                        name = name.replaceAll('', '\u200B');
                                        return Column(
                                          children: [
                                            Container(
                                              height: 1.5,
                                              color: Colors.black,
                                              // width: MediaQuery.of(context).size.width,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 12,
                                                  right: 0,
                                                  bottom: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Builder(builder: (context) {
                                                    return SizedBox(
                                                      width: 210,
                                                      child: Text(
                                                        // invoice
                                                        //         .invoice
                                                        //         ?.cargoItems[index]
                                                        //         .productName ??
                                                        //     "",
                                                        name,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    );
                                                  }),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 80),
                                                    child: SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        invoice
                                                                .invoice
                                                                ?.cargoItems[
                                                                    index]
                                                                .typePackagingId ??
                                                            "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 35,
                                                  ),
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      invoice
                                                              .invoice
                                                              ?.cargoItems[
                                                                  index]
                                                              .packingSizeFirst
                                                              .toString() ??
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      invoice
                                                              .invoice
                                                              ?.cargoItems[
                                                                  index]
                                                              .packingSizeMiddle
                                                              .toString() ??
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      invoice
                                                              .invoice
                                                              ?.cargoItems[
                                                                  index]
                                                              .packingSizeLast
                                                              .toString() ??
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontFamily: 'Roboto',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 65),
                                                    child: SizedBox(
                                                      width: 510,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0),
                                                            child: SizedBox(
                                                              // width: 100,
                                                              child: Text(
                                                                invoice
                                                                        .invoice
                                                                        ?.cargoItems[
                                                                            index]
                                                                        .numberOfSeats
                                                                        .toString() ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        24,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 70),
                                                            child: SizedBox(
                                                              width: 90,
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                invoice
                                                                        .invoice
                                                                        ?.cargoItems[
                                                                            index]
                                                                        .cube
                                                                        .toString() ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        24,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 40),
                                                            child: SizedBox(
                                                              width: 90,
                                                              child: Text(
                                                                invoice
                                                                        .invoice
                                                                        ?.cargoItems[
                                                                            index]
                                                                        .kg
                                                                        .toString() ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        24,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0),
                                                            child: SizedBox(
                                                              width: 90,
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                invoice
                                                                        .invoice
                                                                        ?.cargoItems[
                                                                            index]
                                                                        .totalPrice
                                                                        .toString() ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        24,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //   height: 1.5,
                                            //   color: Colors.black,
                                            //   // width: MediaQuery.of(context).size.width,
                                            // ),
                                          ],
                                        );
                                      }),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          invoice.invoice?.consumptionName
                                                  .toString() ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          invoice.invoice?.consumptionPrice
                                                  .toString() ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Jemi ýer: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              invoice.invoice?.summarySeats
                                                      .toString() ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Jemi m³: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryCube
                                                      .toString() ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Jemi kg: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryKg
                                                      .toString() ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Jemi baha:  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryPrice
                                                      .toString() ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 200,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
