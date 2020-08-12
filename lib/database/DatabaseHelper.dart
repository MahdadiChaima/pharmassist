import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/pation.dart';
import '../model/preparation.dart';
import '../model/medicament.dart';

class DatabaseHelper {
  // attribut med
  final String tableMed = 'MedTable';
  final String idMed='idMed';
  final String columnMed='medicament';

  final String columnDateCreated = "dateCreated";
  final String columnLabo = 'labo';
  final String columnPresenatation = 'presentation';
  final String columnPrix = 'prix';
  final String columnCi = 'ci';
  final String columnCmin = 'cmin';
  final String columnCmax = 'cmax';
  final String columnVolumeApresPreparation = 'volumeaprespreparation';
  final String columnstabiliteflacon = 'stabiliteflacon';
  final String columnstabiliteCi = 'stabiliteCi';
  final String columnstabilitelumiere = 'stabilitelumiere';
  final String columnstabiliteC='stabiliteC';
  final String columnstabilitetemp='stabilitetemp';
  final String columnQteDisponible = 'qteDiqponible';
  final String columnVolumeFlcon = 'volumeFlacon';


//attribut PAtion
  final String tablePation="pationTable";
  final String idPation="idPation";
  final String columnNomPatient = 'NomPatient';
  final String columnPrenomPatient = 'PrenomPatient';
  final String columnSurfaceCoporelle = 'SurfaceCoporelle';

//attribut Preparation
  final String tablePreparation="preparationTable";
  final String idPreparation="idPreparation";
  final String columnDatePreparation = 'date_preparation';
  final String columnPosologie = 'posologie';
  final String columnReduction = 'reduction';
  final String columnDoseAdministrer = 'dose_administrer';
  final String columnVolumeFinale = 'volume_finale';
//attributPoche
  final String tablePoche="pocheTable";
  final String poche="poche";
  //attributReliquat
  final String tableReliquat="reliquatTable";
  final String reliquat="reliquat";
  

  //Singlton
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  //internal can be any name
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
    // from here video 2
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "pharmassist.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  /*
     onCreate: (Database db, int version) async {
        debugPrint('Database OnCreate');
        await db.execute(
          "CREATE TABLE dog(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)",
        );
        await db.execute(
          "CREATE TABLE toy(id INTEGER PRIMARY KEY AUTOINCREMENT, toytype TEXT, dogid INTEGER, FOREIGN KEY(dogid) REFERENCES dog(id) ON DELETE CASCADE)",
        );
      },
   */
  //*****************************************************************  CREATE TABLES  **********************************************************************
  void _onCreate(Database db, int version) async {
    await db.execute(

    "CREATE TABLE $tableMed($idMed INTEGER PRIMARY KEY, $columnMed TEXT, $columnLabo TEXT,$columnstabiliteflacon TEXT,$columnstabilitelumiere TEXT,"
        "$columnPresenatation REAL,$columnCi REAL,$columnCmax REAL,$columnCmin REAL,$columnVolumeApresPreparation REAL,$columnPrix REAL,"
        "$columnstabiliteCi REAL,$columnstabiliteC REAL,$columnstabilitetemp REAL,$columnQteDisponible REAL,$columnVolumeFlcon REAL)");
    //CREATE TABLE MED
  /*  await db.execute(
        "CREATE TABLE $tableMed($idMed INTEGER PRIMARY KEY,"
        //  " $columnName TEXT, $columnPassword TEXT"
            ")");
    //CREATE TABLE Pation
    await db.execute(
        "CREATE TABLE $tablePation($idPation INTEGER PRIMARY KEY,"
        //  " $columnName TEXT, $columnPassword TEXT"

            ")");
    //CREATE TABLE Preparation
    await db.execute(
        "CREATE TABLE $tablePreparation($idPreparation INTEGER PRIMARY KEY,"
        //  " $columnName TEXT, $columnPassword TEXT"
            "FOREIGN KEY($idMed) REFERENCES $tableMed($idMed) ON DELETE CASCADE)");*/
  }


















  //CRUD - Create Read Update DELETE
  Future<int> saveMed(Medicament medicament) async {
    var dbMedicament = await db;
    int res = await dbMedicament.insert("$tableMed", medicament.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllMed() async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery("SELECT * FROM $tableMed");
    return result.toList();
  }

  //afficher un medicament
  Future<Medicament> getMed(int id) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $idMed =$id");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }

  //supprimer un medicament
  Future<int> deleteMed(int id) async {
    var dbMedicament = await db;
    return await dbMedicament
    //? veut dire que on le connait pas pour le moment
        .delete(tableMed, where: "$idMed = ?", whereArgs: [id]);
  }

  //modifier medicament
  Future<int> updateMed(Medicament med) async {
    var dbMedicament = await db;
    //? veut dire que on le connait pas pour le moment
    return await dbMedicament.update(tableMed, med.toMap(),
        where: "$idMed = ?", whereArgs: [med.idMed]);
  }
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
































