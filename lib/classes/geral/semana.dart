import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/global_variables.dart';

class Semana{
  String semanaStr = semana.toString();
  int rodadaGroupInternational = 1;
  bool isJogoCampeonatoNacional = semanasJogosNacionais.contains(semana);
  bool isJogoCampeonatoInternacional = semanasJogosInternacionais.contains(semana);
  bool isJogoGruposInternacional = semanasGruposInternacionais.contains(semana);
  bool isJogoMataMataInternacional = semanasMataMataInternacionais.contains(semana);
  String semanaAlternativeStr = semana.toString(); //com o numero da rodada

  Semana(){

    if(isJogoCampeonatoNacional) {
      semanaStr = semanasJogosNacionais.indexOf(semana).toString();
    }
    if(semanasJogosCopas.contains(semana)){semanaStr = 'Jogo das Copas';}
    else if(semanasGruposInternacionais.contains(semana)){
      semanaStr = 'Fase de Grupos';
      rodadaGroupInternational = semanasGruposInternacionais.indexOf(semana)+1;}
    else if(semanaOitavas.contains(semana)){semanaStr = Name().oitavas;}
    else if(semanaQuartas.contains(semana)){semanaStr = Name().quartas;}
    else if(semanaSemi.contains(semana)){semanaStr = Name().semifinal;}
    else if(semanaFinal.contains(semana)){semanaStr = Name().finale;}

    semanaAlternativeStr = semanaStr;
    if(semanasGruposInternacionais.contains(semana)){
      semanaAlternativeStr += ' ${semanasGruposInternacionais.indexOf(semana)+1}';
    }

    }

}