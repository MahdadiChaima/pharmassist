import 'dart:math';
import 'package:response/response.dart';

import 'package:flutter/material.dart';

const Color gris= Color(0xffEBF1FA);const Color blue = Color(0xff57D9F8);  const Color bluefonce = Color(0xff5EAED1);



class Dialogs_confirmation {
  final response = ResponseUI.instance;

  String text;
  Function ontapSave;
  Function ontapCancel;
  Dialogs_confirmation({this.text,this.ontapSave,this.ontapCancel});
  Future<double> information(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: gris,


            actions: <Widget>[
              Image.asset(
                "assests/images/logoblue.png",
                height:response.setHeight(110) ,
                width: response.setWidth(110),
              ),
              SizedBox(
                width: 20,
              ),
              stylofText(text,response.setFontSize(20)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[   Material(
                color: bluefonce,
                borderRadius: BorderRadius.circular(20.0),
                elevation: 15.0,
                child: MaterialButton(
                    onPressed: ontapSave,
                    minWidth: 150.0,
                    height: 0.0,
                    child:stylofText("oui", response.setFontSize(20),Colors.white)
                ),
              ),
                Material(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 15.0,
                  child: MaterialButton(
                      onPressed: ontapSave,
                      minWidth: 150.0,
                      height: 0.0,
                      child:stylofText("non", response.setFontSize(20),Colors.white)
                  ),
                ),],),



              //onPressed:()=> Navigator.pop(context), child: Text("Calcule")
            ],
          );
        });
  }
}


class stylofText extends StatelessWidget {
  stylofText(this.text,this.size,[this.color]);
  String text;
  double size;
  Color color;

  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: response.setFontSize(size),fontFamily: 'primus',fontWeight: FontWeight.w600,color:color));
  }
}