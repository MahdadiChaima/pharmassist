import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/patient/pat.dart';
import 'package:pharmassist/model/pation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../main.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import '../constant.dart';

final TextEditingController nompat = new TextEditingController();
final TextEditingController prenompat = new TextEditingController();
final TextEditingController surfacecpat = new TextEditingController();
const Color bluefonce = Color(0xff5EAED1);
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);

class ajoutpat extends StatefulWidget {
  @override
  _ajoutpatState createState() => _ajoutpatState();
}

class _ajoutpatState extends State<ajoutpat> {
  final TextEditingController poid1 = new TextEditingController();
  final TextEditingController taille1 = new TextEditingController();
  final response = ResponseUI.instance;
  effacer() {
    nompat.clear();
    prenompat.clear();
    surfacecpat.clear();
  }

  double CalculSC() {
    double Sc = 0.0;
    double taille = double.parse(taille1.text);
    double poid = double.parse(poid1.text);
    if (double.parse(taille1.text).toString().isNotEmpty &&
        double.parse(poid1.text).toString().isNotEmpty)
      return double.parse(sqrt(poid * taille / 3600).toStringAsFixed(3));
    return 0.0;
  }

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
                            "Nouveau Patient",
                            style: TextStyle(
                                fontSize: response.setFontSize(34),
                                fontFamily: 'primus',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: response.setHeight(100),
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Column(children: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    StylofText("Nom", 20),
                                    Container(
                                        height: response.setHeight(50),
                                        width: response.setWidth(200),
                                        decoration: BoxDecoration(
                                            color: gris,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextField(
                                          controller: nompat,
                                        ))
                                  ]),
                              SizedBox(
                                height: response.setHeight(25),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    StylofText("Prenom", 20),
                                    Container(
                                        height: response.setHeight(50),
                                        width: response.setWidth(200),
                                        decoration: BoxDecoration(
                                            color: gris,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextField(
                                          controller: prenompat,
                                        ))
                                  ]),
                              SizedBox(
                                height: response.setHeight(25),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    StylofText("Surface C", 20),
                                    Container(
                                        height: response.setHeight(50),
                                        width: response.setWidth(200),
                                        decoration: BoxDecoration(
                                            color: gris,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextField(
                                          controller: surfacecpat,
                                          keyboardType: TextInputType.number,
                                        ))
                                  ]),
                              SizedBox(
                                height: response.setHeight(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () => {
                                            Alert(
                                              context: context,
                                              image: Image.asset(
                                                "assests/images/logoblue.png",
                                                height: response.setHeight(110),
                                                width: response.setWidth(110),
                                              ),
                                              title:
                                                  "Calculer Surface Corporelle",
                                              content: Column(
                                                children: <Widget>[
                                                  TextField(
                                                    controller: taille1,
                                                    decoration: InputDecoration(
                                                      labelText: 'Taille: Cm',
                                                    ),
                                                  ),
                                                  TextField(
                                                    controller: poid1,
                                                    // obscureText: true,
                                                    decoration: InputDecoration(
                                                      labelText: 'Poid:Kg',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      double Sc = CalculSC();
                                                      surfacecpat.text = "$Sc";
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text(
                                                    "Oui",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  color: Color(0xff57D9F8),
                                                ),
                                                DialogButton(
                                                  child: Text(
                                                    "Non",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  color: Colors.black26,
                                                )
                                              ],
                                            ).show()
                                          },
                                      child: Container(
                                        child: Text(
                                          "Calculer",
                                          style: TextStyle(
                                              fontSize:
                                                  response.setFontSize(22),
                                              fontFamily: 'primus',
                                              color: blue),
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                ],
                              )
                            ])),
                        SizedBox(
                          height: response.setHeight(150),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
        Text(""),
                            FloatingActionButton(
                              backgroundColor: blue,
                              heroTag: "sot page",
                              onPressed: () => {
                                if (nompat.text.isNotEmpty &&
                                    prenompat.text.isNotEmpty &&
                                    surfacecpat.text.isNotEmpty)
                                  {
                                    Alert(
                                      context: context,
                                      image: Image.asset(
                                        "assests/images/logoblue.png",
                                        height: response.setHeight(110),
                                        width: response.setWidth(110),
                                      ),
                                      title:
                                          "Est ce que vous etes  sur des informations que vous allez écrire",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Oui",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () async {
                                            /*for(int i=0;i<pats.length;i++) {

                                     selected_id_Pation=Paction.fromMap(pats[i]).idPation;}

                                   selectPaction= await db.getPation(selected_id_Pation);
                                   print("id Pation: $selected_id_Pation");*/

                                            if (pat_modif == null) {
                                              db.savePation(new Paction(
                                                nompat.text,
                                                prenompat.text,
                                                double.parse(surfacecpat.text),
                                              ));
                                              nompat.clear();
                                              prenompat.clear();
                                              surfacecpat.clear();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          pat()));
                                            } else {
                                              Paction patUpdated =
                                                  Paction.fromMap({
                                                'idPation': updated_id_Pation,
                                                'nomPation': nompat.text,
                                                'prenomPation': prenompat.text,
                                                'surfaceC': double.parse(
                                                    surfacecpat.text),
                                              });
                                              await db.updatePation(patUpdated);
                                              nompat.clear();
                                              prenompat.clear();
                                              surfacecpat.clear();
                                              pat_modif = null;
                                              updated_id_Pation = null;

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          pat()));
                                            }
                                          },
                                          color: Color(0xff57D9F8),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "Non",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color: Colors.black26,
                                        )
                                      ],
                                    ).show()
                                  }
                                else
                                  {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title:
                                          " Vous devez remplir tout les champs ",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Annuler",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                          color: Colors.black26,
                                        )
                                      ],
                                    ).show()
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
            ])));
  }
}
