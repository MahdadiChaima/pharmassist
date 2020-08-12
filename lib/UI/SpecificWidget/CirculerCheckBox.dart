import 'package:flutter/material.dart';
import 'package:response/response.dart';
const Color blue = Color(0xff57D9F8);



class CirculerCheckBox extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CirculerCheckBox> {
  bool _value = false;
final response = ResponseUI.instance;

@override
  Widget build(BuildContext context) {
    return Center(child:Column(children: <Widget>[
      SizedBox(height:response.setHeight(16)
,
      ),  InkWell(
        onTap: () {
          setState(() {
            _value = !_value;
          });
        },
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: blue),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: _value
                ? Icon(
              Icons.check,
              size: 15.0,
              color: Colors.white,
            )
                : Icon(
              Icons.check_box_outline_blank,
              size: 15.0,
              color: blue,
            ),
          ),
        ),),
    ],));
  }
}
