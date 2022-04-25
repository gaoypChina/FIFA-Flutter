import 'package:fifa/global_variables.dart';

class ConfigurationState{
  bool hasSoundEffect = globalHasSoundEffects;
  bool turnIdaEVolta = globalLeagueIdaVolta;
  String coachName = globalCoachName;

  changeSoundEffectSwitchState(){
    hasSoundEffect = !hasSoundEffect;
  }
  changeTurnSwitchState(){
    turnIdaEVolta = !turnIdaEVolta;
    globalLeagueIdaVolta = !globalLeagueIdaVolta;

    globalNMaxRodadasNacional = globalLeagueIdaVolta ? 30 : 15;

      semanaOitavas = [semanasJogosInternacionais.first+6,semanasJogosInternacionais.first+7];
          semanaQuartas = [semanasJogosInternacionais.first+8,semanasJogosInternacionais.first+9];
          semanaSemi = [semanasJogosInternacionais.first+10,semanasJogosInternacionais.first+11];
          semanaFinal = [semanasJogosInternacionais.first+12];
          semanaMundial = [semanasJogosInternacionais.last];
      semanasJogosInternacionais = [for(var i=semanasJogosNacionais.last+1; i<=semanasJogosNacionais.last+13; i++) i];
      semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
      semanasMataMataInternacionais = semanaOitavas+semanaQuartas+semanaSemi+semanaFinal;
      semanasJogosNacionais = [for(var i=1; i<=globalNMaxRodadasNacional; i++) i];
      semanasJogosCopas = [];
      globalUltimaSemana = semanasJogosInternacionais.last;

  }

}