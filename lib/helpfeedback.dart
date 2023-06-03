// import 'dart:js';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
//import 'halffilledicon.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';

class FeedBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Help and FeedBack"),
          backgroundColor: Colors.black,
        ),
        body: Container(
            child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    child: AlertDialog(
                      backgroundColor: Colors.black,
                      title: const Text(
                        "How was your latest ride?",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Rate your Co-rider",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 197, 195, 195),
                                    fontSize: 15)),
                          ),
                        ),
                        Center(
                            child: SmoothStarRating(
                          size: 35,
                          color: Colors.lightGreen,
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
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: const AlertDialog(
                                          title: Text(
                                              "Feedback Submitted Successfully!"),
                                          actions: <Widget>[
                                            Center(
                                                child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.done),
                                            ))
                                          ],
                                        ),
                                      );
                                    });
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
                    ),
                  );
                });
          },
          child: Text("Feedback"),
        )));
  }
}
