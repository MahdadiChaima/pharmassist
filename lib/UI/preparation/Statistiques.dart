import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/accueil.dart';
import 'package:pharmassist/UI/preparation/prep_details.dart';
import 'package:pharmassist/main.dart';
import 'package:pharmassist/model/preparation.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:pharmassist/Controller/calcul.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import 'package:pharmassist/UI/Specific/dateFormatter.dart';
const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);
class Statistiques extends StatefulWidget {
  @override
  _StatistiquesState createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
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
                  onPressed: () =>
                      Navigator.of(context).push(
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

                     padding: EdgeInsets.only( top:0,),
                    //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .canvasColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(130),
                          topLeft: Radius.circular(0),
                          //bottomLeft: Radius.circular(180)
                        ),
                      ),
                      child:FutureBuilder(
                        future: db.getDate( dateFormatter()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            cardDate = snapshot.data;
                            return _buildlistview() ;
                          }
                          return  new CircularProgressIndicator();
                        },
                      )
                  ))])),);

  }
  /**/
 _buildlistview()  {   int prisTotalToday=0,prixReliq=90,prixReliqperime=90;String nameDrug="",patients="",nbrFlacon="";String nomdrugf;int nbrflcdrug;

    return ListView.builder(
        itemCount: cardDate == null ? 0 : 1,
        itemBuilder: (BuildContext context, int position)  {


      //bool b=datreliq(datpreparatin:DateTime.parse("${Preparation.fromMap(cardDate[position]).datenowprep}"),hour:Preparation.fromMap(cardDate[position]).stabiliteTemp);


      for(int i=0;i<cardDate.length;i++){
        print ("nomMed de : $i ${Preparation.fromMap(cardDate[i]).nomMedPrepare}  ");
        nameDrug="$nameDrug"+" ${Preparation.fromMap(cardDate[i]).nomMedPrepare} , ";
        patients="$patients"+" ${Preparation.fromMap(cardDate[i]).nomPationPrepare} , ";
        nbrFlacon="$nbrFlacon"+"${Preparation.fromMap(cardDate[i]).nbrFlacon} ,";
      }
      return Container(height: response.setHeight(630),child: Card(
         elevation: 30,
          color: gris,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)
              ),
          ),
          child:Container(height:response.setHeight(50),width:response.setWidth(200),padding:EdgeInsets.only(left:15,right:15,top: 20,bottom: 20),
              decoration: BoxDecoration(color:gris,      borderRadius: BorderRadius.only(
                  topRight: Radius.circular(130),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)
              )),
              child: Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
               StylofText("${Preparation.fromMap(cardDate[position]).date}",25,bluefonce),
                Row(children: <Widget>[Expanded(flex: 3,child: StylofText("Patients : ",22,blue),),Expanded(flex: 2,child:StylofText("$patients ", 20,Colors.black54))]),
                Row(children: <Widget>[Expanded(flex: 3,child: StylofText("Les medicament Utulise : ",22,blue),),Expanded(flex: 2,child:StylofText("$nameDrug ", 20,Colors.black54))]),
                Row(children: <Widget>[Expanded(flex: 3,child: StylofText("chaq med nombre de flacon : ",22,blue),),Expanded(flex: 2,child:StylofText("$nbrFlacon ", 23,Colors.black54)),]),
                Row(children: <Widget>[Expanded(flex: 3,child: StylofText("prix : ",22,blue),),Expanded(flex: 2,child:StylofText("$prisTotalToday ", 23,Colors.black54))]),



]))
          )),);
    });
}}
