
//final String _datenowprep='datenowprep';
//final String _stabiliteTemp='stabiliteTemp'; //final String _reliquat='reliquat';
class Preparation{
  int _id_preparation;
  String _date,_nomPationPrepare,_nomMedPrepare;
int _nbrFlacon,_prisTotal,_poche;
     double _volumeCalculer,_posologie,_dose;

  Preparation(this._nomPationPrepare,this._nomMedPrepare,
      this._date,this._posologie,this._volumeCalculer,this._nbrFlacon,this._poche,this._prisTotal,this._dose);
  Preparation.map(dynamic obj) {

    this._dose=obj['dose'];


    this._nomPationPrepare=obj['nomPationPrepare'];
    this._nomMedPrepare=obj['nomMedPrepare'];

    this._id_preparation = obj['idPreparation'];
    this._date= obj['date'];
    this._posologie=obj['posologie'];
    this._nbrFlacon=obj['nbrFlacon'] ;
    this. _poche=obj['poche'];

    this._prisTotal=obj['prisTotal'];
    this._volumeCalculer=obj['volumeCalculer'];
  }
  double get dose=>_dose;
  int get id_preparation => _id_preparation;
  String get nomMedPrepare=>_nomMedPrepare;
  String get nomPationPrepare=>_nomPationPrepare;
  int get nbrFlacon=>_nbrFlacon;
  String get date=>_date;
  int get poche=>_poche;
  int get prisTotal=>_prisTotal;
 double get volumeCalculer=>_volumeCalculer;
double get posologie=>_posologie;
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id_preparation != null) {

      map['idPreparation'] = _id_preparation;
    }
    map['dose']=_dose;
    map['nomMedPrepare']=_nomMedPrepare;
    map['nomPationPrepare']=_nomPationPrepare;
    map['date']= _date;
    map['posologie']=_posologie;
    map['nbrFlacon']= _nbrFlacon;
    map['poche']=  _poche;
    map['volumeCalculer']=_volumeCalculer;
    map['prisTotal']=_prisTotal;
    return map;
  }
  Preparation.fromMap(Map<String, dynamic> map) {
    this._id_preparation = map['idPreparation'];
    this._date= map['date'];
    this._nbrFlacon=map['nbrFlacon'] ;
    this._posologie=map['posologie'];
    this. _poche=map['poche'];
    this._volumeCalculer=map['volumeCalculer'];
    this._prisTotal=map['prisTotal'];
    this._nomPationPrepare=map['nomPationPrepare'];
    this._nomMedPrepare=map['nomMedPrepare'];
    this._dose=map['dose'];

  }

}