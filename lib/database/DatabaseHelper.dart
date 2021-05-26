import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pharmassist/model/reliquat.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/pation.dart';
import '../model/preparation.dart';
import '../model/medicament.dart';
class DatabaseHelper {
  // attribut med
  final String tableMed = 'MedTable';
  final String _idMed='idMed';
  final String _medicament='medicament';
  final String _Labo = 'labo';
  final String _presentation = 'presentation';
  final String _pris = 'pris';
  final String _ci = 'ci';
  final String _cmin = 'cmin';
  final String _cmax = 'cmax';
  final String _volumaprespreparation = 'volumeaprespreparation';
  final String _stabiliteflacon1 = 'stabiliteflacon1';
  final String _stabiliteCi1 = 'stabiliteCi1';
  final String _stabilitelumiere1 = 'stabilitelumiere1';
  final String _stabiliteC1='stabiliteC1';
  final String _stabilitetemp1='stabilitetemp1';
  final String _stabiliteflacon2 = 'stabiliteflacon2';
  final String _stabiliteCi2 = 'stabiliteCi2';
  final String _stabilitelumiere2 = 'stabilitelumiere2';
  final String _stabiliteC2='stabiliteC2';
  final String _stabilitetemp2='stabilitetemp2';
  final String _stabiliteflacon3 = 'stabiliteflacon3';
  final String _stabiliteCi3 = 'stabiliteCi3';
  final String _stabilitelumiere3 = 'stabilitelumiere3';
  final String _stabiliteC3='stabiliteC3';
  final String _stabilitetemp3='stabilitetemp3';
  final String _qteDispo1 = 'qteDiqponible1';
  final String _volumeFlacon1 = 'volumeFlacon1';
  //attribut PAtion
  final String tablePation="pationTable";
  final String _idPation='idPation';
  final String _nomPation = 'nomPation';
  final String _prenomPation = 'prenomPation';
  final String _surfaceC = 'surfaceC';
//attribut de preparation
  final String tablePreparation="preparationTable";
   final String _id_preparation = 'idPreparation';
   final String _primeOuNon='primeOuNon';
   final String _dose='dose';
  final String _date= 'date';
  final String _nbrFlacon='nbrFlacon';
  final String _poche='poche';

  final String _prisTotal='prisTotal';
  final String _volumeCalculer='volumeCalculer';
  final String _posologie='posologie';
final String _nomMedPrepare='nomMedPrepare';
final String _nomPationPrepare='nomPationPrepare';
final String _prixreliq='prixreliq';
//atribut reliquat
  final String tableReliq='reliquatTable';
  final String _idReliq='idReliq';
  final String  _Reliquat='reliquat';
  final String _nomMedReliq='nomMedReliq';
  final String _dateprep='dateprep';
  final String _stabilitereliquat='stabilitereliquat';
  final String _dateFormatter='dateFormatter';
  //Singlton
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  DatabaseHelper.internal();
  //to cashe all the states of the Database  - better for memory
  //not create new DB helper
  factory DatabaseHelper() => _instance;

  //Database reference
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
// get location Path file fi phone
  initDb() async {

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "pharmassist.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  //*****************************************************************  CREATE TABLES  **********************************************************************
  void _onCreate(Database db, int version) async {
    await db.execute(

    "CREATE TABLE $tableMed($_idMed INTEGER PRIMARY KEY, $_medicament TEXT, $_Labo TEXT,$_stabiliteflacon1 TEXT,$_stabilitelumiere1 TEXT,$_stabiliteflacon2 TEXT,$_stabilitelumiere2 TEXT,$_stabiliteflacon3 TEXT,$_stabilitelumiere3 TEXT,"
        "$_presentation REAL,$_ci REAL,$_cmax REAL,$_cmin REAL,$_volumaprespreparation REAL,$_pris REAL,"
        "$_stabiliteCi1 REAL,$_stabiliteC1 REAL,$_stabilitetemp1 INTEGER,$_stabiliteCi2 REAL,$_stabiliteC2 REAL,$_stabilitetemp2 INTEGER,$_stabiliteCi3 REAL,$_stabiliteC3 REAL,$_stabilitetemp3 INTEGER,$_qteDispo1 REAL,$_volumeFlacon1 REAL)");
    await db.execute("CREATE TABLE $tablePation($_idPation INTEGER PRIMARY KEY,$_nomPation TEXT,$_prenomPation TEXT,$_surfaceC REAL )");

    await db.execute(
      "CREATE TABLE $tablePreparation($_id_preparation INTEGER PRIMARY KEY autoincrement,$_nomPationPrepare TEXT,$_nomMedPrepare TEXT,$_date TEXT,$_posologie REAL,"
          "$_volumeCalculer REAL,$_nbrFlacon INTEGER,$_poche INTEGER ,$_prisTotal INTEGER,$_dose REAL,$_primeOuNon INTEGER,$_prixreliq INTEGER)");
    await db.execute(
        "CREATE TABLE $tableReliq($_idReliq INTEGER PRIMARY KEY autoincrement,$_Reliquat REAL,$_nomMedReliq TEXT,$_dateprep TEXT,$_stabilitereliquat INTEGER,$_dateFormatter TEXT)");
  }
//**********************************************************Medicament**************************************************************************
//CREATE TABLE

  //CRUD - Create Read Update DELETE
  Future<int> saveMed(Medicament medicament) async {
    var dbMedicament = await db;
    return await dbMedicament.insert("$tableMed", medicament.toMap());
  }
  //READ TABLE
  Future<List> getAllMed() async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery("SELECT * FROM $tableMed");
    return result.toList();
  }
 //UPDATE TABLE
  Future<int> updateMed(Medicament med) async {
    var dbMedicament = await db;
    return await dbMedicament.update(tableMed, med.toMap(),
        where: "$_idMed = ?", whereArgs: [med.idMed]);
  }
  //DELETE TABLE
  Future<int> deleteMed(int id) async {
    var dbMedicament = await db;
    return await dbMedicament
        .delete(tableMed, where: "$_idMed = ?", whereArgs: [id]);
  }
  //get information of one patient By insert ID
  Future<Medicament> getMed(int id) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $_idMed =$id");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }
  //get Id of medicament  using her name
  Future<int> getIdMed(String nommed) async {
    var dbMed= await db;
    return  Sqflite.firstIntValue(await dbMed.rawQuery(
        "SELECT $_idMed FROM $tableMed WHERE $_medicament LIKE '$nommed'"
    ));
  }

  //*****************************************************************************Patient************************************************************************
  //CREATE TABLE
  Future<int> savePation(Paction pat) async {
    var dbPation = await db;
    int res = await dbPation.insert("$tablePation", pat.toMap());

    return res;
  }
  //READ TABLE
  Future<List> getAllPation() async {
    var dbPat = await db;
    var result = await dbPat.rawQuery("SELECT * FROM $tablePation");
    return result.toList();
  }
  //UPDATE TABLE
  Future<int> updatePation(Paction pat) async {
    var dbPation= await db;
    return await dbPation.update(tablePation, pat.toMap(),
        where: "$_idPation = ?", whereArgs: [pat.idPation]);
  }
  //DELETE TABLE
  Future<int> deletePation(int id) async {
    var dbPat = await db;
    return await dbPat
        .delete(tablePation, where: "$_idPation = ?", whereArgs: [id]);
  }
  //get information of one patient By insert ID
  Future<Paction> getPation(int id) async {
    var dbPat = await db;
    var result = await dbPat
        .rawQuery("SELECT * FROM $tablePation WHERE $_idPation =$id");
    if (result.length == 0) return null;
    return new Paction.fromMap(result.first);
  }
  //get Id of patient using her name
  Future<int> getIdPation(String nompat) async {
    var dbPation= await db;
    return  Sqflite.firstIntValue(await dbPation.rawQuery(
        "SELECT $_idPation FROM $tablePation WHERE $_nomPation LIKE '$nompat'"
    ));
  }
//**********************************************************************************PREPARATION*********************************************************************
  //CREATE TABLE
  Future<int> savePreparation(Preparation prep) async {
    var dbPreparation = await db;
    int res = await dbPreparation.insert("$tablePreparation", prep.toMap());
    return res;
  }
  //READ TABLE
  Future<List> getAllPreparation() async {
    var dbPrep = await db;
    var result = await dbPrep.rawQuery("SELECT * FROM $tablePreparation");
    return result.toList();
  }
  //DELETE TABLE
  Future<int> deletePreparation(int id) async {
    var dbPrep = await db;
    return await dbPrep
        .delete(tablePreparation, where: "$_id_preparation = ?", whereArgs: [id]);
  }
  Future<Preparation> getPreparation(int id) async {
    var dbPreparation = await db;
    var result = await dbPreparation
        .rawQuery("SELECT * FROM $tablePreparation WHERE $_id_preparation =$id");
    if (result.length == 0) return null;
    return new Preparation.fromMap(result.first);
  }

//get all Information  of Today by Insert day Of today
  Future<List> getDate(String  date) async {
    var dbPrep = await db;
    var result = await dbPrep.rawQuery("SELECT * FROM $tablePreparation WHERE $_date LIKE '$date'");
    return result.toList();
  }
//********************************************************************RELIQUAT***************************************************************************
  //CREATE TABLE
  Future<int> saveReliq(Reliquat relq) async {
    var dbReliq = await db;
    int res = await dbReliq.insert("$tableReliq", relq.toMap());
    return res;
  }
  //READ TABLE
  Future<List> getAllReliq() async {
    var dbreliq = await db;
    var result = await dbreliq.rawQuery("SELECT * FROM $tableReliq");
    return result.toList();
  }
  //DELETE TABLE
  Future<int> deleteReliq(int id) async {
    var dbreliq = await db;
    return await dbreliq
        .delete(tableReliq, where: "$_idReliq = ?", whereArgs: [id]);
  }
Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
































