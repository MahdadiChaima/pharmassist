double Dose ({double surface,double posologie}){
  double dose=surface*posologie;
  String dose1 = dose.toStringAsFixed(2);
 return  double.parse(dose1);
}
double Volume({double dose ,double ci}){
  double volume=dose/ci;
  String volume1=volume.toStringAsFixed(2);
  return double.parse(volume1);
}
int nbrFlacon({double flacon,double volume}){
  int nbrflacon=(volume/flacon).round();
  if((nbrflacon*flacon)-volume>0) {
    return nbrflacon;
  }
  else{
   // nbrflacon+1;
    return nbrflacon+1;}}

double Reliq({double flacon,double volume}){

  int nbrflacon=(volume/flacon).round();
  if((nbrflacon*flacon)-volume>0) { //nbrflacon+1;
    return double.parse (((nbrflacon*flacon)-volume).toStringAsFixed(2));
  }
  else{
    //nbrflacon+2;
    return double.parse ((((nbrflacon+1)*flacon)-volume).toStringAsFixed(2));
}}
int choisipoche({double dose,double cmax,double cmin}){
  //double intrvlpochminmin=cmin*250;
  //double intrvlpochminmax=cmin*500;
//  double intrvlpochmaxmin=cmax*250;
  //double intrvlpochmaxmax=cmax*500;
//if (dose<intrvlpochminmax)return 250;return 500;
  double pochmin=dose/cmin;
  //double pochmax=dose/cmax;
 if(pochmin<=250)return 250;return 500;

}

int prix({double dose,double pris}){
return (dose*pris).round();
}
int prisjete({double reliq,double volume,double dose,double pris}){
  double doseRel=reliq*dose/volume;
  return (doseRel*pris).round();
}

bool datreliq({DateTime datpreparatin,int hour }){
  DateTime datenow=DateTime.now();
  DateTime dat=datpreparatin.add(new Duration(hours: hour));
  return datenow.isAfter(dat);//flase when datenow>dat;True when datenow<dat
}