class Poche {

  double _poche;
  int _id_preparation;
  int _id_med;

  Poche(this._poche, this._id_preparation,this._id_med);

  Poche.map(dynamic obj) {
  this._poche = obj['poche'];
  this._id_preparation = obj['id_preparation'];
  this._id_med = obj['id_med'];
  }

  //getters
  double get poche => _poche;

  int get id_preparation => _id_preparation;

  int get id_med => _id_med;

  //Map Connstructors
  Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();
  map["poche"] = _poche;
  if(id_preparation != null){
  map["id_preparation"] = _id_preparation;}
  if(id_med != null){
  map["id_med"] = _id_med;
  }
  return map;
  }

  Poche.fromMap(Map<String, dynamic> map){
  this._poche = map["poche"];
  this._id_preparation = map["id_preparation"];
  this._id_med = map["id_med"];
  }

}