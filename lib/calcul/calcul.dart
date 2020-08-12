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
int nbrpoch({double flacon,double volume}){
  int nbrflacon=(volume/flacon).round();
  if((nbrflacon*flacon)-volume>=0) {
    return nbrflacon;
  }
  else{
    nbrflacon+1;
    return nbrflacon;
  }
}
double Reliq({double flacon,double volume}){
  int nbrflacon=(volume/flacon).round();
   if((nbrflacon*flacon)-volume>=0) {
     return double.parse (((nbrflacon*flacon)-volume).toStringAsFixed(2));
   }
   else{
     return double.parse ((( ((nbrflacon+1)*flacon)-volume).toStringAsFixed(2)));
   }
}
int choisipoche({double dose,double cmax,double cmin}){
  double pochmin=dose/cmin;
  double pochmax=dose/cmax;
  if(pochmin<=250)return 250;return 500;

}
int pris({double dose,int pris}){
return (dose*pris).round();
}

bool datreliq({DateTime datpreparatin,int hour }){
  DateTime datenow=DateTime.now();
  DateTime dat=datpreparatin.add(new Duration(hours: hour));
  return datenow.isAfter(dat);//flase when datenow<dat;True when datenow>dat
}