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
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.campeonatoID);
    }
    else if(myClass.playingInternational.isNotEmpty  && Semana().isJogoGruposInternacional){
      campeonatoLogo = FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
    }else if(myClass.playingInternational.isNotEmpty  && Semana().isJogoMataMataInternacional){
      campeonatoLogo = FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
    }else {
      campeonatoLogo = '';
    }
    return campeonatoLogo;
  }
  String getMyLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoLogo(myClass.campeonatoID);
  }
  String getMyInternationalLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague());
  }

  Widget getWallpaper(){
    return Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }

}
