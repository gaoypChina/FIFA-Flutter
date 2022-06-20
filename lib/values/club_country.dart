import 'package:fifa/classes/words.dart';
import 'package:fifa/values/club_names.dart';

class ClubCountry{

  String countryName(String clubName){
    String nationality = Words.country.zimbabwe;
    if(clubName==ClubName().arsenal){    nationality=Words.country.england;}
    else if(clubName==ClubName().astonvilla){    nationality=Words.country.england;}
    else if(clubName==ClubName().crystalpalace){    nationality=Words.country.england;}
    else if(clubName==ClubName().chelsea){    nationality=Words.country.england;}
    else if(clubName==ClubName().everton){    nationality=Words.country.england;}
    else if(clubName==ClubName().leicester){    nationality=Words.country.england;}
    else if(clubName==ClubName().leedsunited){    nationality=Words.country.england;}
    else if(clubName==ClubName().liverpool){    nationality=Words.country.england;}
    else if(clubName==ClubName().manchestercity){    nationality=Words.country.england;}
    else if(clubName==ClubName().manchesterunited){    nationality=Words.country.england;}
    else if(clubName==ClubName().newcastle){    nationality=Words.country.england;}
    else if(clubName==ClubName().southampton){    nationality=Words.country.england;}
    else if(clubName==ClubName().tottenham){    nationality=Words.country.england;}
    else if(clubName==ClubName().westbromwich){    nationality=Words.country.england;}
    else if(clubName==ClubName().westham){    nationality=Words.country.england;}
    else if(clubName==ClubName().wolves){    nationality=Words.country.england;}

    else if(clubName==ClubName().birmigham){    nationality=Words.country.england;}
    else if(clubName==ClubName().blackburn){    nationality=Words.country.england;}
    else if(clubName==ClubName().bournemouth){    nationality=Words.country.england;}
    else if(clubName==ClubName().burnley){    nationality=Words.country.england;}
    else if(clubName==ClubName().brighton){    nationality=Words.country.england;}
    else if(clubName==ClubName().derbycount){    nationality=Words.country.england;}
    else if(clubName==ClubName().fulham){    nationality=Words.country.england;}
    else if(clubName==ClubName().hullcity){    nationality=Words.country.england;}
    else if(clubName==ClubName().middlesbrough){      nationality=Words.country.england;}
    else if(clubName==ClubName().norwich){    nationality=Words.country.england;}
    else if(clubName==ClubName().nottinghamforest){    nationality=Words.country.england;}
    else if(clubName==ClubName().qpr){nationality=Words.country.england;}
    else if(clubName==ClubName().reading){    nationality=Words.country.england;}
    else if(clubName==ClubName().sheffieldunited){    nationality=Words.country.england;}
    else if(clubName==ClubName().stoke){    nationality=Words.country.england;}
    else if(clubName==ClubName().swansea){    nationality=Words.country.england;}
    else if(clubName==ClubName().watford){    nationality=Words.country.england;}

    else if(clubName==ClubName().barnsley){    nationality=Words.country.england;}
    else if(clubName==ClubName().blackpool){    nationality=Words.country.england;}
    else if(clubName==ClubName().bradford){ nationality=Words.country.england;  }
    else if(clubName==ClubName().brentford){ nationality=Words.country.england;  }
    else if(clubName==ClubName().bolton){    nationality=Words.country.england;}
    else if(clubName==ClubName().bristol){    nationality=Words.country.england;}
    else if(clubName==ClubName().cardiffCity){ nationality=Words.country.england;  }
    else if(clubName==ClubName().coventry){ nationality=Words.country.england;  }
    else if(clubName==ClubName().charlton){ nationality=Words.country.england;  }
    else if(clubName==ClubName().grimsby){    nationality=Words.country.england;}
    else if(clubName==ClubName().huddersfield){    nationality=Words.country.england;}
    else if(clubName==ClubName().hullcity){ nationality=Words.country.england;  }
    else if(clubName==ClubName().ipswichTown){ nationality=Words.country.england;  }
    else if(clubName==ClubName().luton){ nationality=Words.country.england;  }
    else if(clubName==ClubName().millwall){ nationality=Words.country.england;  }
    else if(clubName==ClubName().notts){ nationality=Words.country.england;  }
    else if(clubName==ClubName().oxford){ nationality=Words.country.england;  }
    else if(clubName==ClubName().peterborough){ nationality=Words.country.england;  }
    else if(clubName==ClubName().portsmouth){ nationality=Words.country.england;  }
    else if(clubName==ClubName().plymouth){ nationality=Words.country.england;  }
    else if(clubName==ClubName().prestonNorthEnd){ nationality=Words.country.england;  }
    else if(clubName==ClubName().rotherham){ nationality=Words.country.england;  }
    else if(clubName==ClubName().shrewsbury){ nationality=Words.country.england;  }
    else if(clubName==ClubName().sheffieldWednesday){ nationality=Words.country.england;  }
    else if(clubName==ClubName().sunderland){ nationality=Words.country.england;  }
    else if(clubName==ClubName().swindon){ nationality=Words.country.england;  }
    else if(clubName==ClubName().wigan){ nationality=Words.country.england;  }
    else if(clubName==ClubName().wimbledon){ nationality=Words.country.england;  }

    else if(clubName==ClubName().atalanta){    nationality=Words.country.italy;}
    else if(clubName==ClubName().bologna){    nationality=Words.country.italy;}
    else if(clubName==ClubName().cagliari){    nationality=Words.country.italy;}
    else if(clubName==ClubName().fiorentina){    nationality=Words.country.italy;}
    else if(clubName==ClubName().genoa){    nationality=Words.country.italy;}
    else if(clubName==ClubName().inter){    nationality=Words.country.italy;}
    else if(clubName==ClubName().juventus){    nationality=Words.country.italy;}
    else if(clubName==ClubName().milan){    nationality=Words.country.italy;}
    else if(clubName==ClubName().lazio){    nationality=Words.country.italy;}
    else if(clubName==ClubName().napoli){    nationality=Words.country.italy;}
    else if(clubName==ClubName().parma){    nationality=Words.country.italy;}
    else if(clubName==ClubName().roma){    nationality=Words.country.italy;}
    else if(clubName==ClubName().sampdoria){    nationality=Words.country.italy;}
    else if(clubName==ClubName().sassuolo){    nationality=Words.country.italy;}
    else if(clubName==ClubName().torino){    nationality=Words.country.italy;}
    else if(clubName==ClubName().udinese){    nationality=Words.country.italy;}

    else if(clubName==ClubName().ascoli){    nationality=Words.country.italy;}
    else if(clubName==ClubName().bari){    nationality=Words.country.italy;}
    else if(clubName==ClubName().benevento){    nationality=Words.country.italy;}
    else if(clubName==ClubName().brescia){    nationality=Words.country.italy;}
    else if(clubName==ClubName().catania){    nationality=Words.country.italy;}
    else if(clubName==ClubName().cesena){    nationality=Words.country.italy;}
    else if(clubName==ClubName().como){    nationality=Words.country.italy;}
    else if(clubName==ClubName().cremonese){    nationality=Words.country.italy;}
    else if(clubName==ClubName().chievo){    nationality=Words.country.italy;}
    else if(clubName==ClubName().crotone){    nationality=Words.country.italy;}
    else if(clubName==ClubName().empoli){    nationality=Words.country.italy;}
    else if(clubName==ClubName().foggia){    nationality=Words.country.italy;}
    else if(clubName==ClubName().frosinone){    nationality=Words.country.italy;}
    else if(clubName==ClubName().hellasVerona){    nationality=Words.country.italy;}
    else if(clubName==ClubName().lecce){    nationality=Words.country.italy;}
    else if(clubName==ClubName().monza){    nationality=Words.country.italy;}
    else if(clubName==ClubName().palermo){    nationality=Words.country.italy;}
    else if(clubName==ClubName().piacenza){    nationality=Words.country.italy;}
    else if(clubName==ClubName().perugia){    nationality=Words.country.italy;}
    else if(clubName==ClubName().pisa){    nationality=Words.country.italy;}
    else if(clubName==ClubName().reggina){    nationality=Words.country.italy;}
    else if(clubName==ClubName().salernitana){    nationality=Words.country.italy;}
    else if(clubName==ClubName().spal){    nationality=Words.country.italy;}
    else if(clubName==ClubName().spezia){    nationality=Words.country.italy;}
    else if(clubName==ClubName().venezia){    nationality=Words.country.italy;}
    else if(clubName==ClubName().vicenza){    nationality=Words.country.italy;}

    else if(clubName==ClubName().athleticbilbao){    nationality=Words.country.spain;}
    else if(clubName==ClubName().atleticomadrid){    nationality=Words.country.spain;}
    else if(clubName==ClubName().barcelona){    nationality=Words.country.spain;}
    else if(clubName==ClubName().celtavigo){    nationality=Words.country.spain;}
    else if(clubName==ClubName().espanyol){    nationality=Words.country.spain;}
    else if(clubName==ClubName().getafe){    nationality=Words.country.spain;}
    else if(clubName==ClubName().osasuna){    nationality=Words.country.spain;}
    else if(clubName==ClubName().lacoruna){    nationality=Words.country.spain;}
    else if(clubName==ClubName().levante){    nationality=Words.country.spain;}
    else if(clubName==ClubName().realbetis){    nationality=Words.country.spain;}
    else if(clubName==ClubName().realmadrid){    nationality=Words.country.spain;}
    else if(clubName==ClubName().realsociedad){    nationality=Words.country.spain;}
    else if(clubName==ClubName().sevilla){    nationality=Words.country.spain;}
    else if(clubName==ClubName().valladolid){    nationality=Words.country.spain;}
    else if(clubName==ClubName().valencia){    nationality=Words.country.spain;}
    else if(clubName==ClubName().villareal){    nationality=Words.country.spain;}

    else if(clubName==ClubName().alaves){    nationality=Words.country.spain;}
    else if(clubName==ClubName().albacete){    nationality=Words.country.spain;}
    else if(clubName==ClubName().almeria){    nationality=Words.country.spain;}
    else if(clubName==ClubName().atleticomadridB){    nationality=Words.country.spain;}
    else if(clubName==ClubName().barcelonaB){    nationality=Words.country.spain;}
    else if(clubName==ClubName().cadiz){    nationality=Words.country.spain;}
    else if(clubName==ClubName().cordoba){    nationality=Words.country.spain;}
    else if(clubName==ClubName().eibar){    nationality=Words.country.spain;}
    else if(clubName==ClubName().elche){    nationality=Words.country.spain;}
    else if(clubName==ClubName().girona){    nationality=Words.country.spain;}
    else if(clubName==ClubName().granada){    nationality=Words.country.spain;}
    else if(clubName==ClubName().hercules){    nationality=Words.country.spain;}
    else if(clubName==ClubName().huelva){    nationality=Words.country.spain;}
    else if(clubName==ClubName().ibiza){    nationality=Words.country.spain;}
    else if(clubName==ClubName().lasPalmas){    nationality=Words.country.spain;}
    else if(clubName==ClubName().leganes){    nationality=Words.country.spain;}
    else if(clubName==ClubName().malaga){    nationality=Words.country.spain;}
    else if(clubName==ClubName().mallorca){    nationality=Words.country.spain;}
    else if(clubName==ClubName().numancia){    nationality=Words.country.spain;}
    else if(clubName==ClubName().rayoVallecano){    nationality=Words.country.spain;}
    else if(clubName==ClubName().realmadridB){    nationality=Words.country.spain;}
    else if(clubName==ClubName().sportingGijon){    nationality=Words.country.spain;}
    else if(clubName==ClubName().tenerife){    nationality=Words.country.spain;}
    else if(clubName==ClubName().realOviedo){    nationality=Words.country.spain;}
    else if(clubName==ClubName().zaragoza){    nationality=Words.country.spain;}

    else if(clubName==ClubName().moenchengladbach){    nationality=Words.country.germany;}
    else if(clubName==ClubName().borussiadortmund){    nationality=Words.country.germany;}
    else if(clubName==ClubName().bayernmunique){    nationality=Words.country.germany;}
    else if(clubName==ClubName().bayerleverkusen){    nationality=Words.country.germany;}
    else if(clubName==ClubName().eintrachtfrankfurt){    nationality=Words.country.germany;}
    else if(clubName==ClubName().augsburg){    nationality=Words.country.germany;}
    else if(clubName==ClubName().freiburg){    nationality=Words.country.germany;}
    else if(clubName==ClubName().hamburgo){    nationality=Words.country.germany;}
    else if(clubName==ClubName().colonia){    nationality=Words.country.germany;}
    else if(clubName==ClubName().herthaberlim){    nationality=Words.country.germany;}
    else if(clubName==ClubName().hoffenheim){    nationality=Words.country.germany;}
    else if(clubName==ClubName().rbleipzig){    nationality=Words.country.germany;}
    else if(clubName==ClubName().schalke04){    nationality=Words.country.germany;}
    else if(clubName==ClubName().stuttgart){    nationality=Words.country.germany;}
    else if(clubName==ClubName().werderbremen){    nationality=Words.country.germany;}
    else if(clubName==ClubName().wolfsburg){    nationality=Words.country.germany;}

    else if(clubName==ClubName().arminiaBiefeld){    nationality=Words.country.germany;}
    else if(clubName==ClubName().dynamoDresden){    nationality=Words.country.germany;}
    else if(clubName==ClubName().fortunaDusseldorf){    nationality=Words.country.germany;}
    else if(clubName==ClubName().kaiserslautern){    nationality=Words.country.germany;}
    else if(clubName==ClubName().hannover96){    nationality=Words.country.germany;}
    else if(clubName==ClubName().hansaRostock){    nationality=Words.country.germany;}
    else if(clubName==ClubName().darmstadt){    nationality=Words.country.germany;}
    else if(clubName==ClubName().duisburg){    nationality=Words.country.germany;}
    else if(clubName==ClubName().bochum){    nationality=Words.country.germany;}
    else if(clubName==ClubName().mainz05){    nationality=Words.country.germany;}
    else if(clubName==ClubName().munique1860){    nationality=Words.country.germany;}
    else if(clubName==ClubName().nurnberg){    nationality=Words.country.germany;}
    else if(clubName==ClubName().paderborn){    nationality=Words.country.germany;}
    else if(clubName==ClubName().unionBerlin){    nationality=Words.country.germany;}
    else if(clubName==ClubName().stPauli){    nationality=Words.country.germany;}

    else if(clubName==ClubName().bordeaux){    nationality=Words.country.france;}
    else if(clubName==ClubName().lille){    nationality=Words.country.france;}
    else if(clubName==ClubName().lyon){    nationality=Words.country.france;}
    else if(clubName==ClubName().monaco){    nationality=Words.country.france;}
    else if(clubName==ClubName().montpellier){    nationality=Words.country.france;}
    else if(clubName==ClubName().nantes){    nationality=Words.country.france;}
    else if(clubName==ClubName().nice){    nationality=Words.country.france;}
    else if(clubName==ClubName().olympiquemarselha){    nationality=Words.country.france;}
    else if(clubName==ClubName().psg){    nationality=Words.country.france;}
    else if(clubName==ClubName().reims){    nationality=Words.country.france;}
    else if(clubName==ClubName().rennes){    nationality=Words.country.france;}
    else if(clubName==ClubName().saintetienne){    nationality=Words.country.france;}
    else if(clubName==ClubName().metz){    nationality=Words.country.france;}

    else if(clubName==ClubName().ajaccio){    nationality=Words.country.france;}
    else if(clubName==ClubName().angers){    nationality=Words.country.france;}
    else if(clubName==ClubName().auxerre){    nationality=Words.country.france;}
    else if(clubName==ClubName().bastia){    nationality=Words.country.france;}
    else if(clubName==ClubName().brest){    nationality=Words.country.france;}
    else if(clubName==ClubName().caen){    nationality=Words.country.france;}
    else if(clubName==ClubName().clermont){    nationality=Words.country.france;}
    else if(clubName==ClubName().dijon){    nationality=Words.country.france;}
    else if(clubName==ClubName().guingamp){    nationality=Words.country.france;}
    else if(clubName==ClubName().lens){    nationality=Words.country.france;}
    else if(clubName==ClubName().lorient){    nationality=Words.country.france;}
    else if(clubName==ClubName().nancy){    nationality=Words.country.france;}
    else if(clubName==ClubName().nimes){    nationality=Words.country.france;}
    else if(clubName==ClubName().parisFC){    nationality=Words.country.france;}
    else if(clubName==ClubName().toulouse){    nationality=Words.country.france;}
    else if(clubName==ClubName().troyes){    nationality=Words.country.france;}
    else if(clubName==ClubName().sochaux){    nationality=Words.country.france;}
    else if(clubName==ClubName().strasbourg){    nationality=Words.country.france;}

    else if(clubName==ClubName().anderlecht){    nationality=Words.country.belgium;}
    else if(clubName==ClubName().brugge){    nationality=Words.country.belgium;}
    else if(clubName==ClubName().standardliege){    nationality=Words.country.belgium;}
    else if(clubName==ClubName().genk){    nationality=Words.country.belgium;}
    else if(clubName==ClubName().gent){    nationality=Words.country.belgium;}

    else if(clubName==ClubName().benfica){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().porto){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().sporting){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().braga){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().vitoriaguimaraes){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().gilVicente){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().maritimo){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().moreirense){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().boavista){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().portimonense){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().coimbra){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().rioAve){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().belenenses){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().pacosDeFerreira){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().estoril){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().nacionalMadeira){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().famalicao){    nationality=Words.country.portugal;}
    else if(clubName==ClubName().vitoriaSetubal){    nationality=Words.country.portugal;}

    else if(clubName==ClubName().ajax){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().feyenoord){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().psv){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().azAlkmaar){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().twente){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().utrecht){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().vitesse){    nationality=Words.country.netherlands;}
    else if(clubName==ClubName().heerenveen){    nationality=Words.country.netherlands;}

    else if(clubName==ClubName().celtic){    nationality=Words.country.scotland;}
    else if(clubName==ClubName().glasgowrangers){    nationality=Words.country.scotland;}
    else if(clubName==ClubName().hibernian){    nationality=Words.country.scotland;}
    else if(clubName==ClubName().rosenborg){    nationality=Words.country.norway;}
    else if(clubName==ClubName().molde){    nationality=Words.country.norway;}
    else if(clubName==ClubName().malmo){    nationality=Words.country.sweden;}
    else if(clubName==ClubName().copenhague){    nationality=Words.country.denmark;}
    else if(clubName==ClubName().midtjylland){    nationality=Words.country.denmark;}
    else if(clubName==ClubName().helsinki){    nationality=Words.country.finland;}

    else if(clubName==ClubName().rbsalzburg){    nationality=Words.country.austria;}
    else if(clubName==ClubName().rapidviena){    nationality=Words.country.austria;}
    else if(clubName==ClubName().laskLinz){    nationality=Words.country.austria;}
    else if(clubName==ClubName().sturmGraz){    nationality=Words.country.austria;}
    else if(clubName==ClubName().basel){    nationality=Words.country.switzerland;}
    else if(clubName==ClubName().youngBoys){    nationality=Words.country.switzerland;}
    else if(clubName==ClubName().zurich){    nationality=Words.country.switzerland;}
    else if(clubName==ClubName().legiaWarszawa){    nationality=Words.country.poland;}
    else if(clubName==ClubName().lechPoznan){    nationality=Words.country.poland;}

    else if(clubName==ClubName().galatasaray){    nationality=Words.country.turkey;}
    else if(clubName==ClubName().fenerbahce){    nationality=Words.country.turkey;}
    else if(clubName==ClubName().besiktas){    nationality=Words.country.turkey;}
    else if(clubName==ClubName().trabzonspor){    nationality=Words.country.turkey;}
    else if(clubName==ClubName().instanbul){    nationality=Words.country.turkey;}
    else if(clubName==ClubName().olympiacos){    nationality=Words.country.greece;}
    else if(clubName==ClubName().sivasspor){    nationality=Words.country.greece;}
    else if(clubName==ClubName().aek){    nationality=Words.country.greece;}
    else if(clubName==ClubName().paok){    nationality=Words.country.greece;}
    else if(clubName==ClubName().panathinaikos){    nationality=Words.country.greece;}
    else if(clubName==ClubName().apoel){    nationality=Words.country.cyprus;}

    else if(clubName==ClubName().zenit){    nationality=Words.country.russia;}
    else if(clubName==ClubName().cska){    nationality=Words.country.russia;}
    else if(clubName==ClubName().spartakmoscou){    nationality=Words.country.russia;}
    else if(clubName==ClubName().krasnodar){    nationality=Words.country.russia;}
    else if(clubName==ClubName().sochi){    nationality=Words.country.russia;}
    else if(clubName==ClubName().rubinKazan){    nationality=Words.country.russia;}
    else if(clubName==ClubName().lokomotivMoscou){    nationality=Words.country.russia;}
    else if(clubName==ClubName().dinamoMoscou){    nationality=Words.country.russia;}

    else if(clubName==ClubName().shaktardonetsk){    nationality=Words.country.ukraine;}
    else if(clubName==ClubName().dinamokiev){    nationality=Words.country.ukraine;}
    else if(clubName==ClubName().sheriffTiraspol){    nationality=Words.country.moldova;}
    else if(clubName==ClubName().bate){    nationality=Words.country.belarus;}
    else if(clubName==ClubName().qarabag){    nationality=Words.country.azerbaijan;}
    else if(clubName==ClubName().astana){    nationality=Words.country.kazakhstan;}

    else if(clubName==ClubName().estrelavermelha){    nationality=Words.country.serbia;}
    else if(clubName==ClubName().partizan){    nationality=Words.country.serbia;}
    else if(clubName==ClubName().ludogorets){    nationality=Words.country.bulgaria;}
    else if(clubName==ClubName().cskaSofia){    nationality=Words.country.bulgaria;}
    else if(clubName==ClubName().cluj){    nationality=Words.country.romania;}
    else if(clubName==ClubName().vardar){    nationality=Words.country.macedonia;}
    else if(clubName==ClubName().dinamozagreb){    nationality=Words.country.croatia;}
    else if(clubName==ClubName().slovanBratislava){    nationality=Words.country.slovenia;}
    else if(clubName==ClubName().spartapraga){    nationality=Words.country.czechRepublic;}
    else if(clubName==ClubName().slaviaPraha){    nationality=Words.country.czechRepublic;}
    else if(clubName==ClubName().ferencvaros){    nationality=Words.country.hungary;}
    else if(clubName==ClubName().steauaBucureste){    nationality=Words.country.romania;}
    else if(clubName==ClubName().maccabiTelAviv){    nationality=Words.country.israel;}

    ///////////////////////////////////////////////////////////////////////////
    else if(clubName==ClubName().atleticomg){       nationality=Words.country.brazil;}
    else if(clubName==ClubName().atleticopr){       nationality=Words.country.brazil;}
    else if(clubName==ClubName().bahia){     nationality=Words.country.brazil; }
    else if(clubName==ClubName().botafogo){  nationality=Words.country.brazil; }
    else if(clubName==ClubName().corinthians){       nationality=Words.country.brazil;}
    else if(clubName==ClubName().cruzeiro){  nationality=Words.country.brazil; }
    else if(clubName==ClubName().flamengo){  nationality=Words.country.brazil;}
    else if(clubName==ClubName().fluminense){nationality=Words.country.brazil;}
    else if(clubName==ClubName().gremio){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().goias){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().internacional){     nationality=Words.country.brazil;}
    else if(clubName==ClubName().palmeiras){    nationality=Words.country.brazil;   }
    else if(clubName==ClubName().santos){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().saopaulo){ nationality=Words.country.brazil;}
    else if(clubName==ClubName().sport){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().vasco){    nationality=Words.country.brazil;}

    else if(clubName==ClubName().americamg){nationality=Words.country.brazil;}
    else if(clubName==ClubName().atleticogo){nationality=Words.country.brazil;}
    else if(clubName==ClubName().cuiaba){nationality=Words.country.brazil;}
    else if(clubName==ClubName().chapecoense){    nationality=Words.country.brazil;     }
    else if(clubName==ClubName().bragantino){    nationality=Words.country.brazil;      }
    else if(clubName==ClubName().ceara){       nationality=Words.country.brazil;}
    else if(clubName==ClubName().coritiba){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().criciuma){    nationality=Words.country.brazil;}
    else if(clubName==ClubName().figueirense){ nationality=Words.country.brazil;}
    else if(clubName==ClubName().fortaleza){  nationality=Words.country.brazil; }
    else if(clubName==ClubName().guarani){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().juventude){ nationality=Words.country.brazil;  }
    else if(clubName==ClubName().nautico){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().parana){    nationality=Words.country.brazil;  }
    else if(clubName==ClubName().pontepreta){       nationality=Words.country.brazil;  }
    else if(clubName==ClubName().vitoria){    nationality=Words.country.brazil; }

    else if(clubName==ClubName().abc){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().bangu){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().americaRJ){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().americaRN){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().botafogoPB){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().botafogoSP){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().brusque){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().campinense){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().confianca){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().caxias){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().ituano){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().juventusMooca){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().gremioNovorizontino){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().crb){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().csa){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().joinville){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().londrina){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().mirassol){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().operarioPR){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().brasilPelotas){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().gama){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().remo){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().paysandu){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().manaus){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().vilanova){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().abc){  nationality=Words.country.brazil;  }
    else if(clubName==ClubName().avai){nationality=Words.country.brazil;}
    else if(clubName==ClubName().paulista){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().portuguesa){ nationality=Words.country.brazil;  }
    else if(clubName==ClubName().santacruz){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().sampaio){    nationality=Words.country.brazil; }
    else if(clubName==ClubName().santoandre){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().saocaetano){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().tombense){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().treze){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().voltaredonda){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().brasiliense){nationality=Words.country.brazil;  }
    else if(clubName==ClubName().xvpiracicaba){nationality=Words.country.brazil;  }


    ///////////////////////////////////////////////
    else if(clubName==ClubName().argentinojuniors){       nationality=Words.country.argentina;}
    else if(clubName==ClubName().arsenalsarandi){    nationality=Words.country.argentina;     }
    else if(clubName==ClubName().banfield){    nationality=Words.country.argentina;      }
    else if(clubName==ClubName().belgrano){    nationality=Words.country.argentina;      }
    else if(clubName==ClubName().bocajuniors){       nationality=Words.country.argentina;}
    else if(clubName==ClubName().colon){nationality=Words.country.argentina;}
    else if(clubName==ClubName().defensayjusticia){nationality=Words.country.argentina;}
    else if(clubName==ClubName().estudiantes){    nationality=Words.country.argentina;}
    else if(clubName==ClubName().independiente){ nationality=Words.country.argentina;}
    else if(clubName==ClubName().huracan){     nationality=Words.country.argentina; }
    else if(clubName==ClubName().lanus){       nationality=Words.country.argentina; }
    else if(clubName==ClubName().newells){ nationality=Words.country.argentina;  }
    else if(clubName==ClubName().racing){       nationality=Words.country.argentina; }
    else if(clubName==ClubName().riverplate){    nationality=Words.country.argentina;  }
    else if(clubName==ClubName().rosariocentral){  nationality=Words.country.argentina;  }
    else if(clubName==ClubName().sanlorenzo){  nationality=Words.country.argentina;  }
    else if(clubName==ClubName().talleres){      nationality=Words.country.argentina;  }
    else if(clubName==ClubName().velezsarsfield){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().gimnasia){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().tigre){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().atleticoTucuman){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().godoycruz){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().quilmes){    nationality=Words.country.argentina; }
    else if(clubName==ClubName().unionSantaFe){    nationality=Words.country.argentina; }

    else if(clubName==ClubName().penarol){       nationality=Words.country.uruguay;}
    else if(clubName==ClubName().nacional){    nationality=Words.country.uruguay;     }
    else if(clubName==ClubName().montevideo){ nationality=Words.country.uruguay;  }
    else if(clubName==ClubName().olimpia){    nationality=Words.country.paraguay;      }

    else if(clubName==ClubName().cerroporteno){       nationality=Words.country.paraguay;}
    else if(clubName==ClubName().libertad){nationality=Words.country.paraguay;}
    else if(clubName==ClubName().guaraniPAR){ nationality=Words.country.paraguay;  }
    else if(clubName==ClubName().nacionalPAR){ nationality=Words.country.paraguay;  }

    else if(clubName==ClubName().colocolo){    nationality=Words.country.chile;}
    else if(clubName==ClubName().lau){ nationality=Words.country.chile;}
    else if(clubName==ClubName().univcatolica){     nationality=Words.country.chile; }
    else if(clubName==ClubName().palestino){ nationality=Words.country.chile;  }
    else if(clubName==ClubName().huachipato){ nationality=Words.country.chile;  }
    else if(clubName==ClubName().laCalera){ nationality=Words.country.chile;  }

    else if(clubName==ClubName().alianzalima){ nationality=Words.country.peru;  }
    else if(clubName==ClubName().sportingcristal){       nationality=Words.country.peru; }
    else if(clubName==ClubName().cienciano){    nationality=Words.country.peru;  }
    else if(clubName==ClubName().universitario){ nationality=Words.country.peru;  }
    else if(clubName==ClubName().melgar){ nationality=Words.country.peru;  }
    else if(clubName==ClubName().jorge){ nationality=Words.country.peru;  }

    else if(clubName==ClubName().bolivar){       nationality=Words.country.bolivia; }
    else if(clubName==ClubName().theStrongest){ nationality=Words.country.bolivia;  }
    else if(clubName==ClubName().alwaysReady){ nationality=Words.country.bolivia;  }

    else if(clubName==ClubName().barcelonaequ){  nationality=Words.country.ecuador;  }
    else if(clubName==ClubName().emelec){  nationality=Words.country.ecuador;  }
    else if(clubName==ClubName().ldu){      nationality=Words.country.ecuador;  }
    else if(clubName==ClubName().idelvalle){ nationality=Words.country.ecuador;  }

    else if(clubName==ClubName().caracas){    nationality=Words.country.venezuela; }
    else if(clubName==ClubName().laGuaira){ nationality=Words.country.venezuela;  }
    else if(clubName==ClubName().deportivoTachira){ nationality=Words.country.venezuela;  }

    else if(clubName==ClubName().americadecali){       nationality=Words.country.colombia;}
    else if(clubName==ClubName().atleticonacional){    nationality=Words.country.colombia;     }
    else if(clubName==ClubName().deportivocali){    nationality=Words.country.colombia;      }
    else if(clubName==ClubName().junior){       nationality=Words.country.colombia;}
    else if(clubName==ClubName().imedellin){nationality=Words.country.colombia;}
    else if(clubName==ClubName().oncecaldas){    nationality=Words.country.colombia;}
    else if(clubName==ClubName().millonarios){ nationality=Words.country.colombia;}
    else if(clubName==ClubName().santafe){     nationality=Words.country.colombia; }
    else if(clubName==ClubName().tolima){ nationality=Words.country.colombia;  }

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    else if(clubName==ClubName().atlante){       nationality=Words.country.mexico; }
    else if(clubName==ClubName().americamex){       nationality=Words.country.mexico; }
    else if(clubName==ClubName().chivasguadalajara){ nationality=Words.country.mexico;  }
    else if(clubName==ClubName().cruzazul){       nationality=Words.country.mexico; }
    else if(clubName==ClubName().monterrey){    nationality=Words.country.mexico;  }
    else if(clubName==ClubName().pachuca){  nationality=Words.country.mexico;  }
    else if(clubName==ClubName().pumas){  nationality=Words.country.mexico;  }
    else if(clubName==ClubName().tigres){      nationality=Words.country.mexico;  }
    else if(clubName==ClubName().toluca){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().tijuana){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().atlas){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().queretaro){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().necaxa){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().santosLaguna){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().puebla){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().juarez){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().leon){    nationality=Words.country.mexico; }
    else if(clubName==ClubName().leonesNegros){    nationality=Words.country.mexico; }
    //USA
    else if(clubName==ClubName().atlantaunited){       nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().minnesota){    nationality=Words.country.unitedStates;     }
    else if(clubName==ClubName().columbuscrew){       nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().chicagoFire){       nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().colorado){       nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().dcunited){    nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().fcdallas){ nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().houston){    nationality=Words.country.unitedStates;}
    else if(clubName==ClubName().lagalaxy){    nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().montreal){    nationality=Words.country.canada;  }
    else if(clubName==ClubName().nerevolution){       nationality=Words.country.unitedStates; }
    else if(clubName==ClubName().nycity){  nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().nyredbulls){    nationality=Words.country.unitedStates;      }
    else if(clubName==ClubName().orlando){     nationality=Words.country.unitedStates; }
    else if(clubName==ClubName().portland){       nationality=Words.country.unitedStates; }
    else if(clubName==ClubName().seattle){    nationality=Words.country.unitedStates; }
    else if(clubName==ClubName().intermiami){  nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().philadelphia){      nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().torontofc){      nationality=Words.country.canada;  }
    else if(clubName==ClubName().realSaltLake){ nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().sanJoseEarthquakes){ nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().sportingKansasCity){ nationality=Words.country.unitedStates;  }
    else if(clubName==ClubName().vancouver){ nationality=Words.country.canada;  }
    else if(clubName==ClubName().losangelesfc){ nationality=Words.country.unitedStates;  }

    //////////////////////////////////////////////////////////////////////////////////
    else if(clubName==ClubName().ghuagzhouevergrande){       nationality=Words.country.china;}
    else if(clubName==ClubName().beijingguoan){    nationality=Words.country.china;     }
    else if(clubName==ClubName().shandongluneng){    nationality=Words.country.china;      }
    else if(clubName==ClubName().shanghaisipg){       nationality=Words.country.china;}

    else if(clubName==ClubName().kashimaantlers){nationality=Words.country.japan;}
    else if(clubName==ClubName().urawareddiamonds){    nationality=Words.country.japan;}
    else if(clubName==ClubName().visselkobe){     nationality=Words.country.japan; }
    else if(clubName==ClubName().kawasakifrontale){       nationality=Words.country.japan; }
    if(clubName==ClubName().fcTokyo){ nationality=Words.country.japan;}
    else if(clubName==ClubName().cerezoOsaka){ nationality=Words.country.japan;}
    else if(clubName==ClubName().gambaOsaka){ nationality=Words.country.japan;}
    else if(clubName==ClubName().kashiwaReysol){ nationality=Words.country.japan;}
    else if(clubName==ClubName().yokohamaMarinos){ nationality=Words.country.japan;}

    else if(clubName==ClubName().jeonbuk){    nationality=Words.country.southKorea; }
    else if(clubName==ClubName().pohang){      nationality=Words.country.southKorea;  }
    else if(clubName==ClubName().ulsan){ nationality=Words.country.southKorea;}
    else if(clubName==ClubName().fcSeoul){ nationality=Words.country.southKorea;}
    else if(clubName==ClubName().suwonSamsung){ nationality=Words.country.southKorea;}
    else if(clubName==ClubName().ulsan){ nationality=Words.country.southKorea;}

    //ORIENTE MÉDIO
    else if(clubName==ClubName().alsadd){       nationality=Words.country.qatar; }
    else if(clubName==ClubName().alduhail){    nationality=Words.country.qatar;  }
    else if(clubName==ClubName().aljazira){      nationality=Words.country.uae;  }
    else if(clubName==ClubName().alain){ nationality=Words.country.uae;  }
    else if(clubName==ClubName().alWahda){ nationality=Words.country.uae;}
    else if(clubName==ClubName().alhilal){  nationality=Words.country.southArabia;  }
    else if(clubName==ClubName().alnassr){      nationality=Words.country.southArabia;  }
    else if(clubName==ClubName().alIttihad){ nationality=Words.country.southArabia;}
    else if(clubName==ClubName().alShabab){ nationality=Words.country.southArabia;}

    else if(clubName==ClubName().persepolis){      nationality=Words.country.iran;  }
    else if(clubName==ClubName().melbourneVictory){ nationality=Words.country.australia;}
    else if(clubName==ClubName().sydney){ nationality=Words.country.australia;}
    else if(clubName==ClubName().buriramUnited){ nationality=Words.country.thailand;}

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    else if(clubName==ClubName().alahli){  nationality=Words.country.egypt;  }
    else if(clubName==ClubName().zamalek){ nationality=Words.country.egypt;}
    else if(clubName==ClubName().mazembe){ nationality=Words.country.congoRD;}
    else if(clubName==ClubName().rajacasablanca){      nationality=Words.country.morocco;  }
    else if(clubName==ClubName().wydad){ nationality=Words.country.morocco;}
    else if(clubName==ClubName().orlandoPirates){ nationality=Words.country.southAfrica;}
    else if(clubName==ClubName().kaizer){ nationality=Words.country.southAfrica;}
    else if(clubName==ClubName().esperance){ nationality=Words.country.tunisia;}
    else if(clubName==ClubName().mamelodi){ nationality=Words.country.southAfrica;}
    else if(clubName==ClubName().agosto){ nationality=Words.country.angola;}
    else if(clubName==ClubName().usmAlger){ nationality=Words.country.algeria;}
    else if(clubName==ClubName().etoileSahel){ nationality=Words.country.tunisia;}
    else if(clubName==ClubName().esSetif){ nationality=Words.country.algeria;}
    else if(clubName==ClubName().cotonsport){ nationality=Words.country.cameroon;}
    else if(clubName==ClubName().enyimba){ nationality=Words.country.nigeria;}
    else if(clubName==ClubName().asecMimosas){ nationality=Words.country.ivorycoast;}

    return nationality;
  }

}