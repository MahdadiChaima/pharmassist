class Reliquat{
 double _reliquat;
  int _id_preparation;
  int _id_med;
 Reliquat(this._reliquat, this._id_preparation,this._id_med);
 Reliquat.map(dynamic obj) {
    this._reliquat = obj['reliquat'];
    this._id_preparation = obj['id_preparation'];
    this._id_med = obj['id_med'];
  }
double get reliquat => _reliquat;
int get id_preparation => _id_preparation;
int get id_med => _id_med;
Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["reliquat"] = _reliquat;
    if(id_preparation != null){
      map["id_preparation"] = _id_preparation;}
    if(id_med != null){
      map["id_med"] = _id_med;
    }
    return map;
  }
 Reliquat.fromMap(Map<String, dynamic> map){
    this._reliquat = map["reliquat"];
    this._id_preparation = map["id_preparation"];
    this._id_med = map["id_med"];
  }
}