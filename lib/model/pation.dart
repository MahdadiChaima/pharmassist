class Paction{
  String _nomPation;
  String _prenomPation;
  double _surfaceC;
  int _idPation;
  Paction(this._nomPation, this._prenomPation,this._surfaceC);
  Paction.map(dynamic obj) {
  this._nomPation = obj['nomPation'];
  this._prenomPation = obj['prenomPation'];
  this._surfaceC = obj['surfaceC'];
  this._idPation = obj['idPation'];
  }
  String get nomPation => _nomPation;
  String get prenomPation => _prenomPation;
  double get surfaceC=>_surfaceC;
  int get idPation => _idPation;
  //Map Connstructors
  Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();
  map['nomPation'] = _nomPation;
  map['prenomPation'] = _prenomPation;
  map['surfaceC']=_surfaceC ;
  if(_idPation != null){
  map['idPation'] = _idPation;
  }
  return map;
  }
  Paction.fromMap(Map<String, dynamic> map){
  this._nomPation = map['nomPation'];
  this._prenomPation = map['prenomPation'];
  this._surfaceC =map['surfaceC'];this._idPation = map['idPation'];
  }

}