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

    else if(timeFoto==ClubName().birmigham){    imageLogo='birmigham';}
    else if(timeFoto==ClubName().blackburn){    imageLogo='blackburn';}
    else if(timeFoto==ClubName().bournemouth){    imageLogo='bournemouth';}
    else if(timeFoto==ClubName().burnley){    imageLogo='burnley';}
    else if(timeFoto==ClubName().brighton){    imageLogo='brighton';}
    else if(timeFoto==ClubName().derbycount){    imageLogo='derby';}
    else if(timeFoto==ClubName().fulham){    imageLogo='fulham';}
    else if(timeFoto==ClubName().hullcity){    imageLogo='hullcity';}
    else if(timeFoto==ClubName().middlesbrough){      imageLogo='middlesbrough';}
    else if(timeFoto==ClubName().norwich){    imageLogo='norwich';}
    else if(timeFoto==ClubName().nottinghamforest){    imageLogo='nottingham';}
    else if(timeFoto==ClubName().qpr){imageLogo='qpr';}
    else if(timeFoto==ClubName().reading){    imageLogo='reading';}
    else if(timeFoto==ClubName().sheffieldunited){    imageLogo='sheffield';}
    else if(timeFoto==ClubName().stoke){    imageLogo='stoke';}
    else if(timeFoto==ClubName().swansea){    imageLogo='swansea';}
    else if(timeFoto==ClubName().watford){    imageLogo='watford';}

    else if(timeFoto==ClubName().barnsley){    imageLogo='barnsley';}
    else if(timeFoto==ClubName().blackpool){    imageLogo='blackpool';}
    else if(timeFoto==ClubName().bradford){ imageLogo='bradford';  }
    else if(timeFoto==ClubName().brentford){ imageLogo='brentford';  }
    else if(timeFoto==ClubName().bolton){    imageLogo='bolton';}
    else if(timeFoto==ClubName().bristol){    imageLogo='bristol city';}
    else if(timeFoto==ClubName().cardiffCity){ imageLogo='cardiff city';  }
    else if(timeFoto==ClubName().coventry){ imageLogo='coventry';  }
    else if(timeFoto==ClubName().charlton){ imageLogo='charlton';  }
    else if(timeFoto==ClubName().grimsby){    imageLogo='grimsby';}
    else if(timeFoto==ClubName().huddersfield){    imageLogo='huddersfield';}
    else if(timeFoto==ClubName().hullcity){ imageLogo='hullcity';  }
    else if(timeFoto==ClubName().ipswichTown){ imageLogo='ipswich';  }
    else if(timeFoto==ClubName().luton){ imageLogo='luton';  }
    else if(timeFoto==ClubName().millwall){ imageLogo='millwall';  }
    else if(timeFoto==ClubName().notts){ imageLogo='notts';  }
    else if(timeFoto==ClubName().oxford){ imageLogo='oxford';  }
    else if(timeFoto==ClubName().peterborough){ imageLogo='peterborough';  }
    else if(timeFoto==ClubName().portsmouth){ imageLogo='portsmouth';  }
    else if(timeFoto==ClubName().plymouth){ imageLogo='plymouth';  }
    else if(timeFoto==ClubName().prestonNorthEnd){ imageLogo='preston north end';  }
    else if(timeFoto==ClubName().rotherham){ imageLogo='rotherham';  }
    else if(timeFoto==ClubName().shrewsbury){ imageLogo='shrewsbury';  }
    else if(timeFoto==ClubName().sheffieldWednesday){ imageLogo='sheffield wed';  }
    else if(timeFoto==ClubName().sunderland){ imageLogo='sunderland';  }
    else if(timeFoto==ClubName().swindon){ imageLogo='swindon';  }
    else if(timeFoto==ClubName().wigan){ imageLogo='wigan';  }
    else if(timeFoto==ClubName().wimbledon){ imageLogo='wimbledon';  }

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
    else if(timeFoto==ClubName().como){    imageLogo='como';}
    else if(timeFoto==ClubName().cremonese){    imageLogo='cremonese';}
    else if(timeFoto==ClubName().chievo){    imageLogo='chievo';}
    else if(timeFoto==ClubName().crotone){    imageLogo='crotone';}
    else if(timeFoto==ClubName().empoli){    imageLogo='empoli';}
    else if(timeFoto==ClubName().foggia){    imageLogo='foggia';}
    else if(timeFoto==ClubName().frosinone){    imageLogo='frosinone';}
    else if(timeFoto==ClubName().hellasVerona){    imageLogo='hellas';}
    else if(timeFoto==ClubName().lecce){    imageLogo='lecce';}
    else if(timeFoto==ClubName().monza){    imageLogo='monza';}
    else if(timeFoto==ClubName().palermo){    imageLogo='palermo';}
    else if(timeFoto==ClubName().piacenza){    imageLogo='piacenza';}
    else if(timeFoto==ClubName().perugia){    imageLogo='perugia';}
    else if(timeFoto==ClubName().pisa){    imageLogo='pisa';}
    else if(timeFoto==ClubName().reggina){    imageLogo='reggina';}
    else if(timeFoto==ClubName().salernitana){    imageLogo='salernitana';}
    else if(timeFoto==ClubName().spal){    imageLogo='spal';}
    else if(timeFoto==ClubName().spezia){    imageLogo='spezia';}
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
    else if(timeFoto==ClubName().barcelonaB){    imageLogo='barcelona';}
    else if(timeFoto==ClubName().cadiz){    imageLogo='cadiz';}
    else if(timeFoto==ClubName().cordoba){    imageLogo='cordoba';}
    else if(timeFoto==ClubName().eibar){    imageLogo='eibar';}
    else if(timeFoto==ClubName().elche){    imageLogo='elche';}
    else if(timeFoto==ClubName().girona){    imageLogo='girona';}
    else if(timeFoto==ClubName().granada){    imageLogo='granada';}
    else if(timeFoto==ClubName().hercules){    imageLogo='hercules';}
    else if(timeFoto==ClubName().huelva){    imageLogo='huelva';}
    else if(timeFoto==ClubName().ibiza){    imageLogo='ibiza';}
    else if(timeFoto==ClubName().lasPalmas){    imageLogo='las palmas';}
    else if(timeFoto==ClubName().leganes){    imageLogo='leganes';}
    else if(timeFoto==ClubName().malaga){    imageLogo='malaga';}
    else if(timeFoto==ClubName().mallorca){    imageLogo='mallorca';}
    else if(timeFoto==ClubName().numancia){    imageLogo='numancia';}
    else if(timeFoto==ClubName().rayoVallecano){    imageLogo='rayo';}
    else if(timeFoto==ClubName().realmadridB){    imageLogo='realmadrid';}
    else if(timeFoto==ClubName().sportingGijon){    imageLogo='sporting gijon';}
    else if(timeFoto==ClubName().tenerife){    imageLogo='tenerife';}
    else if(timeFoto==ClubName().realOviedo){    imageLogo='real oviedo';}
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

    else if(timeFoto==ClubName().arminiaBiefeld){    imageLogo='arminia';}
    else if(timeFoto==ClubName().dynamoDresden){    imageLogo='dynamo dresden';}
    else if(timeFoto==ClubName().fortunaDusseldorf){    imageLogo='fortuna';}
    else if(timeFoto==ClubName().kaiserslautern){    imageLogo='kaiserslautern';}
    else if(timeFoto==ClubName().hannover96){    imageLogo='hannover96';}
    else if(timeFoto==ClubName().hansaRostock){    imageLogo='hansa';}
    else if(timeFoto==ClubName().darmstadt){    imageLogo='darmstadt';}
    else if(timeFoto==ClubName().duisburg){    imageLogo='duisburg';}
    else if(timeFoto==ClubName().bochum){    imageLogo='bochum';}
    else if(timeFoto==ClubName().mainz05){    imageLogo='mainz';}
    else if(timeFoto==ClubName().munique1860){    imageLogo='munique1860';}
    else if(timeFoto==ClubName().nurnberg){    imageLogo='nurnberg';}
    else if(timeFoto==ClubName().paderborn){    imageLogo='paderborn';}
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
    else if(timeFoto==ClubName().angers){    imageLogo='angers';}
    else if(timeFoto==ClubName().auxerre){    imageLogo='auxerre';}
    else if(timeFoto==ClubName().bastia){    imageLogo='bastia';}
    else if(timeFoto==ClubName().brest){    imageLogo='brest';}
    else if(timeFoto==ClubName().caen){    imageLogo='caen';}
    else if(timeFoto==ClubName().clermont){    imageLogo='clermont';}
    else if(timeFoto==ClubName().dijon){    imageLogo='dijon';}
    else if(timeFoto==ClubName().guingamp){    imageLogo='guingamp';}
    else if(timeFoto==ClubName().lens){    imageLogo='lens';}
    else if(timeFoto==ClubName().lorient){    imageLogo='lorient';}
    else if(timeFoto==ClubName().nancy){    imageLogo='nancy';}
    else if(timeFoto==ClubName().nimes){    imageLogo='nimes';}
    else if(timeFoto==ClubName().parisFC){    imageLogo='paris';}
    else if(timeFoto==ClubName().toulouse){    imageLogo='toulouse';}
    else if(timeFoto==ClubName().troyes){    imageLogo='troyes';}
    else if(timeFoto==ClubName().sochaux){    imageLogo='sochaux';}
    else if(timeFoto==ClubName().strasbourg){    imageLogo='strasbourg';}

    else if(timeFoto==ClubName().benfica){    imageLogo='benfica';}
    else if(timeFoto==ClubName().porto){    imageLogo='porto';}
    else if(timeFoto==ClubName().sporting){    imageLogo='sporting';}
    else if(timeFoto==ClubName().braga){    imageLogo='braga';}
    else if(timeFoto==ClubName().vitoriaguimaraes){    imageLogo='guimaraes';}
    else if(timeFoto==ClubName().gilVicente){    imageLogo='gil vicente';}
    else if(timeFoto==ClubName().maritimo){    imageLogo='maritimo';}
    else if(timeFoto==ClubName().moreirense){    imageLogo='moreirense';}
    else if(timeFoto==ClubName().boavista){    imageLogo='boavista';}
    else if(timeFoto==ClubName().portimonense){    imageLogo='portimonense';}
    else if(timeFoto==ClubName().coimbra){    imageLogo='coimbra';}
    else if(timeFoto==ClubName().rioAve){    imageLogo='rio ave';}
    else if(timeFoto==ClubName().belenenses){    imageLogo='belenenses';}
    else if(timeFoto==ClubName().pacosDeFerreira){    imageLogo='paços de ferreira';}
    else if(timeFoto==ClubName().estoril){    imageLogo='estoril';}
    else if(timeFoto==ClubName().nacionalMadeira){    imageLogo='nacional madeira';}
    else if(timeFoto==ClubName().famalicao){    imageLogo='famalicao';}
    else if(timeFoto==ClubName().vitoriaSetubal){    imageLogo='vitoria setubal';}
    //HOLANDA
    else if(timeFoto==ClubName().ajax){    imageLogo='ajax';}
    else if(timeFoto==ClubName().feyenoord){    imageLogo='feyenoord';}
    else if(timeFoto==ClubName().psv){    imageLogo='psv';}
    else if(timeFoto==ClubName().azAlkmaar){    imageLogo='az';}
    else if(timeFoto==ClubName().twente){    imageLogo='twente';}
    else if(timeFoto==ClubName().utrecht){    imageLogo='utrecht';}
    else if(timeFoto==ClubName().vitesse){    imageLogo='vitesse';}
    else if(timeFoto==ClubName().heerenveen){    imageLogo='heerenveen';}
    //BELGICA
    else if(timeFoto==ClubName().anderlecht){    imageLogo='anderlecht';}
    else if(timeFoto==ClubName().brugge){    imageLogo='brugge';}
    else if(timeFoto==ClubName().standardliege){    imageLogo='liege';}
    else if(timeFoto==ClubName().genk){    imageLogo='genk';}
    else if(timeFoto==ClubName().gent){    imageLogo='gent';}

    //ESCOCIA
    else if(timeFoto==ClubName().celtic){    imageLogo='celtic';}
    else if(timeFoto==ClubName().rangers){    imageLogo='rangers';}
    else if(timeFoto==ClubName().hibernian){    imageLogo='hibernian';}
    else if(timeFoto==ClubName().dundee){    imageLogo='dundee';}
    //IRLANDA
    else if(timeFoto==ClubName().bohemian){    imageLogo='bohemian';}

    //NORDICOS
    else if(timeFoto==ClubName().rosenborg){    imageLogo='rosenborg';}
    else if(timeFoto==ClubName().molde){    imageLogo='molde';}
    else if(timeFoto==ClubName().malmo){    imageLogo='malmo';}
    else if(timeFoto==ClubName().aik){    imageLogo='aik';}
    else if(timeFoto==ClubName().ifkgoteborg){    imageLogo='ifk';}
    else if(timeFoto==ClubName().norrkoping){    imageLogo='norrkoping';}
    else if(timeFoto==ClubName().copenhague){    imageLogo='copenhague';}
    else if(timeFoto==ClubName().midtjylland){    imageLogo='midtjylland';}
    else if(timeFoto==ClubName().aarhus){    imageLogo='aarhus';}
    else if(timeFoto==ClubName().brondby){    imageLogo='brondby';}
    else if(timeFoto==ClubName().helsinki){    imageLogo='hjk helsinki';}

    //AUSTRIA/SUIÇA/POLONIA
    else if(timeFoto==ClubName().rbsalzburg){    imageLogo='rbsalzburg';}
    else if(timeFoto==ClubName().rapidviena){    imageLogo='rapidviena';}
    else if(timeFoto==ClubName().austria){    imageLogo='austria';}
    else if(timeFoto==ClubName().tirol){    imageLogo='tirol';}
    else if(timeFoto==ClubName().laskLinz){    imageLogo='lask';}
    else if(timeFoto==ClubName().sturmGraz){    imageLogo='sturm';}
    //SUIÇA
    else if(timeFoto==ClubName().basel){    imageLogo='basel';}
    else if(timeFoto==ClubName().youngBoys){    imageLogo='young boys';}
    else if(timeFoto==ClubName().zurich){    imageLogo='zurich';}
    else if(timeFoto==ClubName().grasshoppers){    imageLogo='grasshopper';}
    else if(timeFoto==ClubName().servette){    imageLogo='servette';}
    //POLONIA
    else if(timeFoto==ClubName().legiaWarszawa){    imageLogo='legia';}
    else if(timeFoto==ClubName().lechPoznan){    imageLogo='lech';}
    else if(timeFoto==ClubName().gornik){    imageLogo='gornik';}
    else if(timeFoto==ClubName().ruchchorzow){    imageLogo='ruch';}

    //TURQUIA
    else if(timeFoto==ClubName().galatasaray){    imageLogo='galatasaray';}
    else if(timeFoto==ClubName().fenerbahce){    imageLogo='fenerbahce';}
    else if(timeFoto==ClubName().besiktas){    imageLogo='besiktas';}
    else if(timeFoto==ClubName().trabzonspor){    imageLogo='trabzonspor';}
    else if(timeFoto==ClubName().instanbul){    imageLogo='instanbul';}
    else if(timeFoto==ClubName().sivasspor){    imageLogo='sivasspor';}
    //GRECIA-CHIPRE-ISRAEL
    else if(timeFoto==ClubName().olympiacos){    imageLogo='olympiacos';}
    else if(timeFoto==ClubName().aek){    imageLogo='aek';}
    else if(timeFoto==ClubName().paok){    imageLogo='paok';}
    else if(timeFoto==ClubName().panathinaikos){    imageLogo='panathinaikos';}
    else if(timeFoto==ClubName().apoel){    imageLogo='apoel';}
    else if(timeFoto==ClubName().maccabiTelAviv){    imageLogo='maccabi tel aviv';}

    //RUSSIA
    else if(timeFoto==ClubName().zenit){    imageLogo='zenit';}
    else if(timeFoto==ClubName().cska){    imageLogo='cska';}
    else if(timeFoto==ClubName().spartakmoscou){    imageLogo='spartak';}
    else if(timeFoto==ClubName().krasnodar){    imageLogo='krasnodar';}
    else if(timeFoto==ClubName().sochi){    imageLogo='sochi';}
    else if(timeFoto==ClubName().rubinKazan){    imageLogo='rubin kazan';}
    else if(timeFoto==ClubName().lokomotivMoscou){    imageLogo='lokomotiv';}
    else if(timeFoto==ClubName().dinamoMoscou){    imageLogo='dinamo moscou';}
    else if(timeFoto==ClubName().rostov){    imageLogo='rostov';}
    else if(timeFoto==ClubName().rotor){    imageLogo='rotor';}

    //EX-URSS
    else if(timeFoto==ClubName().shaktardonetsk){    imageLogo='shaktar';}
    else if(timeFoto==ClubName().dinamokiev){    imageLogo='dinamokiev';}
    else if(timeFoto==ClubName().dnipro){    imageLogo='dnipro';}
    else if(timeFoto==ClubName().sheriffTiraspol){    imageLogo='sheriff';}
    else if(timeFoto==ClubName().bate){    imageLogo='bate';}
    else if(timeFoto==ClubName().qarabag){    imageLogo='qarabag';}
    else if(timeFoto==ClubName().astana){    imageLogo='astana';}
    else if(timeFoto==ClubName().tbilisi){    imageLogo='tbilisi';}
    else if(timeFoto==ClubName().zalgiris){    imageLogo='zalgiris';}

    //LESTE EUROPEU
    //SERVIA
    else if(timeFoto==ClubName().estrelavermelha){    imageLogo='estrelavermelha';}
    else if(timeFoto==ClubName().partizan){    imageLogo='partizan';}
    //BULGARIA
    else if(timeFoto==ClubName().ludogorets){    imageLogo='ludogorets';}
    else if(timeFoto==ClubName().cskaSofia){    imageLogo='cska sofia';}
    //CROACIA
    else if(timeFoto==ClubName().dinamozagreb){    imageLogo='dinamozagreb';}
    else if(timeFoto==ClubName().hadjuksplit){    imageLogo='hadjuk split';}
    //ESLOVAQUIA-ESLOVENIA
    else if(timeFoto==ClubName().slovanBratislava){    imageLogo='slovan bratislava';}
    else if(timeFoto==ClubName().maribor){    imageLogo='maribor';}
    //REPUBLICA TCHECA
    else if(timeFoto==ClubName().spartapraga){    imageLogo='spartapraga';}
    else if(timeFoto==ClubName().slaviaPraha){    imageLogo='slavia praha';}
    else if(timeFoto==ClubName().banikostrava){    imageLogo='banik';}
    else if(timeFoto==ClubName().viktoriaPlzen){    imageLogo='viktoria';}
    //HUNGRIA
    else if(timeFoto==ClubName().ferencvaros){    imageLogo='ferencvaros';}
    else if(timeFoto==ClubName().honved){    imageLogo='honved';}
    else if(timeFoto==ClubName().mtk){    imageLogo='mtk';}
    else if(timeFoto==ClubName().ujpest){    imageLogo='ujpest';}
    else if(timeFoto==ClubName().vasas){    imageLogo='vasas';}
    //ROMENIA
    else if(timeFoto==ClubName().steauaBucureste){    imageLogo='steaua bucareste';}
    else if(timeFoto==ClubName().dinamoBucureste){    imageLogo='dinamo bucuresti';}
    else if(timeFoto==ClubName().cluj){    imageLogo='cluj';}
    //MACEDONIA
    else if(timeFoto==ClubName().vardar){    imageLogo='vardar';}



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
    else if(timeFoto==ClubName().avai){imageLogo='avai';}
    else if(timeFoto==ClubName().americaRJ){imageLogo='americarj';  }
    else if(timeFoto==ClubName().americaRN){imageLogo='americarn';  }
    else if(timeFoto==ClubName().bangu){imageLogo='bangu';  }
    else if(timeFoto==ClubName().boaesporte){imageLogo='boa esporte';  }
    else if(timeFoto==ClubName().botafogoPB){imageLogo='botafogo pb';  }
    else if(timeFoto==ClubName().botafogoSP){imageLogo='botafogo sp';  }
    else if(timeFoto==ClubName().brasilPelotas){    imageLogo='brasil pelotas'; }
    else if(timeFoto==ClubName().brasiliense){imageLogo='brasiliense';  }
    else if(timeFoto==ClubName().brusque){  imageLogo='brusque';  }
    else if(timeFoto==ClubName().campinense){  imageLogo='campinense';  }
    else if(timeFoto==ClubName().confianca){  imageLogo='confianca';  }
    else if(timeFoto==ClubName().caxias){  imageLogo='caxias';  }
    else if(timeFoto==ClubName().crb){    imageLogo='crb'; }
    else if(timeFoto==ClubName().csa){    imageLogo='csa'; }
    else if(timeFoto==ClubName().ferroviaria){    imageLogo='ferroviaria'; }
    else if(timeFoto==ClubName().gama){    imageLogo='gama'; }
    else if(timeFoto==ClubName().gremioNovorizontino){    imageLogo='gremio novorizontino'; }
    else if(timeFoto==ClubName().ibis){    imageLogo='ibis'; }
    else if(timeFoto==ClubName().ituano){    imageLogo='ituano'; }
    else if(timeFoto==ClubName().interLimeira){  imageLogo='interlimeira';  }
    else if(timeFoto==ClubName().joinville){    imageLogo='joinville'; }
    else if(timeFoto==ClubName().juventusMooca){  imageLogo='juventus mooca';  }
    else if(timeFoto==ClubName().londrina){    imageLogo='londrina'; }
    else if(timeFoto==ClubName().luverdense){    imageLogo='luverdense'; }
    else if(timeFoto==ClubName().manaus){  imageLogo='manaus';  }
    else if(timeFoto==ClubName().marilia){    imageLogo='marilia'; }
    else if(timeFoto==ClubName().mirassol){imageLogo='mirassol';  }
    else if(timeFoto==ClubName().noroeste){    imageLogo='noroeste'; }
    else if(timeFoto==ClubName().operarioPR){    imageLogo='operariopr'; }
    else if(timeFoto==ClubName().paysandu){  imageLogo='paysandu';  }
    else if(timeFoto==ClubName().paulista){imageLogo='paulista';  }
    else if(timeFoto==ClubName().portuguesa){ imageLogo='portuguesa';  }
    else if(timeFoto==ClubName().remo){    imageLogo='remo'; }
    else if(timeFoto==ClubName().santacruz){imageLogo='santacruz';  }
    else if(timeFoto==ClubName().sampaio){    imageLogo='sampaio'; }
    else if(timeFoto==ClubName().santoandre){imageLogo='santo andre';  }
    else if(timeFoto==ClubName().saocaetano){imageLogo='sao caetano';  }
    else if(timeFoto==ClubName().tombense){imageLogo='tombense';  }
    else if(timeFoto==ClubName().tunaluso){imageLogo='tunaluso';  }
    else if(timeFoto==ClubName().treze){imageLogo='treze';  }
    else if(timeFoto==ClubName().vilanova){  imageLogo='vila nova';  }
    else if(timeFoto==ClubName().voltaredonda){imageLogo='volta redonda';  }
    else if(timeFoto==ClubName().xvpiracicaba){imageLogo='xv';  }


    ///////////////////////////////////////////////
    //ARGENTINA
    else if(timeFoto==ClubName().argentinojuniors){       imageLogo='argentinosjr';}
    else if(timeFoto==ClubName().arsenalsarandi){    imageLogo='sarandi';     }
    else if(timeFoto==ClubName().banfield){    imageLogo='banfield';      }
    else if(timeFoto==ClubName().belgrano){    imageLogo='belgrano';      }
    else if(timeFoto==ClubName().bocajuniors){       imageLogo='bocajuniors';}
    else if(timeFoto==ClubName().chacarita){    imageLogo='chacarita';      }
    else if(timeFoto==ClubName().colon){imageLogo='colon';}
    else if(timeFoto==ClubName().defensayjusticia){imageLogo='defensa';}
    else if(timeFoto==ClubName().estudiantes){    imageLogo='estudiantes';}
    else if(timeFoto==ClubName().ferro){imageLogo='ferro';}
    else if(timeFoto==ClubName().independiente){ imageLogo='independiente';}
    else if(timeFoto==ClubName().huracan){     imageLogo='huracan'; }
    else if(timeFoto==ClubName().lanus){       imageLogo='lanus'; }
    else if(timeFoto==ClubName().newells){ imageLogo='newells';  }
    else if(timeFoto==ClubName().racing){       imageLogo='racing'; }
    else if(timeFoto==ClubName().riverplate){    imageLogo='riverplate';  }
    else if(timeFoto==ClubName().rosariocentral){  imageLogo='rosariocentral';  }
    else if(timeFoto==ClubName().sanlorenzo){  imageLogo='sanlorenzo';  }
    else if(timeFoto==ClubName().talleres){      imageLogo='talleres';  }
    else if(timeFoto==ClubName().velezsarsfield){    imageLogo='velez'; }
    else if(timeFoto==ClubName().gimnasia){    imageLogo='gimnasia'; }
    else if(timeFoto==ClubName().tigre){    imageLogo='tigre'; }
    else if(timeFoto==ClubName().atleticoTucuman){    imageLogo='atletico tucuman'; }
    else if(timeFoto==ClubName().godoycruz){    imageLogo='godoy cruz'; }
    else if(timeFoto==ClubName().quilmes){    imageLogo='quilmes'; }
    else if(timeFoto==ClubName().unionSantaFe){    imageLogo='union santa fe'; }

    //AMÉRICA DO SUL
    else if(timeFoto==ClubName().penarol){       imageLogo='penarol';}
    else if(timeFoto==ClubName().nacional){    imageLogo='nacional';     }
    else if(timeFoto==ClubName().montevideo){ imageLogo='montevideo';  }
    else if(timeFoto==ClubName().danubio){ imageLogo='danubio';  }
    else if(timeFoto==ClubName().defensor){ imageLogo='defensor';  }
    else if(timeFoto==ClubName().fenix){ imageLogo='fenix';  }
    else if(timeFoto==ClubName().wanderers){ imageLogo='wanderers';  }

    else if(timeFoto==ClubName().olimpia){    imageLogo='olimpia';      }
    else if(timeFoto==ClubName().cerroporteno){       imageLogo='cerro';}
    else if(timeFoto==ClubName().libertad){imageLogo='libertad';}
    else if(timeFoto==ClubName().guaraniPAR){ imageLogo='guarani paraguai';  }
    else if(timeFoto==ClubName().nacionalPAR){ imageLogo='nacional paraguai';  }

    else if(timeFoto==ClubName().colocolo){    imageLogo='colocolo';}
    else if(timeFoto==ClubName().lau){ imageLogo='lau';}
    else if(timeFoto==ClubName().cobreloa){ imageLogo='cobreloa';}
    else if(timeFoto==ClubName().univcatolica){     imageLogo='universidadcatolica'; }
    else if(timeFoto==ClubName().laCalera){ imageLogo='la calera';  }
    else if(timeFoto==ClubName().palestino){ imageLogo='palestino';  }
    else if(timeFoto==ClubName().huachipato){ imageLogo='huachipato';  }
    else if(timeFoto==ClubName().unionespanola){ imageLogo='union';  }

    else if(timeFoto==ClubName().bolivar){       imageLogo='bolivar'; }
    else if(timeFoto==ClubName().theStrongest){ imageLogo='the strongest';  }
    else if(timeFoto==ClubName().alwaysReady){ imageLogo='always ready';  }
    else if(timeFoto==ClubName().orientePetrolero){ imageLogo='oriente';  }
    else if(timeFoto==ClubName().sanJoseBOL){ imageLogo='san jose';  }
    else if(timeFoto==ClubName().guabira){ imageLogo='guabira';  }

    else if(timeFoto==ClubName().alianzalima){ imageLogo='alianzalima';  }
    else if(timeFoto==ClubName().sportingcristal){       imageLogo='sportingcristal'; }
    else if(timeFoto==ClubName().cienciano){    imageLogo='cienciano';  }
    else if(timeFoto==ClubName().universitario){ imageLogo='universitario';  }
    else if(timeFoto==ClubName().melgar){ imageLogo='melgar';  }
    else if(timeFoto==ClubName().jorge){ imageLogo='jorge';  }
    else if(timeFoto==ClubName().sportboys){ imageLogo='sport boys';  }

    else if(timeFoto==ClubName().barcelonaequ){  imageLogo='barcelonaequ';  }
    else if(timeFoto==ClubName().emelec){  imageLogo='emelec';  }
    else if(timeFoto==ClubName().ldu){      imageLogo='ldu';  }
    else if(timeFoto==ClubName().idelvalle){ imageLogo='delvalle';  }
    else if(timeFoto==ClubName().elnacional){ imageLogo='el nacional';}
    //COLOMBIA
    else if(timeFoto==ClubName().americadecali){       imageLogo='americacali';}
    else if(timeFoto==ClubName().atleticonacional){    imageLogo='atleticonacional';     }
    else if(timeFoto==ClubName().deportivocali){    imageLogo='deportivocali';      }
    else if(timeFoto==ClubName().junior){       imageLogo='junior';}
    else if(timeFoto==ClubName().imedellin){imageLogo='medellin';}
    else if(timeFoto==ClubName().oncecaldas){    imageLogo='oncecaldas';}
    else if(timeFoto==ClubName().millonarios){ imageLogo='millonarios';}
    else if(timeFoto==ClubName().santafe){     imageLogo='santafe'; }
    else if(timeFoto==ClubName().tolima){ imageLogo='tolima';  }
    //VENEZUELA
    else if(timeFoto==ClubName().caracas){    imageLogo='caracas'; }
    else if(timeFoto==ClubName().laGuaira){ imageLogo='la guaira';  }
    else if(timeFoto==ClubName().deportivoTachira){ imageLogo='deportivo tachira';  }

    ///////////////////////////////////////////////////////////////////////////
    //MÉXICO
    else if(timeFoto==ClubName().atlante){       imageLogo='atlante'; }
    else if(timeFoto==ClubName().atlas){    imageLogo='atlas'; }
    else if(timeFoto==ClubName().americamex){       imageLogo='americamx'; }
    else if(timeFoto==ClubName().chivasguadalajara){ imageLogo='chivas';  }
    else if(timeFoto==ClubName().cruzazul){       imageLogo='cruzazul'; }
    else if(timeFoto==ClubName().juarez){    imageLogo='juarez'; }
    else if(timeFoto==ClubName().leon){    imageLogo='leon'; }
    else if(timeFoto==ClubName().leonesNegros){    imageLogo='leones negros'; }
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
    else if(timeFoto==ClubName().santosLaguna){    imageLogo='santos laguna'; }

    else if(timeFoto==ClubName().atlanta){       imageLogo='atlanta';}
    else if(timeFoto==ClubName().columbuscrew){       imageLogo='columbus';}
    else if(timeFoto==ClubName().chicago){       imageLogo='chicago';}
    else if(timeFoto==ClubName().colorado){       imageLogo='colorado';}
    else if(timeFoto==ClubName().dcunited){    imageLogo='dcunited';}
    else if(timeFoto==ClubName().fcdallas){ imageLogo='dallas';}
    else if(timeFoto==ClubName().houston){    imageLogo='houston';}
    else if(timeFoto==ClubName().lagalaxy){    imageLogo='la';  }
    else if(timeFoto==ClubName().losangelesfc){ imageLogo='lafc';  }
    else if(timeFoto==ClubName().minnesota){    imageLogo='minnesota';     }
    else if(timeFoto==ClubName().montreal){    imageLogo='montreal';  }
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

    //////////////////////////////////////////////////////////////////////////////////
    if(timeFoto==ClubName().ghuangzhou){       imageLogo='evergrande';}
    else if(timeFoto==ClubName().beijingguoan){    imageLogo='beijing';     }
    else if(timeFoto==ClubName().shandong){    imageLogo='shandong_luneng';      }
    else if(timeFoto==ClubName().shanghaisipg){       imageLogo='shanghai';}

    else if(timeFoto==ClubName().kashimaantlers){imageLogo='kashima';}
    else if(timeFoto==ClubName().urawareddiamonds){    imageLogo='urawa';}
    else if(timeFoto==ClubName().visselkobe){     imageLogo='vissel_kobe'; }
    else if(timeFoto==ClubName().kawasakifrontale){       imageLogo='kawasaki_frontale'; }
    else if(timeFoto==ClubName().cerezoOsaka){ imageLogo='cerezo osaka';}
    else if(timeFoto==ClubName().gambaOsaka){ imageLogo='gamba osaka';}
    else if(timeFoto==ClubName().kashiwaReysol){ imageLogo='kashiwa';}
    else if(timeFoto==ClubName().yokohamamarinos){ imageLogo='yokohama';}

    else if(timeFoto==ClubName().jeonbuk){    imageLogo='jeonbuk'; }
    else if(timeFoto==ClubName().fcseoul){ imageLogo='fc seoul';}
    else if(timeFoto==ClubName().suwonsamsung){ imageLogo='suwon samsung';}
    else if(timeFoto==ClubName().pohang){      imageLogo='pohang';  }
    else if(timeFoto==ClubName().ulsan){ imageLogo='ulsan';}
    else if(timeFoto==ClubName().ulsan){ imageLogo='ulsan';}

    else if(timeFoto==ClubName().alain){ imageLogo='al_ain';  }
    else if(timeFoto==ClubName().alsadd){       imageLogo='sadd'; }
    else if(timeFoto==ClubName().alduhail){    imageLogo='duhail';  }
    else if(timeFoto==ClubName().alahly){  imageLogo='al_ahly';  }
    else if(timeFoto==ClubName().alhilal){  imageLogo='al_hilal';  }
    else if(timeFoto==ClubName().alnassr){      imageLogo='al_nassr';  }
    else if(timeFoto==ClubName().aljazira){      imageLogo='al_jazira';  }
    else if(timeFoto==ClubName().alIttihad){ imageLogo='al ittihad';}
    else if(timeFoto==ClubName().alShabab){ imageLogo='al shabab';}
    else if(timeFoto==ClubName().alWahda){ imageLogo='al wahda';}

    else if(timeFoto==ClubName().persepolis){      imageLogo='persepolis';  }
    else if(timeFoto==ClubName().melbournevictory){ imageLogo='melbourne victory';}
    else if(timeFoto==ClubName().sydney){ imageLogo='sydney';}
    else if(timeFoto==ClubName().buriram){ imageLogo='buriram united';}

    //AFRICA
    else if(timeFoto==ClubName().alahli){  imageLogo='al_ahli';  }
    else if(timeFoto==ClubName().zamalek){ imageLogo='zamalek';}
    else if(timeFoto==ClubName().mazembe){ imageLogo='mazembe';}
    else if(timeFoto==ClubName().rajacasablanca){      imageLogo='raja';  }
    else if(timeFoto==ClubName().wydad){ imageLogo='wydad';}
    else if(timeFoto==ClubName().orlandopirates){ imageLogo='orlando pirates';}
    else if(timeFoto==ClubName().kaizer){ imageLogo='kaizer chiefs';}
    else if(timeFoto==ClubName().mamelodi){ imageLogo='mamelodi sundowns';}
    else if(timeFoto==ClubName().agosto){ imageLogo='1 de agosto';}
    else if(timeFoto==ClubName().esperance){ imageLogo='esperance';}
    else if(timeFoto==ClubName().usmAlger){ imageLogo='usm alger';}
    else if(timeFoto==ClubName().etoilesahel){ imageLogo='etoile sahel';}
    else if(timeFoto==ClubName().essetif){ imageLogo='es setif';}
    else if(timeFoto==ClubName().asecmimosas){ imageLogo='asec mimosas';}
    else if(timeFoto==ClubName().cotonsport){ imageLogo='cotonsport';}
    else if(timeFoto==ClubName().enyimba){ imageLogo='enyimba';}

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