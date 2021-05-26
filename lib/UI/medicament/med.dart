import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pharmassist/UI/medicament/ajoutmed1.dart';
import 'package:pharmassist/UI/medicament/med_details.dart';
import 'package:pharmassist/model/medicament.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../main.dart';
const Color bluefonce = Color(0xff5EAED1);
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);String nomMed;double qedispo;
class med extends StatefulWidget {
  @override
  _medState createState() => _medState();
}
class _medState extends State<med> {
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
                    width: response.setWidth(285),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10)),
                      color: Theme.of(context).canvasColor,
                    ),
                    child: StylofText("La list  des medicaments :", 22,FontWeight.w500),
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
                        future: db.getAllMed(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            meds = snapshot.data;
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
                context, MaterialPageRoute(builder: (context) => ajoutmed1()));
          },
          child: Icon(Icons.add),
        ));
  }

  ListView _buildlistview() {
    return ListView.builder(
      itemCount: meds == null ? 0 : meds.length,
      itemBuilder: (BuildContext context, int position) {
        nomMed= Medicament.fromMap(meds[position]).medicament;
        qedispo= Medicament.fromMap(meds[position]).qetDispo1;
        return Card(
            color: gris,
            elevation: 22.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            child: ListTile(
              title: StylofText(
                  "Medicament :${Medicament.fromMap(meds[position]).medicament}",
                  18,
                  FontWeight.w600,
                  Colors.black),
              subtitle: Text("Laboratoire :${Medicament.fromMap(meds[position]).labo}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    selected_id_Med = Medicament.fromMap(meds[position]).idMed;
                    Alert(
                        context: context,
                        image: Image.asset(
                          "assests/images/logoblue.png",
                          height: response.setHeight(110),
                          width: response.setWidth(110),
                        ),
                        title: "confirmer",
                        desc:
                            "est ce que vous etes sur de supprimer ce medicament !",
                        buttons: [
                          DialogButton(
                            color: blue,
                            child: Text("oui"),
                            onPressed: () {
                              setState(() {
                                db.deleteMed(selected_id_Med);
                                meds.removeAt(position);
                              });
                              Navigator.pop(context);
                            },
                          ),
                          DialogButton(
                              color: Colors.black26,
                              child: Text("non"),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ]).show();
                  }),
              onTap: () async {
                if( Medicament.fromMap(meds[position]).qetDispo1<3){
                  notification();
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => med_details(),
                    ));
                selected_id_Med = Medicament.fromMap(meds[position]).idMed;
                med_det = await db.getMed(selected_id_Med);
              },
            ));
      },
    );
  }
  void notification() async {
    var scheduledNotificationDateTime=DateTime.now().add(Duration(seconds: 1));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'logo',
      //sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        //sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
      //  presentSound: true
    );
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'La quantité de $nomMed est insuffisante',
        'il ne reste plus que $qedispo',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
