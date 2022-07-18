import 'package:fifa/values/club_names.dart';

import 'league_names.dart';

class FIFAImages{

  String campeonatoInternacionalLogo(String campeonatoFoto){
    String imageLogo = '';
    if(campeonatoFoto==LeagueOfficialNames().championsLeague){       imageLogo = 'assets/league_logos/champions_logo.jpg';       }
    else if(campeonatoFoto==LeagueOfficialNames().libertadores){       imageLogo = 'assets/league_logos/libertadores.png';       }
    else if(campeonatoFoto==LeagueOfficialNames().resto){       imageLogo = 'assets/league_logos/rest.png';       }
    return imageLogo;
  }
  String mundialLogo(){
    return 'assets/league_logos/mundial.png';
  }

  String imageLogo(String timeFoto){
    String imageLogo = 'CLUBE NÃO TEM IMAGEM: $timeFoto';
    if(timeFoto==ClubName().arsenal){    imageLogo='arsenal';}
    else if(timeFoto==ClubName().astonvilla){    imageLogo='astonvilla';}
    else if(timeFoto==ClubName().crystalpalace){    imageLogo='crystalpalace';}
    else if(timeFoto==ClubName().chelsea){    imageLogo='chelsea';}
    else if(timeFoto==ClubName().everton){    imageLogo='everton';}
    else if(timeFoto==ClubName().leicester){    imageLogo='leicester';}
    else if(timeFoto==ClubName().leeds){    imageLogo='leeds';}
    else if(timeFoto==ClubName().liverpool){    imageLogo='liverpool';}
    else if(timeFoto==ClubName().manchestercity){    imageLogo='manchestercity';}
    else if(timeFoto==ClubName().manchesterunited){    imageLogo='manchesterunited';}
    else if(timeFoto==ClubName().newcastle){    imageLogo='newcastle';}
    else if(timeFoto==ClubName().southampton){    imageLogo='southampton';}
    else if(timeFoto==ClubName().tottenham){    imageLogo='tottenham';}
    else if(timeFoto==ClubName().westbromwich){    imageLogo='westbromwich';}
    else if(timeFoto==ClubName().westham){    imageLogo='westham';}
    else if(timeFoto==ClubName().wolves){    imageLogo='wolves';}

    else if(timeFoto==ClubName().accrington){    imageLogo='accrington';}
    else if(timeFoto==ClubName().barnsley){    imageLogo='barnsley';}
    else if(timeFoto==ClubName().birmigham){    imageLogo='birmigham';}
    else if(timeFoto==ClubName().blackburn){    imageLogo='blackburn';}
    else if(timeFoto==ClubName().blackpool){    imageLogo='blackpool';}
    else if(timeFoto==ClubName().bolton){    imageLogo='bolton';}
    else if(timeFoto==ClubName().bournemouth){    imageLogo='bournemouth';}
    else if(timeFoto==ClubName().burnley){    imageLogo='burnley';}
    else if(timeFoto==ClubName().bradford){    imageLogo='bradford';}
    else if(timeFoto==ClubName().brentford){ imageLogo='brentford';  }
    else if(timeFoto==ClubName().brighton){    imageLogo='brighton';}
    else if(timeFoto==ClubName().bristol){    imageLogo='bristol city';}
    else if(timeFoto==ClubName().bristolrovers){    imageLogo='bristol rovers';}
    else if(timeFoto==ClubName().burton){    imageLogo='burton';}
    else if(timeFoto==ClubName().cardiffCity){ imageLogo='cardiff city';  }
    else if(timeFoto==ClubName().coventry){ imageLogo='coventry';  }
    else if(timeFoto==ClubName().charlton){ imageLogo='charlton';  }
    else if(timeFoto==ClubName().derbycount){    imageLogo='derby';}
    else if(timeFoto==ClubName().doncaster){    imageLogo='doncaster';}
    else if(timeFoto==ClubName().fleetwood){    imageLogo='fleetwood';}
    else if(timeFoto==ClubName().fulham){    imageLogo='fulham';}
    else if(timeFoto==ClubName().gillingham){    imageLogo='gillingham';}
    else if(timeFoto==ClubName().huddersfield){    imageLogo='huddersfield';}
    else if(timeFoto==ClubName().hullcity){ imageLogo='hullcity';  }
    else if(timeFoto==ClubName().ipswichTown){ imageLogo='ipswich';  }
    else if(timeFoto==ClubName().lincoln){ imageLogo='lincoln';  }
    else if(timeFoto==ClubName().luton){ imageLogo='luton';  }
    else if(timeFoto==ClubName().middlesbrough){      imageLogo='middlesbrough';}
    else if(timeFoto==ClubName().millwall){ imageLogo='millwall';  }
    else if(timeFoto==ClubName().mkdons){ imageLogo='mk dons';  }
    else if(timeFoto==ClubName().norwich){    imageLogo='norwich';}
    else if(timeFoto==ClubName().notts){ imageLogo='notts';  }
    else if(timeFoto==ClubName().nottinghamforest){    imageLogo='nottingham';}
    else if(timeFoto==ClubName().oxford){ imageLogo='oxford';  }
    else if(timeFoto==ClubName().peterborough){ imageLogo='peterborough';  }
    else if(timeFoto==ClubName().portsmouth){ imageLogo='portsmouth';  }
    else if(timeFoto==ClubName().plymouth){ imageLogo='plymouth';  }
    else if(timeFoto==ClubName().prestonNorthEnd){ imageLogo='preston north end';  }
    else if(timeFoto==ClubName().qpr){imageLogo='qpr';}
    else if(timeFoto==ClubName().reading){    imageLogo='reading';}
    else if(timeFoto==ClubName().rotherham){ imageLogo='rotherham';  }
    else if(timeFoto==ClubName().shrewsbury){ imageLogo='shrewsbury';  }
    else if(timeFoto==ClubName().sheffieldunited){    imageLogo='sheffield';}
    else if(timeFoto==ClubName().sheffieldWednesday){ imageLogo='sheffield wed';  }
    else if(timeFoto==ClubName().stoke){    imageLogo='stoke';}
    else if(timeFoto==ClubName().sunderland){ imageLogo='sunderland';  }
    else if(timeFoto==ClubName().swindon){ imageLogo='swindon';  }
    else if(timeFoto==ClubName().swansea){    imageLogo='swansea';}
    else if(timeFoto==ClubName().watford){    imageLogo='watford';}
    else if(timeFoto==ClubName().wigan){ imageLogo='wigan';  }
    else if(timeFoto==ClubName().wimbledon){ imageLogo='wimbledon';  }
    else if(timeFoto==ClubName().wycombe){ imageLogo='wycombe';  }
    else if(timeFoto==ClubName().york){ imageLogo='york';  }

    else if(timeFoto==ClubName().atalanta){    imageLogo='atalanta';}
    else if(timeFoto==ClubName().bologna){    imageLogo='bologna';}
    else if(timeFoto==ClubName().cagliari){    imageLogo='cagliari';}
    else if(timeFoto==ClubName().fiorentina){    imageLogo='fiorentina';}
    else if(timeFoto==ClubName().genoa){    imageLogo='genoa';}
    else if(timeFoto==ClubName().inter){    imageLogo='inter';}
    else if(timeFoto==ClubName().juventus){    imageLogo='juventus';}
    else if(timeFoto==ClubName().milan){    imageLogo='milan';}
    else if(timeFoto==ClubName().lazio){    imageLogo='lazio';}
    else if(timeFoto==ClubName().napoli){    imageLogo='napoli';}
    else if(timeFoto==ClubName().parma){    imageLogo='parma';}
    else if(timeFoto==ClubName().roma){    imageLogo='roma';}
    else if(timeFoto==ClubName().sampdoria){    imageLogo='sampdoria';}
    else if(timeFoto==ClubName().sassuolo){    imageLogo='sassuolo';}
    else if(timeFoto==ClubName().torino){    imageLogo='torino';}
    else if(timeFoto==ClubName().udinese){    imageLogo='udinese';}

    else if(timeFoto==ClubName().ascoli){    imageLogo='ascoli';}
    else if(timeFoto==ClubName().bari){    imageLogo='bari';}
    else if(timeFoto==ClubName().benevento){    imageLogo='benevento';}
    else if(timeFoto==ClubName().brescia){    imageLogo='brescia';}
    else if(timeFoto==ClubName().catania){    imageLogo='catania';}
    else if(timeFoto==ClubName().catanzaro){    imageLogo='catanzaro';}
    else if(timeFoto==ClubName().cesena){    imageLogo='cesena';}
    else if(timeFoto==ClubName().cittadella){    imageLogo='cittadella';}
    else if(timeFoto==ClubName().como){    imageLogo='como';}
    else if(timeFoto==ClubName().cremonese){    imageLogo='cremonese';}
    else if(timeFoto==ClubName().chievo){    imageLogo='chievo';}
    else if(timeFoto==ClubName().cosenza){    imageLogo='cosenza';}
    else if(timeFoto==ClubName().crotone){    imageLogo='crotone';}
    else if(timeFoto==ClubName().empoli){    imageLogo='empoli';}
    else if(timeFoto==ClubName().foggia){    imageLogo='foggia';}
    else if(timeFoto==ClubName().frosinone){    imageLogo='frosinone';}
    else if(timeFoto==ClubName().hellasVerona){    imageLogo='hellas';}
    else if(timeFoto==ClubName().lecce){    imageLogo='lecce';}
    else if(timeFoto==ClubName().monza){    imageLogo='monza';}
    else if(timeFoto==ClubName().padova){    imageLogo='padova';}
    else if(timeFoto==ClubName().palermo){    imageLogo='palermo';}
    else if(timeFoto==ClubName().perugia){    imageLogo='perugia';}
    else if(timeFoto==ClubName().pescara){    imageLogo='pescara';}
    else if(timeFoto==ClubName().piacenza){    imageLogo='piacenza';}
    else if(timeFoto==ClubName().pisa){    imageLogo='pisa';}
    else if(timeFoto==ClubName().pordenone){    imageLogo='pordenone';}
    else if(timeFoto==ClubName().reggina){    imageLogo='reggina';}
    else if(timeFoto==ClubName().salernitana){    imageLogo='salernitana';}
    else if(timeFoto==ClubName().siena){    imageLogo='siena';}
    else if(timeFoto==ClubName().spal){    imageLogo='spal';}
    else if(timeFoto==ClubName().spezia){    imageLogo='spezia';}
    else if(timeFoto==ClubName().ternana){    imageLogo='ternana';}
    else if(timeFoto==ClubName().venezia){    imageLogo='venezia';}
    else if(timeFoto==ClubName().vicenza){    imageLogo='vicenza';}

    else if(timeFoto==ClubName().athleticbilbao){    imageLogo='athleticbilbao';}
    else if(timeFoto==ClubName().atleticomadrid){    imageLogo='atleticomadrid';}
    else if(timeFoto==ClubName().barcelona){    imageLogo='barcelona';}
    else if(timeFoto==ClubName().celtavigo){    imageLogo='celta';}
    else if(timeFoto==ClubName().espanyol){    imageLogo='espanyol';}
    else if(timeFoto==ClubName().getafe){    imageLogo='getafe';}
    else if(timeFoto==ClubName().osasuna){    imageLogo='osasuna';}
    else if(timeFoto==ClubName().lacoruna){    imageLogo='lacoruna';}
    else if(timeFoto==ClubName().levante){    imageLogo='levante';}
    else if(timeFoto==ClubName().realbetis){    imageLogo='realbetis';}
    else if(timeFoto==ClubName().realmadrid){    imageLogo='realmadrid';}
    else if(timeFoto==ClubName().realsociedad){    imageLogo='realsociedad';}
    else if(timeFoto==ClubName().sevilla){    imageLogo='sevilla';}
    else if(timeFoto==ClubName().valladolid){    imageLogo='valladolid';}
    else if(timeFoto==ClubName().valencia){    imageLogo='valencia';}
    else if(timeFoto==ClubName().villareal){    imageLogo='villareal';}

    else if(timeFoto==ClubName().alaves){    imageLogo='alaves';}
    else if(timeFoto==ClubName().albacete){    imageLogo='albacete';}
    else if(timeFoto==ClubName().almeria){    imageLogo='almeria';}
    else if(timeFoto==ClubName().atleticomadridB){    imageLogo='atleticomadrid';}
    else if(timeFoto==ClubName().badajoz){    imageLogo='badajoz';}
    else if(timeFoto==ClubName().barcelonaB){    imageLogo='barcelona';}
    else if(timeFoto==ClubName().burgos){    imageLogo='burgos';}
    else if(timeFoto==ClubName().cadiz){    imageLogo='cadiz';}
    else if(timeFoto==ClubName().cartagena){    imageLogo='cartagena';}
    else if(timeFoto==ClubName().compostela){    imageLogo='compostela';}
    else if(timeFoto==ClubName().cordoba){    imageLogo='cordoba';}
    else if(timeFoto==ClubName().eibar){    imageLogo='eibar';}
    else if(timeFoto==ClubName().elche){    imageLogo='elche';}
    else if(timeFoto==ClubName().extremadura){    imageLogo='extremadura';}
    else if(timeFoto==ClubName().girona){    imageLogo='girona';}
    else if(timeFoto==ClubName().tarragona){    imageLogo='tarragona';}
    else if(timeFoto==ClubName().granada){    imageLogo='granada';}
    else if(timeFoto==ClubName().hercules){    imageLogo='hercules';}
    else if(timeFoto==ClubName().huelva){    imageLogo='huelva';}
    else if(timeFoto==ClubName().ibiza){    imageLogo='ibiza';}
    else if(timeFoto==ClubName().lasPalmas){    imageLogo='las palmas';}
    else if(timeFoto==ClubName().leganes){    imageLogo='leganes';}
    else if(timeFoto==ClubName().malaga){    imageLogo='malaga';}
    else if(timeFoto==ClubName().mallorca){    imageLogo='mallorca';}
    else if(timeFoto==ClubName().merida){    imageLogo='merida';}
    else if(timeFoto==ClubName().numancia){    imageLogo='numancia';}
    else if(timeFoto==ClubName().rayoVallecano){    imageLogo='rayo';}
    else if(timeFoto==ClubName().realmadridB){    imageLogo='realmadrid';}
    else if(timeFoto==ClubName().sportingGijon){    imageLogo='sporting gijon';}
    else if(timeFoto==ClubName().tenerife){    imageLogo='tenerife';}
    else if(timeFoto==ClubName().realOviedo){    imageLogo='real oviedo';}
    else if(timeFoto==ClubName().salamanca){    imageLogo='salamanca';}
    else if(timeFoto==ClubName().xerez){    imageLogo='xerez';}
    else if(timeFoto==ClubName().zaragoza){    imageLogo='zaragoza';}

    else if(timeFoto==ClubName().moenchengladbach){    imageLogo='borussia';}
    else if(timeFoto==ClubName().dortmund){    imageLogo='dortmund';}
    else if(timeFoto==ClubName().bayernmunique){    imageLogo='bayern';}
    else if(timeFoto==ClubName().leverkusen){    imageLogo='leverkusen';}
    else if(timeFoto==ClubName().eintrachtfrankfurt){    imageLogo='frankfurt';}
    else if(timeFoto==ClubName().augsburg){    imageLogo='augsburg';}
    else if(timeFoto==ClubName().freiburg){    imageLogo='freiburg';}
    else if(timeFoto==ClubName().hamburgo){    imageLogo='hamburgo';}
    else if(timeFoto==ClubName().colonia){    imageLogo='colonia';}
    else if(timeFoto==ClubName().herthaberlim){    imageLogo='hertha';}
    else if(timeFoto==ClubName().hoffenheim){    imageLogo='hoffenheim';}
    else if(timeFoto==ClubName().rbleipzig){    imageLogo='leipzig';}
    else if(timeFoto==ClubName().schalke04){    imageLogo='schalke';}
    else if(timeFoto==ClubName().stuttgart){    imageLogo='stuttgart';}
    else if(timeFoto==ClubName().werderbremen){    imageLogo='werderbremen';}
    else if(timeFoto==ClubName().wolfsburg){    imageLogo='wolfsburg';}

    else if(timeFoto==ClubName().aachen){    imageLogo='aachen';}
    else if(timeFoto==ClubName().arminiaBiefeld){    imageLogo='arminia';}
    else if(timeFoto==ClubName().berliner){    imageLogo='berliner';}
    else if(timeFoto==ClubName().bochum){    imageLogo='bochum';}
    else if(timeFoto==ClubName().darmstadt){    imageLogo='darmstadt';}
    else if(timeFoto==ClubName().duisburg){    imageLogo='duisburg';}
    else if(timeFoto==ClubName().dynamoDresden){    imageLogo='dynamo dresden';}
    else if(timeFoto==ClubName().eintrachtBraunschweiger){    imageLogo='braunschweiger';}
    else if(timeFoto==ClubName().energieCottbus){    imageLogo='energie cottbus';}
    else if(timeFoto==ClubName().erzgebirgeaue){    imageLogo='erzgebirgeaue';}
    else if(timeFoto==ClubName().fortunaDusseldorf){    imageLogo='fortuna';}
    else if(timeFoto==ClubName().greutherFurth){    imageLogo='greuther furth';}
    else if(timeFoto==ClubName().hannover96){    imageLogo='hannover96';}
    else if(timeFoto==ClubName().hansaRostock){    imageLogo='hansa';}
    else if(timeFoto==ClubName().karlsruher){    imageLogo='karlsruher';}
    else if(timeFoto==ClubName().kaiserslautern){    imageLogo='kaiserslautern';}
    else if(timeFoto==ClubName().magdeburg){    imageLogo='magdeburg';}
    else if(timeFoto==ClubName().mainz05){    imageLogo='mainz';}
    else if(timeFoto==ClubName().munique1860){    imageLogo='munique1860';}
    else if(timeFoto==ClubName().nurnberg){    imageLogo='nurnberg';}
    else if(timeFoto==ClubName().paderborn){    imageLogo='paderborn';}
    else if(timeFoto==ClubName().rotWeissEssen){    imageLogo='rot weiss essen';}
    else if(timeFoto==ClubName().saarbrucken){    imageLogo='saarbrucken';}
    else if(timeFoto==ClubName().uerdigen){    imageLogo='uerdigen';}
    else if(timeFoto==ClubName().unionBerlin){    imageLogo='union berlin';}
    else if(timeFoto==ClubName().stPauli){    imageLogo='st pauli';}

    else if(timeFoto==ClubName().bordeaux){    imageLogo='bordeaux';}
    else if(timeFoto==ClubName().lille){    imageLogo='lille';}
    else if(timeFoto==ClubName().lyon){    imageLogo='lyon';}
    else if(timeFoto==ClubName().monaco){    imageLogo='monaco';}
    else if(timeFoto==ClubName().montpellier){    imageLogo='montpellier';}
    else if(timeFoto==ClubName().nantes){    imageLogo='nantes';}
    else if(timeFoto==ClubName().nice){    imageLogo='nice';}
    else if(timeFoto==ClubName().om){    imageLogo='marseille';}
    else if(timeFoto==ClubName().psg){    imageLogo='psg';}
    else if(timeFoto==ClubName().reims){    imageLogo='reims';}
    else if(timeFoto==ClubName().rennes){    imageLogo='rennes';}
    else if(timeFoto==ClubName().saintetienne){    imageLogo='stetienne';}
    else if(timeFoto==ClubName().metz){    imageLogo='metz';}

    else if(timeFoto==ClubName().ajaccio){    imageLogo='ajaccio';}
    else if(timeFoto==ClubName().amiens){    imageLogo='amiens';}
    else if(timeFoto==ClubName().angers){    imageLogo='angers';}
    else if(timeFoto==ClubName().auxerre){    imageLogo='auxerre';}
    else if(timeFoto==ClubName().bastia){    imageLogo='bastia';}
    else if(timeFoto==ClubName().brest){    imageLogo='brest';}
    else if(timeFoto==ClubName().caen){    imageLogo='caen';}
    else if(timeFoto==ClubName().chamois){    imageLogo='chamois';}
    else if(timeFoto==ClubName().clermont){    imageLogo='clermont';}
    else if(timeFoto==ClubName().dijon){    imageLogo='dijon';}
    else if(timeFoto==ClubName().guingamp){    imageLogo='guingamp';}
    else if(timeFoto==ClubName().grenoble){    imageLogo='grenoble';}
    else if(timeFoto==ClubName().lavallois){    imageLogo='lavallois';}
    else if(timeFoto==ClubName().lehavre){    imageLogo='lehavre';}
    else if(timeFoto==ClubName().lemans){    imageLogo='lemans';}
    else if(timeFoto==ClubName().lens){    imageLogo='lens';}
    else if(timeFoto==ClubName().lorient){    imageLogo='lorient';}
    else if(timeFoto==ClubName().nancy){    imageLogo='nancy';}
    else if(timeFoto==ClubName().nimes){    imageLogo='nimes';}
    else if(timeFoto==ClubName().orleans){    imageLogo='orleans';}
    else if(timeFoto==ClubName().pau){    imageLogo='pau';}
    else if(timeFoto==ClubName().parisFC){    imageLogo='paris';}
    else if(timeFoto==ClubName().redstar){    imageLogo='red star';}
    else if(timeFoto==ClubName().rodez){    imageLogo='rodez';}
    else if(timeFoto==ClubName().rouen){    imageLogo='rouen';}
    else if(timeFoto==ClubName().toulouse){    imageLogo='toulouse';}
    else if(timeFoto==ClubName().troyes){    imageLogo='troyes';}
    else if(timeFoto==ClubName().sedan){    imageLogo='sedan';}
    else if(timeFoto==ClubName().sochaux){    imageLogo='sochaux';}
    else if(timeFoto==ClubName().strasbourg){    imageLogo='strasbourg';}
    else if(timeFoto==ClubName().valenciennes){    imageLogo='valenciennes';}

    else if(timeFoto==ClubName().benfica){    imageLogo='benfica';}
    else if(timeFoto==ClubName().porto){    imageLogo='porto';}
    else if(timeFoto==ClubName().sporting){    imageLogo='sporting';}
    else if(timeFoto==ClubName().beiramar){    imageLogo='beiramar';}
    else if(timeFoto==ClubName().belenenses){    imageLogo='belenenses';}
    else if(timeFoto==ClubName().boavista){    imageLogo='boavista';}
    else if(timeFoto==ClubName().casapia){    imageLogo='casa pia';}
    else if(timeFoto==ClubName().chaves){    imageLogo='chaves';}
    else if(timeFoto==ClubName().coimbra){    imageLogo='coimbra';}
    else if(timeFoto==ClubName().estoril){    imageLogo='estoril';}
    else if(timeFoto==ClubName().braga){    imageLogo='braga';}
    else if(timeFoto==ClubName().covilha){    imageLogo='covilha';}
    else if(timeFoto==ClubName().estrelaamadora){    imageLogo='estrela amadora';}
    else if(timeFoto==ClubName().famalicao){    imageLogo='famalicao';}
    else if(timeFoto==ClubName().farense){    imageLogo='farense';}
    else if(timeFoto==ClubName().feirense){    imageLogo='feirense';}
    else if(timeFoto==ClubName().gilVicente){    imageLogo='gil vicente';}
    else if(timeFoto==ClubName().leixoes){    imageLogo='leixoes';}
    else if(timeFoto==ClubName().mafra){    imageLogo='mafra';}
    else if(timeFoto==ClubName().maritimo){    imageLogo='maritimo';}
    else if(timeFoto==ClubName().moreirense){    imageLogo='moreirense';}
    else if(timeFoto==ClubName().nacionalMadeira){    imageLogo='nacional madeira';}
    else if(timeFoto==ClubName().olhanense){    imageLogo='olhanense';}
    else if(timeFoto==ClubName().pacosDeFerreira){    imageLogo='paços de ferreira';}
    else if(timeFoto==ClubName().penafiel){    imageLogo='penafiel';}
    else if(timeFoto==ClubName().portimonense){    imageLogo='portimonense';}
    else if(timeFoto==ClubName().rioAve){    imageLogo='rio ave';}
    else if(timeFoto==ClubName().salgueiros){    imageLogo='salgueiros';}
    else if(timeFoto==ClubName().santaClara){    imageLogo='santa clara';}
    else if(timeFoto==ClubName().tondela){    imageLogo='tondela';}
    else if(timeFoto==ClubName().uniaoLeiria){    imageLogo='leiria';}
    else if(timeFoto==ClubName().varzim){    imageLogo='varzim';}
    else if(timeFoto==ClubName().viseu){    imageLogo='viseu';}
    else if(timeFoto==ClubName().vizela){    imageLogo='vizela';}
    else if(timeFoto==ClubName().vitoriaguimaraes){    imageLogo='guimaraes';}
    else if(timeFoto==ClubName().vitoriaSetubal){    imageLogo='vitoria setubal';}
    //HOLANDA
    else if(timeFoto==ClubName().ajax){    imageLogo='ajax';}
    else if(timeFoto==ClubName().feyenoord){    imageLogo='feyenoord';}
    else if(timeFoto==ClubName().psv){    imageLogo='psv';}
    else if(timeFoto==ClubName().azAlkmaar){    imageLogo='az';}
    else if(timeFoto==ClubName().cambuur){    imageLogo='cambuur';}
    else if(timeFoto==ClubName().denhaag){    imageLogo='den haag';}
    else if(timeFoto==ClubName().emmen){    imageLogo='emmen';}
    else if(timeFoto==ClubName().excelsior){    imageLogo='excelsior';}
    else if(timeFoto==ClubName().fortunasittard){    imageLogo='fortuna sittard';}
    else if(timeFoto==ClubName().goaheadeagles){    imageLogo='go ahead eagles';}
    else if(timeFoto==ClubName().groningen){    imageLogo='groningen';}
    else if(timeFoto==ClubName().heracles){    imageLogo='heracles';}
    else if(timeFoto==ClubName().necnijmegen){    imageLogo='nec';}
    else if(timeFoto==ClubName().rodajc){    imageLogo='rodajc';}
    else if(timeFoto==ClubName().spartarotterdam){    imageLogo='spartarotterdam';}
    else if(timeFoto==ClubName().twente){    imageLogo='twente';}
    else if(timeFoto==ClubName().utrecht){    imageLogo='utrecht';}
    else if(timeFoto==ClubName().vitesse){    imageLogo='vitesse';}
    else if(timeFoto==ClubName().heerenveen){    imageLogo='heerenveen';}
    else if(timeFoto==ClubName().waalwijk){    imageLogo='waalwijk';}
    else if(timeFoto==ClubName().willem){    imageLogo='willem';}
    else if(timeFoto==ClubName().zwolle){    imageLogo='zwolle';}
    //BELGICA
    else if(timeFoto==ClubName().anderlecht){    imageLogo='anderlecht';}
    else if(timeFoto==ClubName().beveren){    imageLogo='beveren';}
    else if(timeFoto==ClubName().brugge){    imageLogo='brugge';}
    else if(timeFoto==ClubName().cerclebrugge){    imageLogo='cerclebrugge';}
    else if(timeFoto==ClubName().charleroi){    imageLogo='charleroi';}
    else if(timeFoto==ClubName().genk){    imageLogo='genk';}
    else if(timeFoto==ClubName().gent){    imageLogo='gent';}
    else if(timeFoto==ClubName().kaseupen){    imageLogo='kas eupen';}
    else if(timeFoto==ClubName().kortrijk){    imageLogo='kortrijk';}
    else if(timeFoto==ClubName().lierse){    imageLogo='lierse';}
    else if(timeFoto==ClubName().mechelen){    imageLogo='mechelen';}
    else if(timeFoto==ClubName().oostende){    imageLogo='oostende';}
    else if(timeFoto==ClubName().royalAntwerp){    imageLogo='royal';}
    else if(timeFoto==ClubName().standardliege){    imageLogo='liege';}
    else if(timeFoto==ClubName().sttruidense){    imageLogo='st truidense';}
    else if(timeFoto==ClubName().saintgilloise){    imageLogo='st gilloise';}
    else if(timeFoto==ClubName().westerlo){    imageLogo='westerlo';}
    else if(timeFoto==ClubName().zulteWaregem){    imageLogo='zulte waregem';}

    //ESCOCIA
    else if(timeFoto==ClubName().celtic){    imageLogo='celtic';}
    else if(timeFoto==ClubName().rangers){    imageLogo='rangers';}
    else if(timeFoto==ClubName().aberdeen){    imageLogo='aberdeen';}
    else if(timeFoto==ClubName().dundee){    imageLogo='dundee';}
    else if(timeFoto==ClubName().hearts){    imageLogo='hearts';}
    else if(timeFoto==ClubName().hibernian){    imageLogo='hibernian';}
    else if(timeFoto==ClubName().kilmarnock){    imageLogo='kilmarnock';}
    else if(timeFoto==ClubName().livingstone){    imageLogo='livingstone';}
    else if(timeFoto==ClubName().motherwell){    imageLogo='motherwell';}
    else if(timeFoto==ClubName().rossCounty){    imageLogo='ross county';}
    else if(timeFoto==ClubName().stjohnstone){    imageLogo='st johnstone';}
    else if(timeFoto==ClubName().stmirren){    imageLogo='st mirren';}
    //IRLANDA
    else if(timeFoto==ClubName().bohemian){    imageLogo='bohemian';}
    else if(timeFoto==ClubName().cork){    imageLogo='cork';}
    else if(timeFoto==ClubName().derry){    imageLogo='derry';}
    else if(timeFoto==ClubName().dundalk){    imageLogo='dundalk';}
    else if(timeFoto==ClubName().shamrock){    imageLogo='shamrock';}
    //GALES
    else if(timeFoto==ClubName().newsaints){    imageLogo='new saints';}
    //IRLANDA DO NORTE
    else if(timeFoto==ClubName().crusaders){    imageLogo='crusaders';}
    else if(timeFoto==ClubName().glentoran){    imageLogo='glentoran';}
    else if(timeFoto==ClubName().linfield){    imageLogo='linfield';}

    //NORDICOS
    //NORUEGA
    else if(timeFoto==ClubName().aalesund){    imageLogo='aalesund';}
    else if(timeFoto==ClubName().fredrikstad){    imageLogo='fredrikstad';}
    else if(timeFoto==ClubName().glimt){    imageLogo='glimt';}
    else if(timeFoto==ClubName().lillestrom){    imageLogo='lillestrom';}
    else if(timeFoto==ClubName().lyn){    imageLogo='lyn';}
    else if(timeFoto==ClubName().odd){    imageLogo='odd';}
    else if(timeFoto==ClubName().molde){    imageLogo='molde';}
    else if(timeFoto==ClubName().rosenborg){    imageLogo='rosenborg';}
    else if(timeFoto==ClubName().valerenga){    imageLogo='valerenga';}
    else if(timeFoto==ClubName().viking){    imageLogo='viking';}
    //SUECIA
    else if(timeFoto==ClubName().malmo){    imageLogo='malmo';}
    else if(timeFoto==ClubName().aik){    imageLogo='aik';}
    else if(timeFoto==ClubName().djurgarden){    imageLogo='djurgarden';}
    else if(timeFoto==ClubName().elfsborg){    imageLogo='elfsborg';}
    else if(timeFoto==ClubName().hammarby){    imageLogo='hammarby';}
    else if(timeFoto==ClubName().helsingborg){    imageLogo='helsingborg';}
    else if(timeFoto==ClubName().ifkgoteborg){    imageLogo='ifk';}
    else if(timeFoto==ClubName().norrkoping){    imageLogo='norrkoping';}
    //DINAMARCA
    else if(timeFoto==ClubName().aarhus){    imageLogo='aarhus';}
    else if(timeFoto==ClubName().aalborg){    imageLogo='aalborg';}
    else if(timeFoto==ClubName().brondby){    imageLogo='brondby';}
    else if(timeFoto==ClubName().copenhague){    imageLogo='copenhague';}
    else if(timeFoto==ClubName().esbjerg){    imageLogo='esbjerg';}
    else if(timeFoto==ClubName().horsens){    imageLogo='horsens';}
    else if(timeFoto==ClubName().lyngby){    imageLogo='lyngby';}
    else if(timeFoto==ClubName().midtjylland){    imageLogo='midtjylland';}
    else if(timeFoto==ClubName().nordsjaelland){    imageLogo='nordsjaelland';}
    else if(timeFoto==ClubName().obodense){    imageLogo='ob odense';}
    else if(timeFoto==ClubName().randers){    imageLogo='randers';}
    else if(timeFoto==ClubName().silkeborg){    imageLogo='silkeborg';}
    else if(timeFoto==ClubName().vejle){    imageLogo='vejle';}
    else if(timeFoto==ClubName().viborg){    imageLogo='viborg';}
    //FINLANDIA
    else if(timeFoto==ClubName().helsinki){    imageLogo='hjk helsinki';}
    else if(timeFoto==ClubName().haka){    imageLogo='haka';}
    else if(timeFoto==ClubName().kups){    imageLogo='kups';}
    else if(timeFoto==ClubName().lahti){    imageLogo='lahti';}
    //ISLANDIA
    else if(timeFoto==ClubName().akraness){    imageLogo='akraness';}
    else if(timeFoto==ClubName().breidablik){    imageLogo='breidablik';}
    else if(timeFoto==ClubName().hafnarfjardar){    imageLogo='hafnarfjardar';}
    else if(timeFoto==ClubName().reykjavik){    imageLogo='reykjavik';}
    else if(timeFoto==ClubName().valur){    imageLogo='valur';}
    else if(timeFoto==ClubName().vikingur){    imageLogo='vikingur';}

    //AUSTRIA
    else if(timeFoto==ClubName().admira){    imageLogo='admira';}
    else if(timeFoto==ClubName().austria){    imageLogo='austria';}
    else if(timeFoto==ClubName().rbsalzburg){    imageLogo='rbsalzburg';}
    else if(timeFoto==ClubName().rapidviena){    imageLogo='rapidviena';}
    else if(timeFoto==ClubName().laskLinz){    imageLogo='lask';}
    else if(timeFoto==ClubName().ried){    imageLogo='ried';}
    else if(timeFoto==ClubName().tirol){    imageLogo='tirol';}
    else if(timeFoto==ClubName().sturmGraz){    imageLogo='sturm';}
    else if(timeFoto==ClubName().wolfsberger){    imageLogo='wolfsberger';}
    //SUIÇA
    else if(timeFoto==ClubName().basel){    imageLogo='basel';}
    else if(timeFoto==ClubName().grasshoppers){    imageLogo='grasshopper';}
    else if(timeFoto==ClubName().lugano){    imageLogo='lugano';}
    else if(timeFoto==ClubName().luzern){    imageLogo='luzern';}
    else if(timeFoto==ClubName().servette){    imageLogo='servette';}
    else if(timeFoto==ClubName().sion){    imageLogo='sion';}
    else if(timeFoto==ClubName().stgallen){    imageLogo='st gallen';}
    else if(timeFoto==ClubName().thun){    imageLogo='thun';}
    else if(timeFoto==ClubName().youngBoys){    imageLogo='young boys';}
    else if(timeFoto==ClubName().winterthur){    imageLogo='winterthur';}
    else if(timeFoto==ClubName().zurich){    imageLogo='zurich';}
    //POLONIA
    else if(timeFoto==ClubName().gornik){    imageLogo='gornik';}
    else if(timeFoto==ClubName().legiaWarszawa){    imageLogo='legia';}
    else if(timeFoto==ClubName().lechPoznan){    imageLogo='lech';}
    else if(timeFoto==ClubName().lechiagdansk){    imageLogo='lechia gdansk';}
    else if(timeFoto==ClubName().pogon){    imageLogo='pogon';}
    else if(timeFoto==ClubName().ruchchorzow){    imageLogo='ruch';}
    else if(timeFoto==ClubName().slaskwrocklaw){    imageLogo='slask';}
    else if(timeFoto==ClubName().wislaKrakow){    imageLogo='wisla krakow';}
    else if(timeFoto==ClubName().wislaPlock){    imageLogo='wisla plock';}

    //TURQUIA
    else if(timeFoto==ClubName().galatasaray){    imageLogo='galatasaray';}
    else if(timeFoto==ClubName().fenerbahce){    imageLogo='fenerbahce';}
    else if(timeFoto==ClubName().besiktas){    imageLogo='besiktas';}
    else if(timeFoto==ClubName().adanaspor){    imageLogo='adanaspor';}
    else if(timeFoto==ClubName().alanyaspor){    imageLogo='alanyaspor';}
    else if(timeFoto==ClubName().antalyaspor){    imageLogo='antalyaspor';}
    else if(timeFoto==ClubName().bursaspor){    imageLogo='bursaspor';}
    else if(timeFoto==ClubName().denizlispor){    imageLogo='denizlispor';}
    else if(timeFoto==ClubName().gaziantepspor){    imageLogo='gaziantepspor';}
    else if(timeFoto==ClubName().goztepe){    imageLogo='goztepe';}
    else if(timeFoto==ClubName().instanbul){    imageLogo='instanbul';}
    else if(timeFoto==ClubName().karagumruk){    imageLogo='karagumruk';}
    else if(timeFoto==ClubName().kasimpasa){    imageLogo='kasimpasa';}
    else if(timeFoto==ClubName().konyaspor){    imageLogo='konyaspor';}
    else if(timeFoto==ClubName().hatayspor){    imageLogo='hatayspor';}
    else if(timeFoto==ClubName().malatyaspor){    imageLogo='malatyaspor';}
    else if(timeFoto==ClubName().rizespor){    imageLogo='rizespor';}
    else if(timeFoto==ClubName().sivasspor){    imageLogo='sivasspor';}
    else if(timeFoto==ClubName().trabzonspor){    imageLogo='trabzonspor';}
    //GRECIA-CHIPRE-ISRAEL
    else if(timeFoto==ClubName().olympiacos){    imageLogo='olympiacos';}
    else if(timeFoto==ClubName().aek){    imageLogo='aek';}
    else if(timeFoto==ClubName().paok){    imageLogo='paok';}
    else if(timeFoto==ClubName().panathinaikos){    imageLogo='panathinaikos';}
    else if(timeFoto==ClubName().aris){    imageLogo='aris';}
    else if(timeFoto==ClubName().ofi){    imageLogo='ofi';}
    //CHIPRE
    else if(timeFoto==ClubName().apoel){    imageLogo='apoel';}
    else if(timeFoto==ClubName().aeklarnaca){    imageLogo='aek larnaca';}
    else if(timeFoto==ClubName().omonia){    imageLogo='omonia';}
    else if(timeFoto==ClubName().apollon){    imageLogo='apollon';}
    //ISRAEL
    else if(timeFoto==ClubName().hapoelTelAviv){    imageLogo='hapoel tel aviv';}
    else if(timeFoto==ClubName().maccabiHaifa){    imageLogo='maccabi haifa';}
    else if(timeFoto==ClubName().maccabiTelAviv){    imageLogo='maccabi tel aviv';}

    //RUSSIA
    else if(timeFoto==ClubName().zenit){    imageLogo='zenit';}
    else if(timeFoto==ClubName().cska){    imageLogo='cska';}
    else if(timeFoto==ClubName().spartakmoscou){    imageLogo='spartak';}
    else if(timeFoto==ClubName().krasnodar){    imageLogo='krasnodar';}
    else if(timeFoto==ClubName().sochi){    imageLogo='sochi';}
    else if(timeFoto==ClubName().rubinKazan){    imageLogo='rubin kazan';}
    else if(timeFoto==ClubName().akhmatGrozny){    imageLogo='akhmat grozny';}
    else if(timeFoto==ClubName().vladikavkaz){    imageLogo='alania';}
    else if(timeFoto==ClubName().anzhi){    imageLogo='anzhi';}
    else if(timeFoto==ClubName().khimki){    imageLogo='khimki';}
    else if(timeFoto==ClubName().krylyaSovetov){    imageLogo='krylya sovetov';}
    else if(timeFoto==ClubName().dinamoMoscou){    imageLogo='dinamo moscou';}
    else if(timeFoto==ClubName().lokomotivMoscou){    imageLogo='lokomotiv';}
    else if(timeFoto==ClubName().nizhnyNovgorod){    imageLogo='novgorod';}
    else if(timeFoto==ClubName().orenburg){    imageLogo='orenburg';}
    else if(timeFoto==ClubName().rostov){    imageLogo='rostov';}
    else if(timeFoto==ClubName().rotor){    imageLogo='rotor';}
    else if(timeFoto==ClubName().torpedo){    imageLogo='torpedo';}
    else if(timeFoto==ClubName().tula){    imageLogo='tula';}
    else if(timeFoto==ClubName().ural){    imageLogo='ural';}

    //EX-URSS
    if(timeFoto==ClubName().shaktardonetsk){    imageLogo='shaktar';}
    else if(timeFoto==ClubName().dinamokiev){    imageLogo='dinamokiev';}
    else if(timeFoto==ClubName().dnipro){    imageLogo='dnipro';}
    else if(timeFoto==ClubName().lviv){    imageLogo='lviv';}
    else if(timeFoto==ClubName().metalist){    imageLogo='metalist';}
    else if(timeFoto==ClubName().zorya){    imageLogo='zorya';}

    //MOLDOVA
    else if(timeFoto==ClubName().sheriffTiraspol){    imageLogo='sheriff';}
    //BELARUS
    else if(timeFoto==ClubName().bate){    imageLogo='bate';}
    else if(timeFoto==ClubName().dinamoBrest){    imageLogo='dinamo brest';}
    else if(timeFoto==ClubName().dinamoMinsk){    imageLogo='dinamo minsk';}
    //AZERBAIJAN
    else if(timeFoto==ClubName().qarabag){    imageLogo='qarabag';}
    //GEORGIA
    else if(timeFoto==ClubName().batumi){    imageLogo='batumi';}
    else if(timeFoto==ClubName().dila){    imageLogo='dila';}
    else if(timeFoto==ClubName().tbilisi){    imageLogo='tbilisi';}
    //ARMENIA
    else if(timeFoto==ClubName().alashkent){    imageLogo='alashkent';}
    else if(timeFoto==ClubName().araratArmenia){    imageLogo='ararat armenia';}
    else if(timeFoto==ClubName().araratYerevan){    imageLogo='ararat yerevan';}
    else if(timeFoto==ClubName().pyunikyerevan){    imageLogo='pyunik yerevan';}
    //KAZAKHSTAN
    else if(timeFoto==ClubName().aktobe){    imageLogo='aktobe';}
    else if(timeFoto==ClubName().astana){    imageLogo='astana';}
    else if(timeFoto==ClubName().kairat){    imageLogo='kairat';}
    else if(timeFoto==ClubName().shakhter){    imageLogo='shakhter';}
    else if(timeFoto==ClubName().okzhetpes){    imageLogo='okzhetpes';}
    else if(timeFoto==ClubName().ordabasy){    imageLogo='ordabasy';}
    else if(timeFoto==ClubName().taraz){    imageLogo='taraz';}
    else if(timeFoto==ClubName().tobol){    imageLogo='tobol';}

    //BALTICOS
    //ESTONIA
    else if(timeFoto==ClubName().floratallinn){    imageLogo='flora talinn';}
    //LATVIA
    else if(timeFoto==ClubName().rigafc){    imageLogo='riga';}
    //LITUANIA
    else if(timeFoto==ClubName().suduva){    imageLogo='suduva';}
    else if(timeFoto==ClubName().kaunu){    imageLogo='kaunu)';}
    else if(timeFoto==ClubName().zalgiris){    imageLogo='zalgiris';}

    //LESTE EUROPEU
    //SERVIA
    else if(timeFoto==ClubName().estrelavermelha){    imageLogo='estrelavermelha';}
    else if(timeFoto==ClubName().partizan){    imageLogo='partizan';}
    else if(timeFoto==ClubName().vojvodina){    imageLogo='vojvodina';}
    //BULGARIA
    else if(timeFoto==ClubName().beroe){    imageLogo='beroe';}
    else if(timeFoto==ClubName().cskaSofia){    imageLogo='cska sofia';}
    else if(timeFoto==ClubName().levskiSofia){    imageLogo='levski sofia';}
    else if(timeFoto==ClubName().lokplovdiv){    imageLogo='lok plovdiv';}
    else if(timeFoto==ClubName().loksofia){    imageLogo='lok sofia';}
    else if(timeFoto==ClubName().ludogorets){    imageLogo='ludogorets';}
    else if(timeFoto==ClubName().slaviaSofia){    imageLogo='slavia sofia';}
    //CROACIA
    else if(timeFoto==ClubName().dinamozagreb){    imageLogo='dinamozagreb';}
    else if(timeFoto==ClubName().hadjuksplit){    imageLogo='hadjuk split';}
    else if(timeFoto==ClubName().rijeka){    imageLogo='rijeka';}
    else if(timeFoto==ClubName().osijek){    imageLogo='osijek';}
    //ESLOVAQUIA
    else if(timeFoto==ClubName().interBratislava){    imageLogo='inter bratislava';}
    else if(timeFoto==ClubName().slovanBratislava){    imageLogo='slovan bratislava';}
    else if(timeFoto==ClubName().trnava){    imageLogo='trnava';}
    else if(timeFoto==ClubName().zilina){    imageLogo='zilina';}
    //ESLOVENIA
    else if(timeFoto==ClubName().ljublijana){    imageLogo='ljublijana';}
    else if(timeFoto==ClubName().maribor){    imageLogo='maribor';}
    else if(timeFoto==ClubName().mura){    imageLogo='mura';}
    //REPUBLICA TCHECA
    else if(timeFoto==ClubName().banikostrava){    imageLogo='banik';}
    else if(timeFoto==ClubName().bohemians){    imageLogo='bohemians';}
    else if(timeFoto==ClubName().brno){    imageLogo='brno';}
    else if(timeFoto==ClubName().dukla){    imageLogo='dukla';}
    else if(timeFoto==ClubName().jablonec){    imageLogo='jablonec';}
    else if(timeFoto==ClubName().slaviaPraha){    imageLogo='slavia praha';}
    else if(timeFoto==ClubName().slovacko){    imageLogo='slovacko';}
    else if(timeFoto==ClubName().slovanLiberec){    imageLogo='slovan liberec';}
    else if(timeFoto==ClubName().spartapraga){    imageLogo='spartapraga';}
    else if(timeFoto==ClubName().teplice){    imageLogo='teplice';}
    else if(timeFoto==ClubName().viktoriaPlzen){    imageLogo='viktoria';}
    //HUNGRIA
    else if(timeFoto==ClubName().ferencvaros){    imageLogo='ferencvaros';}
    else if(timeFoto==ClubName().gyori){    imageLogo='gyori';}
    else if(timeFoto==ClubName().honved){    imageLogo='honved';}
    else if(timeFoto==ClubName().mtk){    imageLogo='mtk';}
    else if(timeFoto==ClubName().ujpest){    imageLogo='ujpest';}
    else if(timeFoto==ClubName().vasas){    imageLogo='vasas';}
    else if(timeFoto==ClubName().debreceni){    imageLogo='debreceni';}
    //ROMENIA
    else if(timeFoto==ClubName().argesPitesti){    imageLogo='arges pitesti';}
    else if(timeFoto==ClubName().steauaBucuresti){    imageLogo='steaua bucareste';}
    else if(timeFoto==ClubName().dinamoBucuresti){    imageLogo='dinamo bucuresti';}
    else if(timeFoto==ClubName().rapidBucuresti){    imageLogo='rapid bucuresti';}
    else if(timeFoto==ClubName().cluj){    imageLogo='cluj';}
    //MACEDONIA
    else if(timeFoto==ClubName().akaPandev){    imageLogo='pandev';}
    else if(timeFoto==ClubName().shkendija){    imageLogo='shkendija';}
    else if(timeFoto==ClubName().shkupi){    imageLogo='shkupi';}
    else if(timeFoto==ClubName().vardar){    imageLogo='vardar';}
    //ALBANIA
    else if(timeFoto==ClubName().tiranafk){  imageLogo='tirana fk';}
    else if(timeFoto==ClubName().laci){  imageLogo='laci';}
    else if(timeFoto==ClubName().partizanitirane){  imageLogo='partizani tirane';}
    else if(timeFoto==ClubName().vllaznia){  imageLogo='vllaznia';}
    //BOSNIA
    else if(timeFoto==ClubName().sarajevo){  imageLogo='sarajevo';}//BOSNIA
    else if(timeFoto==ClubName().zrinjski){  imageLogo='zrinjski';}//BOSNIA
    //MONTENEGRO
    else if(timeFoto==ClubName().podgorica){  imageLogo='podgorica';}//MONTENEGRO
    //SAN MARINO
    else if(timeFoto==ClubName().lafiorita){  imageLogo='lafiorita';}//SAN MARINO
    //MALTA
    else if(timeFoto==ClubName().sliema){  imageLogo='sliema';}//MALTA
    else if(timeFoto==ClubName().valletta){  imageLogo='valletta';}//MALTA
    //ANDORRA
    else if(timeFoto==ClubName().santacoloma){  imageLogo='santa coloma';}
    //GIBRALTAR
    else if(timeFoto==ClubName().europa){  imageLogo='europa';}
    //LUXEMBURGO
    else if(timeFoto==ClubName().dudelange){  imageLogo='f91 dudelange';}
    else if(timeFoto==ClubName().jeunesseesch){  imageLogo='jeunesse esch';}
    //LIECHSTEINTEIN
    else if(timeFoto==ClubName().vaduz){  imageLogo='vaduz';}




    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    if(timeFoto==ClubName().atleticomg){       imageLogo='atleticomg';}
    else if(timeFoto==ClubName().atleticopr){       imageLogo='atleticopr';}
    else if(timeFoto==ClubName().bahia){     imageLogo='bahia'; }
    else if(timeFoto==ClubName().botafogo){  imageLogo='botafogo'; }
    else if(timeFoto==ClubName().corinthians){       imageLogo='corinthians';}
    else if(timeFoto==ClubName().cruzeiro){  imageLogo='cruzeiro'; }
    else if(timeFoto==ClubName().flamengo){  imageLogo='flamengo';}
    else if(timeFoto==ClubName().fluminense){imageLogo='fluminense';}
    else if(timeFoto==ClubName().gremio){    imageLogo='gremio';}
    else if(timeFoto==ClubName().goias){    imageLogo='goias';}
    else if(timeFoto==ClubName().internacional){     imageLogo='internacional';}
    else if(timeFoto==ClubName().palmeiras){    imageLogo='palmeiras';   }
    else if(timeFoto==ClubName().santos){    imageLogo='santos';}
    else if(timeFoto==ClubName().saopaulo){ imageLogo='saopaulo';}
    else if(timeFoto==ClubName().sport){    imageLogo='sport';}
    else if(timeFoto==ClubName().vasco){    imageLogo='vasco';}

    else if(timeFoto==ClubName().americamg){imageLogo='americamg';}
    else if(timeFoto==ClubName().atleticogo){imageLogo='atleticogo';}
    else if(timeFoto==ClubName().cuiaba){imageLogo='cuiaba';}
    else if(timeFoto==ClubName().chapecoense){    imageLogo='chapecoense';     }
    else if(timeFoto==ClubName().bragantino){    imageLogo='bragantino';      }
    else if(timeFoto==ClubName().ceara){       imageLogo='ceara';}
    else if(timeFoto==ClubName().coritiba){    imageLogo='coritiba';}
    else if(timeFoto==ClubName().criciuma){    imageLogo='criciuma';}
    else if(timeFoto==ClubName().figueirense){ imageLogo='figueirense';}
    else if(timeFoto==ClubName().fortaleza){  imageLogo='fortaleza'; }
    else if(timeFoto==ClubName().guarani){    imageLogo='guarani'; }
    else if(timeFoto==ClubName().juventude){ imageLogo='juventude';  }
    else if(timeFoto==ClubName().nautico){    imageLogo='nautico'; }
    else if(timeFoto==ClubName().parana){    imageLogo='parana';  }
    else if(timeFoto==ClubName().pontepreta){       imageLogo='pontepreta';  }
    else if(timeFoto==ClubName().vitoria){    imageLogo='vitoria'; }

    else if(timeFoto==ClubName().abc){    imageLogo='abc'; }
    else if(timeFoto==ClubName().abc){  imageLogo='abc';  }
    else if(timeFoto==ClubName().aguiamaraba){  imageLogo='aguia maraba';  }
    else if(timeFoto==ClubName().anapolina){  imageLogo='anapolina';  }
    else if(timeFoto==ClubName().altos){  imageLogo='altos';  }
    else if(timeFoto==ClubName().asa){  imageLogo='asa';  }
    else if(timeFoto==ClubName().avai){imageLogo='avai';}
    else if(timeFoto==ClubName().americaRJ){imageLogo='americarj';  }
    else if(timeFoto==ClubName().americaRN){imageLogo='americarn';  }
    else if(timeFoto==ClubName().bangu){imageLogo='bangu';  }
    else if(timeFoto==ClubName().boaesporte){imageLogo='boa esporte';  }
    else if(timeFoto==ClubName().boavistaRJ){imageLogo='boavista rj';  }
    else if(timeFoto==ClubName().botafogoPB){imageLogo='botafogo pb';  }
    else if(timeFoto==ClubName().botafogoSP){imageLogo='botafogo sp';  }
    else if(timeFoto==ClubName().brasilPelotas){    imageLogo='brasil pelotas'; }
    else if(timeFoto==ClubName().brasilia){imageLogo='brasilia';  }
    else if(timeFoto==ClubName().brasiliense){imageLogo='brasiliense';  }
    else if(timeFoto==ClubName().brusque){  imageLogo='brusque';  }
    else if(timeFoto==ClubName().campinense){  imageLogo='campinense';  }
    else if(timeFoto==ClubName().cascavel){  imageLogo='cascavel';  }
    else if(timeFoto==ClubName().caxias){  imageLogo='caxias';  }
    else if(timeFoto==ClubName().central){  imageLogo='central';  }
    else if(timeFoto==ClubName().comercial){  imageLogo='comercial';  }
    else if(timeFoto==ClubName().confianca){  imageLogo='confianca';  }
    else if(timeFoto==ClubName().crb){    imageLogo='crb'; }
    else if(timeFoto==ClubName().csa){    imageLogo='csa'; }
    else if(timeFoto==ClubName().ferroviaria){    imageLogo='ferroviaria'; }
    else if(timeFoto==ClubName().gama){    imageLogo='gama'; }
    else if(timeFoto==ClubName().globo){    imageLogo='globo'; }
    else if(timeFoto==ClubName().goytacaz){    imageLogo='goytacaz'; }
    else if(timeFoto==ClubName().gremioNovorizontino){    imageLogo='gremio novorizontino'; }
    else if(timeFoto==ClubName().ibis){    imageLogo='ibis'; }
    else if(timeFoto==ClubName().icasa){    imageLogo='icasa'; }
    else if(timeFoto==ClubName().itabaiana){    imageLogo='itabaiana'; }
    else if(timeFoto==ClubName().ituano){    imageLogo='ituano'; }
    else if(timeFoto==ClubName().interLimeira){  imageLogo='interlimeira';  }
    else if(timeFoto==ClubName().joinville){    imageLogo='joinville'; }
    else if(timeFoto==ClubName().juventusMooca){  imageLogo='juventus mooca';  }
    else if(timeFoto==ClubName().linense){    imageLogo='linense'; }
    else if(timeFoto==ClubName().londrina){    imageLogo='londrina'; }
    else if(timeFoto==ClubName().luverdense){    imageLogo='luverdense'; }
    else if(timeFoto==ClubName().manaus){  imageLogo='manaus';  }
    else if(timeFoto==ClubName().marilia){    imageLogo='marilia'; }
    else if(timeFoto==ClubName().madureira){    imageLogo='madureira'; }
    else if(timeFoto==ClubName().mirassol){imageLogo='mirassol';  }
    else if(timeFoto==ClubName().mixto){imageLogo='mixto';  }
    else if(timeFoto==ClubName().mogimirim){imageLogo='mogi mirim';  }
    else if(timeFoto==ClubName().motoclub){imageLogo='moto club';  }
    else if(timeFoto==ClubName().nacionalSP){    imageLogo='nacionalsp'; }
    else if(timeFoto==ClubName().noroeste){    imageLogo='noroeste'; }
    else if(timeFoto==ClubName().novaiguacu){    imageLogo='nova iguacu'; }
    else if(timeFoto==ClubName().oeste){    imageLogo='oeste'; }
    else if(timeFoto==ClubName().operarioms){    imageLogo='operario ms'; }
    else if(timeFoto==ClubName().operarioPR){    imageLogo='operariopr'; }
    else if(timeFoto==ClubName().palmas){  imageLogo='palmas';  }
    else if(timeFoto==ClubName().paysandu){  imageLogo='paysandu';  }
    else if(timeFoto==ClubName().paulista){imageLogo='paulista';  }
    else if(timeFoto==ClubName().portuguesa){ imageLogo='portuguesa';  }
    else if(timeFoto==ClubName().portuguesaRJ){ imageLogo='portuguesa rj';  }
    else if(timeFoto==ClubName().portuguesasantista){ imageLogo='portuguesa santista';  }
    else if(timeFoto==ClubName().remo){    imageLogo='remo'; }
    else if(timeFoto==ClubName().resende){    imageLogo='resende'; }
    else if(timeFoto==ClubName().riverPI){    imageLogo='river pi'; }
    else if(timeFoto==ClubName().riobrancoAC){    imageLogo='rio branco'; }
    else if(timeFoto==ClubName().salgueiro){    imageLogo='salgueiro'; }
    else if(timeFoto==ClubName().santacruz){imageLogo='santacruz';  }
    else if(timeFoto==ClubName().sampaio){    imageLogo='sampaio'; }
    else if(timeFoto==ClubName().santoandre){imageLogo='santo andre';  }
    else if(timeFoto==ClubName().saobernardo){imageLogo='sao bernardo';  }
    else if(timeFoto==ClubName().saocaetano){imageLogo='sao caetano';  }
    else if(timeFoto==ClubName().saojose){imageLogo='sao jose';  }
    else if(timeFoto==ClubName().saoraimundo){imageLogo='sao raimundo';  }
    else if(timeFoto==ClubName().sergipe){imageLogo='sergipe';  }
    else if(timeFoto==ClubName().sousa){imageLogo='sousa';  }
    else if(timeFoto==ClubName().sobradinho){imageLogo='sobradinho';  }
    else if(timeFoto==ClubName().taubate){imageLogo='taubate';  }
    else if(timeFoto==ClubName().tocantinopolis){imageLogo='tocantinopolis';  }
    else if(timeFoto==ClubName().tombense){imageLogo='tombense';  }
    else if(timeFoto==ClubName().tunaluso){imageLogo='tunaluso';  }
    else if(timeFoto==ClubName().treze){imageLogo='treze';  }
    else if(timeFoto==ClubName().tupi){imageLogo='tupi';  }
    else if(timeFoto==ClubName().uberlandia){imageLogo='uberlandia';  }
    else if(timeFoto==ClubName().urt){imageLogo='urt';  }
    else if(timeFoto==ClubName().vilanova){  imageLogo='vila nova';  }
    else if(timeFoto==ClubName().voltaredonda){imageLogo='volta redonda';  }
    else if(timeFoto==ClubName().xvpiracicaba){imageLogo='xv';  }
    else if(timeFoto==ClubName().ypirangaRS){imageLogo='ypiranga';  }


    ///////////////////////////////////////////////
    //ARGENTINA
    else if(timeFoto==ClubName().aldosivi){    imageLogo='aldosivi';     }
    else if(timeFoto==ClubName().allboys){    imageLogo='allboys';     }
    else if(timeFoto==ClubName().almagro){    imageLogo='almagro';     }
    else if(timeFoto==ClubName().argentinojuniors){       imageLogo='argentinosjr';}
    else if(timeFoto==ClubName().atleticoTucuman){    imageLogo='atletico tucuman'; }
    else if(timeFoto==ClubName().arsenalsarandi){    imageLogo='sarandi';     }
    else if(timeFoto==ClubName().banfield){    imageLogo='banfield';      }
    else if(timeFoto==ClubName().belgrano){    imageLogo='belgrano';      }
    else if(timeFoto==ClubName().bocajuniors){       imageLogo='bocajuniors';}
    else if(timeFoto==ClubName().chacarita){    imageLogo='chacarita';      }
    else if(timeFoto==ClubName().centralCordoba){    imageLogo='central cordoba';      }
    else if(timeFoto==ClubName().colon){imageLogo='colon';}
    else if(timeFoto==ClubName().defensayjusticia){imageLogo='defensa';}
    else if(timeFoto==ClubName().estudiantes){    imageLogo='estudiantes';}
    else if(timeFoto==ClubName().ferro){imageLogo='ferro';}
    else if(timeFoto==ClubName().godoycruz){    imageLogo='godoy cruz'; }
    else if(timeFoto==ClubName().independiente){ imageLogo='independiente';}
    else if(timeFoto==ClubName().huracan){     imageLogo='huracan'; }
    else if(timeFoto==ClubName().lanus){       imageLogo='lanus'; }
    else if(timeFoto==ClubName().newells){ imageLogo='newells';  }
    else if(timeFoto==ClubName().nuevachicago){ imageLogo='nueva chicago';  }
    else if(timeFoto==ClubName().patronato){    imageLogo='patronato'; }
    else if(timeFoto==ClubName().platense){    imageLogo='platense'; }
    else if(timeFoto==ClubName().quilmes){    imageLogo='quilmes'; }
    else if(timeFoto==ClubName().racing){       imageLogo='racing'; }
    else if(timeFoto==ClubName().riverplate){    imageLogo='riverplate';  }
    else if(timeFoto==ClubName().rosariocentral){  imageLogo='rosariocentral';  }
    else if(timeFoto==ClubName().sanlorenzo){  imageLogo='sanlorenzo';  }
    else if(timeFoto==ClubName().sarmiento){  imageLogo='sarmiento';  }
    else if(timeFoto==ClubName().talleres){      imageLogo='talleres';  }
    else if(timeFoto==ClubName().temperley){      imageLogo='temperley';  }
    else if(timeFoto==ClubName().gimnasia){    imageLogo='gimnasia'; }
    else if(timeFoto==ClubName().sanmartin){    imageLogo='san martin'; }
    else if(timeFoto==ClubName().tigre){    imageLogo='tigre'; }
    else if(timeFoto==ClubName().unionSantaFe){    imageLogo='union santa fe'; }
    else if(timeFoto==ClubName().velezsarsfield){    imageLogo='velez'; }

    //AMÉRICA DO SUL
    else if(timeFoto==ClubName().penarol){       imageLogo='penarol';}
    else if(timeFoto==ClubName().nacional){    imageLogo='nacional';     }
    else if(timeFoto==ClubName().montevideo){ imageLogo='montevideo';  }
    else if(timeFoto==ClubName().danubio){ imageLogo='danubio';  }
    else if(timeFoto==ClubName().defensor){ imageLogo='defensor';  }
    else if(timeFoto==ClubName().liverpoolURU){ imageLogo='liverpool uru';  }
    else if(timeFoto==ClubName().fenix){ imageLogo='fenix';  }
    else if(timeFoto==ClubName().plazacolonia){ imageLogo='plaza colonia';  }
    else if(timeFoto==ClubName().rentistas){ imageLogo='rentistas';  }
    else if(timeFoto==ClubName().riverURU){ imageLogo='river uru';  }
    else if(timeFoto==ClubName().wanderers){ imageLogo='wanderers';  }

    else if(timeFoto==ClubName().olimpia){    imageLogo='olimpia';      }
    else if(timeFoto==ClubName().cerroporteno){       imageLogo='cerro';}
    else if(timeFoto==ClubName().libertad){imageLogo='libertad';}
    else if(timeFoto==ClubName().guaraniPAR){ imageLogo='guarani paraguai';  }
    else if(timeFoto==ClubName().nacionalPAR){ imageLogo='nacional paraguai';  }
    else if(timeFoto==ClubName().colegiales){imageLogo='colegiales';}
    else if(timeFoto==ClubName().octubre){ imageLogo='12 de octubre';  }
    else if(timeFoto==ClubName().soldeamerica){ imageLogo='sol de america';  }
    else if(timeFoto==ClubName().luqueno){imageLogo='luqueno';}
    else if(timeFoto==ClubName().tacuary){imageLogo='tacuary';}

    else if(timeFoto==ClubName().colocolo){    imageLogo='colocolo';}
    else if(timeFoto==ClubName().lau){ imageLogo='lau';}
    else if(timeFoto==ClubName().audax){ imageLogo='audax';  }
    else if(timeFoto==ClubName().cobreloa){ imageLogo='cobreloa';}
    else if(timeFoto==ClubName().cobresal){ imageLogo='cobresal';}
    else if(timeFoto==ClubName().coquimbo){ imageLogo='coquimbo';  }
    else if(timeFoto==ClubName().curico){ imageLogo='curico';  }
    else if(timeFoto==ClubName().evertonchi){ imageLogo='everton chile';  }
    else if(timeFoto==ClubName().huachipato){ imageLogo='huachipato';  }
    else if(timeFoto==ClubName().iquique){ imageLogo='iquique';  }
    else if(timeFoto==ClubName().laCalera){ imageLogo='la calera';  }
    else if(timeFoto==ClubName().laserena){ imageLogo='la serena';  }
    else if(timeFoto==ClubName().nublense){ imageLogo='nublense';  }
    else if(timeFoto==ClubName().ohiggins){ imageLogo='ohiggins';  }
    else if(timeFoto==ClubName().palestino){ imageLogo='palestino';  }
    else if(timeFoto==ClubName().santiagowanderers){ imageLogo='santiago wanderers';  }
    else if(timeFoto==ClubName().unionespanola){ imageLogo='union';  }
    else if(timeFoto==ClubName().univcatolica){     imageLogo='universidadcatolica'; }
    //BOLIVIA
    else if(timeFoto==ClubName().aurora){ imageLogo='aurora';  }
    else if(timeFoto==ClubName().blooming){       imageLogo='blooming'; }
    else if(timeFoto==ClubName().bolivar){       imageLogo='bolivar'; }
    else if(timeFoto==ClubName().alwaysReady){ imageLogo='always ready';  }
    else if(timeFoto==ClubName().guabira){ imageLogo='guabira';  }
    else if(timeFoto==ClubName().indPetrolero){ imageLogo='ind petrolero';  }
    else if(timeFoto==ClubName().nacionalpotosi){ imageLogo='nacional potosi';  }
    else if(timeFoto==ClubName().palmaflor){ imageLogo='palmaflor';  }
    else if(timeFoto==ClubName().orientePetrolero){ imageLogo='oriente';  }
    else if(timeFoto==ClubName().realsantacruz){ imageLogo='real santa cruz';  }
    else if(timeFoto==ClubName().royalpari){ imageLogo='royal pari';  }
    else if(timeFoto==ClubName().sanJoseBOL){ imageLogo='san jose';  }
    else if(timeFoto==ClubName().theStrongest){ imageLogo='the strongest';  }
    else if(timeFoto==ClubName().sucre){ imageLogo='sucre';  }
    //PERU
    else if(timeFoto==ClubName().alianzalima){ imageLogo='alianzalima';  }
    else if(timeFoto==ClubName().binacional){    imageLogo='binacional';  }
    else if(timeFoto==ClubName().cesarvallejo){    imageLogo='cesar vallejo';  }
    else if(timeFoto==ClubName().carlosmanucci){    imageLogo='carlos manucci';  }
    else if(timeFoto==ClubName().cienciano){    imageLogo='cienciano';  }
    else if(timeFoto==ClubName().cusco){    imageLogo='cusco';  }
    else if(timeFoto==ClubName().depmunicipal){ imageLogo='depmunicipal';  }
    else if(timeFoto==ClubName().jorge){ imageLogo='jorge';  }
    else if(timeFoto==ClubName().melgar){ imageLogo='melgar';  }
    else if(timeFoto==ClubName().universitario){ imageLogo='universitario';  }
    else if(timeFoto==ClubName().sportingcristal){       imageLogo='sportingcristal'; }
    else if(timeFoto==ClubName().sportboys){ imageLogo='sport boys';  }
    //EQUADOR
    else if(timeFoto==ClubName().barcelonaequ){  imageLogo='barcelonaequ';  }
    else if(timeFoto==ClubName().emelec){  imageLogo='emelec';  }
    else if(timeFoto==ClubName().ldu){      imageLogo='ldu';  }
    else if(timeFoto==ClubName().delfin){ imageLogo='delfin';}
    else if(timeFoto==ClubName().idelvalle){ imageLogo='delvalle';  }
    else if(timeFoto==ClubName().depcuenca){ imageLogo='depcuenca';}
    else if(timeFoto==ClubName().depquito){ imageLogo='depquito';}
    else if(timeFoto==ClubName().elnacional){ imageLogo='el nacional';}
    else if(timeFoto==ClubName().uniequ){ imageLogo='uniequ';}
    //COLOMBIA
    else if(timeFoto==ClubName().rioNegroAguilas){       imageLogo='aguilas';}
    else if(timeFoto==ClubName().alianzaPetrolera){       imageLogo='alianza petrolera';}
    else if(timeFoto==ClubName().americadecali){       imageLogo='americacali';}
    else if(timeFoto==ClubName().atleticonacional){    imageLogo='atleticonacional';     }
    else if(timeFoto==ClubName().bucaramanga){ imageLogo='bucaramanga';  }
    else if(timeFoto==ClubName().cucuta){ imageLogo='cucuta';  }
    else if(timeFoto==ClubName().deportivocali){    imageLogo='deportivocali';      }
    else if(timeFoto==ClubName().envigado){       imageLogo='envigado';}
    else if(timeFoto==ClubName().imedellin){imageLogo='medellin';}
    else if(timeFoto==ClubName().junior){       imageLogo='junior';}
    else if(timeFoto==ClubName().laequidad){ imageLogo='la equidad';  }
    else if(timeFoto==ClubName().millonarios){ imageLogo='millonarios';}
    else if(timeFoto==ClubName().oncecaldas){    imageLogo='oncecaldas';}
    else if(timeFoto==ClubName().patriotas){    imageLogo='patriotas';}
    else if(timeFoto==ClubName().santafe){     imageLogo='santafe'; }
    else if(timeFoto==ClubName().tolima){ imageLogo='tolima';  }
    //VENEZUELA
    else if(timeFoto==ClubName().carabobo){    imageLogo='carabobo'; }
    else if(timeFoto==ClubName().caracas){    imageLogo='caracas'; }
    else if(timeFoto==ClubName().laGuaira){ imageLogo='la guaira';  }
    else if(timeFoto==ClubName().deportivoTachira){ imageLogo='deportivo tachira';  }
    else if(timeFoto==ClubName().estudiantesmerida){ imageLogo='estudiantes merida';  }
    else if(timeFoto==ClubName().deplara){    imageLogo='deplara'; }
    else if(timeFoto==ClubName().mineros){    imageLogo='mineros'; }
    else if(timeFoto==ClubName().minerven){    imageLogo='minerven'; }
    else if(timeFoto==ClubName().monagas){    imageLogo='monagas'; }
    else if(timeFoto==ClubName().portuguesaven){    imageLogo='portuguesa ven'; }
    else if(timeFoto==ClubName().trujillanos){    imageLogo='trujillanos'; }
    else if(timeFoto==ClubName().zamora){    imageLogo='zamora'; }
    else if(timeFoto==ClubName().zulia){    imageLogo='zulia'; }

    ///////////////////////////////////////////////////////////////////////////
    //MÉXICO
    else if(timeFoto==ClubName().atlante){       imageLogo='atlante'; }
    else if(timeFoto==ClubName().atlas){    imageLogo='atlas'; }
    else if(timeFoto==ClubName().americamex){       imageLogo='americamx'; }
    else if(timeFoto==ClubName().chivasguadalajara){ imageLogo='chivas';  }
    else if(timeFoto==ClubName().cruzazul){       imageLogo='cruzazul'; }
    else if(timeFoto==ClubName().jaguares){    imageLogo='jaguares'; }
    else if(timeFoto==ClubName().juarez){    imageLogo='juarez'; }
    else if(timeFoto==ClubName().leon){    imageLogo='leon'; }
    else if(timeFoto==ClubName().leonesNegros){    imageLogo='leones negros'; }
    else if(timeFoto==ClubName().mazatlan){    imageLogo='mazatlan';  }
    else if(timeFoto==ClubName().monterrey){    imageLogo='monterrey';  }
    else if(timeFoto==ClubName().morelia){    imageLogo='morelia'; }
    else if(timeFoto==ClubName().necaxa){    imageLogo='necaxa'; }
    else if(timeFoto==ClubName().pachuca){  imageLogo='pachuca';  }
    else if(timeFoto==ClubName().puebla){    imageLogo='puebla'; }
    else if(timeFoto==ClubName().pumas){  imageLogo='pumas';  }
    else if(timeFoto==ClubName().queretaro){    imageLogo='queretaro'; }
    else if(timeFoto==ClubName().tigres){      imageLogo='tigres';  }
    else if(timeFoto==ClubName().toluca){    imageLogo='toluca'; }
    else if(timeFoto==ClubName().tijuana){    imageLogo='tijuana'; }
    else if(timeFoto==ClubName().sanluis){    imageLogo='san luis'; }
    else if(timeFoto==ClubName().santosLaguna){    imageLogo='santos laguna'; }

    else if(timeFoto==ClubName().atlanta){       imageLogo='atlanta';}
    else if(timeFoto==ClubName().austin){       imageLogo='austin';}
    else if(timeFoto==ClubName().cincinnati){       imageLogo='cincinnati';}
    else if(timeFoto==ClubName().charlotte){       imageLogo='charlotte';}
    else if(timeFoto==ClubName().chicago){       imageLogo='chicago';}
    else if(timeFoto==ClubName().columbuscrew){       imageLogo='columbus';}
    else if(timeFoto==ClubName().colorado){       imageLogo='colorado';}
    else if(timeFoto==ClubName().dcunited){    imageLogo='dcunited';}
    else if(timeFoto==ClubName().fcdallas){ imageLogo='dallas';}
    else if(timeFoto==ClubName().houston){    imageLogo='houston';}
    else if(timeFoto==ClubName().lagalaxy){    imageLogo='la';  }
    else if(timeFoto==ClubName().losangelesfc){ imageLogo='lafc';  }
    else if(timeFoto==ClubName().minnesota){    imageLogo='minnesota';     }
    else if(timeFoto==ClubName().montreal){    imageLogo='montreal';  }
    else if(timeFoto==ClubName().nashville){    imageLogo='nashville';  }
    else if(timeFoto==ClubName().nerevolution){       imageLogo='nerevolution'; }
    else if(timeFoto==ClubName().nycity){  imageLogo='nycity';  }
    else if(timeFoto==ClubName().nyredbulls){    imageLogo='nyredbull';      }
    else if(timeFoto==ClubName().orlando){     imageLogo='orlando'; }
    else if(timeFoto==ClubName().portland){       imageLogo='portland'; }
    else if(timeFoto==ClubName().seattle){    imageLogo='seattle'; }
    else if(timeFoto==ClubName().intermiami){  imageLogo='miami';  }
    else if(timeFoto==ClubName().philadelphia){      imageLogo='philadelphia';  }
    else if(timeFoto==ClubName().torontofc){      imageLogo='toronto';  }
    else if(timeFoto==ClubName().realSaltLake){ imageLogo='real salt lake';  }
    else if(timeFoto==ClubName().sanJoseEarthquakes){ imageLogo='san jose earthquakes';  }
    else if(timeFoto==ClubName().sportingKansasCity){ imageLogo='sporting kansas';  }
    else if(timeFoto==ClubName().vancouver){ imageLogo='vancouver';  }

    //CANADA
    else if(timeFoto==ClubName().cavalry){ imageLogo='cavalry';  }
    else if(timeFoto==ClubName().forge){ imageLogo='forge';  }

    //COSTA RICA
    else if(timeFoto==ClubName().saprissa){ imageLogo='saprissa';  }
    else if(timeFoto==ClubName().alajuelense){ imageLogo='alajuelense';  }
    else if(timeFoto==ClubName().herediano){ imageLogo='herediano';  }
    else if(timeFoto==ClubName().cartagines){ imageLogo='cartagines';  }
    else if(timeFoto==ClubName().sanCarlos){ imageLogo='san carlos';  }
    else if(timeFoto==ClubName().sptSanJose){ imageLogo='spt san jose';  }
    //EL SALVADOR
    else if(timeFoto==ClubName().aguila){ imageLogo='aguila';  }
    //HONDURAS
    else if(timeFoto==ClubName().olimpiaHON){ imageLogo='olimpia honduras';  }
    else if(timeFoto==ClubName().rcdespana){ imageLogo='rcd espana';  }
    else if(timeFoto==ClubName().motagua){ imageLogo='motagua';  }
    else if(timeFoto==ClubName().marathon){ imageLogo='marathon';  }
    //GUATEMALA
    else if(timeFoto==ClubName().antiguaGuatemala){ imageLogo='antigua';  }
    else if(timeFoto==ClubName().comunicaciones){ imageLogo='comunicaciones';  }
    else if(timeFoto==ClubName().municipal){ imageLogo='municipal';  }
    else if(timeFoto==ClubName().xelaju){ imageLogo='xelaju';  }
    //NICARAGUA
    else if(timeFoto==ClubName().realEsteli){ imageLogo='real esteli';  }
    else if(timeFoto==ClubName().managua){ imageLogo='managua';  }
    else if(timeFoto==ClubName().diriangen){ imageLogo='diriangen';  }
    //PANAMA
    else if(timeFoto==ClubName().alianzaPAN){ imageLogo='alianza panama';  }
    else if(timeFoto==ClubName().arabeunido){ imageLogo='arabe unido';  }
    else if(timeFoto==ClubName().independienteChorrera){ imageLogo='independiente chorrera';  }
    else if(timeFoto==ClubName().plazaAmador){ imageLogo='plaza amador';  }
    else if(timeFoto==ClubName().tauro){ imageLogo='tauro';  }
    //CUBA
    else if(timeFoto==ClubName().pinardelrio){ imageLogo='pinar del rio';  }
    else if(timeFoto==ClubName().santiagoCuba){ imageLogo='santiago cuba';  }
    else if(timeFoto==ClubName().villaclara){ imageLogo='villa clara';  }
    //JAMAICA
    else if(timeFoto==ClubName().portmore){ imageLogo='portmore';  }
    else if(timeFoto==ClubName().waterhouse){ imageLogo='waterhouse';  }
    //HAITI
    else if(timeFoto==ClubName().arcahaie){ imageLogo='arcahaie';  }
    else if(timeFoto==ClubName().donBosco){ imageLogo='don bosco';  }
    else if(timeFoto==ClubName().fica){ imageLogo='fica';  }
    else if(timeFoto==ClubName().violette){ imageLogo='violette haiti';  }
    //SURINAME
    else if(timeFoto==ClubName().robinhood){ imageLogo='robinhood';  }
    else if(timeFoto==ClubName().transvaal){ imageLogo='transvaal';  }
    //TRINIDAD TOBAGO
    else if(timeFoto==ClubName().defenseforce){ imageLogo='defense force';  }
    else if(timeFoto==ClubName().police){ imageLogo='police';  }

    //////////////////////////////////////////////////////////////////////////////////
    if(timeFoto==ClubName().ghuangzhou){       imageLogo='ghuangzhou';}
    else if(timeFoto==ClubName().beijingguoan){    imageLogo='beijing';     }
    else if(timeFoto==ClubName().dalian){    imageLogo='dalian';     }
    else if(timeFoto==ClubName().henan){    imageLogo='henan';     }
    else if(timeFoto==ClubName().nantong){    imageLogo='nantong';     }
    else if(timeFoto==ClubName().shandong){    imageLogo='shandong_luneng';      }
    else if(timeFoto==ClubName().shanghaisipg){       imageLogo='shanghai';}
    else if(timeFoto==ClubName().shanghaishenhua){       imageLogo='shanghai shenhua';}
    else if(timeFoto==ClubName().tianjin){    imageLogo='tianjin';     }
    else if(timeFoto==ClubName().wuhan){       imageLogo='wuhan';}
    else if(timeFoto==ClubName().zhejiang){       imageLogo='zhejiang';}

    //JAPAN
    else if(timeFoto==ClubName().albirex){ imageLogo='albirex';}
    else if(timeFoto==ClubName().avispa){ imageLogo='avispa';}
    else if(timeFoto==ClubName().cerezoOsaka){ imageLogo='cerezo osaka';}
    else if(timeFoto==ClubName().gambaOsaka){ imageLogo='gamba osaka';}
    else if(timeFoto==ClubName().fcTokyo){ imageLogo='fc tokyo';}
    else if(timeFoto==ClubName().hiroshima){ imageLogo='hiroshima';}
    else if(timeFoto==ClubName().jubiloiwata){ imageLogo='jubilo iwata';}
    else if(timeFoto==ClubName().kashimaantlers){imageLogo='kashima';}
    else if(timeFoto==ClubName().kashiwaReysol){ imageLogo='kashiwa reysol';}
    else if(timeFoto==ClubName().kyoto){ imageLogo='kyoto';}
    else if(timeFoto==ClubName().kawasakifrontale){       imageLogo='kawasaki_frontale'; }
    else if(timeFoto==ClubName().nagoya){ imageLogo='nagoya';}
    else if(timeFoto==ClubName().sagantosu){ imageLogo='sagan';}
    else if(timeFoto==ClubName().sapporo){ imageLogo='sapporo';}
    else if(timeFoto==ClubName().shonanbellmare){ imageLogo='shonan';}
    else if(timeFoto==ClubName().urawareddiamonds){    imageLogo='urawa';}
    else if(timeFoto==ClubName().vegaltaSendai){     imageLogo='vegalta'; }
    else if(timeFoto==ClubName().visselkobe){     imageLogo='vissel_kobe'; }
    else if(timeFoto==ClubName().yokohamaFC){ imageLogo='yokohama fc';}
    else if(timeFoto==ClubName().yokohamamarinos){ imageLogo='yokohama';}
    //SOUTH KOREA
    else if(timeFoto==ClubName().busan){    imageLogo='busan'; }
    else if(timeFoto==ClubName().daegu){    imageLogo='daegu'; }
    else if(timeFoto==ClubName().jeonbuk){    imageLogo='jeonbuk'; }
    else if(timeFoto==ClubName().jeju){ imageLogo='jeju';}
    else if(timeFoto==ClubName().gimcheon){ imageLogo='gimcheon';}
    else if(timeFoto==ClubName().incheon){ imageLogo='incheon';}
    else if(timeFoto==ClubName().fcseoul){ imageLogo='fc seoul';}
    else if(timeFoto==ClubName().gangwon){ imageLogo='gangwon';}
    else if(timeFoto==ClubName().pohang){      imageLogo='pohang';  }
    else if(timeFoto==ClubName().seongnam){      imageLogo='seongnam';  }
    else if(timeFoto==ClubName().suwonsamsung){ imageLogo='suwon samsung';}
    else if(timeFoto==ClubName().ulsan){ imageLogo='ulsan';}

    //SOUTH ARABIA
    else if(timeFoto==ClubName().alahly){  imageLogo='al_ahly';  }
    else if(timeFoto==ClubName().alettifaq){ imageLogo='al ettifaq';}
    else if(timeFoto==ClubName().alhilal){  imageLogo='al_hilal';  }
    else if(timeFoto==ClubName().alfateh){ imageLogo='al fateh';}
    else if(timeFoto==ClubName().alIttihad){ imageLogo='al ittihad';}
    else if(timeFoto==ClubName().alnassr){      imageLogo='al_nassr';  }
    else if(timeFoto==ClubName().alraed){ imageLogo='al raed';}
    else if(timeFoto==ClubName().alShabab){ imageLogo='al shabab';}
    else if(timeFoto==ClubName().altaawoun){ imageLogo='al taawoun';}
    else if(timeFoto==ClubName().damac){ imageLogo='damac';}
    //QATAR
    else if(timeFoto==ClubName().alarabi){    imageLogo='al arabi';  }
    else if(timeFoto==ClubName().alduhail){    imageLogo='duhail';  }
    else if(timeFoto==ClubName().alrayyan){    imageLogo='al rayyan';  }
    else if(timeFoto==ClubName().alsadd){       imageLogo='sadd'; }
    //EAU
    else if(timeFoto==ClubName().ajman){ imageLogo='ajman';  }
    else if(timeFoto==ClubName().alain){ imageLogo='al_ain';  }
    else if(timeFoto==ClubName().aljazira){      imageLogo='al_jazira';  }
    else if(timeFoto==ClubName().alnasrdubai){ imageLogo='al nasr';  }
    else if(timeFoto==ClubName().alsharjah){ imageLogo='al sharjah';}
    else if(timeFoto==ClubName().alWahda){ imageLogo='al wahda';}
    else if(timeFoto==ClubName().alwasl){ imageLogo='al wasl';}
    else if(timeFoto==ClubName().baniyas){ imageLogo='baniyas';}
    else if(timeFoto==ClubName().shababalahli){ imageLogo='shabab al ahli';}
    //BAHREIN
    else if(timeFoto==ClubName().alhidd){ imageLogo='al hidd';}
    else if(timeFoto==ClubName().alMuharraq){ imageLogo='al muharraq';}
    else if(timeFoto==ClubName().alRiffa){ imageLogo='al riffa';}
    else if(timeFoto==ClubName().manama){ imageLogo='manama';}
    //PHILLIPINES
    else if(timeFoto==ClubName().maharlikaManila){ imageLogo='manila';}
    else if(timeFoto==ClubName().unitedCity){ imageLogo='united city';}
    //TAILANDIA
    else if(timeFoto==ClubName().buriram){ imageLogo='buriram united';}
    else if(timeFoto==ClubName().bangkok){ imageLogo='bangkok';}
    else if(timeFoto==ClubName().pathum){ imageLogo='pathum';}
    else if(timeFoto==ClubName().policeTero){ imageLogo='police tero';}
    //INDIA
    else if(timeFoto==ClubName().bengaluru){ imageLogo='bengaluru';}
    else if(timeFoto==ClubName().chennaiyin){ imageLogo='chennaiyin';}
    else if(timeFoto==ClubName().eastBengal){ imageLogo='east bengal';}
    else if(timeFoto==ClubName().hyderabad){ imageLogo='hyderabad';}
    else if(timeFoto==ClubName().goa){ imageLogo='goa';}
    else if(timeFoto==ClubName().kerala){ imageLogo='kerala blasters';}
    else if(timeFoto==ClubName().mohunBagan){ imageLogo='mohun bagan';}
    else if(timeFoto==ClubName().mumbai){ imageLogo='mumbai';}
    else if(timeFoto==ClubName().northeast){ imageLogo='northeast';}
    else if(timeFoto==ClubName().odisha){ imageLogo='odisha';}

    //BRUNEI
    else if(timeFoto==ClubName().brunei){ imageLogo='brunei';}
    //INDONESIA
    else if(timeFoto==ClubName().bali){ imageLogo='bali';}
    else if(timeFoto==ClubName().persipura){ imageLogo='persipura';}
    else if(timeFoto==ClubName().persib){ imageLogo='persib';}
    else if(timeFoto==ClubName().persebaya){ imageLogo='persebaya';}
    //IRA
    else if(timeFoto==ClubName().persepolis){      imageLogo='persepolis';  }
    else if(timeFoto==ClubName().esteghlal){      imageLogo='esteghlal';  }
    else if(timeFoto==ClubName().sepahan){      imageLogo='sepahan';  }
    //IRAQUE
    else if(timeFoto==ClubName().alzawraa){      imageLogo='al zawraa';  }
    else if(timeFoto==ClubName().alQuwaAlJawiya){      imageLogo='al quwa';  }
    //OUTROS
    else if(timeFoto==ClubName().pakhtakor){ imageLogo='pakhtakor';}//UZBEQUISTAO
    else if(timeFoto==ClubName().phnomPenhCrown){ imageLogo='phnom penh';}//CAMBOJA
    else if(timeFoto==ClubName().alKuwait){ imageLogo='al kuwait';}//KUWAIT
    else if(timeFoto==ClubName().machhindra){ imageLogo='machhindra';}//NEPAL
    else if(timeFoto==ClubName().hanoi){ imageLogo='hanoi';}//VIETNA
    //LEBANON
    else if(timeFoto==ClubName().alAhed){ imageLogo='al ahed';}
    else if(timeFoto==ClubName().alAnsar){ imageLogo='al ansar';}
    else if(timeFoto==ClubName().nejmeh){ imageLogo='nejmeh';}
    //MALASYA
    else if(timeFoto==ClubName().johorDarul){ imageLogo='johor';}
    else if(timeFoto==ClubName().kualaLumpur){ imageLogo='kuala lumpur';}
    else if(timeFoto==ClubName().selangor){ imageLogo='selangor';}
    //MONGOLIA
    else if(timeFoto==ClubName().athletic220){ imageLogo='athletic 220';}
    else if(timeFoto==ClubName().erchim){ imageLogo='erchim';}
    else if(timeFoto==ClubName().khoromkhon){ imageLogo='khoromkhon';}
    else if(timeFoto==ClubName().ulaanbaatar){ imageLogo='ulaanbaatar city';}
    //SIRIA
    else if(timeFoto==ClubName().alJaish){ imageLogo='al jaish';}
    else if(timeFoto==ClubName().tishreen){ imageLogo='tishreen';}



    //OCENIA
    else if(timeFoto==ClubName().auckland){ imageLogo='auckland';}
    else if(timeFoto==ClubName().wellingtonphoenix){ imageLogo='wellington phoenix';}

    else if(timeFoto==ClubName().adelaide){ imageLogo='adelaide';}
    else if(timeFoto==ClubName().brisbane){ imageLogo='brisbane';}
    else if(timeFoto==ClubName().centralcoast){ imageLogo='central coast';}
    else if(timeFoto==ClubName().melbournecity){ imageLogo='melbournecity';}
    else if(timeFoto==ClubName().newcastlejets){ imageLogo='newcastlejets';}
    else if(timeFoto==ClubName().melbournevictory){ imageLogo='melbourne victory';}
    else if(timeFoto==ClubName().perth){ imageLogo='perth';}
    else if(timeFoto==ClubName().sydney){ imageLogo='sydney';}
    else if(timeFoto==ClubName().sydneywanderers){ imageLogo='sydney wanderers';}
    else if(timeFoto==ClubName().westernunited){ imageLogo='western';}

    //AFRICA
    //EGITO
    else if(timeFoto==ClubName().alahli){  imageLogo='al_ahli';  }
    else if(timeFoto==ClubName().almasry){ imageLogo='al masry';}
    else if(timeFoto==ClubName().cleopatra){ imageLogo='cleopatra';}
    else if(timeFoto==ClubName().ismaily){ imageLogo='ismaily';}
    else if(timeFoto==ClubName().pyramids){ imageLogo='pyramids';}
    else if(timeFoto==ClubName().zamalek){ imageLogo='zamalek';}
    //ALGERIA
    else if(timeFoto==ClubName().belouizdad){ imageLogo='belouizdad';}
    else if(timeFoto==ClubName().essetif){ imageLogo='es setif';}
    else if(timeFoto==ClubName().kabylie){ imageLogo='kabylie';}
    else if(timeFoto==ClubName().usmAlger){ imageLogo='usm alger';}
    //LYBIA
    else if(timeFoto==ClubName().alIttihadLIB){ imageLogo='al ittihad libya';}
    else if(timeFoto==ClubName().benghazi){ imageLogo='benghazi';}
    //MARROCOS
    else if(timeFoto==ClubName().rajacasablanca){ imageLogo='raja';  }
    else if(timeFoto==ClubName().wydad){ imageLogo='wydad';}
    else if(timeFoto==ClubName().farRabat){ imageLogo='far rabat';}
    else if(timeFoto==ClubName().maghreb){ imageLogo='maghreb';}
    //SUDAN
    else if(timeFoto==ClubName().omdurman){ imageLogo='omdurman';}
    else if(timeFoto==ClubName().almerrikh){ imageLogo='al merrikh';}
    //TUNISIA
    else if(timeFoto==ClubName().clubAfricain){ imageLogo='club africain';}
    else if(timeFoto==ClubName().esperance){ imageLogo='esperance';}
    else if(timeFoto==ClubName().etoilesahel){ imageLogo='etoile sahel';}
    else if(timeFoto==ClubName().sfaxien){ imageLogo='sfaxien';}

    /////////////////////////////////////////
    //AFRICA DO SUL
    else if(timeFoto==ClubName().amazulu){ imageLogo='amazulu';}
    else if(timeFoto==ClubName().capetown){ imageLogo='cape town';}
    else if(timeFoto==ClubName().goldenarrows){ imageLogo='golden arrows';}
    else if(timeFoto==ClubName().kaizer){ imageLogo='kaizer chiefs';}
    else if(timeFoto==ClubName().mamelodi){ imageLogo='mamelodi sundowns';}
    else if(timeFoto==ClubName().maritzburg){ imageLogo='maritzburg';}
    else if(timeFoto==ClubName().orlandopirates){ imageLogo='orlando pirates';}
    //ANGOLA
    else if(timeFoto==ClubName().agosto){ imageLogo='1 de agosto';}
    else if(timeFoto==ClubName().petroluanda){ imageLogo='petro luanda';}
    else if(timeFoto==ClubName().sagradaesperanca){ imageLogo='sagrada esperanca';}
    else if(timeFoto==ClubName().sptCabinda){ imageLogo='sporting';}
    //BOTSWANA
    else if(timeFoto==ClubName().gaborone){ imageLogo='gaborone';}
    //CAMEROON
    else if(timeFoto==ClubName().canonYaounde){ imageLogo='canon yaounde';}
    else if(timeFoto==ClubName().cotonsport){ imageLogo='cotonsport';}
    else if(timeFoto==ClubName().douala){ imageLogo='douala';}
    //CAPE VERDE
    else if(timeFoto==ClubName().mindelense){ imageLogo='mindelense';}
    else if(timeFoto==ClubName().sptClubePraia){ imageLogo='spt clube praia';}
    //CONGO
    else if(timeFoto==ClubName().mazembe){ imageLogo='mazembe';}
    else if(timeFoto==ClubName().vita){ imageLogo='vita';}
    //ETHIOPIA
    else if(timeFoto==ClubName().fasil){ imageLogo='fasil kenema';}
    else if(timeFoto==ClubName().stGeorge){ imageLogo='st george';}
    //IVORY COAST
    else if(timeFoto==ClubName().asecmimosas){ imageLogo='asec mimosas';}
    //GHANA
    else if(timeFoto==ClubName().asantekotoko){ imageLogo='asante kotoko';}
    else if(timeFoto==ClubName().heartsoak){ imageLogo='hearts oak';}
    //GUINEA
    else if(timeFoto==ClubName().hafia){ imageLogo='hafia guinea';}
    else if(timeFoto==ClubName().horoya){ imageLogo='horoya';}
    //KENYA
    else if(timeFoto==ClubName().gorMahia){ imageLogo='gor mahia';}
    else if(timeFoto==ClubName().mathare){ imageLogo='mathare';}
    else if(timeFoto==ClubName().tusker){ imageLogo='tusker';}
    else if(timeFoto==ClubName().ulinzi){ imageLogo='ulinzi';}
    //MADAGASCAR
    else if(timeFoto==ClubName().adema){ imageLogo='adema';}
    else if(timeFoto==ClubName().cnapsSport){ imageLogo='cnaps sport';}
    //MOZAMBIQUE
    else if(timeFoto==ClubName().costaDoSol){ imageLogo='costa do sol';}
    //NAMIBIA
    else if(timeFoto==ClubName().blackAfrica){ imageLogo='black africa';}
    else if(timeFoto==ClubName().africanStars){ imageLogo='african stars';}
    //NIGERIA
    else if(timeFoto==ClubName().enyimba){ imageLogo='enyimba';}
    //SENEGAL
    else if(timeFoto==ClubName().jaraaf){ imageLogo='jaraaf';}
    else if(timeFoto==ClubName().jeannedarc){ imageLogo='jeanne';}
    //TANZANIA
    else if(timeFoto==ClubName().simba){ imageLogo='simba';}
    //ZAMBIA
    else if(timeFoto==ClubName().greenEagles){ imageLogo='green eagles';}
    else if(timeFoto==ClubName().nkana){ imageLogo='nkana';}
    else if(timeFoto==ClubName().zesco){ imageLogo='zesco';}
    //ZIMBABWE
    else if(timeFoto==ClubName().dynamos){ imageLogo='dynamos';}
    else if(timeFoto==ClubName().manicaDiamonds){ imageLogo='manica';}
    else if(timeFoto==ClubName().platinum){ imageLogo='platinum';}

    //Se o clube não tiver foto poe imagem generica
    if(imageLogo == 'CLUBE NÃO TEM IMAGEM: $timeFoto'){
      //print('CLUBE NÃO TEM IMAGEM: $timeFoto');
      imageLogo = 'generic';
    }
    return imageLogo;
  }

  String campeonatoLogo(String leagueName){
    String imageLogo = 'championship';
    if(leagueName==LeagueOfficialNames().inglaterra1){       imageLogo = 'premierleague';       }
    else if(leagueName==LeagueOfficialNames().inglaterra2){       imageLogo = 'championship';       }
    else if(leagueName==LeagueOfficialNames().inglaterra3){       imageLogo = 'inglaterra3';       }
    else if(leagueName==LeagueOfficialNames().italia1){       imageLogo = 'italia1';       }
    else if(leagueName==LeagueOfficialNames().italia2){       imageLogo = 'italia2';       }
    else if(leagueName==LeagueOfficialNames().espanha1){       imageLogo = 'laliga';       }
    else if(leagueName==LeagueOfficialNames().espanha2){       imageLogo = 'laliga2';       }
    else if(leagueName==LeagueOfficialNames().franca1){       imageLogo = 'ligue1';      }
    else if(leagueName==LeagueOfficialNames().franca2){       imageLogo = 'ligue2';      }
    else if(leagueName==LeagueOfficialNames().alemanha1){      imageLogo = 'bundesliga';       }
    else if(leagueName==LeagueOfficialNames().alemanha2){      imageLogo = 'bundesliga2';       }
    else if(leagueName==LeagueOfficialNames().ptHol){       imageLogo = 'portugal';       }
    else if(leagueName==LeagueOfficialNames().turquiaGrecia){       imageLogo = 'turquia';       }
    else if(leagueName==LeagueOfficialNames().ligaEuropa){       imageLogo = 'liga1';       }
    else if(leagueName==LeagueOfficialNames().lesteEuropeu){     imageLogo = 'leste';       }
    else if(leagueName==LeagueOfficialNames().brasil1){       imageLogo = 'brasileirao';}
    else if(leagueName==LeagueOfficialNames().brasil2){      imageLogo = 'brasilserieb';       }
    else if(leagueName==LeagueOfficialNames().brasil3){      imageLogo = 'brasilseriec';       }
    else if(leagueName==LeagueOfficialNames().paulistao){      imageLogo = 'brasileirao';       }
    else if(leagueName==LeagueOfficialNames().argentina){       imageLogo = 'argentina';       }
    else if(leagueName==LeagueOfficialNames().sulamericano){       imageLogo = 'sulamericana';       }
    else if(leagueName==LeagueOfficialNames().colombia){       imageLogo = 'colombia';       }
    else if(leagueName==LeagueOfficialNames().mexico){       imageLogo = 'mexico';       }
    else if(leagueName==LeagueOfficialNames().estadosUnidos){       imageLogo = 'mls';       }
    else if(leagueName==LeagueOfficialNames().asia){       imageLogo = 'asialeague';       }
    else if(leagueName==LeagueOfficialNames().africa){       imageLogo = 'africa';       }
    else if(leagueName==LeagueOfficialNames().outros){       imageLogo = 'others';       }

    else if(leagueName==LeagueOfficialNames().championsLeague){       imageLogo = 'championsleague_branco';       }
    else if(leagueName==LeagueOfficialNames().libertadores){       imageLogo = 'libertadores';       }
    else if(leagueName==LeagueOfficialNames().resto){       imageLogo = 'rest';       }
    else if(leagueName==LeagueOfficialNames().mundial){       imageLogo = 'mundial';       }

    imageLogo = 'assets/league_logos/$imageLogo.png';
    return imageLogo;
  }
}