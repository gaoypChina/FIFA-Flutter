import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

class Images{


  String getEscudo(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}.png';
  }
  String getUniform(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}1.png';
  }
  String getStadium(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}0.jpg';
  }

  String getMyEscudo(){
    My myClass = My();
    return 'assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}.png';
  }
  String getMyUniform(){
    My myClass = My();
    return 'assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}1.png';
  }
  String getMyStadium(){
    My myClass = My();
    return 'assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}0.jpg';
  }

  String getMyActualCampeonatoLogo(){
    My myClass = My();
    late String campeonatoLogo;
    if(semanasJogosNacionais.contains(semana) && semana < League(index: myClass.campeonatoID).nClubs){
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.campeonatoName);
    }
    else if(myClass.playingInternational.isNotEmpty  && Semana(semana).isJogoGruposInternacional){
      campeonatoLogo = FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
    }else if(myClass.playingInternational.isNotEmpty  && Semana(semana).isJogoMataMataInternacional){
      campeonatoLogo = FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
    }else {
      campeonatoLogo = '';
    }
    return campeonatoLogo;
  }
  String getMyLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoLogo(myClass.campeonatoName);
  }
  String getMyInternationalLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
  }

  Widget getWallpaper(){
    return Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }
  String getGenericPlayerPicture(){
    return 'assets/icons/generic_user.png';
  }
  BoxDecoration getWallpaperContainerDecoration(){
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/icons/wallpaper.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  String getContinentLogo(String continent) {
    if (continent == 'Europa') {
      return 'assets/continents/europe.png';
    }
    if (continent == 'América do Sul') {
      return 'assets/continents/south america.png';
    }
    if (continent == 'América do Norte') {
      return 'assets/continents/north america.png';
    }
    if (continent == 'Ásia') {
      return 'assets/continents/asia.png';
    }
    if (continent == 'África') {
      return 'assets/continents/africa.png';
    }
    return 'assets/continents/europe.png';
  }

}
