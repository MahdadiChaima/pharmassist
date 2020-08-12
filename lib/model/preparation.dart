class Preparation{
  int _id_med;
  int _id_pation;
  int _id;
  String _date;
  int _nbrFlacon;
  int _pocheUtilise;
  double _reliquat;
  Preparation(this._date, this._nbrFlacon,this._pocheUtilise,this._reliquat,this._id_med,this._id_pation);
  Preparation.map(dynamic obj) {
    this._id = obj['id'];
    this._date= obj['date'];
    this._nbrFlacon=obj['nbrFlacon'] ;
    this. _pocheUtilise=obj['pocheUtilise'];
    this. _reliquat=obj['reliquat'];
    this._id_med=obj['id_med'];
    this._id_pation=obj['id_pation'];
  }
  int get id => _id;
  String get date=>_date;
  int get nbrFlacon=>_nbrFlacon;
  int get pocheUtilise=>_pocheUtilise;
  double get reliquat=>_reliquat;
  int get id_med=>_id_med;
  int get id_pation=>_id_pation;
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
  if (id != null) {
  map['id'] = _id;
  }
  if(id_med!=null){
    map['id_med']=_id_med;
  }
  if(id_pation!=null){
    map['id_pation']=_id_pation;
  }
  map['date']= _date;
  map['nbrFlacon']= _nbrFlacon;
  map['pocheUtilise']=  _pocheUtilise;
  map['reliquat']=  _reliquat;
  return map;
  }
Preparation.fromMap(Map<String, dynamic> map) {
  this._id = map['id'];
 this._date= map['date'];
  this._nbrFlacon=map['nbrFlacon'] ;
  this. _pocheUtilise=map['pocheUtilise'];
  this. _reliquat=map['reliquat'];
  this._id_med=map["id_med"];
  this._id_pation=map['id_pation'];

  }

}