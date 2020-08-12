import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import 'package:pharmassist/UI/patient/pat.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import'package:pharmassist/UI/constant.dart';
const Color bluefonce = Color(0xff5EAED1);

const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);
class pat_details extends StatefulWidget {
  @override
  _pat_detailsState createState() => _pat_detailsState();
}

class _pat_detailsState extends State<pat_details> {
  final response = ResponseUI.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:Container(
              //height:double.infinity ,
                width:double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [bluefonce,blue]),
                ),
                child:Column (
                    children: <Widget>[
                      Container( margin:EdgeInsets.only(right: 12,top: 12),alignment:Alignment.topRight,child:IconButton(onPressed: ()=>Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => drawer()  )), icon:Icon(Icons.menu,color:Colors.white,size: 40,), ),
                      ),
                      Flexible(fit:FlexFit.loose,child:  new Container( margin: EdgeInsets.only(top:0,bottom: 0),
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
                            Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[Container( padding: EdgeInsets.only(top:20,bottom: 0),child: StylofText("Patient Nom",26)),SizedBox(width: response.setWidth(10),),IconButton(
                              onPressed: () =>Navigator.pop(context),
                              icon: Icon(
                                Icons.edit,
                                color: bluefonce,
                                size:response.setFontSize( 35),
                              ),
                            ),],),
                            StylofText("Patient Prénom", 26,),
                            SizedBox(height: response.setHeight(150),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("poids", response.setFontSize(23),),StylofText("Kg", response.setFontSize(23), )],),
                            SizedBox(height: response.setHeight(20),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("taille", response.setFontSize(23), ),StylofText("Cm", response.setFontSize(23), )],),
                            SizedBox(height: response.setHeight(20),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Surface corporelle", response.setFontSize(23), ),StylofText(" m\u00b2", response.setFontSize(23), )],),
                               SizedBox(height: response.setHeight(200),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                              GestureDetector(onTap:()=>{},child:Container(child: Text("Supprimer",style: TextStyle(fontSize: response.setFontSize(26),fontFamily: 'primus',color: bluefonce)),)),


                              FloatingActionButton(backgroundColor:blue ,
                                heroTag: "soti page",
                                onPressed: ()=>Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => pat())),

                                child: Icon(Icons.arrow_back),
                              ), ],
                            ),

                          ],
                        ),
                      )),

                    ] ))));
  }
}