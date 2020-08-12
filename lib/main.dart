import 'package:flutter/material.dart';
import 'package:pharmassist/database/DatabaseHelper.dart';
import 'package:pharmassist/model/medicament.dart';
import 'UI/Drawer/theme.dart';
import 'UI/splash_screen.dart';
import 'package:response/response.dart';
import 'package:provider/provider.dart';
List meds;
//utilisée dans list view pour le item selectionner a le id de item
Medicament med_det, med_modif;
int selected_id;
int updated_id;  var db = new DatabaseHelper();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  meds = await db.getAllMed();
  runApp(Response(
     child: ChangeNotifierProvider<ThemeChanger>(  builder: (_) => ThemeChanger(ThemeData.light()),child:MaterialAppWithTheme())));
}

class MaterialAppWithTheme extends StatelessWidget {

  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return new MaterialApp (

    debugShowCheckedModeBanner: false,
    home:new splash_screen(),
 theme: theme.getTheme(),
themeMode:ThemeMode.light ,
    title:"Pharm Assist",

  );
  }
}