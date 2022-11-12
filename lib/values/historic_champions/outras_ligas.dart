import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName _name = ClubName();
LeagueOfficialNames leagueName = LeagueOfficialNames();

Map<String,dynamic> outrasLigas = {

  leagueName.rioSP : {
    1966.0: [_name.botafogo,_name.santos,_name.vasco,_name.corinthians,_name.saopaulo,_name.palmeiras,_name.flamengo,_name.bangu,_name.fluminense,_name.portuguesa],
    1965.0: [_name.palmeiras,_name.vasco,_name.botafogo,_name.flamengo,_name.portuguesa,_name.saopaulo,_name.corinthians,_name.fluminense,_name.santos,_name.americaRJ],
    1964.0: [_name.botafogo,_name.santos,_name.palmeiras,_name.flamengo,_name.portuguesa,_name.bangu,_name.corinthians,_name.vasco,_name.fluminense,_name.saopaulo],
    1963.0: [_name.santos,_name.corinthians,_name.fluminense,_name.botafogo,_name.palmeiras,_name.portuguesa,_name.flamengo,_name.saopaulo,_name.vasco,_name.olaria],
    1962.0: [_name.botafogo,_name.saopaulo,_name.palmeiras,_name.flamengo,_name.americaRJ,_name.corinthians,_name.vasco,_name.portuguesa,_name.fluminense],
    1961.0: [_name.flamengo,_name.botafogo,_name.vasco,_name.palmeiras,_name.santos,_name.corinthians,_name.fluminense,_name.saopaulo,_name.americaRJ,_name.portuguesa],
    1960.0: [_name.fluminense,_name.botafogo,_name.vasco,_name.corinthians,_name.flamengo,_name.palmeiras,_name.saopaulo,_name.santos,_name.portuguesa,_name.americaRJ],
    1959.0: [_name.santos,_name.vasco,_name.flamengo,_name.palmeiras,_name.saopaulo,_name.americaRJ,_name.botafogo,_name.fluminense,_name.corinthians,_name.portuguesa],
    1958.0: [_name.vasco,_name.flamengo,_name.corinthians,_name.saopaulo,_name.botafogo,_name.fluminense,_name.santos,_name.palmeiras,_name.americaRJ,_name.portuguesa],
    1957.0: [_name.fluminense,_name.flamengo,_name.vasco,_name.santos,_name.portuguesa,_name.botafogo,_name.saopaulo,_name.palmeiras,_name.corinthians,_name.americaRJ],
    1956.0: [],
    1955.0: [_name.portuguesa,_name.palmeiras,_name.botafogo,_name.flamengo,_name.santos,_name.americaRJ,_name.fluminense,_name.vasco,_name.saopaulo,_name.corinthians],
    1954.0: [_name.corinthians,_name.fluminense,_name.palmeiras,_name.saopaulo,_name.vasco,_name.santos,_name.flamengo,_name.portuguesa,_name.americaRJ,_name.botafogo],
    1953.0: [_name.corinthians,_name.vasco,_name.saopaulo,_name.botafogo,_name.fluminense,_name.bangu,_name.palmeiras,_name.flamengo,_name.santos,_name.portuguesa],
    1952.0: [_name.portuguesa,_name.vasco,_name.corinthians,_name.fluminense,_name.santos,_name.botafogo,_name.saopaulo,_name.palmeiras,_name.bangu,_name.flamengo],
    1951.0: [_name.palmeiras,_name.corinthians,_name.bangu,_name.americaRJ,_name.flamengo,_name.portuguesa,_name.vasco,_name.saopaulo],
    1950.0: [_name.corinthians,_name.vasco,_name.portuguesa,_name.palmeiras,_name.flamengo,_name.saopaulo,_name.botafogo,_name.fluminense],
  },

  leagueName.latina : {
    1957.0: [_name.realmadrid,_name.benfica,_name.milan,_name.saintetienne],
    1956.0: [_name.milan,_name.athleticbilbao,_name.benfica,_name.nice],
    1955.0: [_name.realmadrid,_name.reims,_name.milan,_name.belenenses],
    1954.0: [],
    1953.0: [_name.reims,_name.milan,_name.sporting,_name.valencia],
    1952.0: [_name.barcelona,_name.nice,_name.juventus,_name.sporting],
    1951.0: [_name.milan,_name.lille,_name.atleticomadrid,_name.sporting],
    1950.0: [_name.benfica,_name.bordeaux,_name.atleticomadrid,_name.lazio],
    1949.0: [_name.barcelona,_name.sporting,_name.torino,_name.reims],
  },

};