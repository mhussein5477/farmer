import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmer/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF00C853);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(

        resizeToAvoidBottomPadding: false,
        body: Container(
          width: _width,
          height: _height,
          color: primaryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                children: <Widget>[


                  Padding(
                    padding: const EdgeInsets.only(top:38.0),
                    child: Text(
                      "E-Farm.",
                      style: TextStyle(fontSize: 42, color: Colors.white , fontWeight: FontWeight.w600,),
                    ),
                  ),
                  SizedBox(height: _height * 0.06),
                  AutoSizeText(
                    "Keep tracks of your daily produce, interact with other farmers and compute your produce with a click of a button.",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: _height * 0.1),
                  RaisedButton(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, bottom: 12.0, left: 30.0, right: 30.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/signUp");

                    },
                  ),
                  SizedBox(height: _height * 0.05),
                  RaisedButton(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, bottom: 12.0, left: 30.0, right: 30.0),
                      child: Text(
                        "Sign In",

                        style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      ),
                    ),

                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/signIn');
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
