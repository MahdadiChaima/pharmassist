
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/preparation/result.dart';
import 'package:pharmassist/calcul/calcul.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'result.dart';
import 'package:pharmassist/UI/medicament/med_details.dart';
import 'package:pharmassist/UI/SpecificWidget/Confirmation.dart';
import 'package:pharmassist/UI/constant.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class comptAncienPat extends StatefulWidget {
  double Surfacec;
  comptAncienPat({Key key,this.Surfacec}):super(key:key);
  @override
  _comptAncienPatState createState() => _comptAncienPatState();
}

class _comptAncienPatState extends State<comptAncienPat> {

  final TextEditingController _ctrlPosologiemg=new TextEditingController();
  double calculDose(){
    //TODO: tjibi surface nta3 pation mn bd
    double surface=0.0;
    double posologie=double.parse(_ctrlPosologiemg.text);

    return Dose(surface: surface,posologie: posologie);

  }double calculVolume(){
    double dose=calculDose();

    return Volume(dose: dose,ci:getCi() );

  }

  double caculReliquat(){
    return Reliq(flacon:100 ,volume: calculVolume());
  }
  int caculnbrflacon(){
    return  nbrpoch(flacon:100 ,volume: calculVolume());
  }
  int calculpoch(){
    return choisipoche(dose: calculDose(),cmin: 10,cmax: 30);
  }
  int caculpris(){
    return pris(dose: calculDose(),pris: 12);
  }
  Dialogs_confirmation  dialog;
  final response = ResponseUI.instance;
  @override
  Widget build(BuildContext context) {
    dialog==new Dialogs_confirmation (text: "Êtes-vous sûr de vouloir le compte",
      ontapCancel: ()=>print("non"),ontapSave: ()=>Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) => result(dose: calculDose(),volume: calculVolume(),
                reliq: caculReliquat(),nbrflacon: caculnbrflacon(),poche: calculpoch(),pris: caculpris(),))),
    );

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
                          color:Theme.of(context).canvasColor,
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

                               Container(child: Text("Patient:",style: TextStyle(fontSize: response.setFontSize(23),fontFamily: 'primus',),),),
                            SizedBox(height:response.setHeight( 8),),
                            DropDownField(
                             value: id_Pation,
                                //required: true,
                                strict: true,
                                labelText: "sélection Patient",
                                items: patient,
                                setter: (dynamic newValue) {
                                  id_Pation= newValue;
                                }
                            ),
                            SizedBox(height: response.setHeight(30),),
                            Container(child: Text("Posologie:",style: TextStyle(fontSize:response.setFontSize( 23),fontFamily: 'primus',),),),
                            SizedBox(height:response.setHeight( 12),),
                            Container(height:response.setHeight(50),width:response.setWidth(150),decoration: BoxDecoration(color: Color(0xffEBF1FA),borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlPosologiemg, keyboardType: TextInputType.number,),),
                            Container(child: Text("Format: mg/m²",style: TextStyle(fontSize:response.setFontSize( 18),fontFamily: 'primus',),),),

                            SizedBox(
                              height: response.setHeight(40),
                            ),

                            Container(child: Text("Medicament:",style: TextStyle(fontSize: response.setFontSize(23),fontFamily: 'primus'),),),
                            SizedBox(height:response.setHeight( 12),),

                            DropDownField(
                                value: id_Med,
                                //required: true,
                                strict: true,
                                labelText: "Ssélection Medicament ",
                                items: patient,
                                setter: (dynamic newValue) {
                                  med= newValue;
                                }
                            ),
                            SizedBox(height: response.setHeight(100),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                              Container(alignment: Alignment.bottomCenter,
                                width: response.setWidth(160),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    //begin: Alignment.centerLeft,
                                      colors: [Color(0xff5EAED1), Color(0xff57D9F8)]),
                                ),
                                child: FlatButton(onPressed: ()=> Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (BuildContext context) => comptAncienPat())), child: Text("Effacer",style: TextStyle(fontSize: response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),),),





                              ),

                              FloatingActionButton(backgroundColor:Color(0xff57D9F8) ,
                                onPressed:() {
                                  if(_ctrlPosologiemg.text.isNotEmpty){      Alert(
                                    context: context,
                                    image: Image.asset(
                                      "assests/images/logoblue.png",
                                      height:response.setHeight(110) ,
                                      width: response.setWidth(110),
                                    ),
                                    title: "Voulez vous continuer et voir les résultat.",
                                    //desc: ",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Oui",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed:()=>Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) => result(dose: calculDose(),volume: calculVolume(),reliq: caculReliquat(),nbrflacon: caculnbrflacon(),poche: calculpoch(),pris: caculpris(),))),

                                        color:Color(0xff57D9F8) ,
                                      ),
                                      DialogButton(
                                        child: Text(
                                          "Non",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Colors.black26,
                                      )
                                    ],
                                  ).show();}
                                  else{
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: " Vous devez remplir tout les champs ",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Annuler",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                          width: 120,
                                          color: Colors.black26,
                                        )
                                      ],
                                    ).show();
                                  }

                                  // dialog.CalculSC()>0? double.parse(_ctrlSurfaceCorpolle.text)=dialog.CalculSC();


                                },
                                /*()=>Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => result(dose: calculDose(),volume: calculVolume(),reliq: caculReliquat(),nbrflacon: caculnbrflacon(),poche: calculpoch(),pris: caculpris(),))),
                                tooltip: 'Calculer',*/
                                child: Icon(Icons.check, color:Colors.white,
                                ),
                              ), ],
                            ),


                          ],
                        ),
                      )),
                ]))));
  }


  String id_Pation;
  List <String> patient=[

  ];

  String id_Med;
  List <String> med=[

  ];











}