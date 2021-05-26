import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/medicament/ajoutmed1.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import '../../main.dart';
const Color bluefonce = Color(0xff5EAED1);
const Color gris= Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
class med_details extends StatefulWidget {
  @override
  _med_detailsState createState() => _med_detailsState();
}double Ci=20;
double getCi(){return Ci;}
class _med_detailsState extends State<med_details> {
  String nom_med= med_det.medicament;
  String labo_med= med_det.labo;
  double pres_med= med_det.presentation;
  double con_init= med_det.ci;
  double con_minim= med_det.cmin;
  double con_max= med_det.cmax;
  double volumprep= med_det.volumeaprespreparation;
  double pris= med_det.pris;
  String flacon1= med_det.stabiliteflacon1;
  double stabiliteCi1= med_det.stabiliteCi1;
  String lumiere1= med_det.stabilitelumiere1;
  int temp1= med_det.stabilitetemp1;
  double stabiliteC1=med_det.stabiliteC1;
  String flacon2= med_det.stabiliteflacon2;
  double stabiliteCi2= med_det.stabiliteCi2;
  String lumiere2= med_det.stabilitelumiere2;
  int temp2= med_det.stabilitetemp2;
  double stabiliteC2=med_det.stabiliteC2;
  String flacon3= med_det.stabiliteflacon3;
  double stabiliteCi3= med_det.stabiliteCi3;
  String lumiere3= med_det.stabilitelumiere3;
  int temp3= med_det.stabilitetemp3;
  double stabiliteC3=med_det.stabiliteC3;
  double volume1= med_det.volumeFlacon1;
  double qtedispo1=med_det.qetDispo1;



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
                            Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[Container(child: Text("$nom_med",style: TextStyle(fontSize:response.setFontSize( 30),fontFamily: 'primus',fontWeight:FontWeight.w600),),),SizedBox(width: response.setWidth(10),),IconButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ajoutmed1()
                            ));
                            ctrlnom.text=nom_med;
                            ctrllaboratoire.text=labo_med;
                            ctrlPresentation.text=pres_med.toString();
                            ctrlcmaximale.text=con_max.toString();
                            ctrlcminimale.text=con_minim.toString();
                            ctrlcinitiale.text=con_init.toString();
                            ctrlvolume.text=volumprep.toString();
                            ctrlprisdemg.text=pris.toString();
                            ctrlflacon1.text=flacon1;
                            ctrlstabilitecinitiale1.text=stabiliteCi1.toString();
                            ctrllumiere1.text=lumiere1;
                            ctrltemps1.text=temp1.toString();
                            ctrltemperature1.text=stabiliteC1.toString();
                            ctrlqtedispo1.text=qtedispo1.toString();
                            ctrlVolumeFlacon1.text=volume1.toString();

                            ctrlflacon2.text=flacon2;
                            ctrlstabilitecinitiale2.text=stabiliteCi2.toString();
                            ctrllumiere2.text=lumiere2;
                            ctrltemps2.text=temp2.toString();
                            ctrltemperature2.text=stabiliteC2.toString();


                            ctrlflacon3.text=flacon3;
                            ctrlstabilitecinitiale3.text=stabiliteCi3.toString();
                            ctrllumiere3.text=lumiere3;
                            ctrltemps3.text=temp3.toString();
                            ctrltemperature3.text=stabiliteC3.toString();

                            med_modif = med_det;
                            updated_id_Med = selected_id_Med;
                            print(med_modif.medicament);

                          },


                              icon: Icon(
                                Icons.edit,
                                color: bluefonce,
                                size:response.setFontSize( 35),
                              ),
                            ),],),
                            SizedBox(height: response.setHeight(50),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Laboratoire", response.setFontSize(23), FontWeight.w500),StylofText("$labo_med", response.setFontSize(23), FontWeight.w700)],),
                            SizedBox(height: response.setHeight(18),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Presentations", response.setFontSize(23), FontWeight.w500),StylofText("", response.setFontSize(23), FontWeight.w700)],),

                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("", response.setFontSize(23), FontWeight.w500),StylofText("$pres_med ml/mg", response.setFontSize(23), FontWeight.w700)],),
                         //   Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("", response.setFontSize(23), FontWeight.w500),StylofText("80/4", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.initiale", response.setFontSize(23), FontWeight.w500),StylofText("$con_init", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.minimale", response.setFontSize(23), FontWeight.w500),StylofText("$con_minim", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.maximale", response.setFontSize(23), FontWeight.w500),StylofText("$con_max", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Prix de mg", response.setFontSize(23), FontWeight.w500),StylofText("$pris", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Volumne", response.setFontSize(23), FontWeight.w500),StylofText("$volume1", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("quntite disponible", response.setFontSize(23), FontWeight.w500),StylofText("$qtedispo1", response.setFontSize(23), FontWeight.w700)],),


                            SizedBox(height: response.setHeight(18),),
                             StylofText("Stabilité",response.setFontSize(23), FontWeight.w500),
                            SizedBox(height: response.setHeight(8),),
                        Container(height:response.setHeight(50),padding: EdgeInsets.all(5),width:response.setWidth(200),decoration: BoxDecoration(color:bluefonce,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular( 20))),child:  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Flacon", response.setFontSize(20), FontWeight.w500,Colors.white),StylofText("C.I", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("lumière", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("°C", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("Temps", response.setFontSize(20), FontWeight.w700,Colors.white)],),
                        ),

                            Container(height: response.setHeight(140),padding: EdgeInsets.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(color: gris,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular( 20))),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("$flacon1",20,FontWeight.w500),stylofText1("$stabiliteCi1",20,FontWeight.w400),stylofText1("$lumiere1",20,FontWeight.w400),stylofText1("$stabiliteC1",20,FontWeight.w400),stylofText1("$temp1",20,FontWeight.w400),],),
                                  Container(margin:EdgeInsets.only(top:8,bottom:8),height: response.setHeight(2),width: double.infinity,color:bluefonce),
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("$flacon2",20,FontWeight.w400),stylofText1("$stabiliteCi2",20,FontWeight.w400),stylofText1("$lumiere2",20,FontWeight.w400),stylofText1("$stabiliteC2",20,FontWeight.w400),stylofText1("$temp2",20,FontWeight.w400),],),
                                  Container(margin:EdgeInsets.only(top:8,bottom:8),height: response.setHeight(2),width: double.infinity,color:bluefonce),
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("$flacon3",20,FontWeight.w400),stylofText1("$stabiliteCi3",20,FontWeight.w400),stylofText1("$lumiere3",20,FontWeight.w400),stylofText1("$stabiliteC3",20,FontWeight.w400),stylofText1("$temp3",20,FontWeight.w400),],),

                                ],
                              ),),     SizedBox(height: response.setHeight(20),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                              //GestureDetector(onTap:()=>{},child:Container(child: Text("",style: TextStyle(fontSize: response.setFontSize(26),fontFamily: 'primus',color: bluefonce)),)),


                              FloatingActionButton(backgroundColor:blue ,
                                heroTag: "soti page",
                                onPressed: ()=>Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => med())),

                                child: Icon(Icons.arrow_back,color:Colors.white),
                              ), ],
                            ),

                          ],
                        ),
                      )),

                    ] ))));
}}

class StylofText extends StatelessWidget {
  StylofText(this.text,this.size,this.font,[this.color]);
  String text;
  double size;
  FontWeight font;
  Color color;

  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: response.setFontSize(size),fontFamily: 'primus',fontWeight: font,color: color));
  }
}

class stylofText1 extends StatelessWidget {
  stylofText1(this.text,this.size,this.font,[this.color=Colors.black]);
  String text;
  double size;
  FontWeight font;
  Color color;

  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: response.setFontSize(size),fontFamily: 'primus',fontWeight: font,color: color));
  }
}