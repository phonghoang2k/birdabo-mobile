import 'dart:async';

import 'package:birdablo_mobile/app/home/explore/components/common-button/common-button.component.dart';
import 'package:birdablo_mobile/app/home/explore/components/custom-expansion/custom-expansion.component.dart';
import 'package:birdablo_mobile/app/home/home.module.dart';
import 'package:birdablo_mobile/app/home/tickets/tickets.module.dart';
import 'package:birdablo_mobile/config/application.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/tickets/tickets.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  StreamSubscription<NDEFMessage> _stream;

  @override
  void initState() {
    _toggleScan();
    super.initState();
  }

  Future<void> _startScanning() async {
    Application.toast.showToastNotification("Scanning Reader for Payment");
    setState(() {
      _stream = NFC.readNDEF(alertMessage: "Custom message with readNDEF#alertMessage").listen(
        (NDEFMessage message) {
          if (message.isEmpty) {
            Application.toast.showToastNotification("Read empty NDEF message");
            return;
          }
          Application.toast.showToastNotification("Read NDEF message with ${message.records.length} records");
          for (NDEFRecord record in message.records) {
            Application.toast.showToastSuccess(
                "Record '${record.id ?? "[NO ID]"}' with TNF '${record.tnf}', type '${record.type}', payload '${record.payload}' and data '${record.data}' and language code '${record.languageCode}'");
          }
        },
        onError: (error) {
          setState(() => _stream = null);
          if (error is NFCUserCanceledSessionException) {
            Application.toast.showToastFailed("user canceled");
          } else if (error is NFCSessionTimeoutException) {
            Application.toast.showToastFailed("session timed out");
          } else {
            Application.toast.showToastFailed("error: $error");
          }
        },
        onDone: () => setState(() => _stream = null),
      );
    });
    // fire after 4 second: simulate connected via NFC payment
    if (await NFC.isNDEFSupported) {
      Future.delayed(Duration(seconds: 4), _startAuthenticateNFC);
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
        return Modular.link.pushNamed(HomeModule.tickets + TicketsModule.nfcStatus);
      });
    }
  }

  void _stopScanning() => {_stream?.cancel(), setState(() => _stream = null)};

  void _toggleScan() => _stream == null ? _startScanning() : _stopScanning();

  Future<dynamic> _startAuthenticateNFC() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 11,
          content: SizedBox(
            width: SizeConfig.safeBlockHorizontal * 60,
            height: SizeConfig.safeBlockHorizontal * 50,
            child: Center(
              child: IntrinsicHeight(
                child: Column(children: [
                  CircularProgressIndicator(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  Text("Purchasing Ticket"),
                ]),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _stopScanning();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.safeBlockVertical * 4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(126, 182, 218, 0.3), Color.fromRGBO(216, 216, 216, 0)],
              )),
            ),
            CommonButton(
              elevation: 11,
              onPressed: () {},
              child: IntrinsicWidth(
                child: Row(
                  children: [
                    Image.asset("assets/images/tickets/physic-card.png", height: SizeConfig.safeBlockVertical * 3),
                    SizedBox(width: SizeConfig.safeBlockHorizontal),
                    Text("Request Physical Card".i18n)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              child: Text(
                "Your Ticket".i18n,
                style: TextStyle(fontSize: 40, color: Color(0xFF404040), fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 33,
              child: Swiper(
                itemCount: 2,
                itemBuilder: (context, index) => index == 0 ? frontCard() : qrCodeWidget(),
              ),
            ),
            CustomExpansionTile(
              title: Text("History".i18n, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFF4CA7F0))),
              // trailing: Card(
              //   shape: CircleBorder(side: BorderSide.none),
              //   child: Icon(Icons.keyboard_arrow_down, color: Color(0xFF2196F3)),
              // ),
              children: <Widget>[
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => ListTile(
                    leading: Image.asset("assets/images/tickets/cash.png", height: SizeConfig.safeBlockVertical * 3.5),
                    title: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Top Up".i18n),
                          Text(DateFormat("d/MM/yyyy - h:mm a").format(DateTime.now())),
                        ],
                      ),
                    ),
                    trailing: Text(
                      "+ ${NumberFormat.currency(locale: 'vi_VN', customPattern: "\đ###,###.#").format(69000)}",
                      style: TextStyle(color: Color(0xFF528DD5)),
                    ),
                    onTap: () {},
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: Color(0xFF545458),
                    indent: SizeConfig.safeBlockHorizontal * 3,
                    thickness: 0.5,
                  ),
                  itemCount: 5,
                )
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 10),
          ],
        ),
      ),
    );
  }

  Widget frontCard() => Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/tickets/mask.png"))),
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 15,
                  margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: CircleBorder(side: BorderSide.none),
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
                    child: Image.asset("assets/images/tickets/bus.png"),
                  ),
                ),
              ),
              Center(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Text("BALANCE".i18n, style: TextStyle(color: Color(0xFF21A1F3), fontWeight: FontWeight.w600, fontSize: 13)),
                      IntrinsicWidth(
                        child: Row(
                          children: [
                            Text("đ", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                            SizedBox(width: SizeConfig.safeBlockHorizontal),
                            Text(
                              "${NumberFormat.currency(locale: 'vi_VN', symbol: "").format(69000)}",
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 4, horizontal: SizeConfig.safeBlockHorizontal * 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                        IntrinsicHeight(
                          child: Column(
                            children: [
                              Text("MEMBER".i18n, style: TextStyle(color: Colors.white, fontSize: 13)),
                              Text("EXP 2/2030".i18n, style: TextStyle(color: Colors.white, fontSize: 13)),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        Spacer(),
                        CommonButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3),
                            child: Text("Top Up"),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );

  Widget qrCodeWidget() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 11,
        color: Color.fromRGBO(255, 255, 255, 0.95),
        shadowColor: Color.fromRGBO(191, 221, 255, 0.5),
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3, vertical: SizeConfig.safeBlockVertical * 2),
        child: Container(
          margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
          alignment: Alignment.center,
          child: QrImage(
            data: 'https://www.google.com.vn',
            version: QrVersions.auto,
            gapless: false,
          ),
        ),
      );
}
