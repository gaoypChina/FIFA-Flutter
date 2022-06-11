import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Widget backgroundInternationalLeague(String leagueInternational){
  return leagueInternational == LeagueOfficialNames().championsLeague
      ? Image.asset('assets/icons/fundochampions.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill)
      : Image.asset('assets/icons/fundolibertadores.png',height: double.maxFinite,width: double.maxFinite,fit: BoxFit.fill);
}