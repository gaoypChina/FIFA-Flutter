import 'package:fifa/global/global_variables.dart';

class ChampionsLeague{
//INDEX 0

  Map grupos = {};
  Map oitavas = {};
  Map quartas = {};
  Map semi = {};
  Map finalMap = {};
  List clubIDs =[];
  List clubsGM =[];
  List clubsGS =[];
  List clubsPoints =[];

  ChampionsLeague() {
    clubIDs = globalInternational32ClubsID[0];
    clubsGM = globalClubsInternationalGM[0];
    clubsGS = globalClubsInternationalGS[0];
    clubsPoints = globalClubsInternationalPoints[0];
  }
/*
  finall
  {
  timeA: 'Barcelona'
  timeB: 'Real',
  GMA: 4,
  GMB: 2,
  }

   */



}