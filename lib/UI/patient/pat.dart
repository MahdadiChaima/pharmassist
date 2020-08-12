import 'package:flutter/material.dart';
import 'package:pharmassist/UI/SpecificWidget/CirculerCheckBox.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:pharmassist/UI/medicament/ajoutmed1.dart';
import 'package:pharmassist/UI/patient/ajoutpat.dart';
import 'package:pharmassist/UI/patient/pat_details.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);const Color bluefonce = Color(0xff5EAED1);

class pat extends StatefulWidget {
  @override
  _patState createState() => _patState();
}

class _patState extends State<pat> {
  final response = ResponseUI.instance;

  bool checkboxvalue=false;
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
                            "Patients",
                            style: TextStyle(
                                fontSize: response.setFontSize(28),
                                fontFamily: 'primus',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        //TODO:Recherche
                        SizedBox(
                          height: response.setHeight(60),
                        ),

                        Card(color: gris,elevation: 15.0,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                          child:Container(padding: EdgeInsets.only(left: 30,right: 20,top: 7,bottom:7),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                            StylofText("pation1", 25),
                            IconButton(icon: Icon(Icons.delete,color: bluefonce,),onPressed: ()=>{},),

                          ])),
                        )

                        /*
                        StylofText("la date",25),
                        GestureDetector(onTap:()=> Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => pat_details())),child:  Container(height:response.setHeight(60),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
                            borderRadius: BorderRadius.circular(20)),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[SizedBox(
                          width: response.setWidth(10),
                        ),CirculerCheckBox(),SizedBox(
                          width: response.setWidth(10),
                        ),
                          StylofText("fullname+ID", 23,Colors.black),]))),


                        SizedBox(height: response.setHeight(140),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                          GestureDetector(onTap:()=>{},child:Container(child:StylofText("Supprimer",26,bluefonce))),
                          FloatingActionButton(backgroundColor:blue,
                            heroTag: "sot page",
                            onPressed: ()=>Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => ajoutpat())),

                            child: Icon(Icons.add,color:Colors.white),
                          ), ],
                        ),


*/
                      ],
                    ),
                  )),
            ])));
  }
}