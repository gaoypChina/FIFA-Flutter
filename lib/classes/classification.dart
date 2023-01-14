import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';

class Classification{

  late int leagueIndex;
  late List classificationClubsIndexes;

  Classification({required this.leagueIndex}){
    leagueIndex = leagueIndex;
    classificationClubsIndexes = setClassification1League(leagueIndex);
  }

  getClubPosition(int clubID){
    return classificationClubsIndexes.indexOf(clubID)+1;
  }

  List setClassification1League(int leagueIndex) {
    List classificationLeagueIndex = [];
    List points = [];
    List saldo = [];
    League ligaClass = League(index: leagueIndex);
    int nClubs = ligaClass.nClubs;
    for (int i = 0; i <nClubs; i++) {
      int clubIndex = ligaClass.getClubRealID(i);
      classificationLeagueIndex.add(clubIndex);
      points.add(globalClubsLeaguePoints[clubIndex]);
      try {
        //A lista pode estar vazia quando é inicializada
        saldo.add(globalClubsLeagueGM[clubIndex] - globalClubsLeagueGS[clubIndex]);
      } catch (e) {
        saldo.add(0);
      }
    }
    //Organiza em ordem decrescente
    dynamic help;
    for(int i=0;i<nClubs;i++){
      for(int k=i;k<nClubs;k++){
        if(points[i]<points[k] || (points[i]==points[k] && saldo[i] < saldo[k])){
          help = points[i];points[i] = points[k];points[k] = help;
          help = classificationLeagueIndex[i];classificationLeagueIndex[i] = classificationLeagueIndex[k];classificationLeagueIndex[k] = help;
          help = saldo[i];saldo[i] = saldo[k];saldo[k] = help;
        }
      }
    }

    return classificationLeagueIndex;
  }
}
