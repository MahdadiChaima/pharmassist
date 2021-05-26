import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:pharmassist/UI/medicament/med.dart';
import 'package:pharmassist/UI/patient/pat.dart';
import 'package:pharmassist/UI/preparation/prep.dart';
import '../accueil.dart';
import 'package:response/response.dart';
import 'package:provider/provider.dart';
import 'package:pharmassist/UI/Drawer/theme.dart';
const blue = Color(0xff57D9F8);
const bluefonce = Color(0xff5EAED1);
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}
class _settingsState extends State<settings> {
  final response = ResponseUI.instance;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.infinity,
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
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: response.setFontSize(40),
                      ),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: new Container(
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        height: double.infinity,
                        width: double.infinity,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(180),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                "assests/images/logoblue.png",
                                height: response.setHeight(110),
                                width: response.setWidth(110),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text("PharmAssist",
                                  style: TextStyle(
                                      fontSize: response.setFontSize(25),
                                      fontFamily: 'primus',
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: response.setHeight(20),
                            ),
                            Container(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          stylofText("Thème sombre", 21),
                                          Switch(
                                            value: isSwitched,
                                            onChanged: (value) {
                                              setState(() {
                                                isSwitched = value;
                                                isSwitched
                                                    ? _themeChanger.setTheme(
                                                        ThemeData(
                                                            primaryColor:
                                                                Colors.black,
                                                            brightness:
                                                                Brightness.dark,
                                                            accentColor:
                                                                Colors.black))
                                                    : _themeChanger.setTheme(
                                                        ThemeData(
                                                            primaryColor:
                                                                Colors.white,
                                                            brightness:
                                                                Brightness
                                                                    .light,
                                                            accentColor:
                                                                Colors.white));
                                              });
                                            },
                                            activeTrackColor: blue,
                                            activeColor: bluefonce,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: response.setHeight(20),
                                      ),
                                      GestureDetector(
                                        onTap: () => {},
                                        child: stylofText(
                                            "Définir un mot de passe", 21),
                                      ),
                                      SizedBox(
                                        height: response.setHeight(20),
                                      ),
                                     /* GestureDetector(
                                        onTap: () => {},
                                        child: stylofText(
                                            "Ajouter adresse e-mail", 21),
                                      ),*/
                                    ])),
                          ],
                        ),
                      ))
                ]))));
  }
}

class fontion extends StatelessWidget {
  final response = ResponseUI.instance;
  String text;
  IconData icon;
  Function tap;
  fontion(this.icon, this.text, this.tap);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 70, top: 15),
      child: GestureDetector(
        onTap: tap,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: response.setFontSize(24),
              color: bluefonce,
            ),
            SizedBox(
              width: response.setWidth(10),
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'primus', fontSize: response.setFontSize(23)),
            ),
          ],
        ),
      ),
    ));
  }
}

class stylofText extends StatelessWidget {
  stylofText(this.text, this.size);
  String text;
  double size;

  final response = ResponseUI.instance;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: response.setFontSize(size),
            fontFamily: 'primus',
            fontWeight: FontWeight.w600));
  }
}
