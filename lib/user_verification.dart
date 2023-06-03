import 'package:flutter/material.dart';
import '../sizeConfig.dart';

List<int> _loading = [0, 0, 0];

class UserVerification extends StatefulWidget {
  static var id = "UserVerification";

  const UserVerification({Key? key}) : super(key: key);

  @override
  _UserVerificationState createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  Future<void> _DetailsError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          content: SizedBox(
              height: SizeConfig.safeBlockVertical * 8,
              width: SizeConfig.safeBlockHorizontal * 45,
              child: const Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'Please fill the details correctly!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito Sans',
                        fontSize: 17.5),
                  ),
                ),
              )),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.safeBlockHorizontal * 16,
                  child: const Card(
                    color: Colors.black,
                    elevation: 5,
                    child: Center(
                      child: Text(
                        'OK',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito Sans',
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: Scaffold(
          body: SizedBox(
            height: SizeConfig.safeBlockVertical * 100,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 8,
                  ),
                  const Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Nunito Sans',
                        fontSize: 21),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.75,
                  ),
                  const Text(
                    'Please fill the details.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito Sans',
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: SizeConfig.safeBlockVertical * 3.5,
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'AADHAAR NUMBER',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito Sans',
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 55,
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito Sans',
                                fontSize: 15),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: '12 digit Aadhaar uid',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 15,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _loading[0] ^= 1;
                            });
                          },
                          child: Material(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.black,
                                child: Center(
                                    child: _loading[0] == 0
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : SizedBox(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            height:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.75,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: SizeConfig.safeBlockVertical * 3.5,
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'Driving Licence ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito Sans',
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 55,
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito Sans',
                                fontSize: 15),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'DL number',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 15,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _loading[1] ^= 1;
                            });
                          },
                          child: Material(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.black,
                                child: _loading[1] == 0
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : SizedBox(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 5,
                                        height:
                                            SizeConfig.safeBlockHorizontal * 5,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.75,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: SizeConfig.safeBlockVertical * 3.5,
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: const Text(
                      'Registration Certificate',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito Sans',
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 55,
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito Sans',
                                fontSize: 15),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'RC number',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.75,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6.5,
                        width: SizeConfig.safeBlockHorizontal * 15,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _loading[2] ^= 1;
                            });
                          },
                          child: Material(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.black,
                                child: Center(
                                    child: _loading[2] == 0
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : SizedBox(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            height:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
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
