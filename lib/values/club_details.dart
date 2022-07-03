import 'package:fifa/values/club_names.dart';
import 'package:flutter/material.dart';
class ClubColors{
  late Color primaryColor;
  late Color secondColor;
  ClubColors(this.primaryColor,this.secondColor);
}
class Coordinates{
  late double latitude;
  late double longitude;
  Coordinates(this.latitude,this.longitude);
}
class ClubDetails{

  Map mapDetails = {};
  ClubColors getColors(String clubName){
    return mapDetails[clubName][0];
  }
  Coordinates getCoordinate(String clubName){
    return mapDetails[clubName][1];
  }
  String getStadium(String clubName){
    return mapDetails[clubName][2];
  }
  int getStadiumCapacity(String clubName){
    return mapDetails[clubName][3];
  }
  int getFoundationYear(String clubName){
    return mapDetails[clubName][4];
  }
  List getRivals(String clubName){
    return mapDetails[clubName][5] ?? [];
  }

  ClubDetails(){
    mapDetails['generico'] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'',0,1900};
    Color darkblue = const Color(0xFF001050);
    Color blue = const Color(0xFF001FBB);
    Color grena = const Color(0xFF760025);
    ClubName _name = ClubName();
    mapDetails[_name.arsenal] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Emirates',60704,1886,[_name.tottenham,_name.chelsea]};
    mapDetails[_name.astonvilla] = {ClubColors(Colors.purple,Colors.blueAccent),Coordinates(0,0),'Villa Park',42660,1874,[_name.birmigham]};
    mapDetails[_name.crystalpalace] = {ClubColors(Colors.purple,Colors.blueAccent),Coordinates(0,0),'	Selhurst Park',26047,1905};
    mapDetails[_name.chelsea] = {ClubColors(blue,Colors.white),Coordinates(0,0),'Stamford Brigde',41837,1905,[_name.tottenham,_name.arsenal]};
    mapDetails[_name.everton] = {ClubColors(blue,Colors.white),Coordinates(0,0),'	Goodison Park',39571,1878,[_name.liverpool]};
    mapDetails[_name.leicester] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'King Power Stadium',39571,1884};
    mapDetails[_name.leeds] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Elland Road',37890,1919,};
    mapDetails[_name.liverpool] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Anfield',54167,1892,[_name.manchesterunited,_name.everton]};
    mapDetails[_name.manchestercity] = {ClubColors(Colors.lightBlue,Colors.white),Coordinates(0,0),'Etihad Stadium',53400,1880,[_name.manchesterunited]};
    mapDetails[_name.manchesterunited] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Old Trafford',76212,1878,[_name.manchestercity]};
    mapDetails[_name.newcastle] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'St. James Park',52409,1892,[_name.sunderland]};
    mapDetails[_name.southampton] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'St. Mary\'s',32690,1885,[_name.portsmouth]};
    mapDetails[_name.tottenham] = {ClubColors(Colors.white,darkblue),Coordinates(0,0),'Tottenham Hotspur Stadium',62850,1882,[_name.arsenal,_name.chelsea]};
    mapDetails[_name.westbromwich] = {ClubColors(darkblue,Colors.white),Coordinates(0,0),'The Hawthorns',26850,1878,[_name.wolves]};
    mapDetails[_name.westham] = {ClubColors(grena,Colors.blue),Coordinates(0,0),'Olímpico de Londres',60000,1895,[_name.millwall,_name.tottenham]};
    mapDetails[_name.wolves] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Molineux Stadium',32050,1877,[_name.westbromwich]};

    mapDetails[_name.birmigham] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'St Andrew\'s Stadium',30016,1875,[_name.astonvilla]};
    mapDetails[_name.blackburn] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Ewood Park',30016,1875,[_name.burnley]};
    mapDetails[_name.bournemouth] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Dean Court',11464,1890,[_name.southampton]};
    mapDetails[_name.burnley] = {ClubColors(Colors.purple,Colors.blueAccent),Coordinates(0,0),'Turf Moor',22546,1882,[_name.blackburn]};
    mapDetails[_name.brighton] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Falmer Stadium',30750,1901,[_name.crystalpalace]};
    mapDetails[_name.derbycount] = {ClubColors(Colors.white,Colors.white10),Coordinates(0,0),'Pride Park',33597,1884,[_name.nottinghamforest]};
    mapDetails[_name.fulham] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Craven Cottage',19000,1879,[_name.chelsea,_name.qpr]};
    mapDetails[_name.hullcity] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'KCOM Stadium',25400,1904,};
    mapDetails[_name.middlesbrough] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Riverside Stadium',34988,1876,[_name.newcastle]};
    mapDetails[_name.norwich] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Carrow Road',27033,1902,[_name.ipswichTown]};
    mapDetails[_name.nottinghamforest] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'City Ground',30446,1865,[_name.leicester]};
    mapDetails[_name.qpr] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Loftus Road',18439,1882,[_name.chelsea,_name.fulham]};
    mapDetails[_name.reading] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Madejski Stadium',24250,1871,};
    mapDetails[_name.sheffieldunited] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Bramall Lane',39859,1889,};
    mapDetails[_name.stoke] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'	Bet365 Stadium',30089,1863,};
    mapDetails[_name.swansea] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Swansea.com Stadium',21088,1912,[_name.cardiffCity]};
    mapDetails[_name.watford] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};


    mapDetails[_name.barnsley] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.blackpool] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.bradford] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.brentford] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.bolton] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.bristol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.cardiffCity] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.coventry] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.charlton] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.grimsby] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.huddersfield] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.ipswichTown] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.luton] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.millwall] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.notts] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.oxford] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.peterborough] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.portsmouth] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.plymouth] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.prestonNorthEnd] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.rotherham] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.shrewsbury] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.sheffieldWednesday] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.sunderland] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.swindon] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.wigan] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',21577,1881,[]};
    mapDetails[_name.wimbledon] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',21577,1881,[]};


    mapDetails[_name.atalanta] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'	Atleti Azzurri d\'Italia',21300,1907,};
    mapDetails[_name.bologna] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'	Renato Dall\'Ara',39444,1909,};
    mapDetails[_name.cagliari] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'Unipol Domus',16416,1920,};
    mapDetails[_name.fiorentina] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Artemio Franchi',47282,1926,};
    mapDetails[_name.genoa] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'Luigi Ferraris',36600,1893,};
    mapDetails[_name.inter] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Giuseppe Meazza',80018,1908,};
    mapDetails[_name.juventus] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Allianz Stadium',41507,1897,};
    mapDetails[_name.milan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Giuseppe Meazza',80018,1899,};
    mapDetails[_name.lazio] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Stadio Olimpico',73261,1900,};
    mapDetails[_name.napoli] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Diego Armando Maradona',54726,1926,};
    mapDetails[_name.parma] = {ClubColors(Colors.white,Colors.yellow),Coordinates(0,0),'Ennio Tardini',22359,1913,};
    mapDetails[_name.roma] = {ClubColors(Colors.deepOrange,Colors.red),Coordinates(0,0),'Stadio Olimpico',73261,1900,};
    mapDetails[_name.sampdoria] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Luigi Ferraris',36600,1946,};
    mapDetails[_name.sassuolo] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.torino] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Olímpico Grande Torino',27994,1906,};
    mapDetails[_name.udinese] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Friuli',25000,1896,};

    mapDetails[_name.ascoli] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bari] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.benevento] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brescia] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Mario Rigamonti',27592,1911,};
    mapDetails[_name.catania] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Angelo Massimino',26000,1946,};
    mapDetails[_name.cesena] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Dino Manuzzi',23860,1940,};
    mapDetails[_name.como] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cremonese] = {ClubColors(Colors.red,Colors.grey),Coordinates(0,0),'Estádio Giovanni Zini',16003,1913,};
    mapDetails[_name.chievo] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.crotone] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.empoli] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Carlo Castellanni',19847,1920,};
    mapDetails[_name.foggia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.frosinone] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hellasVerona] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Marcantonio Bentegodi',39371,1903,};
    mapDetails[_name.lecce] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Via del Mare',36285,1908,};
    mapDetails[_name.monza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Stadio Brianteo',18568,1912,};
    mapDetails[_name.palermo] = {ClubColors(Colors.purpleAccent,Colors.black),Coordinates(0,0),'Renzo Barbera',36871,1900,};
    mapDetails[_name.piacenza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.perugia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pisa] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Stadio Romeo Anconetani',17000,1909,};
    mapDetails[_name.reggina] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.salernitana] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Arechi',38000,1919,};
    mapDetails[_name.spal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Paolo Mazza',16751,1907,};
    mapDetails[_name.spezia] = {ClubColors(Colors.grey,Colors.white),Coordinates(0,0),'Alberto Picco',11466,1906,};
    mapDetails[_name.venezia] = {ClubColors(Colors.green,Colors.orange),Coordinates(0,0),'Pierluigi Penzo',9977,1907,};
    mapDetails[_name.vicenza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Romeo Menti',17163,1902,};

    mapDetails[_name.athleticbilbao] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'San Mamés',53289,1898,};
    mapDetails[_name.atleticomadrid] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Wanda Metropolitano',67829,1903,};
    mapDetails[_name.barcelona] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Camp Nou',99354,1899,};
    mapDetails[_name.celtavigo] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Balaídos',29000,1923,};
    mapDetails[_name.espanyol] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Cornellà-El Prat',40500,1900,};
    mapDetails[_name.getafe] = {ClubColors(Colors.blue,Colors.green),Coordinates(0,0),'Coliseum Alfonso Pérez',17700,1983,};
    mapDetails[_name.osasuna] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Reyno de Navarra',19800,1920,};
    mapDetails[_name.lacoruna] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Anoeta',39500,1909,};
    mapDetails[_name.levante] = {ClubColors(grena,Colors.blue),Coordinates(0,0),'	Ciutat de Valencia',25534,1909,};
    mapDetails[_name.realbetis] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Benito Villamarín',60720,1907,};
    mapDetails[_name.realmadrid] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Santiago Bernabeu',81044,1902,};
    mapDetails[_name.realsociedad] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Anoeta',39500,1909,};
    mapDetails[_name.sevilla] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Ramón Sánchez Pizjuán',43883,1890,};
    mapDetails[_name.valladolid] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'José Zorrilla',26512,1928,};
    mapDetails[_name.valencia] = {ClubColors(Colors.white,Colors.orange),Coordinates(0,0),'Mestalla',10000,1900,};
    mapDetails[_name.villareal] = {ClubColors(Colors.yellow,Colors.yellow),Coordinates(0,0),'La Cerámica',23500,1923,};

    mapDetails[_name.alaves] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Mendizorroza',19840,1921,};
    mapDetails[_name.albacete] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.almeria] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estadio de los Juegos Mediterráneos',22000,1989,};
    mapDetails[_name.alcorcon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticomadridB] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.barcelonaB] = {ClubColors(grena,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.badajoz] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.burgos] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio Municipal de El Plantío',12200,1994,};
    mapDetails[_name.cadiz] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estadio Ramón de Carranza',20724,1910,};
    mapDetails[_name.cartagena] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.compostela] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cordoba] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estadio Nuevo Arcángel',25100,1954,};
    mapDetails[_name.eibar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.elche] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Martínez Valero',36017,1922,};
    mapDetails[_name.extremadura] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.girona] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Montilivi',13500,1930,};
    mapDetails[_name.tarragona] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.granada] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Nuevo Los Cármenes',22524,1931,};
    mapDetails[_name.hercules] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio José Rico Pérez',29500,1922,};
    mapDetails[_name.huelva] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huesca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ibiza] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lasPalmas] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio Gran Canaria',31250,1949,};
    mapDetails[_name.leganes] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Municipal de Butarque',10958,1928,};
    mapDetails[_name.malaga] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'La Rosaleda',30044,1948,};
    mapDetails[_name.mallorca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Iberostar Estádio',23142,1916,};
    mapDetails[_name.merida] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.murcia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.numancia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rayoVallecano] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Vallecas Campo de Futebol',15105,1924,};
    mapDetails[_name.realmadridB] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.salamanca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sportingGijon] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tenerife] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Heliodoro López',24000,1912,};
    mapDetails[_name.toledo] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realOviedo] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.xerez] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zaragoza] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'La Romareda',34596,1932,};

    mapDetails[_name.moenchengladbach] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Borussia-Park',54022,1900,};
    mapDetails[_name.dortmund] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Signal Iduna Park',81359,1909,[_name.schalke04]};
    mapDetails[_name.bayernmunique] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Allianz Arena',75024,1900,};
    mapDetails[_name.leverkusen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'BayArena',30210,1904,};
    mapDetails[_name.eintrachtfrankfurt] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Deutsche Bank Park',51500,1899,};
    mapDetails[_name.augsburg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'SGL Arena',30660,1907,};
    mapDetails[_name.freiburg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Europa-Park Stadion',34700,1904,};
    mapDetails[_name.hamburgo] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Volksparkstadion',57000,1887,};
    mapDetails[_name.colonia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'RheinEnergieStadion',50000,1948,};
    mapDetails[_name.herthaberlim] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Olímpico de Berlim',74649,1892,};
    mapDetails[_name.hoffenheim] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Rhein-Neckar-Arena',30150,1899,};
    mapDetails[_name.rbleipzig] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Red Bull Arena',42146,2009,};
    mapDetails[_name.schalke04] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Veltins-Arena',62271,1904,};
    mapDetails[_name.stuttgart] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Mercedes-Benz Arena',60441,1893,};
    mapDetails[_name.werderbremen] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Wohninvest Weserstadion',42100,1899,};
    mapDetails[_name.wolfsburg] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Volkswagen Arena',30000,1945,};

    mapDetails[_name.aachen] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.arminiaBiefeld] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Bielefelder Alm',27300,1905,};
    mapDetails[_name.berliner] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Dynamo-Sportforum',10000,1953,};
    mapDetails[_name.bochum] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Vonovia Ruhrstadion',27599,1848,};
    mapDetails[_name.darmstadt] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.duisburg] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dynamoDresden] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'DDV-Stadion',32066,1953,};
    mapDetails[_name.erzgebirgeaue] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.energieCottbus] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.eintrachtBraunschweiger] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fortunaDusseldorf] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hannover96] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'HDI-Arena',49000,1896,};
    mapDetails[_name.hansaRostock] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.greutherFurth] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.karlsruher] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Wildparkstadion',32306,1894,};
    mapDetails[_name.kaiserslautern] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Fritz Walter',49850,1900,};
    mapDetails[_name.magdeburg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mainz05] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Opel Arena',34034,1905,};
    mapDetails[_name.munique1860] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Grünwalder Stadion',15000,1860,};
    mapDetails[_name.neunkirchen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nurnberg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Max-Morlock-Stadion',49923,1900,};
    mapDetails[_name.oberhausen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.paderborn] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Benteler-Arena',15000,1907,};
    mapDetails[_name.uerdigen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rotWeissEssen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saarbrucken] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.unionBerlin] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'An der Alten Försterei',22012,1966,};
    mapDetails[_name.vorwarts] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.stPauli] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Millerntor-Stadion',29546,1910,};

    mapDetails[_name.bordeaux] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Matmut Atlantique',42052,1881,};
    mapDetails[_name.lille] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Pierre-Mauroy',50186,1944,};
    mapDetails[_name.lyon] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Parc Olympique Lyonnais',59186,1950,};
    mapDetails[_name.monaco] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Louis II',18523,1924,};
    mapDetails[_name.montpellier] = {ClubColors(Colors.blue,Colors.orange),Coordinates(0,0),'Stade de la Mosson',32939,1919,[_name.nimes]};
    mapDetails[_name.nantes] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Stade de la Beaujoire',37463,1943,};
    mapDetails[_name.nice] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Allianz Riviera',35624,1904,};
    mapDetails[_name.om] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Vélodrome',67395,1899,};
    mapDetails[_name.psg] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Parc des Princes',48583,1970,};
    mapDetails[_name.reims] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Auguste Delaune',21668,1931,};
    mapDetails[_name.rennes] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Roazhon Park',29778,1901,};
    mapDetails[_name.saintetienne] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Geoffroy-Guichard',42000,1919,};
    mapDetails[_name.metz] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Stade Saint-Symphorien',26700,1919,};

    mapDetails[_name.ajaccio] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'François Coty',12000,1910,};
    mapDetails[_name.angers] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.auxerre] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Stade l\'Abbé-Deschamps',23467,1905,};
    mapDetails[_name.bastia] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Stade Armand Cesari',16500,1905,};
    mapDetails[_name.brest] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.caen] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Michel d\'Ornano',21500,1913,};
    mapDetails[_name.clermont] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Stade Gabriel-Montpied',10607,1990,};
    mapDetails[_name.dijon] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guingamp] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lens] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Félix Bollaert',41229,1906,};
    mapDetails[_name.lorient] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Stade du Moustoir',18500,1926,};
    mapDetails[_name.nancy] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Stade Marcel Picot',20085,1967,};
    mapDetails[_name.nimes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Stade des Costières',18482,1937,[_name.montpellier]};
    mapDetails[_name.parisFC] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Stade Sébastien Charléty',20000,1969,};
    mapDetails[_name.redstar] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Stade Bauer',10000,1897,};
    mapDetails[_name.rouen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sedan] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Stade Louis Dugauguez',23189,1919,};
    mapDetails[_name.sochaux] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Auguste Bonal',20005,1928,};
    mapDetails[_name.strasbourg] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Stade de la Meinau',26109,1906,};
    mapDetails[_name.toulouse] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Stade de Toulouse',35500,1937,};
    mapDetails[_name.troyes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Stade de l\'Aube',20400,1900,};
    mapDetails[_name.valenciennes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Stade du Hainaut',25172,1913,};

    mapDetails[_name.benfica] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio da Luz',64642,1904,};
    mapDetails[_name.porto] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio do Dragão',50035,1893,};
    mapDetails[_name.sporting] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'José Alvalade',50095,1906,};
    mapDetails[_name.arouca] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.beiramar] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.braga] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Municipal de Braga',30286,1921,};
    mapDetails[_name.boavista] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio do Bessa Século XXI',28263,1903,};
    mapDetails[_name.belenenses] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio do Restelo',32000,1919,};
    mapDetails[_name.chaves] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.coimbra] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio Cidade de Coimbra',29622,1887,};
    mapDetails[_name.estoril] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'António Coimbra da Mota',8000,1939,};
    mapDetails[_name.estrelaamadora] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.famalicao] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Estádio Municipal de Famalicão',5307,1931,};
    mapDetails[_name.farense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.gilVicente] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio Cidade de Barcelos',12046,1924,};
    mapDetails[_name.leixoes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.maritimo] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Estádio do Marítimo',10932,1910,};
    mapDetails[_name.moreirense] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Comendador Joaquim de Almeida Freitas',6153,1938,};
    mapDetails[_name.nacionalMadeira] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio da Madeira',5500,1910,};
    mapDetails[_name.pacosDeFerreira] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.portimonense] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.olhanense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rioAve] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio do Rio Ave FC',5000,1939,};
    mapDetails[_name.salgueiros] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.santaClara] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.uniaoLeiria] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tondela] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.viseu] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio do Fontelo',6912,1914,};
    mapDetails[_name.vizela] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vitoriaguimaraes] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'D. Afonso Henriques',30146,1922,};
    mapDetails[_name.vitoriaSetubal] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.ajax] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Johan Cruijff Arena',54990,1900,};
    mapDetails[_name.feyenoord] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'De Kuip',51577,1908,};
    mapDetails[_name.psv] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Philips Stadion',35000,1912,};
    mapDetails[_name.azAlkmaar] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'AFAS Stadium',17023,1967,};
    mapDetails[_name.twente] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'De Grolsch Veste',30205,1965,};
    mapDetails[_name.utrecht] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Galgenwaard',24426,1970,};
    mapDetails[_name.vitesse] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'GelreDome',21248,1892,};
    mapDetails[_name.heerenveen] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.spartarotterdam] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.willem] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dws] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rapidjc] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    


    mapDetails[_name.anderlecht] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Constant Vanden Stock',28063,1908,};
    mapDetails[_name.brugge] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Jan Breydel',30000,1891,};
    mapDetails[_name.standardliege] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Maurice Dufrasne',30030,1898,};
    mapDetails[_name.genk] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Cristal Stadium',24604,1988,};
    mapDetails[_name.gent] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lierse] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.royalAntwerp] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mechelen] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.charleroi] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Stade du Pays de Charleroi',25000,1904,};
    mapDetails[_name.beveren] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.molenbeek] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //ESCOCIA
    mapDetails[_name.celtic] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Celtic Park',60355,1888,};
    mapDetails[_name.rangers] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Ibrox Stadium',50817,1872,};
    mapDetails[_name.aberdeen] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Pittodrie Stadium',22199,1903,};
    mapDetails[_name.dundee] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Tannadice Park',14209,1909,};
    mapDetails[_name.hibernian] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Easter Road',20421,1875,};
    mapDetails[_name.kilmarnock] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.linfield] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.glentoran] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.newsaints] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //IRLANDA
    mapDetails[_name.bohemian] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cork] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.derry] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dundalk] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.shamrock] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    //NORDICOS
    //NORUEGA
    mapDetails[_name.fredrikstad] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.glimt] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rosenborg] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Lerkendal Stadion',21405,1917,};
    mapDetails[_name.molde] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Aker Stadion',11167,1911,};
    mapDetails[_name.lillestrom] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valerenga] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    //SUECIA
    mapDetails[_name.aik] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio Gamla Ullevi',18416,1904,};
    mapDetails[_name.atvidabergs] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.djurgarden] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.elfsborg] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hammarby] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.helsingborg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kalmar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ifkgoteborg] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lyn] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.malmo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Eleda Stadion',24000,1910,};
    mapDetails[_name.norrkoping] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    //DINAMARCA
    mapDetails[_name.copenhague] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.midtjylland] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brondby] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.randers] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.obodense] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lyngby] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aalborg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aarhus] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.horsens] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nordsjaelland] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.esbjerg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hvidovre] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.b1909] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.b1903] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ab] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vejle] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //FINLANDIA
    mapDetails[_name.helsinki] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.haka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kuusysi] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lahti] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.turku] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //ISLANDIA
    mapDetails[_name.akraness] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valur] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //AUSTRIA
    mapDetails[_name.rbsalzburg] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rapidviena] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.laskLinz] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sturmGraz] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.austria] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.innsbruck] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wiener] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tirol] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //SUIÇA
    mapDetails[_name.basel] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'St. Jakob-Park',42500,1893,};
    mapDetails[_name.youngBoys] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio da Suíça',32000,1898,};
    mapDetails[_name.zurich] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Letzigrund',26500,1896,};
    mapDetails[_name.grasshoppers] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Letzigrund',26500,1886,};
    mapDetails[_name.sion] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.servette] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.thun] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.neuchatel] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.chauxdefonds] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    //POLONIA
    mapDetails[_name.gornik] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gwardia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.legiaWarszawa] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lechPoznan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ruchchorzow] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.poloniabytom] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.szombierki] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wisla] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.widzew] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //TURQUIA
    mapDetails[_name.galatasaray] = {ClubColors(Colors.orange,Colors.red),Coordinates(0,0),'NEF Stadyumu',52280,1905,};
    mapDetails[_name.fenerbahce] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Şükrü Saraçoğlu',50509,1907,};
    mapDetails[_name.besiktas] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Vodafone Park',41903,1903,};
    mapDetails[_name.trabzonspor] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.instanbul] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.adanaspor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.antalyaspor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.denizlispor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.goztepe] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kasimpasa] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.konyaspor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gaziantepspor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.malatyaspor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.osmanlispor] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sivasspor] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    //GRECIA
    mapDetails[_name.olympiacos] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Karaiskákis',32130,1925,};
    mapDetails[_name.aek] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Olímpico de Atenas',71030,1924,};
    mapDetails[_name.paok] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Toumba Stadium',29000,1926,};
    mapDetails[_name.panathinaikos] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'	Apostolos Nikolaidis',16003,1908,};
    mapDetails[_name.aris] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Kleanthis Vikelidis',22800,1914,};
    //CHIPRE
    mapDetails[_name.apoel] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.omonia] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.apollon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.anorthosis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //ISRAEL
    mapDetails[_name.maccabiTelAviv] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.maccabiHaifa] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hapoelTelAviv] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};

    //RUSSIA
    mapDetails[_name.zenit] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Krestovsky',69000,1925,};
    mapDetails[_name.cska] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'VEB Arena',30000,1911,};
    mapDetails[_name.spartakmoscou] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Otkrytie Arena',44929,1922,};
    mapDetails[_name.krasnodar] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio Krasnodar',35074,2008,};
    mapDetails[_name.sochi] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rubinKazan] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lokomotivMoscou] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dinamoMoscou] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.anzhi] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kubanKrasnodar] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rotor] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.torpedo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vladikavkaz] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    //UCRANIA
    mapDetails[_name.shaktardonetsk] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dinamokiev] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dnipro] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zorya] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.metalist] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    //EX-URSS
    mapDetails[_name.sheriffTiraspol] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bate] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dinamoMinsk] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.qarabag] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.astana] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tbilisi] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.yerevan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zalgiris] = {ClubColors(Colors.green,Colors.greenAccent),Coordinates(0,0),'Estádio',10000,1900,};

    //SERVIA
    mapDetails[_name.estrelavermelha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Rajko Mitić',55538,1945,};
    mapDetails[_name.partizan] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vojvodina] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    //BULGARIA
    mapDetails[_name.ludogorets] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cskaSofia] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.loksofia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};   
    mapDetails[_name.levski] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};   
    mapDetails[_name.plovdiv] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};   
    //CROATIA
    mapDetails[_name.dinamozagreb] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hadjuksplit] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rijeka] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    //REP. TCHECA
    mapDetails[_name.spartapraga] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Generali Arena',20111,1893,};
    mapDetails[_name.slaviaPraha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Stadion Eden',21000,1892,};
    mapDetails[_name.banikostrava] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.bohemians] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brno] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.dukla] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.hradec] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.vitkovice] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.viktoriaPlzen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    //HUNGRIA
    mapDetails[_name.debreceni] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ferencvaros] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gyori] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.honved] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mtk] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ujpest] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vasas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //ROMENIA
    mapDetails[_name.steauaBucureste] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dinamoBucureste] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rapidBucureste] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pitesti] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cluj] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.craiova] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.arad] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.otelul] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.unirea] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    //ESLOVAQUIA
    mapDetails[_name.slovanBratislava] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.interBratislava] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.trnava] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.zilina] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.kosice] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.petrzalka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    //OUTROS
    mapDetails[_name.maribor] = {ClubColors(Colors.purple,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vardar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};   
    mapDetails[_name.sarajevo] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tirana] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dudelange] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.jeunesseesch] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.sliema] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};


    ///////////////////////////////////////////////////////////////////////////
    mapDetails[_name.atleticomg] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Mineirão',61927,1900,};
    mapDetails[_name.atleticopr] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Arena da Baixada',42372,1924,};
    mapDetails[_name.bahia] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Arena Fonte Nova',50025,1931,};
    mapDetails[_name.botafogo] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Nilton Santos',46831,1904,};
    mapDetails[_name.corinthians] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Neo Química Arena',47605,1910,};
    mapDetails[_name.cruzeiro] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Mineirão',61927,1921,};
    mapDetails[_name.flamengo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Maracanã',78838,1895,};
    mapDetails[_name.fluminense] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Maracanã',78838,1902,};
    mapDetails[_name.gremio] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Arena do Grêmio',55662,1903,};
    mapDetails[_name.goias] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Serrinha',16500,1943,};
    mapDetails[_name.internacional] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Beira-Rio',50128,1909,};
    mapDetails[_name.palmeiras] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Allianz Parque',43713,1914,};
    mapDetails[_name.santos] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Vila Belmiro',17923,1912,};
    mapDetails[_name.saopaulo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Morumbi',66795,1930,};
    mapDetails[_name.sport] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Ilha do Retiro',26418,1905,};
    mapDetails[_name.vasco] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'São Januário',21880,1898,};

    mapDetails[_name.americamg] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Independência',23018,1912,};
    mapDetails[_name.atleticogo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Antônio Accioly',12500,1937,};
    mapDetails[_name.cuiaba] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Arena Pantanal',44097,2001,};
    mapDetails[_name.chapecoense] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Arena Condá',22600,1973,};
    mapDetails[_name.bragantino] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Nabi Abi Chedid',12332,1928,};
    mapDetails[_name.ceara] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Castelão',63904,1900,};
    mapDetails[_name.coritiba] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Couto Pereira',40502,1909,};
    mapDetails[_name.criciuma] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Heriberto Hülse',19300,1947,};
    mapDetails[_name.figueirense] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Orlando Scarpelli',19584,1921,};
    mapDetails[_name.fortaleza] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Castelão',63904,1918,};
    mapDetails[_name.guarani] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Brinco de Ouro',29130,1911,};
    mapDetails[_name.juventude] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Alfredo Jaconi',19924,1913,};
    mapDetails[_name.nautico] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Aflitos',22856,1901,};
    mapDetails[_name.parana] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Durival Britto',17140,1989,};
    mapDetails[_name.pontepreta] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Moisés Lucarelli',17728,1900,};
    mapDetails[_name.vitoria] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Barradão',30618,1899,};

    mapDetails[_name.abc] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.avai] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Ressacada',17800,1923,};
    mapDetails[_name.bangu] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Moça Bonita',9500,1904,};
    mapDetails[_name.americaRJ] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.americaRN] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.anapolina] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.botafogoPB] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Almeidão',19000,1931,};
    mapDetails[_name.botafogoSP] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brasilia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brasiliense] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Boca do Jacaré',27000,2000,};
    mapDetails[_name.brasilPelotas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.brusque] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Augusto Bauer',5000,1987,};
    mapDetails[_name.campinense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'O Amigão',10000,1915,};
    mapDetails[_name.central] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.comercial] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.confianca] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.caxias] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.crb] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Rei Pelé',17126,1912,};
    mapDetails[_name.csa] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Rei Pelé',17126,1913,};
    mapDetails[_name.gremioNovorizontino] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ferroviaria] = {ClubColors(grena,Colors.black),Coordinates(0,0),'Fonte Luminosa',20000,1950,};
    mapDetails[_name.gama] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.goiania] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.goytacaz] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ibis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Ademir Cunha',10000,1938,};
    mapDetails[_name.interLimeira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Major José Levy Sobrinho',27000,1913,};
    mapDetails[_name.ipatinga] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.ituano] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Novelli Júnior',16749,1947,};
    mapDetails[_name.joinville] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'	Arena Joinville',22100,1976,};
    mapDetails[_name.juventusMooca] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.londrina] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.luverdense] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.macae] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.madureira] = {ClubColors(Colors.purple,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.manaus] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mirassol] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mixto] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mogimirim] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.motoclub] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.noroeste] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.novaiguacu] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.oeste] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.operarioms] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.operarioPR] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.paysandu] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Mangueirão',35000,1914,};
    mapDetails[_name.paulista] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Jayme Cintra',10210,1909,};
    mapDetails[_name.portuguesa] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Canindé',21004,1920,};
    mapDetails[_name.remo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Mangueirão',35000,1905,};
    mapDetails[_name.riverPI] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rionegro] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santacruz] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Arruda',60044,1914,};
    mapDetails[_name.sampaio] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santoandre] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saobento] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saocaetano] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saoraimundo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sergipe] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tiradentes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tombense] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.treze] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tunaluso] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Mangueirão',35000,1903,};
    mapDetails[_name.tupi] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vilanova] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.voltaredonda] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.xvpiracicaba] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Barão de Serra Negra',18000,1913,};
    mapDetails[_name.xvjau] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};


    ///////////////////////////////////////////////
    mapDetails[_name.aldosivi] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'José María Minella',35180,1913,};
    mapDetails[_name.almagro] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.allboys] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.atleticoTucuman] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Monumental José Fierro',35200,1902,};
    mapDetails[_name.argentinojuniors] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Diego Armando Maradona',25500,1904,};
    mapDetails[_name.arsenalsarandi] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Julio Humberto Grondona',18500,19570,};
    mapDetails[_name.banfield] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Florencio Sola',34901,1896,};
    mapDetails[_name.belgrano] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Gigante de Alberdi',30000,1905,};
    mapDetails[_name.bocajuniors] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'La Bombonera',54000,1905,};
    mapDetails[_name.centralCordoba] = {ClubColors(Colors.grey,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chacarita] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Chacarita Juniors',10000,1906,};
    mapDetails[_name.colon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Brigadier General Estanislao López',40000,1905,};
    mapDetails[_name.defensayjusticia] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Norberto "Tito" Tomaghello',18000,1935,};
    mapDetails[_name.estudiantes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Jorge Luis Hirschi',30018,1905,};
    mapDetails[_name.ferro] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Arquitecto Ricardo Etcheverri',29442,1904,};
    mapDetails[_name.gimnasia] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Juan Carmelo Zerillo',33000,1887,};
    mapDetails[_name.godoycruz] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Feliciano Gambarte',18000,1921,};
    mapDetails[_name.huracan] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Tómas Adolfo Ducó',48314,1908,};
    mapDetails[_name.independiente] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Libertadores de América',52360,1905,};
    mapDetails[_name.lanus] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Ciudad de Lanús',47027,1915,};
    mapDetails[_name.newells] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Marcelo Bielsa',42000,1903,};
    mapDetails[_name.nuevachicago] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.patronato] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.platense] = {ClubColors(Colors.grey,Colors.black),Coordinates(0,0),'	Ciudad de Vicente López',34500,1905,};
    mapDetails[_name.quilmes] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Centenário',30200,1887,};
    mapDetails[_name.racing] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Presidente Perón',51389,1903,};
    mapDetails[_name.riverplate] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Monumental de Núñez',70074,1901,};
    mapDetails[_name.rosariocentral] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Gigante de Arroyito',41654,1889,};
    mapDetails[_name.sanlorenzo] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'El Nuevo Gasómetro',47964,1908,};
    mapDetails[_name.sanmartin] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.talleres] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'	Mario Alberto Kempes',57000,1913,};
    mapDetails[_name.temperley] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estadio Alfredo Beranger',23000,1912,};
    mapDetails[_name.tigre] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'José Dellagiovanna',26282,1902,};
    mapDetails[_name.unionSantaFe] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio 15 de Abril',28000,1907,};
    mapDetails[_name.velezsarsfield] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'José Amalfitani',49590,1910,};

    mapDetails[_name.penarol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Campeón del Siglo',40000,1891,};
    mapDetails[_name.nacional] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Gran Parque Central',34000,1899,};
    mapDetails[_name.bellavista] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cerrouru] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.danubio] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.defensor] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fenix] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.montevideo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Complejo Daniel Marsicano',14000,2007,};
    mapDetails[_name.progreso] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rentista] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.riverURU] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rocha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wanderers] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.olimpia] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Manuel Ferreira',25820,1902,};
    mapDetails[_name.cerroporteno] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'General Pablo Rojas',45000,1912,};
    mapDetails[_name.libertad] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Dr. Nicolás Leoz',10500,1905,};
    mapDetails[_name.guaraniPAR] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Rogelio Livieres',8000,1903,};
    mapDetails[_name.nacionalPAR] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.colegiales] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.luqueno] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.octubre] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.soldeamerica] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tacuary] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.colocolo] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Monumental David Arellano',47017,1925,};
    mapDetails[_name.lau] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Nacional',55358,1927,};
    mapDetails[_name.univcatolica] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'San Carlos de Apoquindo',14768,1937,};
    mapDetails[_name.palestino] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huachipato] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio CAP',10500,1947,};
    mapDetails[_name.audax] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.laCalera] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.cobreloa] = {ClubColors(Colors.orange,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cobresal] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.concepcion] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.coquimbo] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.concepcion] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.evertonchi] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.iquique] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.magallanes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.unionespanola] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ohiggins] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.santiagowanderers] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sanfelipe] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 

    mapDetails[_name.alianzalima] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Alejandro Villanueva',35000,1901,};
    mapDetails[_name.sportingcristal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Alberto Gallardo',11600,1955,};
    mapDetails[_name.cienciano] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Inca Garcilaso de la Vega',45056,1901,};
    mapDetails[_name.universitario] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Monumental de Lima',80093,1924,};
    mapDetails[_name.melgar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio Monumental da UNSA',40370,1915,};
    mapDetails[_name.binacional] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.coronel] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.jorge] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.juanaurich] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.unionhuaral] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.garcilaso] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.defensorlima] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.sportboys] = {ClubColors(Colors.pink,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.univtecnica] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.unisanmartin] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.unionhuaral] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 

    mapDetails[_name.bolivar] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Hernando Siles',42000,1925,};
    mapDetails[_name.theStrongest] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Hernando Siles',42000,1908,};
    mapDetails[_name.alwaysReady] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Hernando Siles',42000,1933,};
    mapDetails[_name.aurora] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.blooming] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Tauhichi Aguilera',38000,1946,};
    mapDetails[_name.depmunicipal] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guabira] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Gilberto Parada',18000,1962,};
    mapDetails[_name.octubre31] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.orientePetrolero] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio Ramón Tahuichi Aguilera',38500,1955,};
    mapDetails[_name.sanJoseBOL] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Jesús Bermúdez',39000,1942,};
    mapDetails[_name.realpotosi] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Víctor Ugarte',32000,1986,};
    mapDetails[_name.sucre] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.barcelonaequ] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Monumental Isidro Romero Carbo',57267,1925,};
    mapDetails[_name.emelec] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'George Capwell',40000,1929,};
    mapDetails[_name.ldu] = {ClubColors(Colors.white,Colors.grey),Coordinates(0,0),'Rodrigo Paz Delgado',41575,1918,};
    mapDetails[_name.idelvalle] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Rumiñahui',10233,1958,};
    mapDetails[_name.elnacional] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Olímpico Atahualpa',45000,1964,};
    mapDetails[_name.delfin] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depcuenca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depquito] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.espoli] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.everest] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.olmedo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.nueveoctubre] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.tecnico] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.uniequ] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.valdez] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 

    mapDetails[_name.caracas] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'	Estádio Olímpico (Caracas)',24900,1967,};
    mapDetails[_name.laGuaira] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio Olímpico de Caracas',24900,2008,};
    mapDetails[_name.deportivoTachira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Pueblo Nuevo de San Cristóbal',42000,1974,};
    mapDetails[_name.estudiantesmerida] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Guillermo Soto Rosa',16500,1971,};
    mapDetails[_name.ula] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.maracaibo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depgalicia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depitalia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.deplara] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.maritimoven] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.margarita] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.mineros] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.minerven] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.portugues] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.portuguesaven] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.sancristobal] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.trujillanos] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.ula] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.valenciaven] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.zamora] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estadio Agustín Tovar',28000,1977,};
    mapDetails[_name.zulia] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio José Encarnación Romero',45000,2005,};

    mapDetails[_name.americadecali] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Olímpico Pascual Guerrero',35405,1927,};
    mapDetails[_name.atleticonacional] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Atanasio Girardot',52872,1947,};
    mapDetails[_name.deportivocali] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio Deportivo Cali',55000,1912,};
    mapDetails[_name.junior] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Metropolitano',46692,1924,};
    mapDetails[_name.imedellin] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Atanasio Girardot',45953,1913,};
    mapDetails[_name.oncecaldas] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Palogrande',42600,1961,};
    mapDetails[_name.millonarios] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'El Campín',36343,1937,};
    mapDetails[_name.santafe] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'El Campín',36343,1941,};
    mapDetails[_name.tolima] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Manuel Murillo Toro',33000,1954,};
    mapDetails[_name.bucaramanga] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.boyaca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.cucuta] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depPasto] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.huila] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.laequidad] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    mapDetails[_name.atlas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Jalisco',57000,1916,};
    mapDetails[_name.atlante] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.americamex] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio Azteca',87000,1916,};
    mapDetails[_name.celaya] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chivasguadalajara] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estadio Akron',49850,1906,};
    mapDetails[_name.cruzazul] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Azul',32904,1927,};
    mapDetails[_name.jaguares] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.juarez] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.leon] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Nou Camp',33943,1944,};
    mapDetails[_name.leonesNegros] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.monterrey] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio BBVA',51348,1945,};
    mapDetails[_name.morelia] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estadio Morelos',41038,1950,};
    mapDetails[_name.necaxa] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estadio Victoria',22000,1923,};
    mapDetails[_name.pachuca] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio Hidalgo',32000,1892,};
    mapDetails[_name.puebla] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estadio Cuauhtemoc',42684,1944,};
    mapDetails[_name.pumas] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Olímpico Universitário',72000,1954,};
    mapDetails[_name.queretaro] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio Corregidora',40000,1950,};
    mapDetails[_name.sanluis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.santosLaguna] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Nuevo Estadio Corona',30000,1983,};
    mapDetails[_name.tigres] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio Universitario',42000,1960,};
    mapDetails[_name.toluca] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Nemesio Díez',30000,1917,};
    mapDetails[_name.tijuana] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Caliente',33333,2007,};
    //USA
    mapDetails[_name.atlanta] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Mercedes-Benz Stadium',72035,2014,};
    mapDetails[_name.minnesota] = {ClubColors(Colors.blue,Colors.grey),Coordinates(0,0),'Allianz Field',19400,2010,};
    mapDetails[_name.columbuscrew] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Mapfre Stadium',19968,1994,};
    mapDetails[_name.chicago] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Toyota Park',20000,1997,};
    mapDetails[_name.colorado] = {ClubColors(grena,Colors.grey),Coordinates(0,0),'DSG Park',19680,1995,};
    mapDetails[_name.dcunited] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Audi Field',20000,1995,};
    mapDetails[_name.fcdallas] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Toyota Stadium',20500,1996,};
    mapDetails[_name.houston] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'BBVA Compass Stadium',22000,2005,};
    mapDetails[_name.lagalaxy] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Dignity Health Sports Park',27000,1994,};
    mapDetails[_name.losangelesfc] = {ClubColors(Colors.black,Colors.yellow),Coordinates(0,0),'Banc of California Stadium',22000,2014,};
    mapDetails[_name.montreal] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Saputo Stadium',19619,2010,};
    mapDetails[_name.nerevolution] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Gillette Stadium',25000,1996,};
    mapDetails[_name.nycity] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Yankee Stadium',33488,2013,};
    mapDetails[_name.nyredbulls] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Red Bull Arena',25000,1995,};
    mapDetails[_name.orlando] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Exploria Stadium',25500,2010,};
    mapDetails[_name.portland] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Providence Park',21144,1975,};
    mapDetails[_name.seattle] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Lumen Field',68000,2007,};
    mapDetails[_name.intermiami] = {ClubColors(Colors.purpleAccent,Colors.black),Coordinates(0,0),'Miami Freedom Park',17417,2018,};
    mapDetails[_name.philadelphia] = {ClubColors(darkblue,Colors.yellow),Coordinates(0,0),'PPL Park',18500,2008,};
    mapDetails[_name.torontofc] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'BMO Field',30000,2005,};
    mapDetails[_name.realSaltLake] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Rio Tinto Stadium',20213,2004,};
    mapDetails[_name.sanJoseEarthquakes] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Avaya Stadium',18000,1994,};
    mapDetails[_name.sportingKansasCity] = {ClubColors(Colors.lightBlueAccent,darkblue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vancouver] = {ClubColors(darkblue,Colors.lightBlueAccent),Coordinates(0,0),'BC Place',54500,2009,};

    //////////////////////////////////////////////////////////////////////////////////
    mapDetails[_name.evergrande] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Tianhe Stadium',58500,1954,};
    mapDetails[_name.beijingguoan] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Worker\'s Stadium',66161,1992,};
    mapDetails[_name.shandongluneng] = {ClubColors(Colors.orange,Colors.white),Coordinates(0,0),'Luneng Stadium',56808,1993,};
    mapDetails[_name.shanghaisipg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio de Shanghai',56842,2005,};

    mapDetails[_name.kashimaantlers] = {ClubColors(Colors.red,Colors.grey),Coordinates(0,0),'Kashima Soccer Stadium',40728,1994,};
    mapDetails[_name.urawareddiamonds] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio Saitama 2002',63700,1950,};
    mapDetails[_name.visselkobe] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio Kobe Wing',30182,1966,};
    mapDetails[_name.kawasakifrontale] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Todoroki Athletics Stadium',27495,1997,};
    mapDetails[_name.fcTokyo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cerezoOsaka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.gambaOsaka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.kashiwaReysol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.yokohamaMarinos] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.jeonbuk] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Jeonju World Cup Stadium',42477,1994,};
    mapDetails[_name.pohang] = {ClubColors(Colors.grey,Colors.black),Coordinates(0,0),'Pohang Steel Yard',25000,1973,};
    mapDetails[_name.ulsan] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Munsu Cup Stadium',44474,1983,};
    mapDetails[_name.fcSeoul] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Seoul World Cup Stadium',66704,1983,};
    mapDetails[_name.suwonSamsung] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Big Bird',43288,1995,};

    //ORIENTE MÉDIO
    mapDetails[_name.alsadd] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Jassim Bin Hamad',15000,1969,};
    mapDetails[_name.alduhail] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Abdullah bin Khalifa',10221,1938,};
    mapDetails[_name.aljazira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio Mohammed Bin Zayed',42000,1974,};
    mapDetails[_name.alain] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Sheikh Khalifa International Stadium',16000,1968,};
    mapDetails[_name.alWahda] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio Al Nahyan',12000,1974,};
    mapDetails[_name.alhilal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'King Fahd Stadium',67000,1957,};
    mapDetails[_name.alnassr] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Universitário Rei Saud',25000,1955,};
    mapDetails[_name.alIttihad] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Prince Abdullah Al-Faisal Stadium',27000,1927,};
    mapDetails[_name.alShabab] = {ClubColors(Colors.white,Colors.orange),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alahli] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Prince Abdullah al-Faisal Stadium',27000,1937,};

    mapDetails[_name.persepolis] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Azadi Stadium',100000,1963,};
    mapDetails[_name.melbourneVictory] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'AAMI Park',30050,2004,};
    mapDetails[_name.sydney] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Sydney Football Stadium',45500,2004,};
    mapDetails[_name.buriramUnited] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'New i-mobile Stadium',32600,1970,};

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    mapDetails[_name.alahly] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio Internacional do Cairo',71400,1907,};
    mapDetails[_name.zamalek] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio Internacional do Cairo',71400,1911,};
    mapDetails[_name.mazembe] = {ClubColors(Colors.black,Colors.black),Coordinates(0,0),'Stade de la Kenya',35000,1939,};
    mapDetails[_name.rajacasablanca] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Stade Mohamed V',67000,1949,};
    mapDetails[_name.wydad] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Stade Mohamed V',67000,1937,};
    mapDetails[_name.orlandoPirates] = {ClubColors(Colors.black,Colors.black),Coordinates(0,0),'Orlando Stadium',40000,1937,};
    mapDetails[_name.kaizer] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Soccer City',78000,1970,};
    mapDetails[_name.mamelodi] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Loftus Versfeld',51762,1960,};
    mapDetails[_name.esperance] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estadio Olímpico de Radès',60500,1919,};
    mapDetails[_name.agosto] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.usmAlger] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.etoileSahel] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.esSetif] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cotonsport] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.enyimba] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.asecMimosas] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
  }


}