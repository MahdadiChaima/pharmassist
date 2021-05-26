import 'package:flutter/material.dart';
import 'package:pharmassist/UI/constant.dart';
import 'package:response/response.dart';

const Color gris = Color(0xffEBF1FA);
const Color blue = Color(0xff57D9F8);
const Color bluefonce = Color(0xff5EAED1);

class Aide extends StatelessWidget {
  final response = ResponseUI.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft, colors: [bluefonce, blue]),
            ),
            child: ListView(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12, top: 12),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: response.setFontSize(40),
                  ),
                ),
              ),
              new Container(//margin:EdgeInsets.only(top:14) ,
                  padding: EdgeInsets.only(top:0,left: 10, bottom: 20),
                  height: response.setHeight(2800),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(140),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    StylofText("Comment utiliser PharmAssist ?", 24, bluefonce),
                    StylofText("Accueil", 24, blue),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      width: double.infinity,
                      child: StylofText(
                          "Dans cette page vous touvez 3 boutons :"
                          "-Pour commencer une nouvelle préparation cliquez « Nouvelle préparation »,"
                          "-Pour consulter  la liste des reliquats et vérifier leurs stabilité cliquez sur « Etats des reliquats »,"
                          "-Pour voir le progres du travail en fin de la journée cliquez sur « Statistiques »",
                          20),
                    ),
                    StylofText("Nouvelle préparation", 21, blue),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      width: double.infinity,
                      child: StylofText(
                          " Dans cette page vous allez effectuer les calculs nécessaires de la préparation nouvelle :"
                          "-Veuillez choisir le nom du patient, le médicament prescrit et sa posologie."
                          "-Choisissez les conditions de stabilité du reliquat du médicament choisit ( en cas il y aura un )"
                          " Après le calcul est terminé, vous aurez une nouvelle page contenant les résultats obtenus :"
                          "--La dose et le volume à administrer au patient,"
                          "--Le nombre des flacons requis,"
                          "--Le type de poche recommandé,"
                          " --Le reliquat du médicament utilisé ( si existant ),"
                          "Si vous voulez commencer une autre préparation cliquez sur « Nouveau »",
                          20),
                    ),
                    StylofText("Etats des reliquats",21,blue),
                    Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        width: double.infinity,
                        child: StylofText("Dans cette page vou trouvez une liste contenants tous les reliquats des préparations effectuées, avec des indications sur leurs états de stabilité, si un reliquat est indiqué en rouge il est expiré, et les reliquats indiqués en vert sont stable pour des prochaines utilisations",21)),
                   StylofText("Statistiques",21,blue),
                  Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      width: double.infinity,
                      child: StylofText("Après chaque préparation, cette page est actualisée pour qu’en fin de la journée vous trouvez les statistiques du travail accomplit :-La liste des patients  concernés par les préparations ,-La liste des medicament est nombre de Flacon utulise pour chaqun preparation,-Le prix total ",21)),
                    StylofText("Menu principale",21,blue),
                    Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        width: double.infinity,
                        child: StylofText("D’après cette menu, vous aurez accés aux données stockées ( Médicaments – Patients - Préparations )Vous pouvez aussi modifiez le thème de PharmAssist ( sombre ou claire ) dans la page « Paramètre », comme vous pouvez partagez notre application ainsi que l’évaluer",21)),
                   StylofText("Base de données",21,blue),
                    Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        width: double.infinity,
                        child: StylofText("Il existe 3 listes des données dans PharmAssist ( accédées de la menu principale ), vous aurez :"
                           " -La liste des médicaments disponibles,"
                            "- La liste des patients concernés par les préparations effectuées,"
                        "-La liste des préparations effectuées,"
                        " Pour ajouter un nouveau ( médicament / patient / préparation ) cliquez sur le bouton « + » en bas à droite, pour voir ses détails cliquez sur sa barre et vous verrez tous ses informations dans une nouvelle page, si un changement est requis cliquez sur l’icon située après les noms en haut de la page, et pour le supprimer cliquez sur « supprimer » en bas à la gauche"
                        "Pour supprimer plusieurs ( médicaments / patients / préparations ) à la fois, veuillez les sélectionner puis cliquer sur « supprimer » en bas à la gauche de la page de liste"
                    ,21)),
                  ]))
            ])));
  }
}
