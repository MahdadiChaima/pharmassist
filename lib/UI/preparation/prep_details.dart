import 'package:flutter/material.dart';
import 'package:pharmassist/main.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';

const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);

class prep_details extends StatefulWidget {
  @override
  _prep_detailsState createState() => _prep_detailsState();
}

class _prep_detailsState extends State<prep_details> {
  String date = prep_det.date;
  String nomPation = prep_det.nomPationPrepare;
  String nomMed = prep_det.nomMedPrepare;
  double volumeCalculer = prep_det.volumeCalculer,
      posologie = prep_det.posologie,
      dose = prep_det.dose;
  int nbrFlacon = prep_det.nbrFlacon,
      prisTotal = prep_det.prisTotal,
      poche = prep_det.poche;
  final response = ResponseUI.instance;

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
                        Container(
                            padding: EdgeInsets.only(top: 0),
                            child: stylofText(
                                "Préparation De date:", 25, FontWeight.w600)),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: stylofText("$date", 24, FontWeight.w700)),
                        SizedBox(
                          height: response.setHeight(120),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Patient", 22),
                            stylofText("$nomPation", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Médicament", 20),
                            stylofText("$nomMed", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Posologie", 20),
                            stylofText("$posologie", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("volume Final", 20),
                            stylofText("$volumeCalculer", 20, FontWeight.w600),
                          ],
                        ),

                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("quantité consommée", 20),
                            stylofText("$dose", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Flacons utilisés", 20),
                            stylofText("$nbrFlacon", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Poche utilisée", 20),
                            stylofText("$poche", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stylofText("Prix", 20),
                            stylofText("$prisTotal", 20, FontWeight.w600),
                          ],
                        ),
                        SizedBox(
                          height: response.setHeight(15),
                        ),

                      ],
                    ),
                  )),
            ])));
  }
}

class stylofText extends StatelessWidget {
  stylofText(this.text, this.size, [this.font = FontWeight.w400]);
  String text;
  double size;
  FontWeight font;
  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: response.setFontSize(size),
            fontFamily: 'primus',
            fontWeight: font));
  }
}
