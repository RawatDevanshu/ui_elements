import 'package:bharatrides_ui/services/api_otp_methods.dart';
import 'package:bharatrides_ui/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PilotPopupDialog extends StatelessWidget {
  PilotPopupDialog({super.key});
  void validateInput(BuildContext context) async {
    var _apiResponse =
        await OtpMethods().validateOtp(otp: int.parse(otpController.text));
    if (_apiResponse.body == "true") {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ride Started"),
          duration: Duration(seconds: 2),
        ),
      );
    } else if (_apiResponse.body == "false") {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("wrong otp"),
        duration: Duration(milliseconds: 2000),
      ));
    }
  }

  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScaffoldMessenger(
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Color.fromARGB(255, 227, 227, 227),
            title: Row(children: [
              const Text(
                "Enter code shared by rider",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NunitoSans',
                    fontSize: 20),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 15,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 7,
                width: SizeConfig.safeBlockHorizontal * 7,
                child: FloatingActionButton(
                  elevation: 3,
                  backgroundColor: Color.fromARGB(255, 172, 172, 172),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: SizeConfig.safeBlockVertical * 2,
                  ),
                ),
              ),
            ]),
            insetPadding: EdgeInsets.all(SizeConfig.safeBlockVertical * 3),
            titlePadding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical,
              left: SizeConfig.safeBlockVertical * 2,
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1),
                child: Center(
                  child: Pinput(
                    controller: otpController,
                    defaultPinTheme: PinTheme(
                        width: SizeConfig.safeBlockHorizontal * 15,
                        height: SizeConfig.safeBlockVertical * 7,
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NunitoSans',
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.059),
                              offset: Offset(0, 3),
                              blurRadius: 16,
                            )
                          ],
                        )),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      validateInput(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text(
                      "Start Ride!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
