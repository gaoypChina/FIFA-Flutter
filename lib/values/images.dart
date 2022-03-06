import 'package:fifa/classes/league.dart';
import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

class FIFAImages{

  String campeonatoInternacionalLogo(String campeonatoFoto){
    String imageLogo = '';
    if(campeonatoFoto==LeagueOfficialNames().championsLeague){       imageLogo = 'assets/league_logos/championsleague.png';       }
    if(campeonatoFoto==LeagueOfficialNames().libertadores){       imageLogo = 'assets/league_logos/libertadores.png';       }
    if(campeonatoFoto==LeagueOfficialNames().outros){       imageLogo = 'assets/league_logos/championsleague.png';       }
    return imageLogo;
  }

  String imageLogo(String timeFoto){
    String imageLogo = '';
    if(timeFoto==ClubName().atleticomg){       imageLogo='atleticomg';        }
    if(timeFoto==ClubName().atleticopr){       imageLogo='atleticopr';        }
    if(timeFoto==ClubName().bahia){             imageLogo='bahia';         }
    if(timeFoto==ClubName().botafogo){          imageLogo='botafogo';         }
    if(timeFoto==ClubName().corinthians){       imageLogo='corinthians';        }
    if(timeFoto==ClubName().cruzeiro){          imageLogo='cruzeiro';         }
    if(timeFoto==ClubName().flamengo){          imageLogo='flamengo';        }
    if(timeFoto==ClubName().fluminense){        imageLogo='fluminense';        }
    if(timeFoto==ClubName().gremio){            imageLogo='gremio';        }
    if(timeFoto==ClubName().goias){            imageLogo='goias';        }
    if(timeFoto==ClubName().internacional){     imageLogo='internacional';        }
    if(timeFoto==ClubName().palmeiras){            imageLogo='palmeiras';   }
    if(timeFoto==ClubName().santos){            imageLogo='santos';        }
    if(timeFoto==ClubName().saopaulo){         imageLogo='saopaulo';        }
    if(timeFoto==ClubName().sport){            imageLogo='sport';        }
    if(timeFoto==ClubName().vasco){            imageLogo='vasco';        }

    if(timeFoto==ClubName().arsenal){            imageLogo='arsenal';        }
    if(timeFoto==ClubName().astonvilla){            imageLogo='astonvilla';        }
    if(timeFoto==ClubName().crystalpalace){            imageLogo='crystalpalace';        }
    if(timeFoto==ClubName().chelsea){            imageLogo='chelsea';        }
    if(timeFoto==ClubName().everton){            imageLogo='everton';        }
    if(timeFoto==ClubName().leicester){            imageLogo='leicester';        }
    if(timeFoto==ClubName().leedsunited){            imageLogo='leeds';        }
    if(timeFoto==ClubName().liverpool){            imageLogo='liverpool';        }
    if(timeFoto==ClubName().manchestercity){            imageLogo='manchestercity';        }
    if(timeFoto==ClubName().manchesterunited){            imageLogo='manchesterunited';        }
    if(timeFoto==ClubName().newcastle){            imageLogo='newcastle';        }
    if(timeFoto==ClubName().southampton){            imageLogo='southampton';        }
    if(timeFoto==ClubName().tottenham){            imageLogo='tottenham';        }
    if(timeFoto==ClubName().westbromwich){            imageLogo='westbromwich';        }
    if(timeFoto==ClubName().westham){            imageLogo='westham';        }
    if(timeFoto==ClubName().wolves){            imageLogo='wolves';        }

    if(timeFoto==ClubName().atalanta){            imageLogo='atalanta';        }
    if(timeFoto==ClubName().bologna){            imageLogo='bologna';        }
    if(timeFoto==ClubName().cagliari){            imageLogo='cagliari';        }
    if(timeFoto==ClubName().fiorentina){            imageLogo='fiorentina';        }
    if(timeFoto==ClubName().genoa){            imageLogo='genoa';        }
    if(timeFoto==ClubName().inter){            imageLogo='inter';        }
    if(timeFoto==ClubName().juventus){            imageLogo='juventus';        }
    if(timeFoto==ClubName().milan){            imageLogo='milan';        }
    if(timeFoto==ClubName().lazio){            imageLogo='lazio';        }
    if(timeFoto==ClubName().napoli){            imageLogo='napoli';        }
    if(timeFoto==ClubName().parma){            imageLogo='parma';        }
    if(timeFoto==ClubName().roma){            imageLogo='roma';        }
    if(timeFoto==ClubName().sampdoria){            imageLogo='sampdoria';        }
    if(timeFoto==ClubName().sassuolo){            imageLogo='sassuolo';        }
    if(timeFoto==ClubName().torino){            imageLogo='torino';        }
    if(timeFoto==ClubName().udinese){            imageLogo='udinese';        }

    if(timeFoto==ClubName().athleticbilbao){            imageLogo='athleticbilbao';        }
    if(timeFoto==ClubName().atleticomadrid){            imageLogo='atleticomadrid';        }
    if(timeFoto==ClubName().barcelona){            imageLogo='barcelona';        }
    if(timeFoto==ClubName().celtavigo){            imageLogo='celta';        }
    if(timeFoto==ClubName().espanyol){            imageLogo='espanyol';        }
    if(timeFoto==ClubName().getafe){            imageLogo='getafe';        }
    if(timeFoto==ClubName().osasuna){            imageLogo='osasuna';        }
    if(timeFoto==ClubName().lacoruna){            imageLogo='lacoruna';        }
    if(timeFoto==ClubName().levante){            imageLogo='levante';        }
    if(timeFoto==ClubName().realbetis){            imageLogo='realbetis';        }
    if(timeFoto==ClubName().realmadrid){            imageLogo='realmadrid';        }
    if(timeFoto==ClubName().realsociedad){            imageLogo='realsociedad';        }
    if(timeFoto==ClubName().sevilla){            imageLogo='sevilla';        }
    if(timeFoto==ClubName().valladolid){            imageLogo='valladolid';        }
    if(timeFoto==ClubName().valencia){            imageLogo='valencia';        }
    if(timeFoto==ClubName().villareal){            imageLogo='villareal';        }

    if(timeFoto==ClubName().moenchengladbach){            imageLogo='borussia';        }
    if(timeFoto==ClubName().borussiadortmund){            imageLogo='dortmund';        }
    if(timeFoto==ClubName().bayernmunique){            imageLogo='bayern';        }
    if(timeFoto==ClubName().bayerleverkusen){            imageLogo='leverkusen';        }
    if(timeFoto==ClubName().eintrachtfrankfurt){            imageLogo='frankfurt';        }
    if(timeFoto==ClubName().augsburg){            imageLogo='augsburg';        }
    if(timeFoto==ClubName().freiburg){            imageLogo='freiburg';        }
    if(timeFoto==ClubName().hamburgo){            imageLogo='hamburgo';        }
    if(timeFoto==ClubName().colonia){            imageLogo='colonia';        }
    if(timeFoto==ClubName().hannover96){            imageLogo='hannover96';        }
    if(timeFoto==ClubName().herthaberlim){            imageLogo='hertha';        }
    if(timeFoto==ClubName().hoffenheim){            imageLogo='hoffenheim';        }
    if(timeFoto==ClubName().rbleipzig){            imageLogo='leipzig';        }
    if(timeFoto==ClubName().schalke04){            imageLogo='schalke';        }
    if(timeFoto==ClubName().stuttgart){            imageLogo='stuttgart';        }
    if(timeFoto==ClubName().werderbremen){            imageLogo='werderbremen';        }
    if(timeFoto==ClubName().wolfsburg){            imageLogo='wolfsburg';        }

    if(timeFoto==ClubName().bordeaux){            imageLogo='bordeaux';        }
    if(timeFoto==ClubName().lille){            imageLogo='lille';        }
    if(timeFoto==ClubName().lyon){            imageLogo='lyon';        }
    if(timeFoto==ClubName().monaco){            imageLogo='monaco';        }
    if(timeFoto==ClubName().montpellier){            imageLogo='montpellier';        }
    if(timeFoto==ClubName().nantes){            imageLogo='nantes';        }
    if(timeFoto==ClubName().nice){            imageLogo='nice';        }
    if(timeFoto==ClubName().olympiquemarselha){            imageLogo='marseille';        }
    if(timeFoto==ClubName().psg){            imageLogo='psg';        }
    if(timeFoto==ClubName().reims){            imageLogo='reims';        }
    if(timeFoto==ClubName().rennes){            imageLogo='rennes';        }
    if(timeFoto==ClubName().saintetienne){            imageLogo='stetienne';        }
    if(timeFoto==ClubName().metz){            imageLogo='metz';        }
    if(timeFoto==ClubName().anderlecht){            imageLogo='anderlecht';        }
    if(timeFoto==ClubName().brugge){            imageLogo='brugge';        }
    if(timeFoto==ClubName().standardliege){            imageLogo='liege';        }

    if(timeFoto==ClubName().benfica){            imageLogo='benfica';        }
    if(timeFoto==ClubName().porto){            imageLogo='porto';        }
    if(timeFoto==ClubName().sporting){            imageLogo='sporting';        }
    if(timeFoto==ClubName().braga){            imageLogo='braga';        }
    if(timeFoto==ClubName().vitoriaguimaraes){            imageLogo='guimaraes';        }
    if(timeFoto==ClubName().ajax){            imageLogo='ajax';        }
    if(timeFoto==ClubName().feyenoord){            imageLogo='feyenoord';        }
    if(timeFoto==ClubName().psv){            imageLogo='psv';        }
    if(timeFoto==ClubName().celtic){            imageLogo='celtic';        }
    if(timeFoto==ClubName().glasgowrangers){            imageLogo='rangers';        }
    if(timeFoto==ClubName().rosemborg){            imageLogo='rosemborg';        }
    if(timeFoto==ClubName().malmo){            imageLogo='malmo';        }
    if(timeFoto==ClubName().copenhague){            imageLogo='copenhague';        }
    if(timeFoto==ClubName().rbsalzburg){            imageLogo='rbsalzburg';        }
    if(timeFoto==ClubName().rapidviena){            imageLogo='rapidviena';        }
    if(timeFoto==ClubName().basel){            imageLogo='basel';        }

    if(timeFoto==ClubName().zenit){            imageLogo='zenit';        }
    if(timeFoto==ClubName().cska){            imageLogo='cska';        }
    if(timeFoto==ClubName().krasnodar){            imageLogo='krasnodar';        }
    if(timeFoto==ClubName().spartakmoscou){            imageLogo='spartak';        }
    if(timeFoto==ClubName().galatasaray){            imageLogo='galatasaray';        }
    if(timeFoto==ClubName().fenerbahce){            imageLogo='fenerbahce';        }
    if(timeFoto==ClubName().besiktas){            imageLogo='besiktas';        }
    if(timeFoto==ClubName().olympiakos){            imageLogo='olympiakos';        }
    if(timeFoto==ClubName().estrelavermelha){            imageLogo='estrelavermelha';        }
    if(timeFoto==ClubName().partizan){            imageLogo='partizan';        }
    if(timeFoto==ClubName().ludogorets){            imageLogo='ludogorets';        }
    if(timeFoto==ClubName().dinamozagreb){            imageLogo='dinamozagreb';        }
    if(timeFoto==ClubName().shaktardonetsk){            imageLogo='shaktar';        }
    if(timeFoto==ClubName().dinamokiev){            imageLogo='dinamokiev';        }
    if(timeFoto==ClubName().spartapraga){            imageLogo='spartapraga';        }
    if(timeFoto==ClubName().apoel){            imageLogo='apoel';        }

    if(timeFoto==ClubName().birmigham){            imageLogo='birmigham';        }
    if(timeFoto==ClubName().blackburn){            imageLogo='blackburn';        }
    if(timeFoto==ClubName().bournemouth){            imageLogo='bournemouth';        }
    if(timeFoto==ClubName().burnley){            imageLogo='burnley';        }
    if(timeFoto==ClubName().brighton){            imageLogo='brighton';        }
    if(timeFoto==ClubName().derbycount){            imageLogo='derby';        }
    if(timeFoto==ClubName().fulham){            imageLogo='fulham';        }
    if(timeFoto==ClubName().hullcity){            imageLogo='hullcity';        }
    if(timeFoto==ClubName().middlesbrough){      imageLogo='middlesbrough';        }
    if(timeFoto==ClubName().norwich){            imageLogo='norwich';        }
    if(timeFoto==ClubName().nottinghamforest){    imageLogo='nottingham';        }
    if(timeFoto==ClubName().qpr){                imageLogo='qpr';        }
    if(timeFoto==ClubName().reading){            imageLogo='reading';        }
    if(timeFoto==ClubName().sheffieldunited){    imageLogo='sheffield';        }
    if(timeFoto==ClubName().stoke){            imageLogo='stoke';        }
    if(timeFoto==ClubName().swansea){            imageLogo='swansea';        }
    if(timeFoto==ClubName().watford){            imageLogo='watford';        }

    if(timeFoto==ClubName().atleticogo){                imageLogo='atleticogo';}
    if(timeFoto==ClubName().americamg){                imageLogo='americamg';        }
    if(timeFoto==ClubName().cuiaba){                imageLogo='cuiaba';        }
    if(timeFoto==ClubName().avai){                imageLogo='avai';        }
    if(timeFoto==ClubName().chapecoense){            imageLogo='chapecoense';     }
    if(timeFoto==ClubName().bragantino){            imageLogo='bragantino';      }
    if(timeFoto==ClubName().ceara){               imageLogo='ceara';        }
    if(timeFoto==ClubName().coritiba){            imageLogo='coritiba';        }
    if(timeFoto==ClubName().criciuma){            imageLogo='criciuma';        }
    if(timeFoto==ClubName().figueirense){         imageLogo='figueirense';        }
    if(timeFoto==ClubName().fortaleza){          imageLogo='fortaleza';         }
    if(timeFoto==ClubName().guarani){            imageLogo='guarani';         }
    if(timeFoto==ClubName().juventude){         imageLogo='juventude';          }
    if(timeFoto==ClubName().nautico){            imageLogo='nautico';         }
    if(timeFoto==ClubName().parana){            imageLogo='parana';          }
    if(timeFoto==ClubName().paysandu){          imageLogo='paysandu';          }

    if(timeFoto==ClubName().pontepreta){       imageLogo='pontepreta';          }
    if(timeFoto==ClubName().santacruz){        imageLogo='santacruz';          }
    if(timeFoto==ClubName().vitoria){            imageLogo='vitoria';         }

    if(timeFoto==ClubName().argentinojuniors){       imageLogo='argentinosjr';        }
    if(timeFoto==ClubName().arsenalsarandi){            imageLogo='sarandi';     }
    if(timeFoto==ClubName().banfield){            imageLogo='banfield';      }
    if(timeFoto==ClubName().bocajuniors){               imageLogo='bocajuniors';        }
    if(timeFoto==ClubName().colon){                imageLogo='colon';        }
    if(timeFoto==ClubName().defensayjusticia){                imageLogo='defensa';        }
    if(timeFoto==ClubName().estudiantes){            imageLogo='estudiantes';        }
    if(timeFoto==ClubName().independiente){         imageLogo='independiente';        }
    if(timeFoto==ClubName().huracan){             imageLogo='huracan';         }
    if(timeFoto==ClubName().lanus){               imageLogo='lanus';         }
    if(timeFoto==ClubName().newells){         imageLogo='newells';          }
    if(timeFoto==ClubName().racing){               imageLogo='racing';         }
    if(timeFoto==ClubName().riverplate){            imageLogo='riverplate';          }
    if(timeFoto==ClubName().rosariocentral){          imageLogo='rosariocentral';          }
    if(timeFoto==ClubName().sanlorenzo){          imageLogo='sanlorenzo';          }
    if(timeFoto==ClubName().talleres){              imageLogo='talleres';          }
    if(timeFoto==ClubName().velezsarsfield){            imageLogo='velez';         }

    if(timeFoto==ClubName().penarol){       imageLogo='penarol';        }
    if(timeFoto==ClubName().nacional){            imageLogo='nacional';     }
    if(timeFoto==ClubName().olimpia){            imageLogo='olimpia';      }
    if(timeFoto==ClubName().cerroporteno){               imageLogo='cerro';        }
    if(timeFoto==ClubName().libertad){                imageLogo='libertad';        }
    if(timeFoto==ClubName().colocolo){            imageLogo='colocolo';        }
    if(timeFoto==ClubName().lau){         imageLogo='lau';        }
    if(timeFoto==ClubName().univcatolica){             imageLogo='universidadcatolica';         }
    if(timeFoto==ClubName().bolivar){               imageLogo='bolivar';         }
    if(timeFoto==ClubName().alianzalima){         imageLogo='alianzalima';          }
    if(timeFoto==ClubName().sportingcristal){               imageLogo='sportingcristal';         }
    if(timeFoto==ClubName().cienciano){            imageLogo='cienciano';          }
    if(timeFoto==ClubName().barcelonaequ){          imageLogo='barcelonaequ';          }
    if(timeFoto==ClubName().emelec){          imageLogo='emelec';          }
    if(timeFoto==ClubName().ldu){              imageLogo='ldu';          }
    if(timeFoto==ClubName().caracas){            imageLogo='caracas';         }

    if(timeFoto==ClubName().americadecali){       imageLogo='americacali';        }
    if(timeFoto==ClubName().atleticonacional){            imageLogo='atleticonacional';     }
    if(timeFoto==ClubName().deportivocali){            imageLogo='deportivocali';      }
    if(timeFoto==ClubName().junior){               imageLogo='junior';        }
    if(timeFoto==ClubName().imedellin){                imageLogo='medellin';        }
    if(timeFoto==ClubName().oncecaldas){            imageLogo='oncecaldas';        }
    if(timeFoto==ClubName().millonarios){         imageLogo='millonarios';        }
    if(timeFoto==ClubName().santafe){             imageLogo='santafe';         }
    if(timeFoto==ClubName().americamex){               imageLogo='americamx';         }
    if(timeFoto==ClubName().chivasguadalajara){         imageLogo='chivas';          }
    if(timeFoto==ClubName().cruzazul){               imageLogo='cruzazul';         }
    if(timeFoto==ClubName().monterrey){            imageLogo='monterrey';          }
    if(timeFoto==ClubName().pachuca){          imageLogo='pachuca';          }
    if(timeFoto==ClubName().pumas){          imageLogo='pumas';          }
    if(timeFoto==ClubName().tigres){              imageLogo='tigres';          }
    if(timeFoto==ClubName().toluca){            imageLogo='toluca';         }

    if(timeFoto==ClubName().ghuagzhouevergrande){       imageLogo='evergrande';        }
    if(timeFoto==ClubName().beijingguoan){            imageLogo='beijing';     }
    if(timeFoto==ClubName().shandongluneng){            imageLogo='shandong_luneng';      }
    if(timeFoto==ClubName().shanghaisipg){               imageLogo='shanghai';        }
    if(timeFoto==ClubName().kashimaantlers){                imageLogo='kashima';        }
    if(timeFoto==ClubName().urawareddiamonds){            imageLogo='urawa';        }
    if(timeFoto==ClubName().visselkobe){             imageLogo='vissel_kobe';         }
    if(timeFoto==ClubName().kawasakifrontale){               imageLogo='kawasaki_frontale';         }
    if(timeFoto==ClubName().fcseoul){         imageLogo='seoul';        }
    if(timeFoto==ClubName().jeonbuk){            imageLogo='jeonbuk';         }
    if(timeFoto==ClubName().alain){         imageLogo='al_ain';          }
    if(timeFoto==ClubName().alsadd){               imageLogo='sadd';         }
    if(timeFoto==ClubName().alduhail){            imageLogo='duhail';          }
    if(timeFoto==ClubName().alahly){          imageLogo='al_ahly';          }
    if(timeFoto==ClubName().alhilal){          imageLogo='al_hilal';          }
    if(timeFoto==ClubName().persepolis){              imageLogo='persepolis';          }
    if(timeFoto==ClubName().alnassr){              imageLogo='al_nassr';          }
    if(timeFoto==ClubName().aljazira){              imageLogo='al_jazira';          }
    if(timeFoto==ClubName().pohang){              imageLogo='pohang';          }
    if(timeFoto==ClubName().ulsan){         imageLogo='ulsan';        }

    if(timeFoto==ClubName().alahli){          imageLogo='al_ahli';          }
    if(timeFoto==ClubName().rajacasablanca){              imageLogo='raja';          }
    if(timeFoto==ClubName().zamalek){         imageLogo='zamalek';        }

    if(timeFoto==ClubName().atlantaunited){       imageLogo='atlanta';        }
    if(timeFoto==ClubName().minnesota){            imageLogo='minnesota';     }
    if(timeFoto==ClubName().columbuscrew){               imageLogo='columbus';        }
    if(timeFoto==ClubName().dcunited){            imageLogo='dcunited';        }
    if(timeFoto==ClubName().fcdallas){         imageLogo='dallas';        }
    if(timeFoto==ClubName().lagalaxy){            imageLogo='la';          }
    if(timeFoto==ClubName().nerevolution){               imageLogo='nerevolution';         }
    if(timeFoto==ClubName().nycity){          imageLogo='nycity';          }
    if(timeFoto==ClubName().nyredbulls){            imageLogo='nyredbull';      }
    if(timeFoto==ClubName().orlando){             imageLogo='orlando';         }
    if(timeFoto==ClubName().portland){               imageLogo='portland';         }
    if(timeFoto==ClubName().seattle){            imageLogo='seattle';         }
    if(timeFoto==ClubName().intermiami){          imageLogo='miami';          }
    if(timeFoto==ClubName().torontofc){              imageLogo='toronto';          }
    if(timeFoto==ClubName().vancouver){         imageLogo='vancouver';          }
    if(timeFoto==ClubName().losangelesfc){         imageLogo='lafc';          }


    if(timeFoto==ClubName().sunderland){         imageLogo='sunderland';          }
    if(timeFoto==ClubName().idelvalle){         imageLogo='delvalle';          }
    if(timeFoto==ClubName().portuguesa){         imageLogo='portuguesa';          }
    if(timeFoto==ClubName().tolima){         imageLogo='tolima';          }

    return imageLogo;
  }
  
  String campeonatoLogo(int numeroCampeonato){
    String campeonatoFoto = League(index: numeroCampeonato).getName();
    String imageLogo = 'championship';
    if(campeonatoFoto==LeagueOfficialNames().inglaterra1){       imageLogo = 'premierleague';       }
    if(campeonatoFoto==LeagueOfficialNames().inglaterra2){       imageLogo = 'championship';       }
    if(campeonatoFoto==LeagueOfficialNames().italia1){       imageLogo = 'seriea';       }
    if(campeonatoFoto==LeagueOfficialNames().italia2){       imageLogo = 'seriea';       }
    if(campeonatoFoto==LeagueOfficialNames().espanha1){       imageLogo = 'laliga2';       }
    if(campeonatoFoto==LeagueOfficialNames().espanha2){       imageLogo = 'laliga2';       }
    if(campeonatoFoto==LeagueOfficialNames().franca1){       imageLogo = 'ligue1';      }
    if(campeonatoFoto==LeagueOfficialNames().alemanha1){      imageLogo = 'bundesliga';       }
    if(campeonatoFoto==LeagueOfficialNames().alemanha2){      imageLogo = 'bundesliga';       }
    if(campeonatoFoto==LeagueOfficialNames().ligaEuropa){       imageLogo = 'liga1';       }
    if(campeonatoFoto==LeagueOfficialNames().lesteEuropeu){     imageLogo = 'leste';       }
    if(campeonatoFoto==LeagueOfficialNames().brasil1){       imageLogo = 'brasileirao';        }
    if(campeonatoFoto==LeagueOfficialNames().brasil2){      imageLogo = 'brasilserieb';       }
    if(campeonatoFoto==LeagueOfficialNames().brasil3){      imageLogo = 'brasileirao';       }
    if(campeonatoFoto==LeagueOfficialNames().paulistao){      imageLogo = 'brasileirao';       }
    if(campeonatoFoto==LeagueOfficialNames().argentina){       imageLogo = 'argentina';       }
    if(campeonatoFoto==LeagueOfficialNames().sulamericano){       imageLogo = 'sulamericana';       }
    if(campeonatoFoto==LeagueOfficialNames().colombiaMexico){       imageLogo = 'colombia';       }
    if(campeonatoFoto==LeagueOfficialNames().estadosUnidos){       imageLogo = 'mls';       }
    if(campeonatoFoto==LeagueOfficialNames().asia){       imageLogo = 'asialeague';       }
    if(campeonatoFoto==LeagueOfficialNames().outros){       imageLogo = 'others';       }

    imageLogo = 'assets/league_logos/$imageLogo.png';
    return imageLogo;
  }
}