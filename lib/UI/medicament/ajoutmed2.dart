import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';import '../constant.dart';

const Color gris= Color(0xffEBF1FA);
class ajoutmed2 extends StatefulWidget {
  @override
  _ajoutmed2State createState() => _ajoutmed2State();
}

class _ajoutmed2State extends State<ajoutmed2> {
  final TextEditingController _ctrlcinitiale=new TextEditingController();
  final TextEditingController _ctrlcminimale=new TextEditingController();
  final TextEditingController _ctrlcmaximale=new TextEditingController();
  final TextEditingController _ctrlprisdemg=new TextEditingController();
  final TextEditingController _ctrlvolume=new TextEditingController();

  final response = ResponseUI.instance;
  effacer(){
    _ctrlcinitiale.clear();
    _ctrlcminimale.clear();
    _ctrlcmaximale.clear();
    _ctrlprisdemg.clear();
    _ctrlvolume.clear();

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
                                "Nouveau Médicament",
                                style: TextStyle(
                                    fontSize: response.setFontSize(28),
                                    fontFamily: 'primus',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(60),
                            ),

                            Container(padding:EdgeInsets.all(15),child:Column(
                                children:<Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[StylofText("C.initiale",20),  Container(height:response.setHeight(50),width:response.setWidth(200),decoration: BoxDecoration(color:gris,
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

                                ]) ),






                            SizedBox(height: response.setHeight(70),),
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
                                heroTag: "soti page",
                                onPressed: ()=>Navigator.pop(context),

                                child: Icon(Icons.arrow_back,color:Colors.white),
                              ), FloatingActionButton(backgroundColor:blue ,
                                heroTag: "sot page",
                                onPressed: ()=>Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => ajoutmed2())),

                                child: Icon(Icons.check,color: Colors.white,),
                              ), ],
                            ),


                          ],
                        ),
                      )),
                ])));
  }
}
