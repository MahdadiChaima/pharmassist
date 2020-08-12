import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/UI/Drawer/drawer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'accueil.dart';
import 'package:response/response.dart';
const Color blue = Color(0xff57D9F8);const Color bluefonce = Color(0xff5EAED1);

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final TextEditingController _ctrllprenom=new TextEditingController();
  final TextEditingController _ctrlmodpass=new TextEditingController();
  final response = ResponseUI.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
       body:Container(
         height:double.infinity ,
         width:double.infinity,
         decoration: BoxDecoration(
           gradient: LinearGradient(
               begin: Alignment.centerLeft,
               colors: [bluefonce,blue]),
         ),


           child: new Container( margin: EdgeInsets.only(top:30,bottom: 30),
             padding: EdgeInsets.only(left: 40,right: 40,top:10,bottom:30),
             // height: 600,
             width: double.infinity,
             //color: Colors.white,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                   topRight: Radius.circular(180),
                   topLeft: Radius.circular(0),
                   bottomLeft: Radius.circular(180)),
             ),


             child: ListView(
               children: <Widget>[
                 Container(child: Text("Bienvenue",style: TextStyle(fontSize:response.setFontSize( 30),fontFamily: 'primus',fontWeight:FontWeight.w600),),),
                 SizedBox(height: response.setHeight(30),),
                 Container(child: Text("Veuillez saisir votre prénom et un mot de passe",style: TextStyle(fontSize:response.setFontSize( 25),fontFamily: 'primus',color: Color(0xff313131)),),),
                 SizedBox(height: response.setHeight(60),),
                 Container(child: Text("Prénom",style: TextStyle(fontSize:response.setFontSize( 26),fontFamily: 'primus',color: Color(0xff313131)),),),
                 SizedBox(height: response.setHeight(10),),
                 Container(height:response.setHeight(50),width:double.infinity,decoration: BoxDecoration(color: Color(0xffEBF1FA),borderRadius: BorderRadius.circular(20)),child: TextField(controller: _ctrllprenom,),),
                 SizedBox(height: response.setHeight(20),),
                 Container(child: Text("Mot de passe",style: TextStyle(fontSize:response.setFontSize( 24),fontFamily: 'primus',color: Color(0xff313131)),),),
                 SizedBox(height: response.setHeight(10),),
                 Container(height:response.setHeight(50),width:double.infinity,decoration: BoxDecoration(color: Color(0xffEBF1FA),borderRadius: BorderRadius.circular(20)),child: TextField(textAlign:TextAlign.center,obscureText:true,controller: _ctrlmodpass,),),
                 SizedBox(height: response.setHeight(70),),
                 GestureDetector(onTap:()=>Navigator.of(context).pushReplacement(
                 MaterialPageRoute(builder: (BuildContext context) => accueil())),child:Container(child: Text("plus tard",style: TextStyle(fontSize: response.setFontSize(26),fontFamily: 'primus',color: blue),textAlign: TextAlign.end,),)),
                 SizedBox(height: response.setHeight(15),),
                 Container(
                   margin: EdgeInsets.only(left: 100),

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                     gradient: LinearGradient(colors:[bluefonce,blue]),
                   ),
                   child: FlatButton(onPressed: (){
                     if(_ctrlmodpass.text=="chaima1"){
    Navigator.of(context).pushReplacement(
    MaterialPageRoute
    (builder: (BuildContext context) => accueil()));
    print("$_ctrlmodpass.text");
    }
                     else{
                       Alert(
                         context: context,
                         image: Image.asset(
                           "assests/images/logoblue.png",color:Colors.deepOrange,
                           height:response.setHeight(110) ,
                           width: response.setWidth(110),
                         ),
                         title: "mode pass incorrecte vous vous sote letap hadi",
                         //desc: ",
                         buttons: [
                           DialogButton(
                             child: Text(
                               "Oui",
                               style: TextStyle(color: Colors.white, fontSize: 20),
                             ),
                             onPressed:(){},
                                 /*Navigator.of(context).push(
                                 MaterialPageRoute(
                                     builder: (BuildContext context) =>compt2(Surfacec: double.parse(_ctrlsurfacec.text),))),*/
                             color:Colors.red,
                             //Color(0xff57D9F8) ,
                           ),
                           DialogButton(
                             child: Text(
                               "Non",
                               style: TextStyle(color: Colors.white, fontSize: 20),
                             ),
                             onPressed: () => Navigator.pop(context),
                             color: Colors.black26,
                           )
                         ],
                       ).show();
                     }

    },

  child: Text("Commencer",style: TextStyle(fontSize:response.setFontSize(24),fontFamily: 'primus',color: Colors.white,fontWeight: FontWeight.w800),),),
    ),

               ],
             ),

         ),
       )
     ),
    );
  }
}
