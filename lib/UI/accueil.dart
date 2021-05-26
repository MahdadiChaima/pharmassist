import 'package:flutter/material.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:pharmassist/UI/preparation/Statistiques.dart';
import 'package:pharmassist/UI/preparation/comptAncienPat.dart';
import 'package:pharmassist/UI/preparation/etatsdesreliquats.dart';
import 'Drawer/drawer.dart';
import 'package:response/response.dart';
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);
class accueil extends StatefulWidget {
  @override
  _accueilState createState() => _accueilState();
}
class _accueilState extends State<accueil> {
  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              //height:double.infinity ,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [bluefonce, blue]),
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 12, top: 12),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () =>
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => drawer())),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: response.setFontSize(40),
                      ),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: new Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0),
                        padding: EdgeInsets.all(20),
                        height: double.infinity,
                        width: double.infinity,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .canvasColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(180),
                            topLeft: Radius.circular(0),
                          ),
                        ),
                        child: ListView(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Accueil",
                                style: TextStyle(
                                    fontSize: response.setFontSize(38),
                                    fontFamily: 'primus',
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(60),
                            ),
                            stylofBottom( "assests/images/preparation.png", () =>
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => comptAncienPat())),"Nouvelle préparation"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),

                            stylofBottom( "assests/images/reliquat.png", () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => etatsdesreliquats())),"Etats des reliquats"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            stylofBottom( "assests/images/travail.png", () =>
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Statistiques())),"Statistiques"),
                          ],
                        ),
                      )),
                ]))));
  }
}


  class stylofBottom extends StatelessWidget {
  stylofBottom(this.image,this.onTap,this.text);
  String image;
  Function onTap;
  String text;
  FontWeight font=FontWeight.w600;
  final response = ResponseUI.instance;
  @override
  Widget build(BuildContext context) {
  return  GestureDetector(
    onTap: onTap,

    child: Container(
      height: response.setHeight(130),// response.setHeight(300),
      width: response.setWidth(200),
      decoration: BoxDecoration(   borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40)
      ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image:
            AssetImage(image,),
          )),
      child:Center(child:StylofText(text,34,Colors.white)),
    ),);
  }}














