import 'package:intl/intl.dart';

String dateFormatter(){
  var now = DateTime.now();
  var formatter = DateFormat("yyyy-MM-dd");
  String formatted = formatter.format(now);
  return formatted;
}