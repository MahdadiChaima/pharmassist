import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/SpecificWidget/CirculerCheckBox.dart';
import 'package:pharmassist/UI/medicament/ajoutmed1.dart';
import 'package:pharmassist/UI/patient/ajoutpat.dart';
import 'package:pharmassist/UI/patient/pat_details.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'package:pharmassist/UI/constant.dart';
const Color bluefonce = Color(0xff5EAED1);
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);

class etatsdesreliquats extends StatefulWidget {

 @override
  _etatsdesreliquatsState createState() => _etatsdesreliquatsState();
}
class _etatsdesreliquatsState extends State<etatsdesreliquats> {
  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //height:double.infinity ,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft, colors: [bluefonce, blue]),
            ),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12, top: 12),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
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
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(180),
                        topLeft: Radius.circular(0),
                        //bottomLeft: Radius.circular(180)
                      ),
                    ),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Reliquats",
                            style: TextStyle(
                                fontSize: response.setFontSize(28),
                                fontFamily: 'primus',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: response.setHeight(60),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircleRedORGreen(Colors.green),
                                      StylofText("  stable", 22),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      CircleRedORGreen(Colors.red),
                                      StylofText("  périmé", 22),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: response.setHeight(10)),
                        ContainerDrugPrimeStable(
                            "namedrug", "20ml", Colors.red),
                        ContainerDrugPrimeStable(
                            "namedrug", "20ml", Colors.green)
                      ],
                    ),
                  )),
            ])));
  }
}

class ContainerDrugPrimeStable extends StatelessWidget {
  final response = ResponseUI.instance;
  ContainerDrugPrimeStable(this.text1, this.text2, this.color);
  String text1, text2;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: response.setHeight(60),
        width: response.setWidth(200),
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 20),
        decoration:
            BoxDecoration(color: gris, borderRadius: BorderRadius.circular(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StylofText(text1, 23, Colors.black),
              Row(
                children: <Widget>[
                  StylofText(text2, 20, Colors.black),
                  SizedBox(
                    width: response.setWidth(10),
                  ),
                  CircleRedORGreen(color),
                ],
              ),
            ]));
  }
}

class CircleRedORGreen extends StatelessWidget {
  CircleRedORGreen(this.color);
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
      ),
    );
  }
}
