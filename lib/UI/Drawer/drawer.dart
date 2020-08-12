import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:pharmassist/UI/Drawer/settings.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import 'package:pharmassist/UI/patient/pat.dart';
import 'package:pharmassist/UI/preparation/prep.dart';
import 'package:provider/provider.dart';
import '../accueil.dart';
import 'package:response/response.dart';

import 'theme.dart';

import 'package:intl/intl.dart';
const blue = Color(0xff57D9F8);
const bluefonce = Color(0xff5EAED1);



class drawer extends StatelessWidget {
  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [bluefonce,blue]),
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 12, top: 12),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () =>Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size:response.setFontSize( 40),
                      ),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: new Container(
                        margin: EdgeInsets.only(top: 0, bottom: 30),
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        height: double.infinity,
                        width: double.infinity,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color:Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(180),
                              bottomLeft: Radius.circular(180)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                "assests/images/logoblue.png",
                                height:response.setHeight(110) ,
                                width: response.setWidth(110),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text("PharmAssist",
                                  style: TextStyle(
                                      fontSize:response.setFontSize( 25),
                                      fontFamily: 'primus',
                                      fontWeight: FontWeight.w600)),
                            ),
                            fontion(FrinoIcons.f_home, "Accueil", () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => accueil()))),
                            fontion(FrinoIcons.f_medicine, "Medicaments", ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => med())),),
                            fontion(FrinoIcons.f_male, "Patients", () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>pat()))),
                            fontion(FrinoIcons.f_lab, "Préparations", () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => prep()))),
                           fontion(FrinoIcons.f_cog, "Paramétre", () =>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => settings()))),

                           fontion(FrinoIcons.f_question, "Aide", () => {}),
                            fontion(FrinoIcons.f_share, "Partagez PharmAssist",
                                () => {}),
                            fontion(FrinoIcons.f_star_filled, "Rate nous",
                                () => {}),
                          ],
                        ),
                      ))
                ]))));
  }
}

class fontion extends StatelessWidget {
  final response = ResponseUI.instance;
  String text;
  IconData icon;
  Function tap;
  fontion(this.icon, this.text, this.tap);
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 70, top: 15),
      child: GestureDetector(
        onTap: tap,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: response.setFontSize(24),
              color: bluefonce,
            ),
            SizedBox(
              width:response.setWidth(10),
            ),
            Text(
              text,
              style: TextStyle(fontFamily: 'primus', fontSize: response.setFontSize(23)),
            ),
          ],
        ),
      ),
    ));
  }
}
//
//
//
//
//
//
//
