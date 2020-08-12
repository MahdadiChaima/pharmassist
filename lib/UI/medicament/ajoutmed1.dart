import 'package:flutter/material.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import'ajoutmed2.dart';
import '../constant.dart';
import'../../main.dart';
import'package:pharmassist/model/medicament.dart';
import'package:pharmassist/database/DatabaseHelper.dart';
const Color bluefonce = Color(0xff5EAED1);


const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);
class ajoutmed1 extends StatefulWidget {
  @override
  _ajoutmed1State createState() => _ajoutmed1State();
}

class _ajoutmed1State extends State<ajoutmed1> {
  final TextEditingController _ctrllaboratoire=new TextEditingController();
  final TextEditingController _ctrlnom=new TextEditingController();
  final TextEditingController _ctrlPresentation=new TextEditingController();
  final TextEditingController _ctrlflacon=new TextEditingController();
  final TextEditingController _ctrlstabilitecinitiale=new TextEditingController();
  final TextEditingController _ctrllumiere=new TextEditingController();

  final TextEditingController _ctrltemperature=new TextEditingController();
  final TextEditingController _ctrltemps=new TextEditingController();
  final TextEditingController _ctrlcinitiale=new TextEditingController();
  final TextEditingController _ctrlcminimale=new TextEditingController();
  final TextEditingController _ctrlcmaximale=new TextEditingController();
  final TextEditingController _ctrlprisdemg=new TextEditingController();
  final TextEditingController _ctrlvolume=new TextEditingController();

  /**_ctrlqtedispo.text),double.parse(_ctrlVolumeFlacon*/
  final TextEditingController _ctrlqtedispo=new TextEditingController();
  final TextEditingController __ctrlVolumeFlacon=new TextEditingController();

 final response = ResponseUI.instance;
 effacer(){
   setState(() {
     _ctrllaboratoire.clear();
     _ctrlnom.clear();

     _ctrlflacon.clear();
     _ctrlstabilitecinitiale.clear();
    _ctrllumiere.clear();
     _ctrltemperature.clear();
     _ctrltemps.clear();
     _ctrlcinitiale.clear();
     _ctrlcminimale.clear();
     _ctrlcmaximale.clear();
     _ctrlprisdemg.clear();
     _ctrlvolume.clear();

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
                    begin: Alignment.centerLeft,
                    colors: [bluefonce,blue]),
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
                Flexible( fit: FlexFit.loose,
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

                          Container(child: Text("  Nom",style: TextStyle(fontSize: response.setFontSize(23),fontFamily: 'primus',),),),
                          SizedBox(height:response.setHeight( 8),),
                          Container(height:response.setHeight(50),width:double.infinity,decoration: BoxDecoration(color: Color(0xffEBF1FA),borderRadius: BorderRadius.circular(20)),child: TextField( controller: _ctrlnom, ),),
                          SizedBox(height:response.setHeight( 25),),
                          Container(child: Text("  Laboratoire",style: TextStyle(fontSize: response.setFontSize(23),fontFamily: 'primus'),),),
                          SizedBox(height:response.setHeight( 8),),
                          Container(height:response.setHeight(50),width:double.infinity,decoration: BoxDecoration(color: Color(0xffEBF1FA),borderRadius: BorderRadius.circular(20)),child: TextField( controller: _ctrllaboratoire, ),),
                          SizedBox(height:response.setHeight( 35),),


                          SizedBox(
                            height: response.setHeight(15),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Présentations",23),
                            FloatingActionButton(backgroundColor:blue ,  heroTag: "addpresentation",
                              onPressed: ()=>{},

                              child: Icon(Icons.check,color:Colors.white),
                            ),],),
                          Container(margin:EdgeInsets.only(top:10),child: Row(children: <Widget>[
                          Container(height:response.setHeight(50),width:response.setWidth(150),decoration: BoxDecoration(color:gris,
                              borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlPresentation,
                            keyboardType: TextInputType.number,)),
                            StylofText("mg/ml",20),],)),
                          SizedBox(
                            height: response.setHeight(15),
                          ),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Stabilité",23),
                            FloatingActionButton(backgroundColor:blue ,  heroTag: "ajouti stabilite",
                              onPressed: ()=>{},

                              child: Icon(Icons.check,color:Colors.white),
                            ),],),
                          SizedBox(
                            height: response.setHeight(15),
                          ),
                          Container(padding:EdgeInsets.all(15),child:Column(
                              children:<Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Flacon",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                  borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlflacon,
                               ))]),


                                SizedBox(
                                  height: response.setHeight(15),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.initiale",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                    borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlstabilitecinitiale,
                                  keyboardType: TextInputType.number,))]),

                                SizedBox(
                                  height: response.setHeight(15),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Lumière",20),Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                  borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrllumiere,
                              ))],),
                                SizedBox(
                                  height: response.setHeight(15),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Température",20),
                              Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                  borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrltemperature,
                                keyboardType: TextInputType.number,))]),


                                SizedBox(
                                  height: response.setHeight(15),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Temps",20),     Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrltemps, keyboardType: TextInputType.number,),),
          ],),



                          SizedBox(
                            height: response.setHeight(15),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Volume de Flacon",20),     Container(height:response.setHeight(50),width:response.setWidth(100),decoration: BoxDecoration(color:gris,borderRadius: BorderRadius.circular(20)),child: TextField(controller: __ctrlVolumeFlacon, keyboardType: TextInputType.number,),),
                          ],),


                        ]) ),
                    SizedBox(
                      height: response.setHeight(15),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("qtedispo",20),     Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlqtedispo, keyboardType: TextInputType.number,),),
                    ],),









                          SizedBox(height: response.setHeight(40),),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.initiale",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                              borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlcinitiale,
                            keyboardType: TextInputType.number,))]),


                          SizedBox(
                            height: response.setHeight(25),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.minimale",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                              borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlcminimale,
                            keyboardType: TextInputType.number,))]),

                          SizedBox(
                            height: response.setHeight(25),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.maximale",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                              borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlcmaximale,
                            keyboardType: TextInputType.number,))]),

                          SizedBox(
                            height: response.setHeight(25),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Prix de mg",20),Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                              borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlprisdemg,
                            keyboardType: TextInputType.number,))],),
                          SizedBox(
                            height: response.setHeight(25),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Volume",20),
                            Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlvolume,
                              keyboardType: TextInputType.number,))]),


                          SizedBox(
                            height: response.setHeight(25),
                          ),
                          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                            Container(alignment: Alignment.bottomCenter,
                              width: response.setWidth(160),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  //begin: Alignment.centerLeft,
                                    colors: [bluefonce,blue]),
                              ),
                              child: FlatButton(onPressed:()=>effacer(), child: Text("Effacer",style: TextStyle(fontSize: response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),),),

                            ),

                            FloatingActionButton(backgroundColor:blue ,
                              heroTag: "soti page",
                              onPressed: (){
                              /*
                               int _idMed;
  String _labo, _medicament,_stabiliteflacon, _stabilitelumiere  ;
  double _presentation, _ci,_cmin,_cmax,_volumaprespreparation,_pris,_stabiliteCi,_stabiliteC,_stabilitetemp,_qteDispo,_volumeFlacon;
Medicament(this._medicament,
    this._labo,this._presentation,this._ci,this._cmin,this._cmax,this._pris,this._volumaprespreparation,this._stabiliteflacon
    ,this._stabiliteCi,this._stabilitelumiere,this._stabiliteC,this._stabilitetemp,this._qteDispo,this._volumeFlacon);*/
                                db.saveMed(new Medicament(_ctrlnom.text,_ctrllaboratoire.text,double.parse(_ctrlPresentation.text),
                                  double.parse(_ctrlcinitiale.text),double.parse(_ctrlcminimale.text),
                                  double.parse(_ctrlcmaximale.text),double.parse(_ctrlprisdemg.text),double.parse(_ctrlvolume.text),_ctrlflacon.text,
                                  double.parse(_ctrlstabilitecinitiale.text),_ctrllumiere.text,double.parse(_ctrltemperature.text),double.parse(_ctrltemps.text),
                                  double.parse(_ctrlqtedispo.text),double.parse(__ctrlVolumeFlacon.text),));


                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => med()));},

                              child: Icon(Icons.arrow_forward,color:Colors.white),
                            ), ],
                          ),


                        ],
                      ),
                    )),
              ]))));
}
}