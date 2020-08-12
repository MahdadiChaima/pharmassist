import 'package:flutter/material.dart';
import 'package:response/response.dart';

class AppConsta{
  static Color blue = Color(0xff57D9F8);
  static Color bluefonce = Color(0xff5EAED1);

static Color gris= Color(0xffEBF1FA);

}
class StylofText extends StatelessWidget {
  StylofText(this.text,this.size,[this.color]);
  String text;
  double size;
  Color color;
  FontWeight font=FontWeight.w600;

  final response = ResponseUI.instance;


  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: response.setFontSize(size),fontFamily: 'primus',fontWeight: font,color:color));
  }
}