class Pation{
  String _nomPation;
  String _prenomPation;
  double _surfaceC;
  int _id;
  Pation(this._nomPation, this._prenomPation,this._surfaceC);
  Pation.map(dynamic obj) {
  this._nomPation = obj['nomPation'];
  this._prenomPation = obj['prenomPation'];
  this._surfaceC = obj['_surfaceC'];
  this._id = obj['id'];
  }
  String get nomPation => _nomPation;
  String get prenomPation => _prenomPation;
  double get surfaceC=>_surfaceC;
  int get id => _id;
  //Map Connstructors
  Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();
  map["nomPation"] = _nomPation;
  map["prenomPation"] = _prenomPation;
  map["_surfaceC"]=_surfaceC ;
  if(id != null){
  map["id"] = _id;
  }
  return map;
  }
  Pation.fromMap(Map<String, dynamic> map){
  this._nomPation = map["nomPation"];
  this._prenomPation = map["prenomPation"];
  this._surfaceC =map["_surfaceC"];this._id = map["id"];
  }

}