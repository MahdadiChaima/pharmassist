import 'package:flutter/material.dart';
import 'package:pharmassist/UI/SpecificWidget/Confirmation.dart';
import 'package:pharmassist/UI/SpecificWidget/dateFormatter.dart';
import 'package:pharmassist/UI/medicament/ajoutmed1.dart';
import 'package:pharmassist/UI/medicament/med_details.dart';
import 'package:pharmassist/database/DatabaseHelper.dart';
import 'package:pharmassist/model/medicament.dart';
import '../Drawer/drawer.dart';
import 'package:response/response.dart';
import '../SpecificWidget/CirculerCheckBox.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import'../../main.dart';
const Color bluefonce = Color(0xff5EAED1);


const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);
class med extends StatefulWidget {
  @override
  _medState createState() => _medState();
}

class _medState extends State<med> {
  TextEditingController _textFieldController = new TextEditingController();


  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chaima"),),
        body: FutureBuilder(
          future: db.getAllMed(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              meds = snapshot.data;
              return _buildlistview();
            }
            return new CircularProgressIndicator();
          },
        ),
        /* Container(
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Médicaments",
                            style: TextStyle(
                                fontSize: response.setFontSize(28),
                                fontFamily: 'primus',
                                fontWeight: FontWeight.w700),
                          ),
                        ),

                        //TODO:Recherche
                        SizedBox(
                          height: response.setHeight(60),
                        ),

                      /* Card(
                          color:  gris,elevation: 15.0,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                          child:Container(padding: EdgeInsets.only(left: 30,right: 20,top: 7,bottom:7),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                            stylofText("text", 25),
                            IconButton(icon: Icon(Icons.delete,color: bluefonce,),onPressed: ()=>{},),

                          ])),


                        ),*/

                Flexible(
                  child: ListView.builder(
                      itemCount: _itemsList.length,

                      itemBuilder: (_, int index) {
                        return   Card(color: gris,elevation: 15.0,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                          child:Container(padding: EdgeInsets.only(left: 30,right: 20,top: 7,bottom:7),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                            StylofText("pation1", 25),
                            IconButton(icon: Icon(Icons.delete,color: bluefonce,),onPressed: ()=>{},),

                          ])),

                        );
                      }),),
                        Divider(
                          height: 1.0,
                        ),























                      ],
                    ),
                  )),















            ])) ,*/
        floatingActionButton: FloatingActionButton(
        backgroundColor:  Color(0xff01a99a),
    onPressed: (){Navigator.push(context, MaterialPageRoute(
    builder:(context)=>ajoutmed1()
    ));
    },
    child: Icon(Icons.add),
    ));
  }


  ListView _buildlistview() {
    return ListView.builder(
        itemCount: meds == null ? 0 : meds.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Color(0xff00d5b7),
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/poso.jpg'),
                  radius: 50.0,
                ),
                title: Text("Medicament :${Medicament
                    .fromMap(meds[position])
                    .medicament}"),
                subtitle: Text("Id :${Medicament
                    .fromMap(meds[position])
                    .idMed}"),
                trailing: GestureDetector(
                    child: Icon(Icons.delete, color: Color(0xffF2F2F2),
                    ),

                    onTap: () async {
                      selected_id = Medicament
                          .fromMap(meds[position])
                          .idMed;
                      Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "confirmer",
                          desc: "est ce que vous etes sur de supprimer ce medicament !",
                          buttons: [
                            DialogButton(
                                color: Color(0xff01a99a),
                                child: Text("non"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }
                            ),
                            DialogButton(
                              color: Color(0xff01a99a),
                              child: Text("oui"),
                              onPressed: () {
                                db.deleteMed(selected_id);
                                setState(() {
                                  meds.removeAt(position);
                                });
                                Navigator.pop(context);
                              },
                            )
                          ]
                      ).show();
                    }
                ),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ajoutmed1(),

                  ));
                  med_det = await db.getMed(selected_id);
                },
              ));
        }
    );
  }


}



















