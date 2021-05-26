import 'package:flutter/material.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:pharmassist/UI/patient/ajoutpat.dart';
import 'package:pharmassist/UI/patient/pat_details.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Drawer/drawer.dart';
import 'package:pharmassist/main.dart';
import 'package:pharmassist/model/pation.dart';
import 'package:response/response.dart';
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);
class pat extends StatefulWidget {
  @override
  _patState createState() => _patState();
}
class _patState extends State<pat> {
  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
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
                    width: response.setWidth(245),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10)),
                      color: Theme.of(context).canvasColor,
                    ),
                    child: StylofText("La liste  des patients :", 22),
                  )),
              Flexible(
                  fit: FlexFit.loose,
                  child: new Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(90),
                          topLeft: Radius.circular(0),
                        ),
                      ),
                      child: FutureBuilder(
                        future: db.getAllPation(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            pats = snapshot.data;
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
                context, MaterialPageRoute(builder: (context) => ajoutpat()));
          },
          child: Icon(Icons.add),
        ));
  }

  ListView _buildlistview() {
    return ListView.builder(
      itemCount: pats == null ? 0 : pats.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            color: gris,
            elevation: 22.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: ListTile(
              title: StylofText(
                  "nom patient :${Paction.fromMap(pats[position]).nomPation} ",
                  18,
                  Colors.black),
              subtitle: Text("prenom patient :${Paction.fromMap(pats[position]).prenomPation}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    selected_id_Pation =
                        Paction.fromMap(pats[position]).idPation;
                    Alert(
                        context: context,
                        image: Image.asset(
                          "assests/images/logoblue.png",
                          height: response.setHeight(110),
                          width: response.setWidth(110),
                        ),
                        title: "est ce que vous etes sur de supprimer ce patient !",
                       // desc: "",
                        buttons: [
                          DialogButton(
                            color: blue,
                            child: Text("Oui",style: TextStyle(color:Colors.white,fontSize: response.setFontSize(21)),),
                            onPressed: () {
                              setState(() {
                                db.deletePation(selected_id_Pation);
                                pats.removeAt(position);
                              });
                              Navigator.pop(context);
                            },
                          ),
                          DialogButton(
                              color: Colors.black26,
                              child:Text("non",style: TextStyle(color:Colors.white,fontSize: response.setFontSize(21)),),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]).show();
                  }),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pat_details(),
                    ));
                selected_id_Pation = Paction.fromMap(pats[position]).idPation;
                pat_det = await db.getPation(selected_id_Pation);
              },
            ));
      },
    );
  }
}
