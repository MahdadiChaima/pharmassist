import 'package:flutter/material.dart';
import 'package:pharmassist/UI/SpecificWidget/CirculerCheckBox.dart';
import 'package:pharmassist/UI/preparation/prep_details.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pharmassist/UI/constant.dart';

import '../Drawer/drawer.dart';
import 'package:response/response.dart';

const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);

class prep extends StatefulWidget {
  @override
  _prepState createState() => _prepState();
}

class _prepState extends State<prep> {
  final response = ResponseUI.instance;

  bool checkboxvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //height:double.infinity ,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft, colors: [bluefonce, blue]),
            ),
            child: Column(children: <Widget>[
              Card(color: gris,elevation: 15.0,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
                child:Container(padding: EdgeInsets.only(left: 30,right: 20,top: 7,bottom:7),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                  stylofText("text", 25),
                  IconButton(icon: Icon(Icons.delete,color: bluefonce,),onPressed: ()=>{},),

                ])),
              )

              /*
              Container(
                margin: EdgeInsets.only(right: 12, top: 12),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
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
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(180),
                        topLeft: Radius.circular(0),
                        //bottomLeft: Radius.circular(180)
                      ),
                    ),
                    child: ListView(
                      children: <Widget>[
                        Container(child: StylofText("Préparations", 28)),
                        //TODO:Recherche
                        SizedBox(
                          height: response.setHeight(60),
                        ),

                        GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        prep_details())),
                            child: Container(
                                height: response.setHeight(60),
                                width: response.setWidth(200),
                                decoration: BoxDecoration(
                                    color: gris,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: response.setWidth(10),
                                      ),
                                      CirculerCheckBox(),
                                      SizedBox(
                                        width: response.setWidth(10),
                                      ),
                                      StylofText("prep1", 23),
                                    ]))),
                        SizedBox(
                          height: response.setHeight(70),
                        ),

                        SizedBox(
                          height: response.setHeight(70),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () => {
                                      Alert(
                                        context: context,
                                        image: Image.asset(
                                          "assests/images/logoblue.png",
                                          height: response.setHeight(110),
                                          width: response.setWidth(110),
                                        ),
                                        title: "Voulez vous sur supprimer?",
                                        //desc: ",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Oui",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () => {
                                              //TODO: supprimer preparation
                                            },
                                            color: Color(0xff57D9F8),
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "Non",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: Colors.black26,
                                          )
                                        ],
                                      ).show()
                                    },
                                child: Container(
                                  child: StylofText("Supprimer", 26, bluefonce),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
        */    ])));
  }
}
