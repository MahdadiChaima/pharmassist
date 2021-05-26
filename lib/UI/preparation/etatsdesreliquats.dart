import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/main.dart';
import 'package:pharmassist/model/preparation.dart';
import 'package:pharmassist/model/reliquat.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:pharmassist/Controller/calcul.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';

Preparation selectPreparation;
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);
class etatsdesreliquats extends StatefulWidget {
  @override
  _etatsdesreliquatsState createState() => _etatsdesreliquatsState();
}

class _etatsdesreliquatsState extends State<etatsdesreliquats> {
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
                colors: [Color(0xff5EAED1), Color(0xff57D9F8)]),
          ),
          child: Column(children: <Widget>[
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
            Container(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: response.setWidth(265),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                    color: Theme.of(context).canvasColor,
                  ),
                  child: StylofText("La liste  des reliquats :", 24),
                )),
            Flexible(
                fit: FlexFit.loose,
                child: new Container(

                    //color: Colors.white,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        topLeft: Radius.circular(0),
                        //bottomLeft: Radius.circular(180)
                      ),
                    ),
                    child: FutureBuilder(
                      future: db.getAllReliq(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          reliqs = snapshot.data;
                          return _buildlistview();
                        }
                        return new CircularProgressIndicator();
                      },
                    )))
          ])),
    );
  }

  /**/
  ListView _buildlistview() {
    return ListView.builder(
      itemCount: reliqs == null ? 0 : reliqs.length,
      itemBuilder: (BuildContext context, int position) {
        bool b = datreliq(
            datpreparatin: DateTime.parse(
                "${Reliquat.fromMap(reliqs[position]).dateprep}"),
            hour: Reliquat.fromMap(reliqs[position]).stabilitereliquat);
        String nomMedicamentreliq =
            Reliquat.fromMap(reliqs[position]).nomMedReliq;
        return Container(
          height: response.setHeight(65),
          child: Card(
              color: gris,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Container(
                  height: response.setHeight(50),
                  width: response.setWidth(200),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: gris, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        StylofText(
                            "${Reliquat.fromMap(reliqs[position]).nomMedReliq}",
                            23,
                            Colors.black),
                        Row(
                          children: <Widget>[
                            StylofText(
                                "${Reliquat.fromMap(reliqs[position]).reliquatR} ml",
                                20,
                                Colors.black),
                            SizedBox(
                              width: response.setWidth(10),
                            ),
                            b
                                ? StylofText("périmé", 20, Colors.redAccent)
                                : StylofText(
                                    "non périmé", 20, Colors.greenAccent),
                            IconButton(
                              onPressed: () async {
                                selected_id_Reliq =
                                    Reliquat.fromMap(reliqs[position]).idReliq;
                                Alert(
                                    context: context,
                                    image: Image.asset(
                                      "assests/images/logoblue.png",
                                      height: response.setHeight(110),
                                      width: response.setWidth(110),
                                    ),
                                    title: "est ce que vous etes supprimer le reliquat!",
                                    //desc: "est ce que vous etes supprimer le reliquat!",
                                    buttons: [
                                      DialogButton(
                                        color: blue,
                                        child: Text("Oui",style: TextStyle(color:Colors.white,fontSize: response.setFontSize(21)),),
                                        onPressed: () async {
                                          setState(() {
                                            db.deleteReliq(selected_id_Reliq);
                                            reliqs.removeAt(position);
                                          });

                                          Navigator.pop(context);
                                        },
                                      ),
                                      DialogButton(
                                          color: Colors.black26,
                                          child: Text("non",style: TextStyle(color:Colors.white,fontSize: response.setFontSize(21)),),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ]).show();
                              },
                              icon: Icon(
                                Icons.delete,
                                color:
                                    b ? Colors.redAccent : Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ])))),
        );
      },
    );
  }
}