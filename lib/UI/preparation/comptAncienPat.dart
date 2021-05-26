import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/Specific/dateFormatter.dart';
import 'package:pharmassist/UI/preparation/result.dart';
import 'package:pharmassist/Controller/calcul.dart';
import 'package:pharmassist/database/DatabaseHelper.dart';
import 'package:pharmassist/main.dart';
import 'package:pharmassist/model/medicament.dart';
import 'package:pharmassist/model/pation.dart';
import 'package:pharmassist/model/preparation.dart';
import 'package:pharmassist/model/reliquat.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'result.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String groupTemp = '';
int temp;

List<DropdownMenuItem> getDropDownItem_med() {
  List<DropdownMenuItem<String>> dropdownitems = [];
  for (int i = 0; i < meds.length; i++) {
    String currency = Medicament.fromMap(meds[i]).medicament;
    var newItem = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );
    dropdownitems.add(newItem);
  }
  return dropdownitems;
}

List<DropdownMenuItem> getDropDownItem_pation() {
  List<DropdownMenuItem<String>> dropdownitems = [];
  for (int i = 0; i < pats.length; i++) {
    String currency1 = Paction.fromMap(pats[i]).nomPation;
    String currency2 = Paction.fromMap(pats[i]).prenomPation;
    selected_item_idPation = Paction.fromMap(pats[i]).idPation;
    var newItem = DropdownMenuItem(
      child: Text("$currency1 $currency2"),
      value: currency1,
    );
    dropdownitems.add(newItem);
  }
  return dropdownitems;
}

class comptAncienPat extends StatefulWidget {
  double Surfacec;
  comptAncienPat({Key key, this.Surfacec}) : super(key: key);
  @override
  _comptAncienPatState createState() => _comptAncienPatState();
}

class _comptAncienPatState extends State<comptAncienPat> {
  final TextEditingController _ctrlPosologiemg = new TextEditingController();

  double calculDose() {
    double surface = selectPaction.surfaceC;
    double posologie = double.parse(_ctrlPosologiemg.text);

    return Dose(surface: surface, posologie: posologie);
  }

  double calculVolume() {
    double dose = calculDose();

    return Volume(dose: dose, ci: selectMed.ci);
  }

  double caculReliquat() {
    return Reliq(
        flacon: selectMed.volumeFlacon1,
        volume: calculVolume(),
       );
  }

  int caculnbrflacon() {
    return nbrFlacon(flacon: selectMed.volumeFlacon1, volume: calculVolume());
  }

  int calculpoch() {
    return choisipoche(
        dose: calculDose(), cmin: selectMed.cmin, cmax: selectMed.cmax);
  }

  int caculpris() {
    return prix(dose: calculDose(), pris: selectMed.pris);
  }

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
                      colors: [Color(0xff5EAED1), Color(0xff57D9F8)]),
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
                                "Espace travail",
                                style: TextStyle(
                                    fontSize: response.setFontSize(30),
                                    fontFamily: 'primus',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(60),
                            ),
                            Container(
                              child: Text(
                                "Patient:",
                                style: TextStyle(
                                  fontSize: response.setFontSize(23),
                                  fontFamily: 'primus',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(8),
                            ),
                            /* DropDownField(
                             value: id_Pation,

                                items: patient,
                                setter: (dynamic newValue) {
                                  id_Pation= newValue;
                                }
                            ),*/
                            FutureBuilder(
                              future: db.getAllPation(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  pats = snapshot.data;
                                  return DropdownButton<String>(
                                    focusColor: Colors.blue,
                                    hint: Text("sélectionner Patient "),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    iconSize: 39,
                                    isExpanded: true,
                                    elevation: 5,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                        fontFamily: 'primus',
                                        fontWeight: FontWeight.w400),
                                    items: getDropDownItem_pation(),
                                    value: null,
                                    onChanged: (value) async {
                                      setState(() {
                                        selected_item_pat = value;
                                      });

                                      selected_id_Pation = await db
                                          .getIdPation(selected_item_pat);
                                      selectPaction = await db
                                          .getPation(selected_id_Pation);
                                      print(
                                          "pation: $selected_id_Pation nomPation:${selectPaction.nomPation}");
                                    },
                                  );
                                }
                                return new CircularProgressIndicator();
                              },
                            ),
                            SizedBox(
                              height: response.setHeight(30),
                            ),
                            Container(
                              child: Text(
                                "Posologie:",
                                style: TextStyle(
                                  fontSize: response.setFontSize(23),
                                  fontFamily: 'primus',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(12),
                            ),
                            Container(
                              height: response.setHeight(50),
                              width: response.setWidth(150),
                              decoration: BoxDecoration(
                                  color: Color(0xffEBF1FA),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: _ctrlPosologiemg,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Format: mg/m²",
                                style: TextStyle(
                                  fontSize: response.setFontSize(18),
                                  fontFamily: 'primus',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(40),
                            ),
                            Container(
                              child: Text(
                                "Medicament:",
                                style: TextStyle(
                                    fontSize: response.setFontSize(23),
                                    fontFamily: 'primus'),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(12),
                            ),
                            FutureBuilder(
                              future: db.getAllMed(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  meds = snapshot.data;
                                  return DropdownButton<String>(
                                    focusColor: Colors.blue,
                                    hint: Text("sélectionner medicament "),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    iconSize: 39,
                                    isExpanded: true,
                                    elevation: 5,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                        fontFamily: 'primus',
                                        fontWeight: FontWeight.w400),
                                    items: getDropDownItem_med(),
                                    value: null,
                                    onChanged: (value) async {
                                      selected_id_Med =
                                          await db.getIdMed(value);
                                      selectMed =
                                          await db.getMed(selected_id_Med);
                                      print("Medicament: $selected_id_Med");
                                      setState(() {
                                        selected_item_med = value;
                                      });
                                    },
                                  );
                                }
                                return new CircularProgressIndicator();
                              },
                            ),
                            SizedBox(
                              height: response.setHeight(100),
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
                                        //begin: Alignment.centerLeft,
                                        colors: [
                                          Color(0xff5EAED1),
                                          Color(0xff57D9F8)
                                        ]),
                                  ),
                                  child: FlatButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                comptAncienPat())),
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
                                  backgroundColor: Color(0xff57D9F8),
                                  onPressed: () {
                                    if (_ctrlPosologiemg.text.isNotEmpty) {
                                      Alert(
                                        context: context,
                                        image: Image.asset(
                                          "assests/images/logoblue.png",
                                          height: response.setHeight(110),
                                          width: response.setWidth(110),
                                        ),
                                        title:
                                            "dites-moi d'abord comment conserver votre médicament et vous verrez votre résultat",
                                        //Voulez vous continuer et voir les résultat

                                        //desc: ",
                                        content: StatefulBuilder(
                                            // You need this, notice the parameters below:
                                            builder: (BuildContext context,
                                                StateSetter setState) {
                                          return Container(
                                              child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                      value: '1',
                                                      activeColor:
                                                          Color(0xff57D9F8),

                                                      groupValue: groupTemp,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupTemp = value;
                                                          temp = selectMed
                                                              .stabilitetemp1;
                                                        });
                                                      }),
                                                  Text(
                                                    " ${selectMed.stabiliteflacon1} ,C°: ${selectMed.stabiliteC1},Lum:${selectMed.stabilitelumiere1},Ci:${selectMed.stabiliteCi1} ",
                                                    style: TextStyle(
                                                      fontSize: response
                                                          .setFontSize(14),
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: 'primus',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                      value: '2',
                                                      activeColor:
                                                          Color(0xff57D9F8),
                                                      groupValue: groupTemp,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupTemp = value;
                                                          temp = selectMed
                                                              .stabilitetemp2;
                                                        });
                                                      }),
                                                  Text(
                                                    " ${selectMed.stabiliteflacon2} ,C°: ${selectMed.stabiliteC2},Lum:${selectMed.stabilitelumiere2},Ci:${selectMed.stabiliteCi2} ",
                                                    style: TextStyle(
                                                      fontSize: response
                                                          .setFontSize(14),
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: 'primus',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                      value: '3',
                                                      activeColor:
                                                          Color(0xff57D9F8),
                                                      groupValue: groupTemp,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupTemp = value;
                                                          temp = selectMed
                                                              .stabilitetemp3;
                                                        });
                                                      }),
                                                  Text(
                                                    " ${selectMed.stabiliteflacon3} ,C°: ${selectMed.stabiliteC3},Lum:${selectMed.stabilitelumiere3},Ci:${selectMed.stabiliteCi3} ",
                                                    style: TextStyle(
                                                      fontSize: response
                                                          .setFontSize(14),
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: 'primus',
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ));
                                        }),

                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Oui",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () async {
                                              int b;
                                              setState(() {
                                                int true1false0prime() {
                                                  if (datreliq(
                                                      datpreparatin:
                                                          DateTime.parse(
                                                              dateFormatter()),
                                                      hour: temp))
                                                    return 1;
                                                  else
                                                    return 0;
                                                }

                                                b = true1false0prime();
                                              });

                                              int prixreliq() {
                                                return prisjete(
                                                    reliq: caculReliquat(),
                                                    volume: calculVolume(),
                                                    pris: selectMed.pris,
                                                    dose: calculDose());
                                              }

                                              db.savePreparation(new Preparation(
                                                  "${selectPaction.nomPation}",
                                                  "${selectMed.medicament}",
                                                  dateFormatter(),
                                                  double.parse(
                                                      _ctrlPosologiemg.text),
                                                  calculVolume(),
                                                  caculnbrflacon(),
                                                  calculpoch(),
                                                  caculpris(),
                                                  calculDose(),
                                                 ));

                                              db.saveReliq(new Reliquat(
                                                  caculReliquat(),
                                                  "${selectMed.medicament}",
                                                  "${DateTime.now()}",
                                                  temp,
                                                  dateFormatter()));
                                              double disposupernbrflacon =
                                                  selectMed.qetDispo1 -
                                                      caculnbrflacon();
                                              if (disposupernbrflacon < 0) {
                                                Alert(
                                                  context: context,
                                                  type: AlertType.error,
                                                  title:
                                                  " La quantité de ${selectMed.medicament} est insuffisante",
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
                                                ).show();
                                              } else {
                                                double newqteDisp =
                                                    selectMed.qetDispo1 -
                                                        caculnbrflacon();
                                                Medicament medUpdated =
                                                    Medicament.fromMap({
                                                  'idMed': selectMed.idMed,
                                                  'medicament':
                                                      selectMed.medicament,
                                                  'labo': selectMed.labo,
                                                  'presentation':
                                                      selectMed.presentation,
                                                  'ci': selectMed.ci,
                                                  'cmin': selectMed.cmin,
                                                  'cmax': selectMed.cmax,
                                                  'volumeaprespreparation':
                                                      selectMed
                                                          .volumeaprespreparation,
                                                  'pris': selectMed.pris,
                                                  'stabiliteflacon1': selectMed
                                                      .stabiliteflacon1,
                                                  'stabiliteCi1':
                                                      selectMed.stabiliteCi1,
                                                  'stabilitelumiere1': selectMed
                                                      .stabilitelumiere1,
                                                  'stabilitetemp1':
                                                      selectMed.stabilitetemp1,
                                                  'stabiliteC1':
                                                      selectMed.stabiliteC1,
                                                  'stabiliteflacon2': selectMed
                                                      .stabiliteflacon2,
                                                  'stabiliteCi2':
                                                      selectMed.stabiliteCi2,
                                                  'stabilitelumiere2': selectMed
                                                      .stabilitelumiere2,
                                                  'stabilitetemp2':
                                                      selectMed.stabilitetemp2,
                                                  'stabiliteC2':
                                                      selectMed.stabiliteC2,
                                                  'stabiliteflacon3': selectMed
                                                      .stabiliteflacon3,
                                                  'stabiliteCi3':
                                                      selectMed.stabiliteCi3,
                                                  'stabilitelumiere3': selectMed
                                                      .stabilitelumiere3,
                                                  'stabilitetemp3':
                                                      selectMed.stabilitetemp3,
                                                  'stabiliteC3':
                                                      selectMed.stabiliteC3,
                                                  'qteDiqponible1': newqteDisp,
                                                  'volumeFlacon1':
                                                      selectMed.volumeFlacon1,
                                                });
                                                await db.updateMed(medUpdated);
                                                med_modif = null;
                                                updated_id_Med = null;

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          result(
                                                            nomPation:
                                                                "${selectPaction.nomPation}",
                                                            nomMed:
                                                                "${selectMed.medicament}",
                                                            dose: calculDose(),
                                                            volume:
                                                                calculVolume(),
                                                            reliq:
                                                                caculReliquat(),
                                                            nbrflacon:
                                                                caculnbrflacon(),
                                                            poche: calculpoch(),
                                                            pris: caculpris(),
                                                          )));}
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
                                      ).show();
                                    } else {
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
                                      ).show();
                                    }
                                    // dialog.CalculSC()>0? double.parse(_ctrlSurfaceCorpolle.text)=dialog.CalculSC();
                                  },
                                  tooltip: 'Calculer',
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ]))));
  }
}
