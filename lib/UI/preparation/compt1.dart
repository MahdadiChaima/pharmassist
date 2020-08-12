
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/patient/ajoutpat.dart';
import 'package:pharmassist/UI/patient/pat.dart';
import 'package:pharmassist/UI/preparation/comptAncienPat.dart';
import 'package:pharmassist/UI/preparation/result.dart';
import 'package:pharmassist/calcul/calcul.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'result.dart';
import 'package:pharmassist/UI/medicament/med_details.dart';
import 'package:pharmassist/UI/SpecificWidget/Confirmation.dart';
import 'package:pharmassist/UI/constant.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class compt1 extends StatefulWidget {
  @override
  _comptState createState() => _comptState();
}

class _comptState extends State<compt1> {final TextEditingController _ctrlSurfaceCorpolle=new TextEditingController();

final TextEditingController _ctrlPosologiemg=new TextEditingController();
double calculDose(){
  double surface=double.parse(_ctrlSurfaceCorpolle.text);
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
                      padding: EdgeInsets.all(0),
                      height: double.infinity,// response.setHeight(300),
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
                            height: response.setHeight(450),// response.setHeight(300),
                            width: double.infinity,
                            decoration: BoxDecoration(   borderRadius: BorderRadius.only(
                              topRight: Radius.circular(180),
                              topLeft: Radius.circular(0),
                               // bottomRight: Radius.circular(60),

                              bottomLeft: Radius.circular(160)
                            ),
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                              AssetImage(
                                "assests/images/patient.png",

                              ),
                            )),
                          ),
                          SizedBox(height: response.setHeight(0),),
                                               SizedBox(height: response.setHeight(10),),

                          Container(alignment: Alignment.bottomCenter,
                            width: response.setWidth(160),
                            height: response.setHeight(60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                //begin: Alignment.centerLeft,
                                  colors: [Color(0xff5EAED1), Color(0xff57D9F8)]),
                            ),
                            child: FlatButton(onPressed: ()=> Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => ajoutpat())), child: Center(child:Text("Nouveau patient ",style: TextStyle(fontSize: response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),)),),





                          ),                          SizedBox(height: response.setHeight(20),),

                          Container(alignment: Alignment.bottomCenter,
                            height: response.setHeight(60),

                            width: response.setWidth(160),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                //begin: Alignment.centerLeft,
                                  colors: [Color(0xff5EAED1), Color(0xff57D9F8)]),
                            ),
                            child: FlatButton(onPressed: ()=> Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => comptAncienPat())), child:Center(child:Text("Ancien patient",style: TextStyle(fontSize: response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),)),),





                          ),

                        ],
                      ),
                    )),
              ]))));
}













}