import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/kits_crests/crest.dart';
import 'package:fifa/widgets/kits_crests/uniforme.dart';
import 'package:flutter/material.dart';

class Images{

  Widget getWeekCompetitionLogo(My myClass){
    if (Semana(semana).isJogoCampeonatoNacional){
      return Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoName),height: 35,width: 35);
    }else if (Semana(semana).isJogoCopa){
      return Image.asset(FIFAImages().campeonatoLogo(myClass.cupName),height: 35,width: 35);
    }else if (Semana(semana).isJogoCampeonatoNacional){
      return Image.asset(FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague()),height: 35,width: 35);
    }
    return Container();
  }

  String getEscudo(String clubName){
      return 'assets/clubs/${FIFAImages().imageLogo(clubName)}.png';
  }
  Widget getEscudoWidget(String clubName,[double _height=50.0, double _width=50.0]){
    String crest = FIFAImages().imageLogo(clubName);
    if(crest != 'generic'){
      //Se tem a imagem do logo
      return Image.asset('assets/clubs/$crest.png',height: _height,width: _width);
    }else{
      //Logos genericos
      return Padding(
        padding: EdgeInsets.only(left: _height*0.07,right: _height*0.07,top: _height*0.13,bottom: _height*0.12),
        child: CrestWidgets(size: _height*0.77).getCrest(clubName),
      );
    }
  }


  Widget getUniformWidget(String clubName,[double _height=50.0, double _width=50.0]){
    String name = FIFAImages().imageLogo(clubName);
    if(name != 'generic'){
      return Image.asset('assets/clubs/${name}1.png',height: _height, width: _width,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        //Se o clube tem logo, mas não tiver a imagem do uniforme
        return UniformCustom(clubName,(_height/50)*0.45).kit();
      });
    }else{
      //Se o clube não tiver logo
      return UniformCustom(clubName,(_height/50)*0.45).kit();
    }
  }

  Widget getLeagueLogo(String leagueName, [double _height=50.0, double _width=50.0]){
    return Image.asset(FIFAImages().campeonatoLogo(leagueName),height: _height,width: _width);
  }

  String getStadium(String clubName){
    return 'assets/clubs/${FIFAImages().imageLogo(clubName)}0.jpg';
  }
  Widget getStadiumWidget(String clubName, [double _height=50.0, double _width=50.0]){
      return Image.asset(Images().getStadium(clubName),height: _height,width: _width,fit: BoxFit.fill,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        //Se o clube não tiver a imagem do estadio
        return Image.asset('assets/clubs/generic0.jpg',height: _height,width: _width,fit: BoxFit.fill);
      });
  }
  /////////////////////////////////////////////////////////////////////////////
  //MY
  Widget getMyEscudo({required double size}){
    My myClass = My();
    return getEscudoWidget(myClass.clubName,size,size);
  }
  Widget getMyUniform({required double height,required double width}){
    My myClass = My();
    return getUniformWidget(myClass.clubName,height,width);
  }
  String getMyStadium(){
    My myClass = My();
    return 'assets/clubs/${FIFAImages().imageLogo(myClass.clubName)}0.jpg';
  }

  String getMyActualCampeonatoLogo(){
    My myClass = My();
    late String campeonatoLogo;
    if(semanasJogosNacionais.contains(semana)){
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.campeonatoName);
    }
    else if(myClass.playingInternational.isNotEmpty  && Semana(semana).isJogoGruposInternacional){
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague());
    }else if(myClass.playingInternational.isNotEmpty  && Semana(semana).isJogoMataMataInternacional){
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague());
    }else if(semanasJogosCopas.contains(semana)){
      campeonatoLogo = FIFAImages().campeonatoLogo(myClass.cupName);
    }else {
      campeonatoLogo = '';
    }
    return campeonatoLogo;
  }
  String getMyLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoLogo(myClass.campeonatoName);
  }
  String getMyCupLogo(){
    My myClass = My();
    return FIFAImages().campeonatoLogo(myClass.cupName);
  }

  String getMyInternationalLeagueLogo(){
    My myClass = My();
    return FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague());
  }
  String getMundialLogo(){
    return FIFAImages().campeonatoLogo(LeagueOfficialNames().mundial);
  }

  Widget getWallpaper(){
    return Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill);
  }

  Image getPlayerPictureWidget(Jogador player,[double height = 50,double width=50]){
    return globalHasInternet
        ? Image.network(player.imageUrl,height: height, width: width, fit: BoxFit.fill,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        // Return a fallback image when the original image fails to load
        return Image.asset('assets/icons/generic_user.png',height: height, width: width, fit: BoxFit.fill);
      },
    )
        : Image.asset('assets/icons/generic_user.png',height: height, width: width, fit: BoxFit.fill);
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

  Widget getTrophy(String leagueName,[double _height=100.0, double _width=100.0]){
    return Image.asset('assets/trophy/${getTrophyImage(leagueName)}.png',height: _height,width: _width);
  }

  Widget getContinentLogo(String continent, [double _height=40.0, double _width=40.0]) {
    if (continent == Continents().europa) {
      return Image.asset('assets/continents/europe.png',height: _height,width: _width);
    }
    if (continent == Continents().americaSul) {
      return  Image.asset('assets/continents/south america.png',height: _height,width: _width);
    }
    if (continent == Continents().americaNorte) {
      return  Image.asset('assets/continents/north america.png',height: _height,width: _width);
    }
    if (continent == Continents().asia) {
      return  Image.asset('assets/continents/asia.png',height: _height,width: _width);
    }
    if (continent == Continents().africa) {
      return  Image.asset('assets/continents/africa.png',height: _height,width: _width);
    }
    if (continent == Continents().oceania) {
      return  Image.asset('assets/continents/oceania.png',height: _height,width: _width);
    }
    if (continent == Continents().notExist) {
      return  Image.asset('assets/continents/world.png',height: _height,width: _width);
    }
    return  Image.asset('assets/continents/world.png',height: _height,width: _width);
  }

}
