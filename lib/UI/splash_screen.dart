import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'signIn.dart';
import 'package:response/response.dart';
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);

class splash_screen extends StatefulWidget {
  @override
  _splash_screenState createState() => _splash_screenState();
}
class _splash_screenState extends State<splash_screen> {
  final response = ResponseUI.instance;
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => signIn()));
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [bluefonce,blue]),
    ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [bluefonce,blue]),
          )),
         new Container(
           width:double.infinity,
            height:response.setHeight(450),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(340),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(340)),
            ),
          ),
          new Container(
              child: Image.asset(
            "assests/images/splash.png",
            width:response.setWidth(550),
          )),
        ],
      ),
    ));
  }
}
