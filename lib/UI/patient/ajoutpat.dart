import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pharmassist/UI/preparation/comptNouveauPat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';

import '../constant.dart';

const Color gris= Color(0xffEBF1FA);
class ajoutpat extends StatefulWidget {
  @override
  _ajoutpatState createState() => _ajoutpatState();
}

class _ajoutpatState extends State<ajoutpat>{
  final TextEditingController _ctrlnom=new TextEditingController();
  final TextEditingController _ctrlprenom=new TextEditingController();
  final TextEditingController _ctrlpoid=new TextEditingController();
  final TextEditingController _ctrltaille=new TextEditingController();
  final TextEditingController _ctrlsurfacec=new TextEditingController();

  final response = ResponseUI.instance;
  effacer(){
    _ctrlnom.clear();
    _ctrlprenom.clear();
    _ctrlpoid.clear();
    _ctrltaille.clear();
    _ctrlsurfacec.clear();

  }
double   CalculSC() {
  double Sc=0.0;
  double taille = double.parse(_ctrltaille.text);
  double poid = double.parse(_ctrlpoid.text);
  if(double.parse(_ctrltaille.text).toString().isNotEmpty&&double.parse(_ctrlpoid.text).toString().isNotEmpty)
    return double.parse( sqrt(poid * taille / 3600).toStringAsFixed(3)) ;
  return 0.0 ;



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                        Container(padding:EdgeInsets.all(15),child:Column(
                            children:<Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Nom",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlnom,
                             ))]),


                              SizedBox(
                                height: response.setHeight(25),
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Prenom",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                  borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlprenom,
                               ))]),

                              SizedBox(
                                height: response.setHeight(25),
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Surface C",20),
                                Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                                    borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrlsurfacec,
                                  keyboardType: TextInputType.number,))]),


                              SizedBox(
                                height: response.setHeight(10),
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[ GestureDetector(onTap:()=>{

                              Alert(
                              context: context,
                              image: Image.asset(
                              "assests/images/logoblue.png",
                              height:response.setHeight(110) ,
                              width: response.setWidth(110),
                              ),
                              title: "Calculer Surface Corporelle",
                                content: Column(
                                  children: <Widget>[
                                    TextField(controller:_ctrltaille,
                                      decoration: InputDecoration(

                                        labelText: 'Taille: Cm',
                                      ),
                                    ),
                                    TextField(controller: _ctrlpoid,
                                    // obscureText: true,
                                      decoration: InputDecoration(

                                        labelText: 'Poid:Kg',
                                      ),
                                    ),
                                  ],
                                ),
                              buttons: [
                              DialogButton(
                                onPressed:(){
                                  setState(() {
                                    double Sc=CalculSC();
                                    debugPrint("RESULTA sURFACE COREPORELLE  **********************************      :$Sc");
                                    _ctrlsurfacec.text="$Sc";
                                    Navigator.pop(context);

                                  });


                              },
                              child: Text(
                              "Oui",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              ),

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
                              ).show()},

                              child:Container(child: Text("Calculer",style: TextStyle(fontSize: response.setFontSize(22),fontFamily: 'primus',color: blue),textAlign: TextAlign.end,),)),
                              ],)

                            ]) ),






                        SizedBox(height: response.setHeight(150),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                          Container(alignment: Alignment.bottomCenter,
                            width: response.setWidth(160),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                //begin: Alignment.centerLeft,
                                  colors: [bluefonce,blue]),
                            ),
                            child: FlatButton(onPressed:()=> effacer(), child: Text("Effacer",style: TextStyle(fontSize: response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),),),

                          ),

                          FloatingActionButton(backgroundColor:blue ,
                            heroTag: "sot page",
                            onPressed: ()=> {//Navigator.of(context).pushReplacement(
                               // MaterialPageRoute(builder: (BuildContext context) => compt())),
    if(_ctrlnom.text.isNotEmpty&&_ctrlprenom.text.isNotEmpty&&_ctrlsurfacec.text.isNotEmpty){
    Alert(
    context: context,
    image: Image.asset(
    "assests/images/logoblue.png",
    height:response.setHeight(110) ,
    width: response.setWidth(110),
    ),
    title: "Est ce que vous etes  sur des informations que vous allez écrire",
    //desc: ",
    buttons: [
    DialogButton(
    child: Text(
    "Oui",
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    onPressed:()=>Navigator.of(context).push(
    MaterialPageRoute(
    builder: (BuildContext context) =>compt2(Surfacec: double.parse(_ctrlsurfacec.text),))),
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
    ).show()}
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
  ).show()}},
                            child: Icon(Icons.arrow_forward,color:Colors.white),
                          ), ],
                        ),


                      ],
                    ),
                  )),
            ])));
  }
}

