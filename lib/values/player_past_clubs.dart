import 'package:fifa/values/club_names.dart';

class PlayerPastClubs{

  final ClubName _name = ClubName();
  Map map = {};
  String retired = 'retired';

  PlayerPastClubs(){

  map['Sergio Agüero'] = {    2003: _name.independiente,2006:_name.atleticomadrid,2011:_name.manchestercity,2021:_name.barcelona,2022:retired,  };
  map['Arrascaeta'] = {    2012:_name.defensor,2015:_name.cruzeiro,2019:_name.flamengo,};
  map['Aubameyang'] = {    2008:_name.dijon,2009:_name.lille,2010:_name.monaco,2011:_name.saintetienne,2013: _name.dortmund,2018:_name.arsenal,2022:_name.barcelona  };
  map['Benzema'] = {    2005:_name.lyon,2009:_name.realmadrid  };
  map['Buffon'] = {    1995:_name.parma,2001:_name.juventus,2018:_name.psg,2019:_name.juventus,2021:_name.parma,2023:retired  };
  map['Bruno Fernandes'] = {    2012:_name.novara,2013:_name.udinese,2016: _name.sampdoria,2017:_name.sporting,2020:_name.manchesterunited  };
  map['Casemiro'] = {2010:_name.saopaulo,2013:_name.realmadrid,2014:_name.porto,2015:_name.realmadrid,};
  map['Chiellini'] = {    2000: _name.livorno,2004:_name.fiorentina,2005:_name.juventus,2022:_name.losangelesfc,  };
  map['Courtois'] = {    2009: _name.genk,2011: _name.atleticomadrid,2014: _name.chelsea,2018:_name.realmadrid  };
  map['De Bruyne'] = {    2008: _name.genk,2012: _name.werderbremen,2013:_name.chelsea,2014:_name.wolfsburg,2015: _name.manchestercity  };
  map['Di Maria'] = {    2005: _name.rosario,2007:_name.benfica,2010:_name.realmadrid,2014:_name.manchesterunited,2015: _name.psg,2022: _name.juventus,  };
  map['Dybala'] = {    2011: _name.instituto,2012:_name.palermo,2015:_name.juventus,2022:_name.roma  };
  map['Dudu'] = {    2009: _name.cruzeiro,2010:_name.coritiba,2011:_name.dinamokiev,2014:_name.gremio,2015:_name.palmeiras,2020:_name.alduhail,2021:_name.palmeiras  };
  map['Haaland'] = {    2017: _name.molde,2019: _name.rbsalzburg,2020:_name.dortmund,2022:_name.manchestercity,  };
  map['Higuain'] = {    2005: _name.riverplate,2006:_name.realmadrid,2013:_name.napoli,2016:_name.juventus,2018:_name.milan,2019:_name.chelsea,2020:_name.intermiami  };
  map['Hulk'] = {    2004: _name.vitoria,2005: _name.kawasakifrontale,2006: _name.sapporo,2007: _name.tokyoVerdy,2008: _name.porto,2012: _name.zenit,2020: _name.shanghaisipg,2021:_name.atleticomg  };
  map['Ibrahimovic'] = {    1999: _name.malmo,2001:_name.ajax,2004:_name.juventus,2006:_name.inter,2009:_name.barcelona,2010:_name.milan,2012:_name.psg,2016:_name.manchesterunited,2018:_name.lagalaxy,2020:_name.milan  };
  map['Immobile'] = {    2010: _name.siena,2011: _name.pescara,2012:_name.genoa,2013:_name.torino,2014:_name.dortmund,2015:_name.sevilla,2016:_name.lazio  };
  map['Kroos'] = {    2007: _name.bayernmunique,2009: _name.leverkusen,2010: _name.bayernmunique,2014:_name.realmadrid  };
  map['Lewandowski'] = {    2008: _name.lechPoznan,2010:_name.dortmund,2014: _name.bayernmunique,2023:_name.barcelona,  };
  map['Marcelo'] = {    2005: _name.fluminense,2007:_name.realmadrid  };
  map['Mbappé'] = {    2016: _name.monaco,2018:_name.psg  };
  map['Messi'] = {    2005: _name.barcelona,2022:_name.psg  };
  map['Modric'] = {    2003: _name.dinamozagreb,2004: _name.zrinjski,2005: _name.dinamozagreb,2008:_name.tottenham,2012:_name.realmadrid  };
  map['Neymar'] = {    2009: _name.santos,2014:_name.barcelona,2018:_name.psg  };
  map['Neuer'] = {    2006: _name.schalke04,2011:_name.bayernmunique  };
  map['Pogba'] = {    2011: _name.manchesterunited, 2012: _name.juventus,2016: _name.manchesterunited, 2022: _name.juventus  };
  map['Salah'] = {    2010: _name.almokawloon,2012:_name.basel,2014:_name.chelsea,2015:_name.roma,2017:_name.liverpool  };
  map['Sérgio Ramos'] = {    2004: _name.sevilla, 2005: _name.realmadrid,2021:_name.psg   };
  map['Francesco Totti'] = {    1992: _name.roma,2017:retired };
  map['Xavi'] = {    1998: _name.barcelona, 2015: _name.alsadd, 2019: retired  };

  }
}