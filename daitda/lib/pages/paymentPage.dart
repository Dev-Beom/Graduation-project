import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
//  Design Setting.
  final designSet = Get.put(DESIGNS.DesignSet());
  final colorSet = DESIGNS.ColorSet();

  //  Controller Setting.
  final progressData = Get.put(CONTROLLERS.ProgressData());

  /*
   * 현재 페이지의 인덱스와 이를 바탕으로 계산될 프로그래스의 인덱스입니다.
   * 
   * The index of the current page and the progress that will be calculated based on it.
   */
  static double thisPageIndex;
  static double thisPageProgressIndex;

  @override
  void initState() {
    /*
     * 현재 페이지의 인덱스.
     * 
     * The index of the current page.
     */
    thisPageIndex = 2;
    thisPageProgressIndex = 0.2 * (thisPageIndex + 1);

    /*
     * 현재 페이지의 인덱스를 사용하여 구성합니다.
     * 
     * Configure using the index on the current page.
     */
    progressData.setData(thisPageProgressIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                renderLogoArea(),
                renderProgressArea(),
              ],
            ),
            Row(
              children: [
                renderPaymentArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLogoArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.logoAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getLogoAreaWidth(),
      height: designSet.getLogoAreaHeight(),
    );
  }

  Widget renderProgressArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.progressAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getProgressAreaWidth(),
      height: designSet.getProgressAreaHeight(),
      child: Column(
        children: [
          UICOMPONENTS.AnimatedLiquidLinearProgressIndicator(),
          UICOMPONENTS.ProcessBar(
            index: thisPageIndex.toInt(),
          ),
        ],
      ),
    );
  }

  Widget renderPaymentArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.mainAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getPaymentAreaWidth(),
      height: designSet.getPaymentAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainCardMackgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FlatButton(
            child: Text('AD',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/cameraPage');
            },
          ),
        ),
      ),
    );
  }
}
