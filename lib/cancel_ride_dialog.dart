import 'package:bharatrides_ui/sizeConfig.dart';
import 'package:flutter/material.dart';

class CancelFeedbackDialog extends StatelessWidget {
  const CancelFeedbackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      title: const Text(
        "Why do you want to cancel ride?",
        style: TextStyle(color: Colors.black),
      ),
      insetPadding: EdgeInsets.all(SizeConfig.safeBlockVertical * 3),
      titlePadding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
          left: SizeConfig.safeBlockVertical * 2,
          bottom: SizeConfig.safeBlockVertical),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 2,
              vertical: SizeConfig.safeBlockVertical * 2),
          child: Align(
            alignment: Alignment(0, SizeConfig.safeBlockVertical * -0.09),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Write your feedback...",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockVertical * 5,
                  bottom: SizeConfig.safeBlockVertical * 1),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor: Color.fromARGB(255, 227, 227, 227),
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans',
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockVertical * 10,
                  bottom: SizeConfig.safeBlockVertical * 1),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Feedback Submitted"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
