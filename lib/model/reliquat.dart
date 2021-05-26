class Reliquat{
  int _idReliq;
 double _Reliquat;
 String _nomMedReliq;
 String _dateprep;
 int _stabilitereliquat;
 String _dateFormatter;
 Reliquat(this._Reliquat, this._nomMedReliq,this._dateprep,this._stabilitereliquat,this._dateFormatter);
 Reliquat.map(dynamic obj) {
   this._dateFormatter=obj['dateFormatter'];
   this._idReliq=obj['idReliq'];
    this._Reliquat = obj['reliquat'];
    this._nomMedReliq=obj['nomMedReliq'];
    this._dateprep=obj['dateprep'];
    this._stabilitereliquat=obj['stabilitereliquat'];
  }
double get reliquatR => _Reliquat;
 String get nomMedReliq=>_nomMedReliq;
 String get dateprep=>_dateprep;
 int get stabilitereliquat=>_stabilitereliquat;
 int get idReliq=>_idReliq;
String get dateFormatter=>_dateFormatter;
Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(_idReliq != null){
      map['idReliq']=_idReliq;
    }
    map['reliquat'] = _Reliquat;
    map['nomMedReliq']=_nomMedReliq;
    map['dateprep']=_dateprep;
    map['stabilitereliquat']=_stabilitereliquat;
    map['dateFormatter']=_dateFormatter;

    return map;
  }
 Reliquat.fromMap(Map<String, dynamic> map){
    this._Reliquat = map['reliquat'];
    this._nomMedReliq = map['nomMedReliq'];
    this._dateprep = map['dateprep'];
    this._stabilitereliquat=map['stabilitereliquat'];
    this._idReliq=map['idReliq'];
    this._dateFormatter=map['dateFormatter'];
  }
}