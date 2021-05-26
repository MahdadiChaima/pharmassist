import 'package:flutter/material.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import '../constant.dart';
import '../../main.dart';
import 'package:pharmassist/model/medicament.dart';

final TextEditingController ctrllaboratoire = new TextEditingController();
final TextEditingController ctrlnom = new TextEditingController();
final TextEditingController ctrlPresentation = new TextEditingController();
final TextEditingController ctrlflacon1 = new TextEditingController();
final TextEditingController ctrlstabilitecinitiale1 =
    new TextEditingController();
final TextEditingController ctrllumiere1 = new TextEditingController();
final TextEditingController ctrltemperature1 = new TextEditingController();
final TextEditingController ctrltemps1 = new TextEditingController();
final TextEditingController ctrlflacon2 = new TextEditingController();
final TextEditingController ctrlstabilitecinitiale2 =
    new TextEditingController();
final TextEditingController ctrllumiere2 = new TextEditingController();
final TextEditingController ctrltemperature2 = new TextEditingController();
final TextEditingController ctrltemps2 = new TextEditingController();
final TextEditingController ctrlflacon3 = new TextEditingController();
final TextEditingController ctrlstabilitecinitiale3 =
    new TextEditingController();
final TextEditingController ctrllumiere3 = new TextEditingController();
final TextEditingController ctrltemperature3 = new TextEditingController();
final TextEditingController ctrltemps3 = new TextEditingController();
final TextEditingController ctrlcinitiale = new TextEditingController();
final TextEditingController ctrlcminimale = new TextEditingController();
final TextEditingController ctrlcmaximale = new TextEditingController();
final TextEditingController ctrlprisdemg = new TextEditingController();
final TextEditingController ctrlvolume = new TextEditingController();
final TextEditingController ctrlqtedispo1 = new TextEditingController();
final TextEditingController ctrlVolumeFlacon1 = new TextEditingController();

const Color bluefonce = Color(0xff5EAED1);

const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);

class ajoutmed1 extends StatefulWidget {
  @override
  _ajoutmed1State createState() => _ajoutmed1State();
}

class _ajoutmed1State extends State<ajoutmed1> {
  final response = ResponseUI.instance;

  effacer() {
    setState(() {
      ctrllaboratoire.clear();
      ctrlnom.clear();

      ctrlflacon1.clear();
      ctrlstabilitecinitiale1.clear();
      ctrllumiere1.clear();
      ctrltemperature1.clear();
      ctrltemps1.clear();
      ctrlflacon2.clear();
      ctrlstabilitecinitiale2.clear();
      ctrllumiere2.clear();
      ctrltemperature2.clear();
      ctrltemps2.clear();

      ctrlflacon3.clear();
      ctrlstabilitecinitiale3.clear();
      ctrllumiere3.clear();
      ctrltemperature3.clear();
      ctrltemps3.clear();

      ctrlcinitiale.clear();
      ctrlcminimale.clear();
      ctrlcmaximale.clear();
      ctrlprisdemg.clear();
      ctrlvolume.clear();
      ctrlqtedispo1.clear();
      ctrlVolumeFlacon1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      onPressed: () => Navigator.of(context).push(
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
                                "Nouveau Médicament",
                                style: TextStyle(
                                    fontSize: response.setFontSize(28),
                                    fontFamily: 'primus',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(50),
                            ),
                            Container(
                              child: Text(
                                "  Nom",
                                style: TextStyle(
                                  fontSize: response.setFontSize(23),
                                  fontFamily: 'primus',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(8),
                            ),
                            Container(
                              height: response.setHeight(50),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBF1FA),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: ctrlnom,
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Container(
                              child: Text(
                                "  Laboratoire",
                                style: TextStyle(
                                    fontSize: response.setFontSize(23),
                                    fontFamily: 'primus'),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(8),
                            ),
                            Container(
                              height: response.setHeight(50),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xffEBF1FA),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: ctrllaboratoire,
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(35),
                            ),
                            SizedBox(
                              height: response.setHeight(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                StylofText("Présentations", 23),
                                FloatingActionButton(
                                  backgroundColor: blue,
                                  heroTag: "addpresentation",
                                  onPressed: () => {},
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        height: response.setHeight(50),
                                        width: response.setWidth(150),
                                        decoration: BoxDecoration(
                                            color: gris,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextField(
                                          controller: ctrlPresentation,
                                          keyboardType: TextInputType.number,
                                        )),
                                    StylofText("mg/ml", 20),
                                  ],
                                )),
                            SizedBox(
                              height: response.setHeight(15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                StylofText("Stabilité", 23),
                                FloatingActionButton(
                                  backgroundColor: blue,
                                  heroTag: "ajouti stabilite",
                                  onPressed: () => {},
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: response.setHeight(15),
                            ),
                            Container(
                              height: response.setHeight(50),
                              padding: EdgeInsets.all(5),
                              width: response.setWidth(200),
                              decoration: BoxDecoration(
                                  color: bluefonce,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StylofText2(
                                      "Flacon",
                                      response.setFontSize(20),
                                      FontWeight.w500,
                                      Colors.white),
                                  StylofText2("C.I", response.setFontSize(20),
                                      FontWeight.w700, Colors.white),
                                  StylofText2(
                                      "lumière",
                                      response.setFontSize(20),
                                      FontWeight.w700,
                                      Colors.white),
                                  StylofText2("°C", response.setFontSize(20),
                                      FontWeight.w700, Colors.white),
                                  StylofText2("Temps", response.setFontSize(20),
                                      FontWeight.w700, Colors.white)
                                ],
                              ),
                            ),
                            Container(
                              height: response.setHeight(180),
                              padding: EdgeInsets.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: gris,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrlflacon1)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrlstabilitecinitiale1,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrllumiere1)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemperature1,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemps1,
                                            keyboardType: TextInputType.number,
                                          ))
                                    ],
                                  ),
                                  /*   stylofText2(
                                          "$stabiliteCi", 20, FontWeight.w400),
                                      stylofText2(
                                          "$lumiere", 20, FontWeight.w400),
                                      stylofText2(
                                          "$stabiliteC", 20, FontWeight.w400),
                                      stylofText2("$temp", 20, FontWeight.w400),*/

                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      height: response.setHeight(2),
                                      width: double.infinity,
                                      color: bluefonce),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrlflacon2)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrlstabilitecinitiale2,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrllumiere2)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemperature2,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemps2,
                                            keyboardType: TextInputType.number,
                                          ))
                                    ],
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      height: response.setHeight(2),
                                      width: double.infinity,
                                      color: bluefonce),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrlflacon3)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrlstabilitecinitiale3,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                              controller: ctrllumiere3)),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemperature3,
                                            keyboardType: TextInputType.number,
                                          )),
                                      Container(
                                          height: response.setHeight(40),
                                          width: response.setWidth(50),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrltemps3,
                                            keyboardType: TextInputType.number,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(40),
                            ),
                            Container(
                                padding: EdgeInsets.all(15),
                                child: Column(children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(children: <Widget>[
                                        StylofText("Volume de Flacon", 20),
                                        SizedBox(
                                          height: response.setHeight(10),
                                        ),
                                        Container(
                                          height: response.setHeight(50),
                                          width: response.setWidth(150),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrlVolumeFlacon1,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ]),
                                      Column(children: <Widget>[
                                        StylofText("qte Disponible", 20),
                                        SizedBox(
                                          height: response.setHeight(10),
                                        ),
                                        Container(
                                          height: response.setHeight(50),
                                          width: response.setWidth(150),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            controller: ctrlqtedispo1,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ])),
                            SizedBox(
                              height: response.setHeight(40),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StylofText("C.initiale", 20),
                                  Container(
                                      height: response.setHeight(50),
                                      width: response.setWidth(200),
                                      decoration: BoxDecoration(
                                          color: gris,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextField(
                                        controller: ctrlcinitiale,
                                        keyboardType: TextInputType.number,
                                      ))
                                ]),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StylofText("C.minimale", 20),
                                  Container(
                                      height: response.setHeight(50),
                                      width: response.setWidth(200),
                                      decoration: BoxDecoration(
                                          color: gris,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextField(
                                        controller: ctrlcminimale,
                                        keyboardType: TextInputType.number,
                                      ))
                                ]),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StylofText("C.maximale", 20),
                                  Container(
                                      height: response.setHeight(50),
                                      width: response.setWidth(200),
                                      decoration: BoxDecoration(
                                          color: gris,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextField(
                                        controller: ctrlcmaximale,
                                        keyboardType: TextInputType.number,
                                      ))
                                ]),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                StylofText("Prix de mg", 20),
                                Container(
                                    height: response.setHeight(50),
                                    width: response.setWidth(200),
                                    decoration: BoxDecoration(
                                        color: gris,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextField(
                                      controller: ctrlprisdemg,
                                      keyboardType: TextInputType.number,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  StylofText("Volume", 20),
                                  Container(
                                      height: response.setHeight(50),
                                      width: response.setWidth(200),
                                      decoration: BoxDecoration(
                                          color: gris,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextField(
                                        controller: ctrlvolume,
                                        keyboardType: TextInputType.number,
                                      ))
                                ]),
                            SizedBox(
                              height: response.setHeight(25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  width: response.setWidth(160),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [bluefonce, blue]),
                                  ),
                                  child: FlatButton(
                                    onPressed: () => effacer(),
                                    child: Text(
                                      "Effacer",
                                      style: TextStyle(
                                          fontSize: response.setFontSize(24),
                                          fontFamily: 'primus',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  backgroundColor: blue,
                                  heroTag: "soti page",
                                  onPressed: () async {
                                    if (med_modif == null) {
                                      db.saveMed(new Medicament(
                                          ctrlnom.text,
                                          ctrllaboratoire.text,
                                          double.parse(ctrlPresentation.text),
                                          double.parse(ctrlcinitiale.text),
                                          double.parse(ctrlcminimale.text),
                                          double.parse(ctrlcmaximale.text),
                                          double.parse(ctrlprisdemg.text),
                                          double.parse(ctrlvolume.text),
                                          ctrlflacon1.text,
                                          double.parse(
                                              ctrlstabilitecinitiale1.text),
                                          ctrllumiere1.text,
                                          double.parse(ctrltemperature1.text),
                                          int.parse(ctrltemps1.text),
                                          ctrlflacon2.text,
                                          double.parse(
                                              ctrlstabilitecinitiale2.text),
                                          ctrllumiere2.text,
                                          double.parse(ctrltemperature2.text),
                                          int.parse(ctrltemps2.text),
                                          ctrlflacon3.text,
                                          double.parse(
                                              ctrlstabilitecinitiale3.text),
                                          ctrllumiere3.text,
                                          double.parse(ctrltemperature3.text),
                                          int.parse(ctrltemps3.text),
                                          double.parse(ctrlqtedispo1.text),
                                          double.parse(
                                              ctrlVolumeFlacon1.text)));
                                      ctrllaboratoire.clear();
                                      ctrlnom.clear();
                                      ctrlPresentation.clear();
                                      ctrlflacon1.clear();
                                      ctrlstabilitecinitiale1.clear();
                                      ctrllumiere1.clear();
                                      ctrltemperature1.clear();
                                      ctrltemps1.clear();
                                      ctrlflacon2.clear();
                                      ctrlstabilitecinitiale2.clear();
                                      ctrllumiere2.clear();
                                      ctrltemperature2.clear();
                                      ctrltemps2.clear();

                                      ctrlflacon3.clear();
                                      ctrlstabilitecinitiale3.clear();
                                      ctrllumiere3.clear();
                                      ctrltemperature3.clear();
                                      ctrltemps3.clear();
                                      ctrlcinitiale.clear();
                                      ctrlcminimale.clear();
                                      ctrlcmaximale.clear();
                                      ctrlprisdemg.clear();
                                      ctrlvolume.clear();
                                      ctrlqtedispo1.clear();
                                      ctrlVolumeFlacon1.clear();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  med()));
                                    } else {
                                      Medicament medUpdated =
                                          Medicament.fromMap({
                                        'idMed': updated_id_Med,
                                        'medicament': ctrlnom.text,
                                        'labo': ctrllaboratoire.text,
                                        'presentation':
                                            double.parse(ctrlPresentation.text),
                                        'ci': double.parse(ctrlcinitiale.text),
                                        'cmin':
                                            double.parse(ctrlcminimale.text),
                                        'cmax':
                                            double.parse(ctrlcmaximale.text),
                                        'volumeaprespreparation':
                                            double.parse(ctrlvolume.text),
                                        'pris': double.parse(ctrlprisdemg.text),
                                        'stabiliteflacon1': ctrlflacon1.text,
                                        'stabiliteCi1': double.parse(
                                            ctrlstabilitecinitiale1.text),
                                        'stabilitelumiere1': ctrllumiere1.text,
                                        'stabilitetemp1':
                                            int.parse(ctrltemps1.text),
                                        'stabiliteC1':
                                            double.parse(ctrltemperature1.text),
                                        'stabiliteflacon2': ctrlflacon2.text,
                                        'stabiliteCi2': double.parse(
                                            ctrlstabilitecinitiale2.text),
                                        'stabilitelumiere2': ctrllumiere2.text,
                                        'stabilitetemp2':
                                            int.parse(ctrltemps2.text),
                                        'stabiliteC2':
                                            double.parse(ctrltemperature2.text),
                                        'stabiliteflacon3': ctrlflacon3.text,
                                        'stabiliteCi3': double.parse(
                                            ctrlstabilitecinitiale3.text),
                                        'stabilitelumiere3': ctrllumiere3.text,
                                        'stabilitetemp3':
                                            int.parse(ctrltemps3.text),
                                        'stabiliteC3':
                                            double.parse(ctrltemperature3.text),
                                        'qteDiqponible1':
                                            double.parse(ctrlqtedispo1.text),
                                        'volumeFlacon1': double.parse(
                                            ctrlVolumeFlacon1.text),
                                      });
                                      await db.updateMed(medUpdated);

                                      ctrllaboratoire.clear();
                                      ctrlnom.clear();
                                      ctrlPresentation.clear();
                                      ctrlflacon2.clear();
                                      ctrlstabilitecinitiale2.clear();
                                      ctrllumiere2.clear();
                                      ctrltemperature2.clear();
                                      ctrltemps2.clear();

                                      ctrlflacon3.clear();
                                      ctrlstabilitecinitiale3.clear();
                                      ctrllumiere3.clear();
                                      ctrltemperature3.clear();
                                      ctrltemps3.clear();
                                      ctrlflacon1.clear();
                                      ctrlstabilitecinitiale1.clear();
                                      ctrllumiere1.clear();
                                      ctrltemperature1.clear();
                                      ctrltemps1.clear();
                                      ctrlcinitiale.clear();
                                      ctrlcminimale.clear();
                                      ctrlcmaximale.clear();
                                      ctrlprisdemg.clear();
                                      ctrlvolume.clear();
                                      ctrlqtedispo1.clear();
                                      ctrlVolumeFlacon1.clear();

                                      med_modif = null;
                                      updated_id_Med = null;

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  med()));
                                    }
                                  },
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ]))));
  }
}

class StylofText2 extends StatelessWidget {
  StylofText2(this.text, this.size, this.font, [this.color]);
  String text;
  double size;
  FontWeight font;
  Color color;

  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: response.setFontSize(size),
            fontFamily: 'primus',
            fontWeight: font,
            color: color));
  }
}

class stylofText1 extends StatelessWidget {
  stylofText1(this.text, this.size, this.font, [this.color = Colors.black]);
  String text;
  double size;
  FontWeight font;
  Color color;

  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: response.setFontSize(size),
            fontFamily: 'primus',
            fontWeight: font,
            color: color));
  }
}
