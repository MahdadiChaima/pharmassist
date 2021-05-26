import 'package:flutter/material.dart';
import 'package:pharmassist/UI/accueil.dart';
import 'package:pharmassist/UI/preparation/prep_details.dart';
import 'package:pharmassist/main.dart';
import 'package:pharmassist/model/preparation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pharmassist/UI/constant.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';

const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);

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
                    width: response.setWidth(285),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10)),
                      color: Theme.of(context).canvasColor,
                    ),
                    child: StylofText("La liste  des preparation :", 22),
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
                        future: db.getAllPreparation(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            preps = snapshot.data;
                            return _buildlistview();
                          }
                          return new CircularProgressIndicator();
                        },
                      )))
            ])),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bluefonce,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => accueil()));
          },
          child: Icon(Icons.add),
        ));
  }

  ListView _buildlistview() {
    return ListView.builder(
      itemCount: preps == null ? 0 : preps.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            color: gris,
            elevation: 22.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: ListTile(
              title: StylofText(
                  "Patient  :${Preparation.fromMap(preps[position]).nomPationPrepare} ",
                  17,
                  Colors.black),
              subtitle: Text(
                  "medicament :${Preparation.fromMap(preps[position]).nomMedPrepare}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    selected_id_Preparation =
                        Preparation.fromMap(preps[position]).id_preparation;
                    Alert(
                        context: context,
                        image: Image.asset(
                          "assests/images/logoblue.png",
                          height: response.setHeight(110),
                          width: response.setWidth(110),
                        ),
                        title: "est ce que vous etes sur de supprimer ce preparation!",
                       // desc:
                         //   "",
                        buttons: [
                          DialogButton(
                            color: blue,
                            child:Text("Oui",style: TextStyle(color:Colors.white,fontSize: response.setFontSize(21)),),
                            onPressed: () {
                              setState(() {
                                db.deletePreparation(selected_id_Preparation);
                                preps.removeAt(position);
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
                  }),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => prep_details(),
                    ));
                selected_id_Preparation =
                    Preparation.fromMap(preps[position]).id_preparation;
                prep_det = await db.getPreparation(selected_id_Preparation);
              },
            ));
      },
    );
  }
}
