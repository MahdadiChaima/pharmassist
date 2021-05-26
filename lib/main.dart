import 'package:flutter/material.dart';
import 'package:pharmassist/database/DatabaseHelper.dart';
import 'package:pharmassist/model/medicament.dart';
import 'package:pharmassist/model/pation.dart';
import 'package:pharmassist/model/preparation.dart';
import 'UI/Drawer/theme.dart';
import 'UI/Specific/dateFormatter.dart';
import 'UI/splash_screen.dart';
import 'package:response/response.dart';
import 'package:provider/provider.dart';
import 'database/DatabaseHelper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

List meds, pats, preps, reliqs;
Medicament med_det, med_modif;
Paction pat_det, pat_modif;
Preparation prep_det;
int selected_id_Med, selected_id_Preparation, selected_id_Reliq, selected_id_Pation, updated_id_Med;
int updated_id_Pation;
String selected_item_pat = null;
String selected_item_med = null;
int selected_item_idMed, selected_item_idPation;
List cardDate;
Paction selectPaction;
Medicament selectMed;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
var db = new DatabaseHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });

  cardDate = await db.getDate(dateFormatter());
  meds = await db.getAllMed();
  runApp(Response(
      child: ChangeNotifierProvider<ThemeChanger>(
          builder: (_) => ThemeChanger(ThemeData.light()),
          child: MaterialAppWithTheme())));
}
class MaterialAppWithTheme extends StatelessWidget {
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new splash_screen(),
      theme: theme.getTheme(),
      themeMode: ThemeMode.light,
      title: "Pharm Assist",
    );
  }
}
