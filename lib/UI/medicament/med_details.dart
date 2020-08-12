import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import '../constant.dart';
const Color bluefonce = Color(0xff5EAED1);

const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);
class med_details extends StatefulWidget {
  static String id = 'Add_med';
  @override
  _med_detailsState createState() => _med_detailsState();
}double Ci=20;
double getCi(){return Ci;}
class _med_detailsState extends State<med_details> {


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
                            Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[Container(child: Text("DOCETAXEL",style: TextStyle(fontSize:response.setFontSize( 30),fontFamily: 'primus',fontWeight:FontWeight.w600),),),SizedBox(width: response.setWidth(10),),IconButton(
                              onPressed: () =>Navigator.pop(context),
                              icon: Icon(
                                Icons.edit,
                                color: bluefonce,
                                size:response.setFontSize( 35),
                              ),
                            ),],),
                            SizedBox(height: response.setHeight(50),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Laboratoire", response.setFontSize(23), FontWeight.w500),StylofText("Sanfoni", response.setFontSize(23), FontWeight.w700)],),
                            SizedBox(height: response.setHeight(18),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Presentations", response.setFontSize(23), FontWeight.w500),StylofText("", response.setFontSize(23), FontWeight.w700)],),

                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("", response.setFontSize(23), FontWeight.w500),StylofText("20ml/mg", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("", response.setFontSize(23), FontWeight.w500),StylofText("80/4", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.initiale", response.setFontSize(23), FontWeight.w500),StylofText("$Ci mg/ml", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.minimale", response.setFontSize(23), FontWeight.w500),StylofText("Sanfoni", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.maximale", response.setFontSize(23), FontWeight.w500),StylofText("Sanfoni", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Prix de mg", response.setFontSize(23), FontWeight.w500),StylofText("Sanfoni", response.setFontSize(23), FontWeight.w700)],),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Volumne", response.setFontSize(23), FontWeight.w500),StylofText("Sanfoni", response.setFontSize(23), FontWeight.w700)],),
                           SizedBox(height: response.setHeight(18),),
                             StylofText("Stabilité",response.setFontSize(23), FontWeight.w500),
                            SizedBox(height: response.setHeight(8),),
                        Container(height:response.setHeight(50),padding: EdgeInsets.all(5),width:response.setWidth(200),decoration: BoxDecoration(color:bluefonce,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular( 20))),child:  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("Flacon", response.setFontSize(20), FontWeight.w500,Colors.white),StylofText("C.I", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("lumière", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("°C", response.setFontSize(20), FontWeight.w700,Colors.white),StylofText("Temps", response.setFontSize(20), FontWeight.w700,Colors.white)],),
                        ),

                            Container(height: response.setHeight(130),padding: EdgeInsets.all(5),
                              width: double.infinity,
                              decoration: BoxDecoration(color: gris,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular( 20))),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("verre",20,FontWeight.w500),stylofText1("20",20,FontWeight.w400),stylofText1("no",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),],),
                                  Container(margin:EdgeInsets.only(top:8,bottom:8),height: response.setHeight(2),width: double.infinity,color:bluefonce),
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("verre",20,FontWeight.w400),stylofText1("20",20,FontWeight.w400),stylofText1("no",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),],),
                                  Container(margin:EdgeInsets.only(top:8,bottom:8),height: response.setHeight(2),width: double.infinity,color:bluefonce),
                                  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText1("pvs  ",20,FontWeight.w400),stylofText1("20",20,FontWeight.w400),stylofText1("no",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),stylofText1("4",20,FontWeight.w400),],),

                                ],
                              ),),     SizedBox(height: response.setHeight(40),),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                              GestureDetector(onTap:()=>{},child:Container(child: Text("Supprimer",style: TextStyle(fontSize: response.setFontSize(26),fontFamily: 'primus',color: bluefonce)),)),


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