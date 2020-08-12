import 'package:flutter/material.dart';
import 'package:pharmassist/UI/preparation/prep.dart';
import 'package:pharmassist/UI/preparation/prep_details.dart';

import '../Drawer/drawer.dart';
import 'package:response/response.dart';
const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);
class prep_details extends StatefulWidget {
  @override
  _prep_detailsState createState() => _prep_detailsState();
}

class _prep_detailsState extends State<prep_details> {

  final response = ResponseUI.instance;


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
                        Container(padding:EdgeInsets.only(top:0),
                            child: stylofText("24/4/2023", 24,FontWeight.w700)
                        ),
                        Container(padding:EdgeInsets.only(top:10),
                          child: stylofText("PréparationID", 25,FontWeight.w600)
                        ),

                        SizedBox(height: response.setHeight(120),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText("Patient", 22),stylofText("PatNom+Pre", 20,FontWeight.w600),],),
                        SizedBox(height: response.setHeight(15),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText("Médicament", 20),stylofText("", 20,FontWeight.w600),],),
                        SizedBox(height: response.setHeight(15),),

                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText("Flacons utilisés", 20),stylofText("", 20,FontWeight.w600),],),
                        SizedBox(height: response.setHeight(15),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText("Poche utilisée", 20),stylofText("", 20,FontWeight.w600),],),
                        SizedBox(height: response.setHeight(15),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[stylofText("Reliquats", 20),stylofText("", 20,FontWeight.w600),],),
                        SizedBox(height: response.setHeight(185),),
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                          GestureDetector(onTap:()=>{},child:Container(child: Text("Supprimer",style: TextStyle(fontSize: response.setFontSize(26),fontFamily: 'primus',color: bluefonce)),)),


                          FloatingActionButton(backgroundColor:blue ,
                            heroTag: "soti page",
                            onPressed: ()=>Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => prep())),

                            child: Icon(Icons.arrow_back),
                          ), ],
                        ),




                      ],
                    ),
                  )),
            ])));
  }
}

class stylofText extends StatelessWidget {
  stylofText(this.text,this.size,[this.font=FontWeight.w400]);
  String text;
  double size;
  FontWeight font;
  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: response.setFontSize(size),fontFamily: 'primus',fontWeight: font));
  }

}
