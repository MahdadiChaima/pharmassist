class Medicament  {

  int _idMed;
  String _labo, _medicament,_stabiliteflacon, _stabilitelumiere  ;
  double _presentation, _ci,_cmin,_cmax,_volumaprespreparation,_pris,_stabiliteCi,_stabiliteC,_stabilitetemp,_qteDispo,_volumeFlacon;

Medicament(this._medicament,
    this._labo,this._presentation,this._ci,this._cmin,this._cmax,this._pris,this._volumaprespreparation,this._stabiliteflacon
    ,this._stabiliteCi,this._stabilitelumiere,this._stabiliteC,this._stabilitetemp,this._qteDispo,this._volumeFlacon);
  Medicament.map(dynamic obj) {
    this._idMed = obj['idMed'];

    this._medicament = obj['medicament'];
    this._labo=obj['labo'];
  this._presentation=obj['presentation'];
  this._ci=obj['ci'];
  this._cmin=obj['cmin'];
  this._cmax= obj['cmax'];
  this._pris= obj['pris'];
  this._volumaprespreparation=obj['volumeaprespreparation'];
  this._stabiliteflacon= obj['stabiliteflacon'];
  this._stabiliteCi= obj['stabiliteCi'];
  this._stabilitelumiere=obj['stabilitelumiere'];
  this._stabiliteC= obj['stabiliteC'];
  this._stabilitetemp= obj['stabilitetemp'];
  this._qteDispo=obj['qteDiqponible'];
  this._volumeFlacon=obj['volumeFlacon'];
  }

  int get idMed =>_idMed;
  String get  medicament=>_medicament;
  String get labo =>_labo;
  double get presentation =>_presentation;
  double get  ci=>_ci;
  double get  cmin=>_cmin;
  double get  cmax=>_cmax;
  double get  pris=>_pris;
  double get volumeaprespreparation =>_volumaprespreparation;
  String get  stabiliteflacon=>_stabiliteflacon;
  double get  stabiliteCi=>_stabiliteCi;
  String get stabilitelumiere =>_stabilitelumiere;
  double get stabiliteC =>_stabiliteC;
  double get stabilitetemp =>_stabilitetemp;
  double get  getDispo=>_qteDispo;
  double get volumeFlacon=>_volumeFlacon;
  Map<String,dynamic>toMap(){
    var map=Map<String,dynamic>();
    if(_idMed!=null){   map['idMed']=_idMed;}
    map['medicament']=_medicament;
   map['labo']=_labo;
    map['presentation']=_presentation;
    map['ci']=_ci;
    map['cmin']=_cmin;
    map['cmax']=_cmax;
    map['pris']=_pris;
    map['volumeaprespreparation']=_volumaprespreparation;
    map['stabiliteflacon']=_stabiliteflacon;
    map['stabiliteCi']=_stabiliteCi;
    map['stabilitelumiere']=_stabilitelumiere;
    map['stabiliteC']=_stabiliteC;
    map['stabilitetemp']=_stabilitetemp;
    map['qteDiqponible']=_qteDispo;
    map['volumeFlacon']=_volumeFlacon;
    return map;
}
  Medicament.fromMap(Map<String,dynamic>map){
    this._idMed=map['idMed'];
    this._medicament=map['medicament'];

    this._labo=map['labo'];
    this._presentation=map['presentation'];
    this._ci=map['ci'];
    this._cmin=map['cmin'];
   this._cmax= map['cmax'];
   this._pris= map['pris'];
   this._volumaprespreparation=map['volumeaprespreparation'];
   this._stabiliteflacon= map['stabiliteflacon'];
   this._stabiliteCi= map['stabiliteCi'];
   this._stabilitelumiere=map['stabilitelumiere'];
   this._stabiliteC= map['stabiliteC'];
   this._stabilitetemp= map['stabilitetemp'];
   this._qteDispo=map['qteDiqponible'];
   this._volumeFlacon=map['volumeFlacon'];
  }



}