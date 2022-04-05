import 'package:fifa/global_variables.dart';

class Semana{
  String semanaStr = semana.toString();
  bool isJogoCampeonatoNacional = semanasJogosNacionais.contains(semana);
  bool isJogoCampeonatoInternacional = semanasJogosInternacionais.contains(semana);
  bool isJogoGruposInternacional = semanasGruposInternacionais.contains(semana);
  bool isJogoMataMataInternacional = semanasJogosInternacionais.contains(semana) && !semanasGruposInternacionais.contains(semana);
  String semanaAlternativeStr = semana.toString(); //com o numero da rodada

  Semana(){

    if(isJogoCampeonatoNacional) {
      semanaStr = semanasJogosNacionais.indexOf(semana).toString();
    }
    if(semanasJogosCopas.contains(semana)){semanaStr = 'Jogo das Copas';}
    if(semanasGruposInternacionais.contains(semana)){semanaStr = 'Fase de Grupos';}
    if(semanaOitavas.contains(semana)){semanaStr = 'Oitavas';}
    if(semanaQuartas.contains(semana)){semanaStr = 'Quartas';}
    if(semanaSemi.contains(semana)){semanaStr = 'Semifinal';}
    if(semanaFinal.contains(semana)){semanaStr = 'Final';}

    semanaAlternativeStr = semanaStr;
    if(semanasGruposInternacionais.contains(semana)){
      semanaAlternativeStr += ' ${semanasGruposInternacionais.indexOf(semana)+1}';
    }

    }

    updateWeek(){
      semana++;
      //Atualiza a rodada do campeonato
      if(semanasJogosNacionais.contains(semana)) {
        rodada = semanasJogosNacionais.indexOf(semana)+1;
      }
    }

}