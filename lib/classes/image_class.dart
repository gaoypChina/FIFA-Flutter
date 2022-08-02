import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/kits_crests/crest.dart';
import 'package:fifa/widgets/kits_crests/uniforme.dart';
import 'package:flutter/material.dart';

class Images{


  String getEscudo(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}.png';
  }
  Widget getEscudoWidget(String clubName,[double _height=50.0, double _width=50.0]){
    String crest = FIFAImages().imageLogo(clubName);
    if(crest != 'generic'){
      return Image.asset('assets/clubs/$crest.png',height: _height,width: _width);
    }else{
      return Padding(
        padding: EdgeInsets.only(left: _height*0.12,top: _height*0.13,bottom: _height*0.12),
        child: CrestWidgets(size: _height*0.7).getCrest(clubName),
      );
    }
  }


  String getUniform(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}1.png';
  }
  Widget getUniformWidget(String clubName,[double _height=50.0, double _width=50.0]){
    String name = FIFAImages().imageLogo(clubName);
    if(name != 'generic'){
      return Image.asset('assets/clubs/${name}1.png',height: _height,width: _width,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        //Se o clube tem logo, mas não tiver a imagem do uniforme
        return UniformCustom(clubName,(_height/50)*0.45).kit();
      });
    }else{
      //Se o clube não tiver logo
      return UniformCustom(clubName,(_height/50)*0.45).kit();
    }
  }


  String getStadium(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}0.jpg';
  }
  Widget getStadiumWidget(String clubName,[double _height=50.0, double _width=50.0]){
      return Image.asset(Images().getStadium(clubName),height: _height,width: _width,fit: BoxFit.fill,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        //Se o clube não tiver a imagem do estadio
        return Image.asset('assets/clubs/generic0.jpg',height: _height,width: _width,fit: BoxFit.fill);
      });
  }
  /////////////////////////////////////////////////////////////////////////////
  //MY
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
