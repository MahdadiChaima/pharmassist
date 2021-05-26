import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/Specific/dateFormatter.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
const Color bluefonce = Color(0xff5EAED1);
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
class result extends StatefulWidget {
  String nomPation, nomMed;
  double dose, volume, reliq;
  int poche, nbrflacon, pris;
  result(
      {Key key,
      this.nomPation,
      this.nomMed,
      this.dose,
      this.volume,
      this.poche,
      this.nbrflacon,
      this.reliq,
      this.pris})
      : super(key: key);
  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  String date = dateFormatter();
  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                //height:double.infinity ,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft, colors: [bluefonce, blue]),
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
                            Container(
                              child: Text(
                                "Résultats",
                                style: TextStyle(
                                    fontSize: response.setFontSize(30),
                                    fontFamily: 'primus',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: response.setHeight(30),
                            ),
                            Text(
                              date,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: response.setFontSize(25),
                                  fontFamily: 'primus',
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: response.setHeight(30),
                            ),
                            rowText("Nom Paction", "${widget.nomPation}"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Nom Medicament", "${widget.nomMed}"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Dose", "${widget.dose}mg"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Volume", "${widget.volume}ml"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Poche recommandée", "${widget.poche}ml"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText(
                                "Nombre des flacons", "${widget.nbrflacon}"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Reliquat", "${widget.reliq}ml"),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            rowText("Pris", "${widget.pris}DA"),
                          ],
                        ),
                      )),
                ]))));
  }
}

class rowText extends StatelessWidget {
  final response = ResponseUI.instance;
  String text1;
  String text2;
  rowText(this.text1, this.text2);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(text1,
                style: TextStyle(
                    fontSize: response.setFontSize(22),
                    fontFamily: 'primus',
                    fontWeight: FontWeight.w400)),
          ),
          Expanded(
            flex: 1,
            child: Text(text2,
                style: TextStyle(
                    fontSize: response.setFontSize(22),
                    fontFamily: 'primus',
                    fontWeight: FontWeight.w600)),
          ),
        ]);
  }
}
