import 'package:bharatrides_ui/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CrossFeedbackDialog extends StatelessWidget {
  const CrossFeedbackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.black,
      title: const Text(
        "How was your latest ride?",
        style: TextStyle(color: Colors.white),
      ),
      titlePadding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 2,
          left: SizeConfig.safeBlockVertical * 2,
          bottom: SizeConfig.safeBlockVertical),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical,
              vertical: SizeConfig.safeBlockVertical),
          child: Center(
            child: Text("Rate your Co-rider",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 195, 195), fontSize: 15)),
          ),
        ),
        Center(
            child: SmoothStarRating(
          size: 35,
          color: Colors.amber,
          allowHalfRating: true,
          borderColor: Colors.white,
          defaultIconData: Icons.directions_bike,
          // halfFilledIconData: HalfFilledIcon(
          //     color: Colors.amber,
          //     icon: Icons.directions_bike,
          //     size: 5),
          filledIconData: Icons.directions_bike,
          spacing: 10,
        )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical,
              vertical: SizeConfig.safeBlockVertical),
          child: Center(
            child: Text("Riding experience",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 195, 195), fontSize: 15)),
          ),
        ),
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockVertical),
            child: Center(
                child: RatingBar.builder(
              glow: false,
              unratedColor: Colors.grey,
              initialRating: 3,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return Icon(Icons.close);
                }
              },
              onRatingUpdate: (rating) {},
            ))),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 2,
              vertical: SizeConfig.safeBlockVertical * 2),
          child: Align(
            alignment: Alignment(0, SizeConfig.safeBlockVertical * -0.09),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
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
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockVertical * 2,
              vertical: SizeConfig.safeBlockVertical * 1),
          child: Center(
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
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  )),
              child: const Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}
