import 'package:bharatrides_ui/cancel_ride_dialog.dart';
import 'package:bharatrides_ui/cross_feedback_dialog.dart';
import 'package:bharatrides_ui/main_ui/two.dart';
import 'package:bharatrides_ui/services/internet_connect.dart';
import 'package:bharatrides_ui/passenger_popup.dart';
import 'package:bharatrides_ui/pilot_popup.dart';
import 'package:bharatrides_ui/user_verification.dart';
import 'package:bharatrides_ui/wallet_screen.dart';
import 'package:flutter/material.dart';

class BtnScrn extends StatelessWidget {
  const BtnScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                isInternet().then((value) {
                  print(value);
                });
              },
              child: Text("Internet stat")),
          ElevatedButton(
              child: Text("Wallet"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WalletView()));
              }),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CrossFeedbackDialog();
                    });
              },
              child: Text("Cross feedback")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CancelFeedbackDialog();
                    });
              },
              child: Text("Ride cancel")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return PassengerPopupDialog();
                    });
              },
              child: Text("Passenger popup")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return PilotPopupDialog();
                    });
              },
              child: Text("Pilot popup")),
              ElevatedButton(
              child: Text("User Verification"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserVerification()));
              }),
              ElevatedButton(
              child: Text("Main ui(2)"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TwoWidget()));
              }),
        ]),
      ),
    );
  }
}
