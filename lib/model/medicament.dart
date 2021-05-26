class Medicament  {

  int _idMed,_stabilitetemp3,_stabilitetemp1,_stabilitetemp2;
  String _labo, _medicament,_stabiliteflacon1, _stabilitelumiere1 ,_stabiliteflacon2, _stabilitelumiere2,_stabiliteflacon3, _stabilitelumiere3 ;
  double _presentation, _ci,_cmin,_cmax,_volumaprespreparation,_pris,_stabiliteCi1,_stabiliteC1,
      _stabiliteCi2,_stabiliteC2,_stabiliteCi3,_stabiliteC3,_qteDispo1,_volumeFlacon1;

Medicament(this._medicament,
    this._labo,this._presentation,this._ci,this._cmin,this._cmax,this._pris,this._volumaprespreparation,this._stabiliteflacon1
    ,this._stabiliteCi1,this._stabilitelumiere1,this._stabiliteC1,this._stabilitetemp1,this._stabiliteflacon2
  ,this._stabiliteCi2,this._stabilitelumiere2,this._stabiliteC2,this._stabilitetemp2,this._stabiliteflacon3
  ,this._stabiliteCi3,this._stabilitelumiere3,this._stabiliteC3,this._stabilitetemp3,this._qteDispo1,this._volumeFlacon1,);
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
  this._stabiliteflacon1= obj['stabiliteflacon1'];
  this._stabiliteCi1= obj['stabiliteCi1'];
  this._stabilitelumiere1=obj['stabilitelumiere1'];
  this._stabiliteC1= obj['stabiliteC1'];
  this._stabilitetemp1= obj['stabilitetemp1'];

    this._stabiliteflacon2= obj['stabiliteflacon2'];
    this._stabiliteCi2= obj['stabiliteCi2'];
    this._stabilitelumiere2=obj['stabilitelumiere2'];
    this._stabiliteC2= obj['stabiliteC2'];
    this._stabilitetemp2= obj['stabilitetemp2'];

    this._stabiliteflacon3= obj['stabiliteflacon3'];
    this._stabiliteCi3= obj['stabiliteCi3'];
    this._stabilitelumiere3=obj['stabilitelumiere3'];
    this._stabiliteC3= obj['stabiliteC3'];
    this._stabilitetemp3= obj['stabilitetemp3'];
  this._qteDispo1=obj['qteDiqponible1'];
  this._volumeFlacon1=obj['volumeFlacon1'];

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
  String get  stabiliteflacon1=>_stabiliteflacon1;
  double get  stabiliteCi1=>_stabiliteCi1;
  String get stabilitelumiere1 =>_stabilitelumiere1;
  double get stabiliteC1 =>_stabiliteC1;
  int get stabilitetemp1 =>_stabilitetemp1;

  String get  stabiliteflacon2=>_stabiliteflacon2;
  double get  stabiliteCi2=>_stabiliteCi2;
  String get stabilitelumiere2 =>_stabilitelumiere2;
  double get stabiliteC2 =>_stabiliteC2;
 int get stabilitetemp2 =>_stabilitetemp2;

  String get  stabiliteflacon3=>_stabiliteflacon3;
  double get  stabiliteCi3=>_stabiliteCi3;
  String get stabilitelumiere3 =>_stabilitelumiere3;
  double get stabiliteC3 =>_stabiliteC3;
  int get stabilitetemp3 =>_stabilitetemp3;
  double get  qetDispo1=>_qteDispo1;
  double get volumeFlacon1=>_volumeFlacon1;

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
    map['stabiliteflacon1']=_stabiliteflacon1;
    map['stabiliteCi1']=_stabiliteCi1;
    map['stabilitelumiere1']=_stabilitelumiere1;
    map['stabiliteC1']=_stabiliteC1;
    map['stabilitetemp1']=_stabilitetemp1;

    map['stabiliteflacon2']=_stabiliteflacon2;
    map['stabiliteCi2']=_stabiliteCi2;
    map['stabilitelumiere2']=_stabilitelumiere2;
    map['stabiliteC2']=_stabiliteC2;
    map['stabilitetemp2']=_stabilitetemp2;
    map['stabiliteflacon3']=_stabiliteflacon3;
    map['stabiliteCi3']=_stabiliteCi3;
    map['stabilitelumiere3']=_stabilitelumiere3;
    map['stabiliteC3']=_stabiliteC3;
    map['stabilitetemp3']=_stabilitetemp3;
    map['qteDiqponible1']=_qteDispo1;
    map['volumeFlacon1']=_volumeFlacon1;

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
   this._stabiliteflacon1= map['stabiliteflacon1'];
   this._stabiliteCi1= map['stabiliteCi1'];
   this._stabilitelumiere1=map['stabilitelumiere1'];
   this._stabiliteC1= map['stabiliteC1'];
   this._stabilitetemp1= map['stabilitetemp1'];
   this._stabiliteflacon2= map['stabiliteflacon2'];
    this._stabiliteCi2= map['stabiliteCi2'];
    this._stabilitelumiere2=map['stabilitelumiere2'];
    this._stabiliteC2= map['stabiliteC2'];
    this._stabilitetemp2= map['stabilitetemp2'];
    this._stabiliteflacon3= map['stabiliteflacon3'];
    this._stabiliteCi3= map['stabiliteCi3'];
    this._stabilitelumiere3=map['stabilitelumiere3'];
    this._stabiliteC3= map['stabiliteC3'];
    this._stabilitetemp3= map['stabilitetemp3'];
   this._qteDispo1=map['qteDiqponible1'];
   this._volumeFlacon1=map['volumeFlacon1'];

  }



}