import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/contries_continents.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/widgets/patterns.dart';
import 'package:flutter/material.dart';

class ClubColors{
  late Color primaryColor;
  late Color secondColor;
  Color thirdColor = Colors.transparent;
  ClubColors(this.primaryColor,this.secondColor,[this.thirdColor = Colors.transparent]);
}
class Coordinates{
  late double latitude;
  late double longitude;
  Coordinates(this.latitude,this.longitude);
}
class ClubImage{
  //FUTURO
  late String clubImage;
  ClubImage(this.clubImage){
    if(clubImage.isNotEmpty){
      clubImage = 'assets/clubs/$clubImage.png';
    }else{
      //print('CLUBE NÃO TEM IMAGEM');
      clubImage = 'assets/clubs/generic.png';
    }
  }
}
class ClubDetails{

  Map map = {};

  ClubColors getColors(String clubName){
    return map[clubName][0];
  }
  String getPattern(String clubName){
    return map[clubName][1];
  }
  Coordinates getCoordinate(String clubName){
    return map[clubName][2] ?? Coordinates(0, 0);
  }
  String getStadium(String clubName){
    return map[clubName][3];
  }
  int getStadiumCapacity(String clubName){
    return map[clubName][4];
  }
  String getStadiumCapacityPointFormat(String clubName){
    int capacity = getStadiumCapacity(clubName);
    if(capacity>=100000){
      return capacity.toString()[0]+capacity.toString()[1]+capacity.toString()[2]+'.'+capacity.toString()[3]+capacity.toString()[4]+capacity.toString()[5];
    }
    if(capacity>=10000){
      return capacity.toString()[0]+capacity.toString()[1]+'.'+capacity.toString()[2]+capacity.toString()[3]+capacity.toString()[4];
    }
    if(capacity>=1000){
      return capacity.toString()[0]+'.'+capacity.toString()[1]+capacity.toString()[2]+capacity.toString()[3];
    }
    return capacity.toString();
  }
  int getFoundationYear(String clubName){
    return map[clubName][5];
  }
  String getCountry(String clubName){
    try {
      return map[clubName][6];
    }catch (e) {
      print('ERROR GETCOUNTRY: $clubName');
      return '';
    }
  }
  String getContinent(String clubName){
    return Continents().funcCountryContinents(getCountry(clubName));
  }
  List getRivals(String clubName){
    return map[clubName][7];
  }

  ClubDetails(){
    //map['generico'] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(0,0),'Estádio',3123,1900,_country.england];
    var _country = Words.country;
    Color darkblue = const Color(0xFF001050);
    Color darkgreen = const Color(0xFF0B5700);
    Color blue = const Color(0xFF001FBB);
    Color grena = const Color(0xFF760025);
    ClubPattern pattern = ClubPattern();
    
    ClubName _name = ClubName();
    //https://query.wikidata.org/#SELECT%20%3Fclub%20%3FclubLabel%20%3Fvenue%20%3FvenueLabel%20%3Fcoordinates%0AWHERE%0A%7B%0A%09%3Fclub%20wdt%3AP31%20wd%3AQ476028%20.%0A%09%3Fclub%20wdt%3AP115%20%3Fvenue%20.%0A%09%3Fvenue%20wdt%3AP625%20%3Fcoordinates%20.%0A%09SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22pt%22%20%7D%0A%7D
    map[_name.arsenal] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(51.555,-0.108611),
			'Estádio Emirates',60704,1886,_country.england,[_name.tottenham,_name.chelsea]];
    map[_name.astonvilla] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(52.509166666,-1.884722222),
			'Villa Park',42660,1874,_country.england,[_name.birmigham]];
    map[_name.bournemouth] = [ClubColors(Colors.black,Colors.red),pattern.stripes3,Coordinates(50.735278,-1.838333),
      'Dean Court',11464,1890,_country.england,[_name.southampton]];
    map[_name.brentford] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.488167,-0.302639),
      'Griffin Park',17250,1889,_country.england,];
    map[_name.brighton] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(50.861822222,-0.083277777),
      'Falmer Stadium',30750,1901,_country.england,[_name.crystalpalace]];
    map[_name.crystalpalace] = [ClubColors(Colors.purple,Colors.blueAccent),pattern.stripes2,Coordinates(51.398333333,-0.085555555),
			'Selhurst Park',26047,1905,_country.england,];
    map[_name.chelsea] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(51.481666666,-0.191111111),
			'Stamford Brigde',41837,1905,_country.england,[_name.tottenham,_name.arsenal]];
    map[_name.everton] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(53.438888888,-2.966388888),
			'	Goodison Park',39571,1878,_country.england,[_name.liverpool]];
    map[_name.fulham] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(51.475,-0.221666666),
      'Craven Cottage',19000,1879,_country.england,[_name.chelsea,_name.qpr]];
    map[_name.leicester] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.620277777,-1.142222222),
			'King Power Stadium',39571,1884,_country.england,];
    map[_name.leeds] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(53.777777777,-1.572222222),
			'Elland Road',37890,1919,_country.england,];
    map[_name.liverpool] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.430833333,-2.960833333),
			'Anfield',54167,1892,_country.england,[_name.manchesterunited,_name.everton]];
    map[_name.manchestercity] = [ClubColors(Colors.lightBlue,Colors.white),pattern.solid,Coordinates(53.48331043737668, -2.200470393744969),
			'Etihad Stadium',53400,1880,_country.england,[_name.manchesterunited]];
    map[_name.manchesterunited] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.463055555,-2.291388888),
			'Old Trafford',76212,1878,_country.england,[_name.manchestercity]];
    map[_name.newcastle] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(54.975555555,-1.621666666),
			'St. James Park',52409,1892,_country.england,[_name.sunderland]];
    map[_name.nottinghamforest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.94,-1.132778),
      'City Ground',30446,1865,_country.england,[_name.leicester]];
    map[_name.southampton] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.90583333,-1.39111111),
			'St. Mary\'s',32690,1885,_country.england,[_name.portsmouth]];
    map[_name.tottenham] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(51.604444444,-0.066388888),
			'Tottenham Hotspur Stadium',62850,1882,_country.england,[_name.arsenal,_name.chelsea]];
    map[_name.westham] = [ClubColors(grena,Colors.blue),pattern.sleeves,Coordinates(51.538611111,-0.016388888),
			'Olímpico de Londres',60000,1895,_country.england,[_name.millwall,_name.tottenham]];
    map[_name.wolves] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.590277777,-2.130277777),
			'Molineux Stadium',32050,1877,_country.england,[_name.westbromwich]];

    map[_name.accrington] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.7654, -2.371048),
      'Crown Ground',6000,1968,_country.england,];
    map[_name.barnsley] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.552222,-1.4675),
			'Oakwell Stadium',23000,1887,_country.england,];
    map[_name.birmigham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.475702777,-1.868188888),
      'St Andrew\'s Stadium',30016,1875,_country.england,[_name.astonvilla]];
    map[_name.blackburn] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(53.728611111,-2.489166666),
      'Ewood Park',30016,1875,_country.england,[_name.burnley]];
    map[_name.blackpool] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(53.804722,-3.048056),
			'Bloomfield Road',12555,1887,_country.england,];
    map[_name.bolton] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.580555555,-2.535555555),
      'Reebok Stadium',28723,1874,_country.england,];
    map[_name.burton] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.821944, -1.626888),
      'Pirelli Stadium',6912,1950,_country.england,];
    map[_name.bradford] = [ClubColors(Colors.orangeAccent,grena),pattern.divided,Coordinates(53.804222222,-1.7590222),
			'Valley Parade',25136,1903,_country.england,];
    map[_name.bristol] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.44,-2.620278),
			'Ashton Gate Stadium',21497,1897,_country.england,];
    map[_name.bristolrovers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.4862678, -2.583142),
      'Memorial Stadium',12300,1883,_country.england,];
    map[_name.burnley] = [ClubColors(Colors.purple,Colors.lightBlueAccent),pattern.sleeves,Coordinates(53.789064,-2.230225),
      'Turf Moor',22546,1882,_country.england,[_name.blackburn]];
    map[_name.cardiffCity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.472778,-3.203056),
			'Cardiff City Stadium',33000,1899,_country.wales,];
    map[_name.coventry] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.44849844, -1.496216266),
			'Coventry Building Society Arena',32609,1883,_country.england,];
    map[_name.charlton] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(51.487489,0.035632),
			'The Valley',27116,1905,_country.england,];
    map[_name.doncaster] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.5098730, -1.11355670),
      'Keepmoat Rovers Park',15231,1879,_country.england,];
    map[_name.derbycount] = [ClubColors(Colors.white,Colors.white10),pattern.solid,Coordinates(52.915,-1.447222222),
      'Pride Park',33597,1884,_country.england,[_name.nottinghamforest]];
    map[_name.fleetwood] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.91654334, -3.024740453),
      'Highbury Stadium',5327,1908,_country.england,];
    map[_name.gillingham] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.3843096, 0.5607898),
      'KRBS Priestfield Stadium',11582,1893,_country.england,];
    map[_name.grimsby] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(53.570176, -0.04632012),
      'Blundell Park',9052,1893,_country.england,];
    map[_name.huddersfield] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.65416666,-1.76833333),
			'Kirklees Stadium',24500,1908,_country.england,];
    map[_name.hullcity] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(53.746111,-0.367777),
      'KCOM Stadium',25400,1904,_country.england,];
    map[_name.ipswichTown] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.05506755, 1.1451992),
			'Portman Road',30311,1878,_country.england,];
    map[_name.lincoln] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.218429, -0.54082758),
      'Sincil Bank',10127,1884,_country.england,];
    map[_name.luton] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.883688, -0.4305913),
			'Kenilworth Road',10356,1885,_country.england,];
    map[_name.middlesbrough] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(54.578333,-1.2169444),
      'Riverside Stadium',34988,1876,_country.england,[_name.newcastle]];
    map[_name.millwall] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(51.485833,-0.050833),
			'The New Den',20146,1885,_country.england,];
    map[_name.mkdons] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(52.0096280, -0.7335208),
      'Stadium MK',30500,2004,_country.england,[_name.wimbledon]];
    map[_name.norwich] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.622128,1.308653),
      'Carrow Road',27033,1902,_country.england,[_name.ipswichTown]];
    map[_name.notts] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(52.9425,-1.137222),
			'Meadow Lane',19841,1862,_country.england,];
    map[_name.oldham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.555147, -2.1284515),
      'Boundary Park',10638,1895,_country.england,];
    map[_name.oxford] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.716419,-1.208067),
			'Oxford Stadium',30582,1893,_country.england,];
    map[_name.peterborough] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(52.56483332, -0.240204256),
			'Weston Homes Stadium',15314,1934,_country.england,];
    map[_name.portsmouth] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(50.79638888,-1.0638888),
			'Fratton Park',20688,1898,_country.england,];
    map[_name.portvale] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.0501, -2.19261630),
      'Vale Park',19052,1876,_country.england,];
    map[_name.plymouth] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(50.388055555,-4.150833333),
			'Home Park',19500,1886,_country.england,];
    map[_name.prestonNorthEnd] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.772222222,-2.6880555),
			'Deepdale',23408,1880,_country.england,];
    map[_name.qpr] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes,Coordinates(51.50916666,-0.232222222),
      'Loftus Road',18439,1882,_country.england,[_name.chelsea,_name.fulham]];
    map[_name.reading] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes,Coordinates(51.4222,-0.98277),
      'Madejski Stadium',24250,1871,_country.england,];
    map[_name.rotherham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.4279,-1.362),
			'New York Stadium',12021,1925,_country.england,];
    map[_name.sheffieldWednesday] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.411388888,-1.50055),
			'Estádio Hillsborough',39732,1867,_country.england,[_name.sheffieldunited]];
    map[_name.sheffieldunited] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes2,Coordinates(53.3705550, -1.4709732046),
      'Bramall Lane',39859,1889,_country.england,[_name.sheffieldWednesday]];
    map[_name.shrewsbury] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(52.6887706, -2.749098116),
      'New Meadow',9875,1886,_country.england,];
    map[_name.stoke] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(52.988333333,-2.175555555),
      'Bet365 Stadium',30089,1863,_country.england,];
    map[_name.sunderland] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(54.9144,-1.3882),
			'Stadium of Light',49000,1879,_country.england,[_name.newcastle]];
    map[_name.swansea] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(51.6422,-3.9351),
      'Liberty Stadium',21088,1912,_country.wales,[_name.cardiffCity]];
    map[_name.tranmere] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(53.37379415, -3.03251662),
      'Prenton Park',16789,1884,_country.england,];
    map[_name.watford] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(51.649928,-0.401606),
      'Vicarage Road',21577,1881,_country.england,[_name.luton]];
    map[_name.westbromwich] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(52.509166666,-1.963888888),
      'The Hawthorns',26850,1878,_country.england,[_name.wolves]];
    map[_name.wigan] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.547778,-2.653889),
			'DW Stadium',25135,1932,_country.england,];
    map[_name.wimbledon] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.431363888,-0.186669444),
			'Plough Lane',9215,2002,_country.england,[_name.mkdons]];
    map[_name.wycombe] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.divided,Coordinates(51.6305577, -0.8001325),
      'Adams Park',10137,1887,_country.england,];
    map[_name.york] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(53.98449, -1.052972250),
			'York Community Stadium',8500,1922,_country.england,];

    //ITALIA
    map[_name.atalanta] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.708889,9.680833),
			'Atleti Azzurri d\'Italia',21300,1907,_country.italy,];
    map[_name.bologna] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.49362,11.309719),
			'Renato Dall\'Ara',39444,1909,_country.italy,];
    map[_name.cagliari] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(39.199888888,9.137583333),
			'Unipol Domus',16416,1920,_country.italy,];
    map[_name.cremonese] = [ClubColors(Colors.red,Colors.grey),pattern.stripes3,Coordinates(45.140424475662854, 10.034943289585),
      'Estádio Giovanni Zini',16003,1913,_country.italy,];
    map[_name.empoli] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.726389,10.955),
      'Carlo Castellanni',19847,1920,_country.italy,];
    map[_name.fiorentina] = [ClubColors(Colors.purple,Colors.white),pattern.oneHorStripe,Coordinates(43.780822,11.282258),
			'Artemio Franchi',47282,1926,_country.italy,];
    map[_name.hellasVerona] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(45.435356,10.968647),
      'Marcantonio Bentegodi',39371,1903,_country.italy,];
    map[_name.inter] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(45.478055,9.123947),
			'Giuseppe Meazza',80018,1908,_country.italy,[_name.milan,_name.juventus]];
    map[_name.juventus] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(45.109594,7.641247),
			'Allianz Stadium',41507,1897,_country.italy,[_name.milan,_name.inter]];
    map[_name.milan] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(45.4786,9.1244),
			'Giuseppe Meazza',80018,1899,_country.italy,[_name.juventus,_name.inter]];
    map[_name.monza] = [ClubColors(Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(45.582778,9.308056),
      'Stadio Brianteo',18568,1912,_country.italy,];
    map[_name.lazio] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(41.933872,12.454714),
			'Stadio Olimpico',73261,1900,_country.italy,[_name.roma]];
    map[_name.lecce] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(40.3654579445129, 18.20937082941416),
      'Via del Mare',36285,1908,_country.italy,];
    map[_name.napoli] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(40.827967,14.193008),
			'Diego Armando Maradona',54726,1926,_country.italy,[_name.juventus]];
    map[_name.roma] = [ClubColors(grena,Colors.orange),pattern.solid,Coordinates(41.9339,12.454),
			'Stadio Olimpico',73261,1900,_country.italy,[_name.lazio]];
    map[_name.salernitana] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(40.64574181157901, 14.82401436498),
      'Arechi',38000,1919,_country.italy,];
    map[_name.sampdoria] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(44.4164,8.9524),
			'Luigi Ferraris',36600,1946,_country.italy,[_name.genoa]];
    map[_name.sassuolo] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(44.714722,10.649722),
			'MAPEI Stadium',23717,1920,_country.italy,];
    map[_name.spezia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.102222,9.808611),
      'Alberto Picco',11466,1906,_country.italy,];
    map[_name.torino] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(45.041667,7.65),
			'Olímpico Grande Torino',27994,1906,_country.italy,];
    map[_name.udinese] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(46.081603,13.200136),
			'Friuli',25000,1896,_country.italy,];

    map[_name.ascoli] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(42.861111,13.594167),
			'Stadio Cino e Lillo Del Duca',20000,1898,_country.italy,];
    map[_name.avellino] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.92713726, 14.792281517),
      'Stadio Partenio',26308,1912,_country.italy,];
    map[_name.bari] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(41.084736,16.840072),
			'San Nicola',58270,1908,_country.italy,];
    map[_name.benevento] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(41.116691, 14.78177738),
			'Municipal Stadium Ciro Vigorito',17554,1929,_country.italy,];
    map[_name.brescia] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(45.570556,10.236944),
			'Estádio Mario Rigamonti',27592,1911,_country.italy,];
    map[_name.catania] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(37.515833,15.071389),
			'Angelo Massimino',26000,1946,_country.italy,];
    map[_name.cesena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.140556,12.261944),
			'Dino Manuzzi',23860,1940,_country.italy,];
    map[_name.cittadella] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(45.642930, 11.7809924),
      'Pier Cesare Tombolato',7623,1973,_country.italy,];
    map[_name.chievo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.435356,10.968647),
			'Estádio Marcantonio Bentegodi',39371,1929,_country.italy,];
    map[_name.como] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8142475, 9.07235),
			'Giuseppe Sinigaglia',13602,1907,_country.italy,];
    map[_name.cosenza] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(39.31004544, 16.23091),
      'Stadio San Vito-Gigi Marulla',24209,1929,_country.italy,];
    map[_name.crotone] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(39.079167,17.116667),
			'Ezio Scida',16547,1923,_country.italy,];
    map[_name.foggia] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(41.45503127, 15.542573),
			'Pino Zaccheria',25085,1920,_country.italy,];
    map[_name.frosinone] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(41.6349811, 13.32167292),
			'Benito Stirpe',16227,1906,_country.italy,];
    map[_name.genoa] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.416431,8.952428),
      'Luigi Ferraris',36600,1893,_country.italy,[_name.sampdoria]];
    map[_name.livorno] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.52680444, 10.3144784728),
			'Stadio Armando Picchi',20000,1915,_country.italy,];
    map[_name.messina] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(44.65350542, 10.9231108),
			'Stadio San Filippo',38722,1947,_country.italy,];
    map[_name.modena] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Alberto Braglia',20500,1912,_country.italy,];
    map[_name.padova] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.43245775, 11.858382067),
			'Estádio Euganeo',32336,1910,_country.italy,];
    map[_name.palermo] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(38.152767,13.342275),
			'Renzo Barbera',36871,1900,_country.italy,];
    map[_name.parma] = [ClubColors(Colors.yellow,darkblue),pattern.dividedHor,Coordinates(44.794916666,10.338444444),
      'Ennio Tardini',22359,1913,_country.italy,];
    map[_name.perugia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.1064162086, 12.3574171183),
      'Estádio Renato Curi',23625,1905,_country.italy,];
    map[_name.pescara] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.4552707276, 14.229580317),
			'Adriático',24500,1936,_country.italy,];
    map[_name.piacenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.02977717, 9.690407817),
			'Leonardo Garilli',21608,1919,_country.italy,];
    map[_name.pisa] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(43.725629, 10.400910245),
			'Stadio Romeo Anconetani',17000,1909,_country.italy,];
    map[_name.pordenone] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(45.957921, 12.648520),
			'Stadio Ottavio Bottecchia',3000,1928,_country.italy,];
    map[_name.reggina] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(38.0928237, 15.6357327),
			'Stadio Oreste',27763,1914,_country.italy,];
    map[_name.siena] = [ClubColors(grena,Colors.white),pattern.stripes2,Coordinates(43.3218490, 11.32611057),
			'Artemio Franchi',15373,1901,_country.italy,];
    map[_name.spal] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(44.839722,11.6075),
			'Estádio Paolo Mazza',16751,1907,_country.italy,];
    map[_name.ternana] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(42.5621775, 12.635254),
      'Libero Liberati',22000,1925,_country.italy,];
    map[_name.varese] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Franco Ossola',10000,1910,_country.italy,];
    map[_name.venezia] = [ClubColors(Colors.black,Colors.orange,Colors.green),pattern.solid,Coordinates(45.427761,12.363731),
			'Pierluigi Penzo',9977,1907,_country.italy,];
    map[_name.vicenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.544167,11.555556),
			'Estádio Romeo Menti',17163,1902,_country.italy,];

    //ESPANHA
    map[_name.almeria] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.84,-2.435278),
      'Estadio de los Juegos Mediterráneos',22000,1989,_country.spain,];
    map[_name.athleticbilbao] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.264205,-2.949369),
			'San Mamés',53289,1898,_country.spain,[_name.realsociedad]];
    map[_name.atleticomadrid] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(40.436111,-3.599444),
			'Wanda Metropolitano',67829,1903,_country.spain,[_name.realmadrid]];
    map[_name.barcelona] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(41.380833,2.1225),
			'Camp Nou',99354,1899,_country.spain,[_name.realmadrid]];
    map[_name.cadiz] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(36.50274029685163, -6.272703671625995),
      'Estadio Ramón de Carranza',20724,1910,_country.spain,];
    map[_name.celtavigo] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(42.211861,-8.740328),
			'Balaídos',29000,1923,_country.spain,];
    map[_name.elche] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(38.266944,-0.663333),
      'Martínez Valero',31388,1922,_country.spain,];
    map[_name.espanyol] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(41.347861,2.075667),
			'Cornellà-El Prat',40500,1900,_country.spain,];
    map[_name.getafe] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(40.325556,-3.714722),
			'Coliseum Alfonso Pérez',17700,1983,_country.spain,];
    map[_name.girona] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(41.961560623544194, 2.8289012665501416),
      'Estádio Montilivi',13500,1930,_country.spain,];
    map[_name.levante] = [ClubColors(grena,Colors.blue),pattern.stripes2,Coordinates(39.494722,-0.364167),
			'	Ciutat de Valencia',25534,1909,_country.spain,[_name.valencia]];
    map[_name.mallorca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(39.59,2.63),
      'Iberostar Estádio',23142,1916,_country.spain,];
    map[_name.osasuna] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(42.796667,-1.636944),
      'Reyno de Navarra',19800,1920,_country.spain,];
    map[_name.rayoVallecano] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(40.391944,-3.658961),
      'Vallecas Campo de Futebol',15105,1924,_country.spain,];
    map[_name.realbetis] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.356403,-5.981611),
			'Benito Villamarín',60720,1907,_country.spain,[_name.sevilla]];
    map[_name.realmadrid] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(40.45306,-3.68835),
			'Santiago Bernabeu',81044,1902,_country.spain,[_name.barcelona,_name.atleticomadrid]];
    map[_name.realsociedad] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.301378,-1.973617),
			'Anoeta',39500,1909,_country.spain,[_name.athleticbilbao]];
    map[_name.sevilla] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.383878,-5.970467),
			'Ramón Sánchez Pizjuán',43883,1890,_country.spain,[_name.realbetis]];
    map[_name.valladolid] = [ClubColors(Colors.purple,Colors.white),pattern.stripes2,Coordinates(41.644444,-4.761111),
			'José Zorrilla',26512,1928,_country.spain,];
    map[_name.valencia] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(39.474722,-0.358333),
			'Mestalla',48600,1919,_country.spain,];
    map[_name.villareal] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(39.944167,-0.103611),
			'La Cerámica',23500,1923,_country.spain,];

    map[_name.alaves] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(42.837224, -2.68794204),
			'Mendizorroza',19840,1921,_country.spain,];
    map[_name.albacete] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(38.981201108390465, -1.8516267370025241),
			'Carlos Belmonte',17300,1940,_country.spain,];
    map[_name.barcelonaB] = [ClubColors(grena,Colors.blue),pattern.stripes2,Coordinates(41.37443652, 2.050680580),
			'Estadi Johan Cruyff',6000,1970,_country.spain,];
    map[_name.badajoz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.85909805058098, -7.005712641258505),
			'Nuevo Vivero',14898,1905,_country.spain,];
    map[_name.burgos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.34445896760816, -3.6803115846755574),
			'Estádio Municipal de El Plantío',12200,1994,_country.spain,];
    map[_name.cartagena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.60997607308336, -0.9961850276088828),
			'Estádio Cartagonova',15105,1995,_country.spain,];
    map[_name.compostela] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.88266375966114, -8.51672248511444),
			'Vero Boquete',13000,1962,_country.spain,];
    map[_name.cordoba] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.872294,-4.764642),
			'Estadio Nuevo Arcángel',25100,1954,_country.spain,];
    map[_name.eibar] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(43.18193713680332, -2.47563195763621),
			'Municipal de Ipurua',8164,1940,_country.spain,];
    map[_name.extremadura] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
			'Francisco de la Hera',11580,1924,_country.spain,];
    map[_name.tarragona] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.19020152864727, 2.4763709658248683),
			'Nou Estadi',14500,1886,_country.spain,];
    map[_name.granada] = [ClubColors(Colors.red,Colors.white),pattern.horStripes,Coordinates(37.152967,-3.595736),
			'Nuevo Los Cármenes',22524,1931,_country.spain,];
    map[_name.hercules] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(38.3580625, -0.4914326032),
			'José Rico Pérez',29500,1922,_country.spain,];
    map[_name.huelva] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(37.24660814, -6.9540283),
			'Estadio Nuevo Colombino',21670,1889,_country.spain,];
    map[_name.huesca] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(42.131944,-0.424444),
			'Estádio El Alcoraz',8000,1960,_country.spain,];
    map[_name.ibiza] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.913791833, 1.415050),
			'Estádio Municipal de Can Misses',4500,2015,_country.spain,];
    map[_name.lacoruna] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.368667,-8.417372),
      'Municipal de Riazor',35600,1906,_country.spain,];
    map[_name.lasPalmas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(28.1,-15.456667),
			'Estádio Gran Canaria',31250,1949,_country.spain,];
    map[_name.leganes] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(40.3406935, -3.7602580),
			'Municipal de Butarque',10958,1928,_country.spain,];
    map[_name.logrones] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(42.45328234, -2.453517217),
      'Estadio Las Gaunas',16000,1940,_country.spain,];
    map[_name.lugo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(43.003350, -7.57097154),
      'Anxo Carro',7070,1953,_country.spain,];
    map[_name.malaga] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(36.734092,-4.426422),
			'La Rosaleda',30044,1948,_country.spain,];
    map[_name.merida] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.9144846, -6.33649039),
			'Estadio Romano',14600,1912,_country.spain,];
    map[_name.mirandes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.6809190, -2.93530024),
      'Municipal de Anduva',6000,1927,_country.spain,];
    map[_name.murcia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.0424994, -1.14406194),
			'Nueva Condomina',33900,1908,_country.spain,];
    map[_name.numancia] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.754444,-2.467778),
			'Nuevo Estadio Los Pajaritos',9025,1945,_country.spain,];
    map[_name.ponferradina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.5574263, -6.599923),
      'El Toralín',8200,1922,_country.spain,];
    map[_name.realmadridB] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(40.477060, -3.61423761),
			'Estádio Alfredo Di Stéfano',12000,1930,_country.spain,];
    map[_name.salamanca] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.995500, -5.664743645),
			'El Helmántico',17341,2013,_country.spain,];
    map[_name.sportingGijon] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.536111,-5.637222),
			'El Molinón',30000,1905,_country.spain,];
    map[_name.tenerife] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(28.463192602, -16.2608979),
			'Heliodoro López',24000,1912,_country.spain,];
    map[_name.toledo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(39.86914546, -4.0182605),
			'Salto del Caballo',5500,1928,_country.spain,];
    map[_name.racingSantander] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(43.476370, -3.7933152),
      'Estádio El Sardinero',22400,1913,_country.spain,];
    map[_name.realOviedo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.3608751, -5.86979084),
			'Novo Estádio Carlos Tartiere',30500,1926,_country.spain,];
    map[_name.sabadell] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(41.5546512, 2.09199163),
      'Nova Creu Alta',11908,1903,_country.spain,];
    map[_name.xerez] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(36.6896000, -6.1198111),
			'Estadio de Chapín',20523,1947,_country.spain,];
    map[_name.zaragoza] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.636592,-0.901822),
			'La Romareda',34596,1932,_country.spain,];

    //ALEMANHA
    map[_name.augsburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.32333464205292, 10.886761848412458),
      'SGL Arena',30660,1907,_country.germany,];
    map[_name.leverkusen] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(51.038255555,7.002205555),
      'BayArena',30210,1904,_country.germany,];
    map[_name.bayernmunique] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.218775,11.624752777),
      'Allianz Arena',75024,1900,_country.germany,];
    map[_name.bochum] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.489944,7.236489),
      'Vonovia Ruhrstadion',27599,1848,_country.germany,];
    map[_name.dortmund] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.4925,7.451667),
      'Signal Iduna Park',81359,1909,_country.germany,[_name.schalke04]];
    map[_name.moenchengladbach] = [ClubColors(Colors.white,Colors.green,Colors.black),pattern.solid,Coordinates(51.174583333,6.385463888),
			'Borussia-Park',54022,1900,_country.germany,];
    map[_name.colonia] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.933611,6.875),
      'RheinEnergieStadion',50000,1948,_country.germany,];
    map[_name.eintrachtfrankfurt] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.068611,8.645278),
			'Deutsche Bank Park',51500,1899,_country.germany,];
    map[_name.freiburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.988889,7.893056),
			'Europa-Park Stadion',34700,1904,_country.germany,];
    map[_name.herthaberlim] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(52.514722222,13.239444444),
			'Olímpico de Berlim',74649,1892,_country.germany,];
    map[_name.hoffenheim] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.239,8.888278),
			'Rhein-Neckar-Arena',30150,1899,_country.germany,];
    map[_name.mainz05] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.984167,8.224167),
      'Opel Arena',34034,1905,_country.germany,];
    map[_name.rbleipzig] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.345833,12.348056),
			'Red Bull Arena',42146,2009,_country.germany,];
    map[_name.schalke04] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.554502777,7.067588888),
			'Veltins-Arena',62271,1904,_country.germany,[_name.dortmund]];
    map[_name.stuttgart] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(48.792222,9.231944),
			'Mercedes-Benz Arena',60441,1893,_country.germany,];
    map[_name.unionBerlin] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.457222,13.568056),
      'An der Alten Försterei',22012,1966,_country.germany,];
    map[_name.werderbremen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.066389,8.8375),
			'Wohninvest Weserstadion',42100,1899,_country.germany,];
    map[_name.wolfsburg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.431944,10.803889),
			'Volkswagen Arena',30000,1945,_country.germany,];

    map[_name.aachen] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(50.7933333,6.097222222),
			'New Tivoli',32960,1900,_country.germany,];
    map[_name.arminiaBiefeld] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(52.031389,8.516944),
			'Bielefelder Alm',27300,1905,_country.germany,];
    map[_name.berliner] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.54062157, 13.4768246),
			'Dynamo-Sportforum',10000,1953,_country.germany,];
    map[_name.darmstadt] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.85781666103, 8.672877134887),
			'Merck-Stadion am Böllenfalltor',17000,1898,_country.germany,];
    map[_name.duisburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.409028,6.778639),
			'MSV-Arena',31500,1902,_country.germany,];
    map[_name.dynamoDresden] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.040278,13.747778),
			'DDV-Stadion',32066,1953,_country.germany,];
    map[_name.eintrachtBraunschweiger] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(52.29,10.521389),
			'Eintracht-Stadion',23325,1895,_country.germany,];
    map[_name.energieCottbus] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.751389,14.345556),
      'Stadion der Freundschaft',25450,1966,_country.germany,];
    map[_name.erzgebirgeaue] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(50.5975,12.711111),
      'Erzgebirgsstadion',15711,1946,_country.germany,];
    map[_name.fortunaDusseldorf] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.261539,6.733083),
			'Merkur Spielarena',54600,1895,_country.germany,];
    map[_name.greutherFurth] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(49.4870762463, 11.0000170),
			'Stadion am Laubenweg',15500,1903,_country.germany,];
    map[_name.hamburgo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(53.5872273, 9.89854),
      'Volksparkstadion',57000,1887,_country.germany,];
    map[_name.hannover96] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(52.3601348913, 9.73151458536),
			'HDI-Arena',49000,1896,_country.germany,];
    map[_name.hansaRostock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.08495,12.095188888),
			'Ostseestadion',29000,1965,_country.germany,];
    map[_name.heidenheim] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(48.66851956, 10.13918217),
      'Voith-Arena',15000,1911,_country.germany,];
    map[_name.holsteinkiel] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.349072, 10.12361715),
      'Holstein-Stadion',15034,1900,_country.germany,];
    map[_name.ingolstadt] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.745434, 11.485777),
      'Audi-Sportpark',15445,2004,_country.germany,];
    map[_name.jahnregensburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.99090071, 12.1074654),
      'Jahnstadion Regensburg',15210,1907,_country.germany,];
    map[_name.kaiserslautern] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.43448525, 7.77761161),
      'Fritz Walter',49850,1900,_country.germany,];
    map[_name.karlsruher] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.02,8.41305555),
			'Wildparkstadion',32306,1894,_country.germany,];
    map[_name.magdeburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.1254076, 11.6705710),
			'MDCC-Arena',30098,1965,_country.germany,];
    map[_name.munique1860] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(48.110833,11.574444),
			'Grünwalder Stadion',15000,1860,_country.germany,];
    map[_name.nurnberg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.42632233, 11.126222),
			'Max-Morlock-Stadion',49923,1900,_country.germany,];
    map[_name.paderborn] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.731389,8.710833),
			'Benteler-Arena',15000,1907,_country.germany,];
    map[_name.rotWeissEssen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.4867758, 6.9768),
			'Georg-Melches-Stadion',22500,1907,_country.germany,];
    map[_name.sandhausen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.3322165, 8.647684677),
      'BWT-Stadion am Hardtwald',16003,1916,_country.germany,];
    map[_name.saarbrucken] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(49.2475,6.984167),
			'Ludwigsparkstadion',15414,1903,_country.germany,];
    map[_name.stPauli] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(53.554444,9.967778),
			'Millerntor-Stadion',29546,1910,_country.germany,];
    map[_name.uerdigen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.339167,6.603611),
      'Grotenburg-Stadion',34500,1905,_country.germany,];
    map[_name.carlzeissjena] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.germany,];
    map[_name.vorwarts] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.germany,];

    //FRANÇA
    map[_name.ajaccio] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.931255913, 8.777428344),
      'François Coty',12000,1910,_country.france,];
    map[_name.angers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(47.4606232855, -0.5314198073),
      'Stade Jean-Bouin',18752,1919,_country.france,];
    map[_name.auxerre] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.78717964, 3.5894887694),
      'Stade l\'Abbé-Deschamps',23467,1905,_country.france,];
    map[_name.bordeaux] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(44.8974722523, -0.561285887),
			'Matmut Atlantique',42052,1881,_country.france,];
    map[_name.brest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.402932,-4.461694),
      'Stade Francis-Le Blé',15000,1950,_country.france,];
    map[_name.clermont] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(45.81592183512457, 3.1208739),
      'Stade Gabriel-Montpied',10607,1990,_country.france,];
    map[_name.lens] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonal,Coordinates(50.43300186, 2.81536255633),
      'Félix Bollaert',41229,1906,_country.france,];
    map[_name.lille] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(50.611944,3.130556),
			'Pierre-Mauroy',50186,1944,_country.france,];
    map[_name.lorient] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(47.74833585, -3.36818605),
      'Stade du Moustoir',18500,1926,_country.france,];
    map[_name.lyon] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(45.765224,4.982131),
			'Parc Olympique Lyonnais',59186,1950,_country.france,];
    map[_name.monaco] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(43.727615426, 7.415587736),
			'Louis II',18523,1924,_country.france,];
    map[_name.montpellier] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(43.269722222,5.395833333),
			'Stade de la Mosson',32939,1919,_country.france,[_name.nimes]];
    map[_name.nantes] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(47.25625627, -1.524267292),
			'Stade de la Beaujoire',37463,1943,_country.france,];
    map[_name.nice] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(43.705138888,7.192583333),
			'Allianz Riviera',35624,1904,_country.france,];
    map[_name.om] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(43.26998307, 5.3962199073),
			'Vélodrome',67395,1899,_country.france,[_name.psg]];
    map[_name.psg] = [ClubColors(darkblue,Colors.red),pattern.oneVertStripe,Coordinates(48.8413888,2.2530555),
			'Parc des Princes',48583,1970,_country.france,[_name.om]];
    map[_name.reims] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.246667,4.025),
			'Auguste Delaune',21668,1931,_country.france,];
    map[_name.rennes] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(48.107472222,-1.712861111),
			'Roazhon Park',29778,1901,_country.france,];
    map[_name.strasbourg] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.560064,7.754969),
      'Stade de la Meinau',26109,1906,_country.france,];
    map[_name.toulouse] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(43.583296,1.434055),
      'Stade de Toulouse',35500,1937,_country.france,];
    map[_name.troyes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(48.30766856, 4.0987888),
      'Stade de l\'Aube',20400,1900,_country.france,];

    map[_name.amiens] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.89432771, 2.26331715),
			'Stade de la Licorne',12097,1901,_country.france,];
    map[_name.annecy] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(45.9165575, 6.1180684),
      'Parc des Sports',15714,1927,_country.france,];
    map[_name.bastia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6514,9.442619),
			'Stade Armand Cesari',16500,1905,_country.france,];
    map[_name.caen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.17955728, -0.3960764),
			'Michel d\'Ornano',21500,1913,_country.france,];
    map[_name.cannes] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.55317462, 6.964876416),
      'Pierre de Coubertin',17500,1909,_country.france,];
    map[_name.chamois] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.3170594, -0.48961761),
      'Stade René-Gaillard',10898,1919,_country.france,];
    map[_name.dijon] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.3249340, 5.06840377),
			'Stade Gaston-Gérard',16000,1998,_country.france,];
    map[_name.evian] = [ClubColors(Colors.purpleAccent,Colors.white),pattern.dividedHor,Coordinates(45.9160, 6.11834259),
      'Parc des Sports',15660,2007,_country.france,];
    map[_name.grenoble] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.1875313, 5.740180234),
			'Stade des Alpes',20062,1892,_country.france,];
    map[_name.guingamp] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.56549284, -3.1643878),
			'Stade du Roudourou',18256,1912,_country.france,];
    map[_name.lavallois] = [ClubColors(Colors.orange,Colors.orange),pattern.solid,Coordinates(48.082332, -0.754686),
      'Stade Francis-Le-Basser',18739,1902,_country.france,];
    map[_name.lehavre] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.4988613, 0.1698838),
			'Stade Océane',25178,1872,_country.france,];
    map[_name.lemans] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(47.95919009, 0.223153075),
			'MMArena',17500,1985,_country.france,];
    map[_name.metz] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(49.11020796, 6.1603276020),
      'Stade Saint-Symphorien',26700,1919,_country.france,];
    map[_name.nancy] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.6955,6.210687),
			'Stade Marcel Picot',20085,1967,_country.france,];
    map[_name.nimes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.8161358, 4.359880),
			'Stade des Costières',18482,1937,_country.france,[_name.montpellier]];
    map[_name.orleans] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.8406476, 1.9414294),
      'Stade de la Source',8000,1902,_country.france,];
    map[_name.parisFC] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.818611,2.346667),
			'Stade Sébastien Charléty',20000,1969,_country.france,];
    map[_name.pau] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(43.309443, -0.3169603),
      'Stade du Hameau',13966,1920,_country.france,];
    map[_name.quevilly] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(49.427630, 1.0512107),
      'Amable Lozai',2500,1902,_country.france,];
    map[_name.redstar] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(48.90659978, 2.34197952),
			'Stade Bauer',10000,1897,_country.france,];
    map[_name.rodez] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(44.351570, 2.5637119),
      'Stade Paul-Lignon',5955,1929,_country.france,];
    map[_name.rouen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(49.41143361, 1.07069394),
			'Stade Robert Diochon',12018,1899,_country.france,];
    map[_name.saintetienne] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(45.460833,4.39),
      'Geoffroy-Guichard',42000,1919,_country.france,];
    map[_name.sedan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(49.69404732, 4.93880095),
			'Stade Louis Dugauguez',23189,1919,_country.france,];
    map[_name.sochaux] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.512403,6.811094),
			'Auguste Bonal',20005,1928,_country.france,];
    map[_name.toulon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.126298, 5.9023646),
      'Stade de Bon Rencontre',8000,1944,_country.france,];
    map[_name.valenciennes] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(50.3490100, 3.5325451),
			'Stade du Hainaut',25172,1913,_country.france,];
    map[_name.villefranche] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.00, 4.7073536),
      'Stade Armand Chouffet',5000,1927,_country.france,];

    //PORTUGAL
    map[_name.benfica] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.75301495, -9.1844710),
			'Estádio da Luz',64642,1904,_country.portugal,[_name.porto,_name.sporting]];
    map[_name.porto] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(41.161758,-8.583933),
			'Estádio do Dragão',50035,1893,_country.portugal,[_name.benfica,_name.sporting]];
    map[_name.sporting] = [ClubColors(Colors.green,Colors.white),pattern.horStripes,Coordinates(38.76119444,-9.16078333),
			'José Alvalade',50095,1906,_country.portugal,[_name.porto,_name.benfica]];
    map[_name.alverca] = [ClubColors(grena,darkblue),pattern.stripes2,Coordinates(38.897982, -9.0350067),
      'Alverca do Ribatejo',7705,1939,_country.portugal,];
    map[_name.arouca] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(40.933557625, -8.249067289),
			'Estádio Municipal de Arouca',5000,1952,_country.portugal,];
    map[_name.beiramar] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.6478986, -8.593620),
			'Municipal de Aveiro',32830,1923,_country.portugal,];
    map[_name.braga] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(41.56272876, -8.429015524),
			'Municipal de Braga',30286,1921,_country.portugal,[_name.vitoriaguimaraes]];
    map[_name.boavista] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(41.162222,-8.64277777),
			'Estádio do Bessa Século XXI',28263,1903,_country.portugal,];
    map[_name.belenenses] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.702778,-9.207778),
			'Estádio do Restelo',32000,1919,_country.portugal,];
    map[_name.casapia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(38.73764642, -9.20340044),
			'Estádio Pina Manique',5000,1920,_country.portugal,];
    map[_name.chaves] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.75094886, -7.464533445),
			'	Estádio Municipal de Chaves',9000,1949,_country.portugal,];
    map[_name.coimbra] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.2035513, -8.406711275),
			'Estádio Cidade de Coimbra',29622,1887,_country.portugal,];
    map[_name.covilha] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.2828334, -7.5122373),
			'Municipal José Santos Pinto',3500,1923,_country.portugal,];
    map[_name.espinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0021047, -8.64512619),
      'Estádio Comendador Manuel',7500,1914,_country.portugal,];
    map[_name.estoril] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(38.7153065, -9.40573817),
			'António Coimbra da Mota',8000,1939,_country.portugal,];
    map[_name.estrelaamadora] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(38.75216476, -9.22726611),
			'Estádio José Gomes',9288,1932,_country.portugal,];
    map[_name.famalicao] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(41.4016829, -8.52243319),
			'Estádio Municipal de Famalicão',5307,1931,_country.portugal,];
    map[_name.farense] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.02232811, -7.928202),
			'Estádio de São Luís',7000,1910,_country.portugal,];
    map[_name.feirense] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.926660, -8.545820),
      'Marcolino de Castro',5600,1918,_country.portugal,];
    map[_name.gilVicente] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.533888888,-8.611111111),
			'Estádio Cidade de Barcelos',12046,1924,_country.portugal,];
    map[_name.leixoes] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(41.1842451364265, -8.666396418),
			'Estádio do Mar',9821,1907,_country.portugal,];
    map[_name.mafra] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-26.1286357, -49.80125986),
      'Municipal de Mafra',1257,1965,_country.portugal,];
    map[_name.maritimo] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(32.645561,-16.928331),
			'Estádio dos Barreiros',10932,1910,_country.portugal,];
    map[_name.moreirense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3782047, -8.3542469),
			'Comendador Joaquim de Almeida Freitas',6153,1938,_country.portugal,];
    map[_name.nacionalMadeira] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.670625,-16.883525),
			'Estádio da Madeira',5500,1910,_country.portugal,];
    map[_name.naval] = [ClubColors(Colors.green,Colors.white),pattern.horStripes,Coordinates(40.162827, -8.85902270),
      'José Bento Pessoa',9000,1893,_country.portugal,];
    map[_name.pacosDeFerreira] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(41.27144668, -8.38488781),
			'Capital do Móvel',9077,1950,_country.portugal,];
    map[_name.penafiel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.211768, -8.27777600),
			'Estádio Municipal 25 de Abril',5300,1951,_country.portugal,];
    map[_name.portimonense] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.13588, -8.540001),
			'Estádio Municipal de Portimão',6000,1914,_country.portugal,];
    map[_name.olhanense] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(37.029370, -7.84837313),
			'Estádio José Arcanjo',10080,1912,_country.portugal,];
    map[_name.rioAve] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3628257, -8.73965321),
			'Estádio dos Arcos',5000,1939,_country.portugal,];
    map[_name.salgueiros] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.15904746, -8.572435608),
			'Complexo Desportivo de Campanhã',1500,1911,_country.portugal,];
    map[_name.santaClara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(37.76392847, -25.622288584),
			'Estádio de São Miguel',10000,1927,_country.portugal,];
    map[_name.leiria] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(39.74945449, -8.81260997427),
			'Estádio Dr. Magalhães Pessoa',25000,1966,_country.portugal,];
    map[_name.tondela] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(40.51203795, -8.082878165),
			'Estádio João Cardoso',5000,1933,_country.portugal,];
    map[_name.varzim] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.3879700136, -8.771977516024036),
			'Estádio do Varzim Sport Club',7280,1915,_country.portugal,];
    map[_name.vilafranquense] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(38.94535, -8.99430208),
      'Campo do Cevadeiro',2500,1957,_country.portugal,];
    map[_name.viseu] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.659553216, -7.9003969788),
			'Estádio do Fontelo',6912,1914,_country.portugal,];
    map[_name.vizela] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.38882478, -8.306887911),
			'Estádio do Futebol Clube de Vizela',6000,1939,_country.portugal,];
    map[_name.vitoriaguimaraes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.446135622, -8.300460355),
			'D. Afonso Henriques',30146,1922,_country.portugal,[_name.braga]];
    map[_name.setubal] = [ClubColors(Colors.white,Colors.green),pattern.stripes2,Coordinates(38.53138889,-8.891111),
			'Estádio do Bonfim',21530,1910,_country.portugal,];

    //HOLANDA
    map[_name.ajax] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(52.3141666,4.9419444),
			'Johan Cruijff Arena',54990,1900,_country.netherlands,[_name.psv,_name.feyenoord]];
    map[_name.feyenoord] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(51.89389444,4.52325277),
			'De Kuip',51577,1908,_country.netherlands,[_name.psv,_name.ajax]];
    map[_name.psv] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.4418878, 5.46784477),
			'Philips Stadion',35000,1912,_country.netherlands,[_name.ajax,_name.feyenoord]];
    map[_name.az] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.6130966, 4.742401887),
			'AFAS Stadium',17023,1967,_country.netherlands,];
    map[_name.cambuur] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(53.2055474, 5.8145969),
      'Cambuur Stadion',10000,1964,_country.netherlands,];
    map[_name.denhaag] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.0628811, 4.383067425),
			'Estádio Cars Jeans',15000,1905,_country.netherlands,];
    map[_name.emmen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(52.77479885, 6.9456866),
      'Univé Stadion',8700,1925,_country.netherlands,];
    map[_name.excelsior] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(51.9170728, 4.520500),
      'Stadion Woudestein',3531,1902,_country.netherlands,];
    map[_name.fortunasittard] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(50.9919321, 5.8437577),
      'Wagner & Partners Stadion',12500,1968,_country.netherlands,];
    map[_name.goaheadeagles] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.2604448, 6.1726971),
      'De Adelaarshorst',10500,1902,_country.netherlands,];
    map[_name.groningen] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(53.2062203, 6.59170906),
			'Euroborg',22329,1915,_country.netherlands,];
    map[_name.heerenveen] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(52.9588595, 5.93625977),
			'Abe Lenstra',12080,1920,_country.netherlands,];
    map[_name.heracles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.3389281, 6.650802339),
      'Polman Stadion',26100,1903,_country.netherlands,];
    map[_name.nacbreda] = [ClubColors(Colors.yellow,Colors.black),pattern.diagonal,Coordinates(51.59486073, 4.750421595),
      'Rat Verlegh',17064,1912,_country.netherlands,];
    map[_name.necnijmegen] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.822486, 5.837214),
      'Stadion de Goffert',12500,1900,_country.netherlands,];
    map[_name.roda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(50.8572678, 6.0058343),
			'Parkstad Limburg Stadion',9790,1962,_country.netherlands,];
    map[_name.rapidjc] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
			'Gemeentelijk Sportpark Kaalheide',25000,1954,_country.netherlands,];    //EXTINTO vira roda jc
    map[_name.spartarotterdam] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.9200241, 4.4337761),
			'Sparta Stadion Het Kasteel',11026,1888,_country.netherlands,];
    map[_name.twente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.2366666,6.8375),
			'De Grolsch Veste',30205,1965,_country.netherlands,];
    map[_name.utrecht] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.0785286, 5.14622137),
			'Galgenwaard',24426,1970,_country.netherlands,];
    map[_name.vitesse] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(51.96292454, 5.8930736),
			'GelreDome',21248,1892,_country.netherlands,];
    map[_name.volendam] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.4945818, 5.06643744),
      'Kras Stadion',6260,1920,_country.netherlands,];
    map[_name.vvv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.3521076, 6.179960356),
      'De Koel',8000,1903,_country.netherlands,];
    map[_name.waalwijk] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(51.686679, 5.089090),
      'Mandemakers Stadion',7500,1940,_country.netherlands,];
    map[_name.willem] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(51.5430195, 5.067781659),
			'Willen II Stadion',45500,1896,_country.netherlands,];
    map[_name.zwolle] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5171852, 6.120810235),
      'IJsseldeltastadion',12500,1910,_country.netherlands,];
    map[_name.dws] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.netherlands,];

    //BELGICA
    map[_name.anderlecht] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(50.8344335, 4.2979681),
			'Constant Vanden Stock',28063,1908,_country.belgium,[_name.brugge]];
    map[_name.beveren] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.2143650, 4.2442212),
      'Freethiel Stadion',13290,1936,_country.belgium,];
    map[_name.brugge] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.1933339, 3.180370),
			'Jan Breydel',30000,1891,_country.belgium,[_name.anderlecht]];
    map[_name.cerclebrugge] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(51.1934139, 3.1807351),
      'Jan Breydel',29062,1899,_country.belgium,];
    map[_name.charleroi] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(50.4148749, 4.45318367),
      'Stade du Pays de Charleroi',25000,1904,_country.belgium,];
    map[_name.genk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.0050548, 5.5335494),
			'Cristal Arena',24604,1988,_country.belgium,];
    map[_name.gent] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.01671567, 3.73471876),
			'Ghelamco Arena',20000,1900,_country.belgium,];
    map[_name.kaseupen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.6263931, 6.04539),
      'Kehrwegstadion',8366,1945,_country.belgium,];
    map[_name.kortrijk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.83036, 3.2491287),
      'Guldensporenstadion',9500,1901,_country.belgium,];
    map[_name.lierse] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.1443335, 4.57393474),
			'Herman Vanderpoorten Stadion',15500,1906,_country.belgium,];
    map[_name.mechelen] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes2,Coordinates(51.036870, 4.487291538),
      'AFAS Stadion',10000,1904,_country.belgium,];
    map[_name.oostende] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.2169176, 2.886586),
      'Albertparkstadion',10000,1904,_country.belgium,];
    map[_name.royalAntwerp] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.23260, 4.47252263),
			'Stadium “BOSUIL“',10000,1880,_country.belgium,];
    map[_name.standardliege] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.609929, 5.544381876),
      'Maurice Dufrasne',30030,1898,_country.belgium,];
    map[_name.sttruidense] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.8134616, 5.166361),
      'Estádio Stayen',11250,1933,_country.belgium,];
    map[_name.saintgilloise] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(50.8178096, 4.329303),
      'Stade Joseph Marien',6000,1897,_country.belgium,];
    map[_name.westerlo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.0947729, 4.928768),
      'Het Kuipje',7982,1933,_country.belgium,];
    map[_name.zulteWaregem] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.88311, 3.42904),
      'Regenboogstadion',8500,1950,_country.belgium,];
    map[_name.molenbeek] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.belgium,];

    //ESCOCIA
    map[_name.aberdeen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.15986178, -2.0880853),
			'Pittodrie Stadium',22199,1903,_country.scotland];
    map[_name.celtic] = [ClubColors(Colors.green,Colors.white),pattern.horStripes,Coordinates(55.84971111,-4.20558889),
      'Celtic Park',60355,1888,_country.scotland,[_name.rangers]];
    map[_name.dundee] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.4748207, -2.9686031),
			'Tannadice Park',14209,1909,_country.scotland,];
    map[_name.hibernian] = [ClubColors(Colors.green,Colors.white),pattern.sleeves,Coordinates(55.96189876, -3.1650656),
			'Easter Road',20421,1875,_country.scotland,];
    map[_name.hearts] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(55.9389923, -3.232460),
			'Tynecastle Stadium',20099,1874,_country.scotland,];
    map[_name.kilmarnock] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(55.604225,-4.508122),
      'Rugby Park',18128,1869,_country.scotland,];
    map[_name.livingstone] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.88594835, -3.522035),
      'Almondvale Stadium',9521,1943,_country.scotland,];
    map[_name.motherwell] = [ClubColors(Colors.yellow,Colors.redAccent),pattern.solid,Coordinates(55.7804536, -3.9800776),
      'Fir Park',13742,1886,_country.scotland,];
    map[_name.rangers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.8530555,-4.309166666),
      'Ibrox Stadium',50817,1872,_country.scotland,[_name.celtic]];
    map[_name.rossCounty] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(57.59589451, -4.4187127),
      'Victoria Park',6310,1929,_country.scotland,];
    map[_name.stmirren] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(55.8506123, -4.4442139),
      'St Mirren Park',7937,1877,_country.scotland,];
    map[_name.stjohnstone] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.409916, -3.4767773),
      'McDiarmid Park',10696,1884,_country.scotland,];
    //IRLANDA DO NORTE
    map[_name.crusaders] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(54.624341808, -5.92197737),
      'Seaview',3054,1898,_country.northernIreland,];
    map[_name.glentoran] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(54.6030087, -5.8911762),
      'The Oval',26556,1882,_country.northernIreland,];
    map[_name.linfield] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.582700, -5.95480680),
			'Windsor Park',21000,1886,_country.northernIreland,];
    // GALES
    map[_name.balatown] = [ClubColors(Colors.white,Colors.black),pattern.dividedHor,Coordinates(52.9124643, -3.601483437),
      'Maes Tegid',3004,1880,_country.wales];
    map[_name.newsaints] = [ClubColors(Colors.white,Colors.green),pattern.dividedHor,Coordinates(52.8759,-3.02631),
			'Park Hall',2034,1896,_country.wales];
    map[_name.newtown] = [ClubColors(Colors.red,Colors.black),pattern.dividedHor,Coordinates(52.5115521, -3.3228284),
      'Latham Park',5000,1875,_country.wales];
    //IRLANDA
    map[_name.bohemian] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.3615383, -6.274242753),
			'Dalymount Park',8030,1890,_country.ireland,];
    map[_name.cork] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(51.8855177012, -8.468353748),
			'Turner Cross',7000,1984,_country.ireland,];
    map[_name.derry] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.99085262, -7.336110758),
			'Brandywell',7700,1928,_country.ireland,];
    map[_name.dundalk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.999213461, -6.41599349),
			'Oriel Park',13600,1919,_country.ireland,];
    map[_name.shamrock] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.28363777, -6.373458012),
			'Estádio de Tallaght',6000,1899,_country.ireland,];
    map[_name.waterford] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ireland,];

    //NORDICOS
    //NORUEGA
    map[_name.aalesund] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(62.46965856, 6.1872397),
      'Color Line Stadion',10778,1914,_country.norway,];
    map[_name.fredrikstad] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(59.2116267, 10.9374700),
			'Nye Fredrikstad Stadion',13300,1903,_country.norway,];
    map[_name.glimt] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(67.27666691, 14.38474245),
			'Aspmyra Stadion',7354,1916,_country.norway,];
    map[_name.lillestrom] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(59.962752,11.063458),
      'Åråsen Stadion',12000,1917,_country.norway,];
    map[_name.lyn] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.9491344, 10.734334),
			'Ullevaal Stadion',25572,1896,_country.norway,];
    map[_name.molde] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.73348179, 7.1483130),
			'Aker Stadion',11167,1911,_country.norway,[_name.rosenborg]];
    map[_name.odd] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(59.2114814, 9.5900116),
      'Skagerak Arena',13500,1894,_country.norway,];
    map[_name.rosenborg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(63.41251977, 10.405168),
      'Lerkendal Stadion',21405,1917,_country.norway,[_name.molde]];
    map[_name.valerenga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(59.9492525, 10.7344950),
			'Ullevaal Stadion',25000,1913,_country.norway,];
    map[_name.viking] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(58.9146757, 5.73094724),
			'	Viking Stadion',16000,1899,_country.norway,];
    //SUECIA
    map[_name.aik] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(57.705889, 11.98060),
			'Estádio Gamla Ullevi',18416,1904,_country.sweden,];
    map[_name.djurgarden] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(59.291191, 18.084667),
			'Stockholmsarenan',33000,1899,_country.sweden,];
    map[_name.elfsborg] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(57.734357, 12.9347772),
			'Arena de Borås',17000,1904,_country.sweden,];
    map[_name.hacken] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(57.71921, 11.93074),
      'Bravida Arena',8480,1940,_country.sweden,];
    map[_name.hammarby] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(59.290854, 18.085401),
			'Tele2 Arena',33000,1915,_country.sweden,];
    map[_name.helsingborg] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.345391, 18.0790722),
			'Stockholm Olympic Stadium',17100,1907,_country.sweden,];
    map[_name.kalmar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.6693123, 16.3598183),
			'Stade Fredriksskans',10000,1910,_country.sweden,];
    map[_name.ifkgoteborg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(57.706313, 11.980112),
			'Gamla Ullevi',18416,1904,_country.sweden,];
    map[_name.malmo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.583611,12.987777),
			'Eleda Stadion',24000,1910,_country.sweden,];
    map[_name.mjallby] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(56.0120291, 14.71628237),
      'Strandvallen',6750,1939,_country.sweden,];
    map[_name.norrkoping] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(58.584254, 16.1730),
			'Nya Parken',17234,1897,_country.sweden,];
    map[_name.sirius] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(59.849614, 17.6454),
      'Studenternas IP',7600,1907,_country.sweden,];
    map[_name.atvidabergs] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.sweden,];
    //DINAMARCA
    map[_name.aalborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.052210568355, 9.899045278578187),
			'Estádio Aalborg',13800,1885,_country.denmark,];
    map[_name.aarhus] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(56.1319897, 10.196636954464124),
			'NRGi Park',20032,1880,_country.denmark,];
    map[_name.brondby] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(55.64892327650882, 12.417979390429544),
      'Brøndby Stadion',29000,1964,_country.denmark,];
    map[_name.copenhague] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.702801493878425, 12.572584226298794),
      'Parken Stadium',42358,1992,_country.denmark,];
    map[_name.esbjerg] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(55.48228994837166, 8.439832057459824),
      'Blue Water Arena',18000,1924,_country.denmark,];
    map[_name.horsens] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.871661, 9.857663512789747),
			'CASA Arena Horsens',10400,1994,_country.denmark,];
    map[_name.lyngby] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.78079102321677, 12.50617005734735),
      'Lyngby Stadion',12000,1921,_country.denmark,];
    map[_name.midtjylland] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(56.117084943757675, 8.952439451278998),
      'MCH Arena',11800,1999,_country.denmark,];
    map[_name.nordsjaelland] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(55.81610534417498, 12.352498875054323),
			'Farum Park',10000,1991,_country.denmark,];
    map[_name.obodense] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.39794088243304, 10.350535478742769),
      'TRE-FOR Park',15761,1887,_country.denmark,];
    map[_name.randers] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(56.46572077485179, 10.009500677727642),
      'AutoC Park Randers',10300,2003,_country.denmark,];
    map[_name.silkeborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.157916, 9.5540119),
      'MASCOT Park',10000,1917,_country.denmark,];
    map[_name.vejle] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.71376447, 9.55639463),
			'Vejle Stadion',10491,1891,_country.denmark,];
    map[_name.viborg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(56.455972956, 9.4020026),
      'Viborg Stadium',9566,1896,_country.denmark,];
    map[_name.b1903] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,];
    map[_name.b1909] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,];
    map[_name.ab] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,];
    map[_name.hvidovre] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,];
    //FINLANDIA
    map[_name.haka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(61.2680806, 24.02085023),
			'Tehtaan kenttä',6400,1934,_country.finland,];
    map[_name.helsinki] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(60.1876315, 24.9233446),
      'Bolt Arena',10770,1907,_country.finland,];
    map[_name.haka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(61.2680806, 24.020850),
      'Tehtaan kenttä',6400,1934,_country.finland,];
    map[_name.ilves] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(61.5003270, 23.7854713),
      'Tammela Stadion',5040,1931,_country.finland,];
    map[_name.kups] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(62.884580, 27.6718364),
			'Väre Areena',4700,1923,_country.finland,];
    map[_name.lahti] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(60.98651281, 25.65060111),
			'Lahden Stadion',14465,1996,_country.finland,];
    map[_name.kuusysi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.finland,];
    map[_name.turku] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(60.44283325, 22.292024),
      'Veritas Stadion',9372,1990,_country.finland,];
    //ISLANDIA
    map[_name.akraness] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(64.3181903, -22.05713664),
			'Akranesvöllur',6000,1946,_country.iceland,];
    map[_name.breidablik] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(64.10421594, -21.8969209),
      'Kópavogsvöllur',5501,1950,_country.iceland,];
    map[_name.hafnarfjardar] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(64.07608583, -21.935295742),
			'Kaplakriki',6450,1928,_country.iceland,];
    map[_name.reykjavik] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(64.14640062, -21.96675625),
      'KR-völlur',6000,1899,_country.iceland,];
    map[_name.valur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(64.13294129158774, -21.9229681),
      'Vodafonevöllurinn',3000,1911,_country.iceland,];
    map[_name.vikingur] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(64.11637343, -21.85500321),
			'Víkingsvöllur',1450,1908,_country.iceland,];
    //ILHAS FAROE
    map[_name.b36] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.019293, -6.7805902),
      'Gundadalur',5000,1936,_country.faroe,];
    map[_name.hb] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(62.0192123, -6.7779013),
      'Gundadalur',5000,1904,_country.faroe,];
    map[_name.klaksvik] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.224696, -6.580514426),
      'Djúpumýra Klaksvík',1500,1904,_country.faroe,];
    map[_name.vikingurFaroe] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(62.199574, -6.7458078),
      'Serpugerdi Stadium',16000,2008,_country.faroe,];

    //AUSTRIA
    map[_name.admira] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(48.097542, 16.3113277),
      'Bundesstadion Südstadt',10000,1905,_country.austria,];
    map[_name.austria] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(48.16250323, 16.3876322),
      'Franz Horr',17656,1911,_country.austria,];
    map[_name.hartberg] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(47.2811738, 15.9776617),
      'Arena Hartberg',4500,1946,_country.austria,];
    map[_name.laskLinz] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.2938258, 14.2766143),
			'Linzer Stadion',30138,1908,_country.austria,];
    map[_name.rapidviena] = [ClubColors(Colors.green,Colors.white),pattern.dividedHor,Coordinates(48.19810877, 16.2660961),
      'Allianz Stadion',28000,1899,_country.austria,];
    map[_name.rbsalzburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.8163615, 12.9986015),
      'Red Bull Arena',31895,2005,_country.austria,];
    map[_name.ried] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(48.207823, 13.478552),
      'Keine Sorgen Arena',7680,1912,_country.austria,];
    map[_name.sturmGraz] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.0466456, 15.4552685),
			'Merkur Arena',16400,1909,_country.austria,];
    map[_name.tirol] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.255992, 11.4113934),
			'Tivoli Stadium',16008,1930,_country.austria,];
    map[_name.wolfsberger] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(46.8263069, 14.852003),
      'Lavanttal-Arena',7300,1930,_country.austria,];
    map[_name.innsbruck] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,];
    map[_name.wiener] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,];
    //SUIÇA
    map[_name.basel] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(47.54169074, 7.62067642),
			'St. Jakob-Park',42500,1893,_country.switzerland,];
    map[_name.grasshoppers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38286, 8.5036),
			'Letzigrund',26500,1886,_country.switzerland,];
    map[_name.lugano] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(46.023828, 8.96135788),
      'Stadio de Cornaredo',10500,1908,_country.switzerland,];
    map[_name.luzern] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.03307, 8.3051154),
      'Swissporarena',13000,1901,_country.switzerland,];
    map[_name.sion] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(46.23353628, 7.37640473),
			'Estádio Tourbillon',14500,1909,_country.switzerland,];
    map[_name.servette] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(46.177778,6.1275),
			'Stade de Genève',30084,1890,_country.switzerland,];
    map[_name.stgallen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.408398945, 9.3057807),
      'Kybunpark',19694,1879,_country.switzerland,];
    map[_name.thun] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.7439056, 7.60663322),
			'Stockhorn Arena',10300,1898,_country.switzerland,];
    map[_name.youngBoys] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(46.9633758, 7.4653358),
      'Estádio da Suíça',32000,1898,_country.switzerland,];
    map[_name.winterthur] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.5008475, 8.717600),
      'Schützenwiese',8550,1896,_country.switzerland,];
    map[_name.zurich] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38279,8.503801),
      'Letzigrund',26500,1896,_country.switzerland,];
    map[_name.chauxdefonds] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Centre Sportif de la Charrière',12700,1894,_country.switzerland,];
    map[_name.neuchatel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.switzerland,];
    //POLONIA
    map[_name.gornik] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.296646268, 18.7696376),
			'Estádio Ernest Pohl',24563,1948,_country.poland,];
    map[_name.gwardia] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(52.19919178, 20.99196),
			'Stadion WKS Gwardia',9000,1948,_country.poland,];
    map[_name.legiaWarszawa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.220579264, 21.0408855),
			'Pepsi Arena',31000,1916,_country.poland,];
    map[_name.lechiagdansk] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(54.3900689, 18.6404273),
      'PGE Arena Gdańsk',43165,1945,_country.poland,];
    map[_name.lechPoznan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.39775183, 16.8587159),
			'Estádio Municipal de Poznań',41609,1922,_country.poland,];
    map[_name.piastGliwice] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(50.3066789, 18.695438),
      'Stadion Miejski im. Piotra Wieczorka',9913,1945,_country.poland,];
    map[_name.pogon] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(53.43655020, 14.51868017),
      'Estádio Florian Krygier',8990,1948,_country.poland,];
    map[_name.rakow] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(50.7767924, 19.159192),
      'Miejski Stadion Piłkarski',5500,1921,_country.poland,];
    map[_name.ruchchorzow] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.28228733, 18.94527638),
			'Stadion Ruchu Chorzów',9300,1920,_country.poland,];
    map[_name.slaskwrocklaw] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(51.14125077, 16.94370316),
      'Municipal de Wroclaw',44416,1947,_country.poland,];
    map[_name.wislaPlock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5620205, 19.68411),
      'Estádio Kazimierz Górski',12800,1947,_country.poland,];
    map[_name.wislaKrakow] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.0638402, 19.91199072),
			'Estádio Henryk Reyman',33326,1906,_country.poland,];
    map[_name.widzew] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.764935, 19.51160286),
			'MOSiR Widzew Łódź',18008,1922,_country.poland,];
    map[_name.poloniabytom] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.poland,];
    map[_name.szombierki] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.poland,];

    //TURQUIA
    map[_name.adanaspor] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(37.06372554, 35.37545482),
			'Novo Estádio de Adana',33543,1954,_country.turkey,];
    map[_name.alanyaspor] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(36.5626171, 32.0791125),
      'Estádio do Colégio Bahçeşehir',10842,1948,_country.turkey,];
    map[_name.antalyaspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.8884456, 30.66902964),
			'Estádio de Antália',32539,1966,_country.turkey,];
    map[_name.besiktas] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0394909, 28.99474848),
      'Vodafone Park',41903,1903,_country.turkey,[_name.fenerbahce,_name.galatasaray]];
    map[_name.bursaspor] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(40.210638, 29.009436),
			'Municipal Metropolitano de Bursa',42331,1963,_country.turkey,];
    map[_name.denizlispor] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(37.76621147, 29.08265607),
			'Denizli Atatürk Stadyumu',18745,1966,_country.turkey,];
    map[_name.eskisehirspor] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(39.7626458, 30.467788155),
      'Estádio Atatürk de Esquiceir',34930,1965,_country.turkey,];
    map[_name.fenerbahce] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(40.9877951, 29.036899),
      'Şükrü Saraçoğlu',50509,1907,_country.turkey,[_name.galatasaray,_name.besiktas]];
    map[_name.galatasaray] = [ClubColors(Colors.orange,Colors.red),pattern.divided,Coordinates(41.103388888,28.991),
      'NEF Stadyumu',52280,1905,_country.turkey,[_name.fenerbahce,_name.besiktas]];
    map[_name.genclerbirligi] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(39.9799511, 32.61372983),
      'Estádio de Eryaman',20560,1923,_country.turkey,];
    map[_name.karagumruk] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.07463764, 28.765735),
      'Estádio Olímpico Atatürk',75145,1926,_country.turkey,];
    map[_name.kasimpasa] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(41.0327862, 28.9723363),
      'Estádio Recep Tayyip Erdoğan',14234,1921,_country.turkey,];
    map[_name.kayserispor] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(38.7373165, 35.42329044),
      'Estádio Kadir Has',32864,1966,_country.turkey,];
    map[_name.goztepe] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(38.3955952, 27.0760464),
			'Estádio Gürsel Aksel',20035,1925,_country.turkey,];
    map[_name.hatayspor] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(36.258447, 36.2078878),
      'New Hatay Stadium',26600,1967,_country.turkey,];
    map[_name.instanbul] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.12323595, 28.808461462),
      'Fatih Terim de Başakşehir',17319,1990,_country.turkey,];
    map[_name.kocaelispor] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(40.774943, 30.017681438),
      'Estádio de Cocaeli',34712,1966,_country.turkey,];
    map[_name.konyaspor] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(37.9463311, 32.48842835),
			'Estádio Municipal Metropolitano de Cônia',41981,1922,_country.turkey,];
    map[_name.gaziantepspor] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.1230653, 37.3837841),
			'Estádio de Gaziantepe',35574,1988,_country.turkey];
    map[_name.malatyaspor] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(38.337827, 38.4464651),
      'Novo Estádio de Malatya',27044,1986,_country.turkey];
    map[_name.rizespor] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(41.0420904, 40.5733391),
      'Novo Estádio Municipal de Rize',15568,1953,_country.turkey];
    map[_name.samsunspor] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(41.228053, 36.4579017),
      'Estádio 19 de Maio de Samsun',33919,1965,_country.turkey,];
    map[_name.sivasspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.7245242, 36.97510870),
			'Yeni Sivas 4 Eylül Stadı',27532,1967,_country.turkey,];
    map[_name.trabzonspor] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(39.6463,40.9987),
      'Şenol Güneş Stadium',41461,1967,_country.turkey,];
    //GRECIA
    map[_name.aek] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(38.036111111,23.7875),
			'Olímpico de Atenas',71030,1924,_country.greece,];
    map[_name.aris] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(40.600069,22.9695),
      'Kleanthis Vikelidis',22800,1914,_country.greece,[_name.paok]];
    map[_name.asteras] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(37.50264465, 22.388388),
      'Asteras Tripolis Stadium',6430,1931,_country.greece,];
    map[_name.pasGiannina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(39.6676117, 20.84881764),
      'Zosimades Stadium',7500,1966,_country.greece,];
    map[_name.ionikos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(37.9772289, 23.634989),
      'Neapolis Nikaia',5000,1965,_country.greece,];
    map[_name.ofi] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(35.3368787, 25.106282),
      'Pankritio',26400,1925,_country.greece,];
    map[_name.olympiacos] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(37.946169,23.664536),
      'Karaiskákis',32130,1925,_country.greece,];
    map[_name.paok] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(40.613839,22.972422),
			'Toumba Stadium',29000,1926,_country.greece,[_name.aris]];
    map[_name.panathinaikos] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(37.987606, 23.753651),
			'Apostolos Nikolaidis',16003,1908,_country.greece,];
    //CHIPRE
    map[_name.aeklarnaca] = [ClubColors(Colors.yellow,Colors.green),pattern.oneHorStripe,Coordinates(34.9264739, 33.5976785),
      'AEK arena',13032,1994,_country.cyprus,];
    map[_name.apoel] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(35.1145399, 33.3630869672),
			'GSP Stadium',22859,1926,_country.cyprus,];
    map[_name.apollon] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(34.700914,33.022975),
			'Tsirion Stadium',13331,1954,_country.cyprus,];
    map[_name.omonia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.1145, 33.3631),
      'GSP Stadium',22859,1948,_country.cyprus,];
    map[_name.anorthosis] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.cyprus,];
    //ISRAEL
    map[_name.ashdod] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(31.8104802, 34.648333),
      'Estádio HaYud-Alef',8200,1999,_country.israel,];
    map[_name.beitarJerusalem] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(31.7513445, 35.190685),
      'Teddy Stadium',34000,1936,_country.israel,];
    map[_name.hapoelBerSheva] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.2734850, 34.779789),
      'Terner Stadium',16000,1949,_country.israel,];
    map[_name.hapoelTelAviv] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.0518, 34.7618),
      'Bloomfield Stadium',29400,1927,_country.israel,];
    map[_name.maccabiHaifa] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(32.7830479, 34.9658581),
			'Sammy Ofer',10000,1913,_country.israel,];
    map[_name.maccabiNetanya] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(32.29447084, 34.86460658),
      'Netanya Stadium',13610,1934,_country.israel,];
    map[_name.maccabiTelAviv] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(32.0517917, 34.761783),
      'Bloomfield Stadium',29400,1906,_country.israel,];

    //RUSSIA
    map[_name.amkar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(57.990748180, 56.244622619),
      'Zvezda Stadium',19500,1993,_country.russia,];
    map[_name.akhmatGrozny] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(43.3244449, 45.6900699),
      'Sultan Bilimkhanov',10200,1958,_country.russia,];
    map[_name.anzhi] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(42.9079000, 47.618420),
			'Arena Anji',10000,1991,_country.russia,];
    map[_name.tula] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(54.17481890, 37.6025909),
      'Arsenal Stadium',20048,1946,_country.russia,];
    map[_name.cska] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(55.7921064, 37.5159460),
      'VEB Arena',30000,1911,_country.russia,];
    map[_name.dinamoMoscou] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(55.79095156, 37.5610590),
      'Dinamo Lev Yashin Stadium',36000,1923,_country.russia,];
    map[_name.khimki] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(55.8854723, 37.454475),
      'Arena Khimki',18636,1997,_country.russia,];
    map[_name.krasnodar] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(45.0450492, 39.0294265),
      'Estádio Krasnodar',35074,2008,_country.russia,];
    map[_name.krylyaSovetov] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.277987, 50.2374051),
      'Solidarnost Arena',44918,1942,_country.russia,];
    map[_name.lokomotivMoscou] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.80355,37.741169),
      'Estádio Lokomotiv de Moscou',28800,1922,_country.russia,];
    map[_name.nizhnyNovgorod] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(56.3374867, 43.963353),
      'Nizhny Novgorod Stadium',44900,2015,_country.russia,];
    map[_name.orenburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.7851665, 55.2210744),
      'Estádio Gazovik',4950,1976,_country.russia,];
    map[_name.rostov] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.20833333,39.74166667),
      'Rostov Arena',45000,1930,_country.russia,];
    map[_name.rotor] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.73463702, 44.54914292288772),
			'Volgograd Arena',45568,1929,_country.russia,];
    map[_name.rubinKazan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.82109839, 49.161094869),
      'Arena Kazan',45379,1958,_country.russia,];
    map[_name.sochi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.401925, 39.9562793781204),
      'Fisht',47659,2018,_country.russia,];
    map[_name.spartakmoscou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.8178315, 37.4406002),
      'Otkrytie Arena',44929,1922,_country.russia,];
    map[_name.torpedo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(55.7164327, 37.6563151),
			'Eduard Streltsov',13400,1930,_country.russia,];
    map[_name.ufa] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(54.82587214, 56.0614233),
      'Neftyanik',16500,2009,_country.russia,];
    map[_name.ural] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.8325198, 60.573520),
      'Arena Ekaterinburg',35163,1930,_country.russia,];
    map[_name.alania] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(43.0233065, 44.69528968),
			'Republican Spartak Stadium',32464,1921,_country.russia,];
    map[_name.zenit] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(59.97280838, 30.2220053),
      'Gazprom Arena',69000,1925,_country.russia,];

    //UCRANIA
    map[_name.desna] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.50177025, 31.327121),
      'Yurii Haharin Stadium',12060,1960,_country.ukraine,]; //FALIU
    map[_name.dinamokiev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.4334322, 30.52202498),
			'Olímpico de Kiev',70050,1927,_country.ukraine,[_name.shaktardonetsk]];
    map[_name.dnipro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
			'Dnipro Arena',31003,1918,_country.ukraine,]; //FALIU
    map[_name.lviv] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7749650, 24.02770639),
      'Arena Lviv',34915,1992,_country.ukraine,];
    map[_name.metalist] = [ClubColors(Colors.black,Colors.blue),pattern.oneVertStripe,Coordinates(49.9810, 36.2617732),
      'OSC Metalist',34164,1936,_country.ukraine,];
    map[_name.odesa] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(46.48055848, 30.7556973),
      'Chornomorets Stadium',40003,1925,_country.ukraine,];
    map[_name.shaktardonetsk] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(50.433542433, 30.522135),
      'Donbass Arena',52187,1936,_country.ukraine,[_name.dinamokiev]];
    map[_name.vorskla] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(49.5948672, 34.5490243),
      'Butovsky Memorial Vorskla',25000,1955,_country.ukraine,];
    map[_name.zorya] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.859599, 35.097371331),
			'Slavutych Arena',22888,1923,_country.ukraine,];
    //EX-URSS
    //MOLDOVA
    map[_name.milsami] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.37443160, 28.819647943),
      'Complexul Sportiv Raional Orhei',3023,2005,_country.moldova,];
    map[_name.sheriffTiraspol] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(46.8383774, 29.558222),
			'Sheriff Stadium',12746,1997,_country.moldova,];
    map[_name.zimbru] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(46.9803721, 28.86797756),
      'Zimbru Stadium',10400,1947,_country.moldova,];
    //BELARUS
    map[_name.bate] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(54.1927777,28.475694444),
			'Borisov Arena',12900,1973,_country.belarus,];
    map[_name.dinamoBrest] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(52.089810, 23.6836123),
			'Sport Complex Brestskiy',10060,1960,_country.belarus,];
    map[_name.dinamoMinsk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.881454, 27.6175440),
			'Traktar Stadium',16500,1927,_country.belarus,];
    map[_name.gomel] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(52.436713874, 31.0121813),
      'Central Stadium',14307,1959,_country.belarus,];
    map[_name.soligorsk] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.79859758, 27.5382051),
      'Estádio Stroitel',4200,1961,_country.belarus,];
    //AZERBAIJÃO
    map[_name.baku] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(40.4001566, 49.9438641),
      'Bakcell Arena',11000,1906,_country.azerbaijan,];
    map[_name.qabala] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(40.9845888, 47.834242336),
      'Gabala City Stadium',4500,1995,_country.azerbaijan,];
    map[_name.qarabag] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.3974049, 49.852724642),
			'Estádio Tofig Bahramov',31200,1951,_country.azerbaijan,];
    map[_name.zira] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(40.358953392, 50.29314366),
      'Zira Olympic Sport Complex',1200,2014,_country.azerbaijan,];
    //CAZAQUISTÃO
    map[_name.aktobe] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(50.29155, 57.15927),
      'Aktobe Central Stadium',13200,1967,_country.kazakhstan,];
    map[_name.astana] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(51.1083829, 71.4031747),
			'Astana Arena',30000,2009,_country.kazakhstan,];
    //map[_name.irtysh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
    //  'Central Stadium',20000,1965,_country.kazakhstan,]; //EXTINTO 2020
    map[_name.kairat] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(43.238482, 76.924193),
			'Central Stadium',23804,1954,_country.kazakhstan,];
    map[_name.okzhetpes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.285220, 69.3924265),
      'Okzhetpes Stadium',10000,1957,_country.kazakhstan,];
    map[_name.ordabasy] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(42.335537, 69.59348),
      'Kazhimukan Munaitpasov Stadium',20000,1958,_country.kazakhstan,];
    map[_name.shakhter] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(49.8186566, 73.0752474),
      'Shakhter Stadium',19000,1958,_country.kazakhstan,];
    map[_name.taraz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.902019, 71.382288),
      'Taraz Central Stadium',12525,1967,_country.kazakhstan,];
    map[_name.tobol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(53.2263205, 63.636574),
			'Tsentralny Kostanay',8323,1967,_country.kazakhstan,];
    map[_name.zhenis] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.162695, 71.4133405),
      'K.Munaitpasov Stadium',12343,1964,_country.kazakhstan,];
    //GEORGIA
    map[_name.tbilisi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.72,44.78),
			'Tbilisi Sports Palace',53279,1925,_country.georgia,];
    map[_name.batumi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.8126276, 41.77440),
      'Chele Arena',6000,1923,_country.georgia,];
    map[_name.dila] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.983075, 44.1038858),
      'Tengiz Burjanadze',8230,1949,_country.georgia,];
    //ARMENIA
    map[_name.araratArmenia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(40.1713237, 44.5255822),
			'Vazgen Sargsyan Republican',14530,2017,_country.armenia,];
    map[_name.araratYerevan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.18052, 44.4948721),
			'Hrazdan Stadium',53849,1935,_country.armenia,];
    map[_name.alashkent] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.15448480, 44.47532),
			'Alashkert Stadium',22570,1921,_country.armenia,];
    map[_name.pyunikyerevan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.17168518, 44.5257160),
      'Hanrapetakan Stadium',15000,1992,_country.armenia,];
    //BALTICOS
    //ESTONIA
    map[_name.floratallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.421331, 24.73216),
      'A. Le Coq Arena',10340,1990,_country.estonia,];
    map[_name.levadiatallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.434562537, 24.7830739),
      'Kadrioru Stadium',4700,1998,_country.estonia,];
    map[_name.paide] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(58.8783763, 25.54076747),
      'ÜG Stadium',250,1990,_country.estonia,];
    //LATVIA
    map[_name.rigafc] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(56.961413, 24.116308),
			'Skonto',9100,2014,_country.latvia,];
    map[_name.rigaRFS] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.90891835, 24.15514115),
      'LNK Sporta Parks',1000,2011,_country.latvia,];
    map[_name.valmiera] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(57.5410309, 25.4417177),
      'Jānis Daliņš',2000,1996,_country.latvia,];
    //LITHUANIA
    map[_name.suduva] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(54.5747184, 23.365261),
      'Marijampolės futbolo arena',6250,1968,_country.lithuania,];
    map[_name.kaunu] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(54.89744355, 23.937322),
      'Dariaus ir Girėno stadionas',15315,2004,_country.lithuania,];
    map[_name.zalgiris] = [ClubColors(Colors.green,Colors.greenAccent),pattern.stripes2,Coordinates(54.669264, 25.2951),
      'LFF Stadium',5400,1947,_country.lithuania,];

    //SERVIA
    map[_name.estrelavermelha] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(44.783172, 20.465097),
			'Rajko Mitić',55538,1945,_country.serbia,[_name.partizan]];
    map[_name.partizan] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(44.7886175, 20.45902),
			'Stadion Partizana',32710,1945,_country.serbia,[_name.estrelavermelha]];
    map[_name.cukaricki] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.7603344, 20.4245656),
      'Čukarički Stadion',7000,1926,_country.serbia,];
    map[_name.radnik] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.6924068, 22.1655271),
      'Surdulica City Stadium',3312,1926,_country.serbia,];
    map[_name.radnicki] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(43.31552, 21.9088012),
      'Čair Stadium',18151,1923,_country.serbia,];
    map[_name.vojvodina] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(45.24694, 19.8417566),
			'Stadium of Vojvodina',15754,1914,_country.serbia,];
    //BULGARIA
    map[_name.beroe] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(42.4326854, 25.61541325),
      'Estádio Beroe',12128,1916,_country.bulgaria,];
    map[_name.cskaSofia] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.6842594, 23.339714),
      'Balgarska Armiya Stadium',22015,1948,_country.bulgaria,];
    map[_name.levskiSofia] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.7054198, 23.3632712),
      'Georgi Aspraruhov',29980,1914,_country.bulgaria,];
    map[_name.lokplovdiv] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.1338578, 24.77161877),
			'Lokomotiv',11800,1926,_country.bulgaria,];
    map[_name.loksofia] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.737672, 23.314724),
      'Lokomotiv Stadium',22000,1929,_country.bulgaria,];
    map[_name.ludogorets] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(43.5344062, 26.5281217),
      'Ludogorets Arena',12500,1940,_country.bulgaria,];
    map[_name.slaviaSofia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.675321, 23.27190),
      'Slavia Stadium',15992,1913,_country.bulgaria,];
    map[_name.spartakPlovdiv] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.bulgaria,];
    //CROATIA
    map[_name.dinamozagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.818673, 16.018165),
			'Maksimir',38923,1911,_country.croatia,[_name.hadjuksplit]];
    map[_name.gorica] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.7239381, 16.0730582),
      'Gradski stadion Velika Gorica',5200,2009,_country.croatia,];
    map[_name.hadjuksplit] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.5198462, 16.432361),
			'Polijud',35000,1911,_country.croatia,[_name.dinamozagreb]];
    map[_name.lokZagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8045, 15.96078837),
      'Stadion Kranjčevićeva',8850,1914,_country.croatia,];
    map[_name.osijek] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.5449856, 18.6955684),
      '	Stadion Gradski vrt',18856,1947,_country.croatia,];
    map[_name.rijeka] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(45.347946972, 14.4026226413),
			'Kantrida',12600,1906,_country.croatia,];
    //REP. TCHECA
    map[_name.banikostrava] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.8453373, 18.29918785113781),
			'Bazaly',17400,1922,_country.czechRepublic,];
    map[_name.bohemians] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.067005, 14.454192422766054),
			'Ďolíček',5000,1905,_country.czechRepublic,];
    map[_name.brno] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.22719586, 16.586590),
			'Městský fotbalový Stadion Srbská',12550,1913,_country.czechRepublic,];
    map[_name.jablonec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.715097, 15.16240467),
      'Stadion Střelnice',6280,1945,_country.czechRepublic,];
    map[_name.slaviaPraha] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(50.06761576, 14.4717161),
      'Stadion Eden',21000,1892,_country.czechRepublic,[_name.spartapraga]];
    map[_name.slovacko] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.914364, 14.619126),
      'Městský fotbalový Miroslava Valenty',8121,1927,_country.czechRepublic,];
    map[_name.slovanLiberec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.77632357, 15.0500971),
      'Stadion u Nisy',10000,1921,_country.czechRepublic,];
    map[_name.spartapraga] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(50.0999540, 14.41632580),
      'Generali Arena',20111,1893,_country.czechRepublic,[_name.slaviaPraha]];
    map[_name.teplice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.6400542, 13.81769347),
      'Na Stínadlech',18221,1945,_country.czechRepublic,];
    map[_name.viktoriaPlzen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7500716, 13.385528253),
			'Doosan Arena',12500,1911,_country.czechRepublic,];
    map[_name.dukla] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.czechRepublic,];
    map[_name.hradec] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.czechRepublic,];
    map[_name.vitkovice] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.czechRepublic,];
    //HUNGRIA
    map[_name.debreceni] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.55435955, 21.63374620),
			'Nagyerdei Stadion',20020,1902,_country.hungary,];
    map[_name.ferervar] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(47.17372825, 18.41546374),
      'MOL Aréna Sóstó',14201,1941,_country.hungary,];
    map[_name.ferencvaros] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(47.475396323, 19.0958288),
			'Gouprama Arena',22000,1899,_country.hungary,];
    map[_name.gyori] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.69580, 17.663847462),
			'ETO Park',16000,1904,_country.hungary,];
    map[_name.honved] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.442567, 19.1553822),
			'József Bozsik',15000,1909,_country.hungary,];
    map[_name.kisvarda] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.23324767, 22.0744867),
      'Várkert Sportpálya',2750,1911,_country.hungary,];
    map[_name.mtk] = [ClubColors(Colors.blue,Colors.white),pattern.diagonal,Coordinates(47.490919444,19.106725),
			'Hidegkuti Nándor Stadion',12700,1888,_country.hungary,];
    map[_name.puskas] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(47.4640167, 18.586763),
			'Pancho Aréna',3816,2005,_country.hungary,];
    map[_name.ujpest] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(47.5750, 19.085368),
      'Ferenc Szusza',13600,1885,_country.hungary,];
    map[_name.vasas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(47.537036, 19.080578381),
			'Rudolf Illovszky',18000,1911,_country.hungary,];
    //ROMENIA
    map[_name.argesPitesti] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(44.8466756, 24.866616),
      'Stadionul Nicolae Dobrin',15000,1953,_country.romania,];
    map[_name.cluj] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.779678,23.577247),
      'Stadionul Dr. Constantin Rădulescu',21000,1907,_country.romania,];
    map[_name.dinamoBucuresti] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.455083,26.102444),
			'Stadionul Dinamo',15300,1948,_country.romania,];
    map[_name.rapidBucuresti] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(44.45708788, 26.05564517),
			'Estádio Giulești-Valentin Stănescu',19100,1929,_country.romania,];
    map[_name.steauaBucuresti] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(44.43741937, 26.15314218),
      'Arena Națională',55634,1947,_country.romania,];
    map[_name.arad] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(46.15233222, 21.319844858),
      'Stadionul Motorul',2000,1945,_country.romania,];
    map[_name.craiova] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(44.3140987, 23.7841649),
      'Stadionul Ion Oblemenco',30983,1948,_country.romania,];
    map[_name.otelul] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.solid,Coordinates(45.430125, 28.0224765),
      'Stadionul Oțelul',13500,1964,_country.romania,];
    //ESLOVAQUIA
    map[_name.dac1904] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(50.91490, 14.6191298),
      'Mestský Stadion',16410,1904,_country.slovakia,];
    map[_name.interBratislava] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(48.1760430, 17.05031259),
			'Stadium ŠKP Inter Dúbravka',10200,1940,_country.slovakia,];
    map[_name.kosice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Košická futbalová aréna',5836,2018,_country.slovakia,];
    map[_name.petrzalka] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Štadión Rapid',10000,1898,_country.slovakia,];
    map[_name.slovanBratislava] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(48.1659626, 17.14220898),
      'Pasienky',30085,1919,_country.slovakia,];
    map[_name.trnava] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.3736672, 17.5916824),
			'Štadión Antona Malatinského',18448,1923,_country.slovakia,];
    map[_name.zilina] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(49.229209, 18.7446925),
      'Štadión pod Dubňom',11258,1908,_country.slovakia,];

    //OUTROS
    //ALBANIA
    map[_name.tiranafk] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(41.319399, 19.81133),
			'Selman Stermasi Stadium',7000,1920,_country.albania,];
    map[_name.laci] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(41.6424706, 19.711743),
      'Laçi Stadium',4500,1960,_country.albania,];
    map[_name.partizanitirane] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.3191655, 19.8114063),
      'Selman Stërmasi Stadium',20600,1946,_country.albania,];
    map[_name.vllaznia] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(42.07005, 19.5066547),
      'Loro-Boriçi Stadium',20300,1919,_country.albania,];
    //ESLOVENIA
    map[_name.celje] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(46.2465780, 15.2699934),
      'Arena Petrol',13006,1919,_country.slovenia,];
    map[_name.domzale] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(46.136925, 14.60178),
      'Športni Park',3212,1921,_country.slovenia,];
    map[_name.ljublijana] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(46.0804351, 14.524180),
      'Športni park Stožice',16038,2005,_country.slovenia,];
    map[_name.maribor] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(46.5625,15.640556),
			'Ljudski vrt',12702,1960,_country.slovenia,];
    map[_name.mura] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(46.6685624, 16.1575858),
      'Fazanerija',3782,2012,_country.slovenia,];
    //MACEDONIA
    map[_name.akaPandev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.437822, 22.768785),
      'Stadion Kukuš',1500,2010,_country.macedonia,];
    map[_name.makedonija] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(42.002417, 21.359890),
      'Gjorče Petrov Stadium',5000,1932,_country.macedonia,];
    map[_name.shkendija] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(42.0186995, 20.97822),
      'Čair Stadium',15000,1979,_country.macedonia,];
    map[_name.shkupi] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.015522, 21.4446538),
      'Čair Stadium',6000,1927,_country.macedonia,];
    map[_name.vardar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(42.0060954, 21.425804),
      'Nacional Arena Philip II Macedônia',24000,1947,_country.macedonia,];
    //BOSNIA
    map[_name.sarajevo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.87391863, 18.409078),
			'Estádio Asim Ferhatović Hase',35630,1946,_country.bosnia,];
    map[_name.zrinjski] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(43.3456540, 17.795418),
			'Bijeli Brijeg Stadium',25000,1905,_country.bosnia,];
    //KOSOVO
    map[_name.ballkani] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(42.38421140, 20.434450),
      'Suva Reka City Stadium',1500,1947,_country.kosovo,];
    map[_name.drita] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.46440065, 21.476240),
      '	Gjilan City Stadium',15000,1947,_country.kosovo,];
    map[_name.llapi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.90515045, 21.19488228),
      'Zahir Pajaziti Stadium',5000,1932,_country.kosovo,];
    map[_name.prishtina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6628634, 21.15705135),
      'Estádio Pristina City',16200,1922,_country.kosovo,];
    //MONTENEGRO
    map[_name.podgorica] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(42.44493750, 19.26417934),
			'Podgorica City Stadium',12000,1925,_country.montenegro,];
    map[_name.sutjeska] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(45.7239349, 16.0734067),
      'Gradski stadion',5214,1927,_country.montenegro,];
    //LUXEMBURGO
    map[_name.dudelange] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(49.47303716840933, 6.085128060337294),
			'Jos Nosbaum',2558,1921,_country.luxembourg,];
    map[_name.jeunesseesch] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(49.48596292, 5.97704983),
			'Stade de la Frontière',8200,1907,_country.luxembourg,];
    //Liechtenstein
    map[_name.balzers] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.073456, 9.494012),
      'Sportplatz Rheinau',2000,1932,_country.liechtenstein,];
    map[_name.eschenMauren] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(47.20567226, 9.53788747),
      'Sportpark Eschen-Mauren',6000,1963,_country.liechtenstein,];
    map[_name.vaduz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.1404698, 9.51056035),
			'Rheinpark Stadion',7838,1932,_country.liechtenstein,];
    //MALTA
    map[_name.sliema] = [ClubColors(Colors.blueAccent,Colors.blue),pattern.solid,Coordinates(35.89488, 14.415361),
			'Estádio Ta\' Qali',18000,1909,_country.malta,];
    map[_name.valletta] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(35.8950, 14.414893),
			'Estádio Ta\' Qali',18000,1943,_country.malta,];
    //SAN MARINO
    map[_name.folglore] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(43.97135136, 12.4772219),
      'San Marino Stadium',700,1972,_country.sanMarino,];
    map[_name.lafiorita] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(43.91492856, 12.48212),
			'Estádio Igor Crescentini',4000,1967,_country.sanMarino,];
    map[_name.trefiori] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.9086749, 12.4480538),
      'Campo Sportivo di Fiorentino',1000,1949,_country.sanMarino,];
    map[_name.trepenne] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.oneHorStripe,Coordinates(43.92955, 12.4428307),
      'Stadio Fonte dell\'Ovo',500,1956,_country.sanMarino,];
    //GIBRALTAR
    map[_name.europa] = [ClubColors(Colors.black,Colors.green),pattern.stripes2,Coordinates(36.1491889, -5.3500741),
			'Victoria Stadium',2000,1925,_country.gibraltar,];
    map[_name.lincolnRedImps] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(36.14861712, -5.3499992),
      'Victoria Stadium',2000,1900,_country.gibraltar,];
    //ANDORRA
    map[_name.andorra] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(42.50127, 1.514),
      'Estádio Comunal de Aixovall',2000,1942,_country.andorra,];
    map[_name.andorra] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(42.502, 1.512),
      'Estádio Comunal de Aixovall',1800,1993,_country.andorra,];
    map[_name.santacoloma] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.5008, 1.5137),
      'Estádio Comunal de Aixovall',1800,1986,_country.andorra,];


    ///////////////////////////////////////////////////////////////////////////
    map[_name.americamg] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(-19.9074787, -43.91821561),
      'Independência',23018,1912,_country.brazil,[_name.atleticomg,_name.cruzeiro]];
    map[_name.atleticogo] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(-16.653152, -49.284273482),
      'Antônio Accioly',12500,1937,_country.brazil,[_name.goias,_name.vilanova]];
    map[_name.atleticomg] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-19.86583,-43.97080),
			'Mineirão',61927,1900,_country.brazil,[_name.cruzeiro]];
    map[_name.atleticopr] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(-25.448333,-49.276944),
			'Arena da Baixada',42372,1924,_country.brazil,[_name.coritiba]];
    map[_name.botafogo] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-22.893172,-43.292269),
			'Nilton Santos',46831,1904,_country.brazil,[_name.flamengo,_name.vasco,_name.fluminense]];
    map[_name.bragantino] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-22.965414,-46.536936),
      'Nabi Abi Chedid',12332,1928,_country.brazil,];
    map[_name.ceara] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-3.8075,-38.5225),
      'Castelão',63904,1900,_country.brazil,[_name.fortaleza]];
    map[_name.corinthians] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.545555,-46.474),
      'Neo Química Arena',47605,1910,_country.brazil,[_name.palmeiras,_name.saopaulo,_name.santos]];
    map[_name.coritiba] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(-25.421111,-49.2595),
      'Couto Pereira',40502,1909,_country.brazil,[_name.atleticopr]];
    map[_name.flamengo] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(-22.911357, -43.230113),
			'Maracanã',78838,1895,_country.brazil,[_name.botafogo,_name.vasco,_name.fluminense]];
    map[_name.fluminense] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(-22.913116, -43.2303602),
			'Maracanã',78838,1902,_country.brazil,[_name.flamengo,_name.vasco,_name.botafogo]];
    map[_name.fortaleza] = [ClubColors(Colors.red,Colors.blue),pattern.horStripes,Coordinates(-3.807,-38.522),
      'Castelão',63904,1918,_country.brazil,[_name.ceara]];
    map[_name.juventude] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-29.162,-51.176),
      'Alfredo Jaconi',19924,1913,_country.brazil,];
    map[_name.goias] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.698889,-49.233889),
			'Serrinha',16500,1943,_country.brazil,[_name.atleticogo,_name.vilanova]];
    map[_name.internacional] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-30.06485477, -51.23599),
			'Beira-Rio',50128,1909,_country.brazil,[_name.gremio]];
    map[_name.palmeiras] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-23.52744641540078, -46.6784),
			'Allianz Parque',43713,1914,_country.brazil,[_name.saopaulo,_name.corinthians,_name.santos]];
    map[_name.santos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.950216, -46.3388120),
			'Vila Belmiro',17923,1912,_country.brazil,[_name.palmeiras,_name.corinthians,_name.saopaulo]];
    map[_name.saopaulo] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-23.600125,-46.720155555),
			'Morumbi',66795,1930,_country.brazil,[_name.palmeiras,_name.corinthians,_name.santos]];

    map[_name.bahia] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-12.978819444,-38.504252777),
      'Arena Fonte Nova',50025,1931,_country.brazil,[_name.vitoria,_name.sport]];
    map[_name.brusque] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-27.10126696, -48.916319),
      'Augusto Bauer',5000,1987,_country.brazil,];
    map[_name.cuiaba] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(-15.60186930, -56.121367),
			'Arena Pantanal',44097,2001,_country.brazil,];
    map[_name.chapecoense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-27.10339550, -52.6068313),
			'Arena Condá',22600,1973,_country.brazil,];
    map[_name.crb] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(-9.67054432, -35.75930852),
      'Rei Pelé',17126,1912,_country.brazil,[_name.csa]];
    map[_name.criciuma] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes,Coordinates(-28.684329, -49.36763),
			'Heriberto Hülse',19300,1947,_country.brazil,];
    map[_name.cruzeiro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-19.865833,-43.970833),
      'Mineirão',61927,1921,_country.brazil,[_name.atleticomg]];
    map[_name.csa] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-9.6705, -35.7593),
      'Rei Pelé',17126,1913,_country.brazil,[_name.crb]];
    map[_name.figueirense] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-27.585556,-48.586667),
			'Orlando Scarpelli',19584,1921,_country.brazil,];
    map[_name.gremio] = [ClubColors(Colors.lightBlue,Colors.black),pattern.stripes3,Coordinates(-29.972884, -51.1949268),
      'Arena do Grêmio',55662,1903,_country.brazil,[_name.internacional]];
    map[_name.gremioNovorizontino] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes,Coordinates(-21.466885, -49.231995),
      'Estádio Jorge Ismael de Biasi',18000,1973,_country.brazil,];
    map[_name.guarani] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.909782888, -47.043755),
			'Brinco de Ouro',29130,1911,_country.brazil,[_name.pontepreta]];
    map[_name.londrina] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-23.282222,-51.165),
      'Estádio do Café',36000,1956,_country.brazil,];
    map[_name.nautico] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-8.040533, -34.89678093),
			'Aflitos',22856,1901,_country.brazil,[_name.sport,_name.santacruz]];
    map[_name.operarioPR] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-25.115991, -50.156180),
      'Germano Krüger',10632,1912,_country.brazil,];
    map[_name.pontepreta] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-22.913611,-47.051389),
			'Moisés Lucarelli',17728,1900,_country.brazil,[_name.guarani]];
    map[_name.sport] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(-8.062888888,-34.902888888),
      'Ilha do Retiro',26418,1905,_country.brazil,[_name.nautico,_name.santacruz,_name.bahia]];
    map[_name.tombense] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-20.90766468, -42.030541527),
      'Antônio Guimarães de Almeida',3050,1914,_country.brazil,];
    map[_name.vasco] = [ClubColors(Colors.black,Colors.white),pattern.diagonal,Coordinates(-22.890916666,-43.228252777),
      'São Januário',21880,1898,_country.brazil,[_name.flamengo,_name.fluminense,_name.botafogo]];
    map[_name.vilanova] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-16.673543, -49.236922),
      'Onésio Brasileiro Alvarenga',11788,1943,_country.brazil,];
    map[_name.vitoria] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(-12.91850220, -38.42813070),
			'Barradão',30618,1899,_country.brazil,[_name.bahia]];

    map[_name.julho4] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-4.27619893, -41.78598826),
      'Arena Ytacoatiara',8500,1987,_country.brazil,];
    map[_name.abc] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.888405361, -35.17937587),
			'Frasqueirão',18000,1915,_country.brazil,];
    map[_name.aguasanta] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-23.723344, -46.612920),
      'Arena Inamar',10000,1981,_country.brazil,];
    map[_name.aguiamaraba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-5.3520618, -49.1383246157),
			'Zinho de Oliveira',4500,1982,_country.brazil,];
    map[_name.altos] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(-5.038122163, -42.44551040),
      'Felipão',4000,2013,_country.brazil,];
    map[_name.amazonas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-3.0844007, -59.9838851),
      'Estádio Municipal Carlos Zamith',5000,2019,_country.brazil,];
    map[_name.americaRJ] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.7953107, -43.41957718),
			'Giulite Coutinho',13544,1904,_country.brazil,];
    map[_name.americaRN] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-5.93371016, -35.28271557468),
			'Arena América',5000,1915,_country.brazil,];
    map[_name.anapolina] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-16.345930, -48.95587463),
			'Jonas Duarte',20000,1948,_country.brazil,];
    map[_name.aparecidense] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-16.81970, -49.245532),
			'Anníbal Batista de Toledo',5000,1985,_country.brazil,];
    map[_name.avai] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-27.66578267, -48.53165186),
      'Ressacada',17800,1923,_country.brazil,];
    map[_name.azuriz] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-26.2110895, -52.679588977),
			'Os Pioneiros',8000,2018,_country.brazil,];
    map[_name.bahiafeira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-12.27632, -38.93577856),
			'Arena Cajueiro',7000,1937,_country.brazil,];
    map[_name.bangu] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.8719064, -43.456439277),
      'Moça Bonita',9500,1904,_country.brazil,];
    map[_name.boavistaRJ] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.8954655, -42.4771417),
      'Elcyr Resende de Mendonça',8000,1961,_country.brazil,];
    map[_name.botafogoPB] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-7.1668181, -34.873362768),
			'Almeidão',19000,1931,_country.brazil,];
    map[_name.botafogoSP] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-21.201866, -47.78959753222946),
			'Estádio Santa Cruz',22292,1918,_country.brazil,];
    map[_name.brasilia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-15.78318347, -47.8993050727),
			'Mané Garrincha',69349,1975,_country.brazil,];
    map[_name.brasiliense] = [ClubColors(Colors.yellow,Colors.white),pattern.oneVertStripe,Coordinates(-15.835889, -48.0801529),
			'Boca do Jacaré',27000,2000,_country.brazil,[_name.gama]];
    map[_name.brasilPelotas] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-31.7712377, -52.332841550),
      'Bento Freitas',10200,1911,_country.brazil,];
    map[_name.camboriu] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-27.0214440, -48.64794059),
      'Robertão',3500,2003,_country.brazil,];
    map[_name.campinense] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(-7.25366757188, -35.88033665),
			'O Amigão',25770,1915,_country.brazil,];
    map[_name.cascavel] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-24.9750456, -53.502418),
			'Olímpico Regional',28125,2008,_country.brazil,];
    map[_name.catuense] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Antônio Pena',8000,1974,_country.brazil,];
    map[_name.caxias] = [ClubColors(grena,darkblue),pattern.stripes3,Coordinates(-29.1649520, -51.1964163918332),
      'Centenário',30000,1935,_country.brazil,];
    map[_name.central] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-8.2785053, -35.972948033),
			'Lacerdão',20000,1919,_country.brazil,];
    map[_name.cianorte] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.66138978, -52.5938666),
			'Albino Turbay',4000,1993,_country.brazil,];
    map[_name.comercial] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-21.1865312, -47.788333),
			'Estádio Palma Travassos',18277,1911,_country.brazil,];
    map[_name.confianca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-10.8944975, -37.0538261),
			'Sabino Ribeiro',3000,1936,_country.brazil,];
    map[_name.desportiva] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-20.33414206, -40.3561058),
      'Engenheiro Araripe',7700,1963,_country.brazil,];
    map[_name.duque] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(-22.5854488,-43.305297),
			'Marrentão',3334,2005,_country.brazil,];
    map[_name.fast] = [ClubColors(Colors.white,Colors.red,Colors.blue),pattern.sp,Coordinates(-3.12155505, -60.03779047),
      'Colina',10000,1930,_country.brazil,];
    map[_name.ferroviaria] = [ClubColors(grena,Colors.black),pattern.solid,Coordinates(-21.7750702, -48.1701263),
			'Fonte Luminosa',20000,1950,_country.brazil,];
    map[_name.gama] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.01127196, -48.06133544),
			'Bezerrão',20310,1975,_country.brazil,[_name.brasiliense]];
    map[_name.globo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.6489411, -35.46004640),
			'Barretão',10000,2012,_country.brazil,];
    map[_name.goytacaz] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-21.76202402, -41.31634627),
			'Ary de Oliveira e Souza',15000,1912,_country.brazil,];
    map[_name.ibis] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-7.963256319, -34.840713),
			'Ademir Cunha',10000,1938,_country.brazil,];
    map[_name.icasa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.22376, -39.317673),
			'Arena Romeirão',17000,2002,_country.brazil,];
    map[_name.interLimeira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.555294,-47.385042),
			'Major José Levy Sobrinho',27000,1913,_country.brazil,];
    map[_name.ipatinga] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-19.470869944, -42.541159),
			'Ipatingão',22000,1998,_country.brazil,];
    map[_name.itabaiana] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-10.68849961, -37.4319),
      'Etelvino Mendonça',12000,1938,_country.brazil,];
    map[_name.ituano] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-23.2803369, -47.287407674),
			'Novelli Júnior',16749,1947,_country.brazil,];
    map[_name.joinville] = [ClubColors(Colors.red,Colors.black),pattern.oneHorStripe,Coordinates(-26.31645224, -48.83343633),
			'Arena Joinville',22100,1976,_country.brazil,];
    map[_name.juventusMooca] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-23.5531052, -46.60451048),
			'Estádio Conde Rodolfo Crespi',5000,1924,_country.brazil,];
    map[_name.linense] = [ClubColors(Colors.red,Colors.white),pattern.horStripes,Coordinates(-21.666501905, -49.763218818),
			'Gilbertão',15770,1927,_country.brazil,];
    map[_name.luverdense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-13.07439827, -55.923762246),
			'Passo das Emas',10000,2004,_country.brazil,[_name.cuiaba]];
    map[_name.macae] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-22.3563513, -41.77086),
			'Moacyrzão',15000,1990,_country.brazil,];
    map[_name.madureira] = [ClubColors(Colors.purple,Colors.yellow),pattern.stripes3,Coordinates(-22.869530143, -43.337035425),
			'Conselheiro Galvão',5014,1914,_country.brazil,];
    map[_name.manaus] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-3.082731444, -60.02706630),
			'Arena da Amazônia',44000,2013,_country.brazil,];
    map[_name.marilia] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes2,Coordinates(-22.21940335, -49.93949715),
			'Bento de Abreu',19800,1942,_country.brazil,];
    map[_name.mirassol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-20.821404501, -49.5065208),
			'	José Maria de Campos Maia',15000,1925,_country.brazil,];
    map[_name.mixto] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-15.60386, -56.1210),
			'Arena Pantanal',44097,1934,_country.brazil,[_name.luverdense,_name.cuiaba]];
    map[_name.mogimirim] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.439263926, -46.9617167107),
			'Estádio Vail Chaves',19900,1932,_country.brazil,];
    map[_name.motoclub] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5483, -44.2600),
			'Castelão',40149,1937,_country.brazil,];
    map[_name.nacionalAM] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-3.084092564, -60.02796159),
      'Arena da Amazônia',44000,2013,_country.brazil,];
    map[_name.nacionalSP] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-23.5180334948, -46.6851971843),
			'	Nicolau Alayon',10723,1919,_country.brazil,];
    map[_name.noroeste] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.3242, -49.09748),
			'Alfredo de Castilho',18866,1910,_country.brazil,];
    map[_name.novaiguacu] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-22.74785706, -43.460851929),
			'Jânio Moraes',4700,1990,_country.brazil,];
    map[_name.novohamburgo] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-29.7262180, -51.143800),
      'Estádio do Vale',5196,1911,_country.brazil,];
    map[_name.oeste] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(-23.51223575, -46.89928345),
			'Arena Barueri',31452,1921,_country.brazil,];
    map[_name.operarioms] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-20.50119164, -54.610060),
			'Morenão',16000,1938,_country.brazil,];
    map[_name.palmas] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-10.2822114, -48.330556),
			'Nilton Santos',12000,1997,_country.brazil,];
    map[_name.parana] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(-25.436122, -49.25595888),
      'Durival Britto',17140,1989,_country.brazil,[_name.coritiba,_name.atleticopr]];
    map[_name.paulista] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-23.1880264, -46.8597525),
      'Jayme Cintra',10210,1909,_country.brazil,];
    map[_name.paysandu] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-1.381095, -48.44458),
			'Mangueirão',35000,1914,_country.brazil,[_name.remo]];
    map[_name.portovelho] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-8.75714855, -63.9105997),
      'Aluízio Ferreira',7000,2018,_country.brazil,];
    map[_name.portuguesa] = [ClubColors(Colors.red,Colors.green),pattern.horStripes,Coordinates(-23.520556,-46.618333),
			'Canindé',21004,1920,_country.brazil,];
    map[_name.portuguesaRJ] = [ClubColors(Colors.white,Colors.green,Colors.red),pattern.sp,Coordinates(-22.8016378, -43.2078454),
      'Luso-Brasileiro',6437,1924,_country.brazil,];
    map[_name.portuguesasantista] = [ClubColors(Colors.red,Colors.green),pattern.horStripes,Coordinates(-23.94715573, -46.3372746),
      'Ulrico Mursa',7635,1917,_country.brazil,];
    map[_name.princesasolimoes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-3.283451615, -60.6316817),
      'Gilbertão',15000,1971,_country.brazil,];
    map[_name.remo] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-1.3811, -48.4447),
			'Mangueirão',35000,1905,_country.brazil,[_name.paysandu]];
    map[_name.resende] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-22.4638346, -44.456106),
      'Estádio do Trabalhador',7500,1909,_country.brazil,];
    map[_name.retro] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-8.040662488, -35.00816974),
      'Arena de Pernambuco',44300,2016,_country.brazil,];
    map[_name.riverPI] = [ClubColors(Colors.red,Colors.black,Colors.black),pattern.sp,Coordinates(-5.116047825, -42.792511),
			'Albertão',52216,1946,_country.brazil,];
    map[_name.riobrancoAC] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-9.97037785, -67.8079834),
      'José de Melo',6000,1919,_country.brazil,];
    map[_name.riobrancoES] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-20.33280029, -40.38518316),
      'Kleber Andrade',21000,1913,_country.brazil,];
    map[_name.riobrancoSP] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.734535, -47.3479962),
      'Décio Vitta',16300,1913,_country.brazil,];
    map[_name.rioclaro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-22.4223454, -47.56188026),
			'Schmidtão',8284,1909,_country.brazil,];
    map[_name.riopreto] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.83460, -49.4012242),
			'Anísio Haddad',14126,1919,_country.brazil,];
    map[_name.salgueiro] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-8.0758843, -39.1194243),
			'Cornélio de Barros',12070,1972,_country.brazil,];
    map[_name.sampaio] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(-2.54823, -44.2599829),
      'Castelão',40149,1923,_country.brazil,];
    map[_name.santacruz] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-8.026711,-34.891175),
			'Arruda',60044,1914,_country.brazil,];
    map[_name.santoandre] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.669687, -46.50901102),
			'Estádio Bruno José Daniel',12000,1967,_country.brazil,[_name.saocaetano]];
    map[_name.saobento] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.4902975, -47.44815),
			'Estádio Walter Ribeiro',13772,1913,_country.brazil,];
    map[_name.saobernardo] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(-23.699738, -46.55637),
      'Primeiro de Maio',15159,2004,_country.brazil,];
    map[_name.saocaetano] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-23.630661, -46.560448),
			'Anacleto Campanella',16744,1989,_country.brazil,[_name.santoandre]];
    map[_name.saojose] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.1884290, -45.8698296),
			'Martins Pereira',15317,1933,_country.brazil,];
    map[_name.saojoseRS] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-30.006611, -51.173485531),
			'Passo D\'Areia',13000,1913,_country.brazil,];
    map[_name.saoraimundo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-3.1215126, -60.037779),
			'Ismael Benigno',10000,1918,_country.brazil,];
    map[_name.saoraimundoRR] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(2.818876055, -60.7208497),
      'Ribeirão',3000,1963,_country.brazil,];
    map[_name.serra] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-20.12764236, -40.304361721),
      'Roberto Siqueira Costa',2000,1930,_country.brazil,];
    map[_name.sergipe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-10.92337996, -37.07210),
			'João Hora',6000,1909,_country.brazil,];
    map[_name.sobradinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-15.6526257, -47.7852544),
      'Augustinho Lima',10000,1975,_country.brazil,];
    map[_name.sousa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.7559593, -38.2232163),
      'Marizão',12400,1991,_country.brazil,];
    map[_name.taubate] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.02785, -45.57043134),
			'Joaquinzão',10000,1914,_country.brazil,];
    map[_name.tocantinopolis] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.3429743, -47.4276875),
      'João Ribeiro',8000,1989,_country.brazil,];
    map[_name.trem] = [ClubColors(Colors.red,Colors.black),pattern.horStripes,Coordinates(0.0006848359, -51.0808365),
      'Zerão',13680,1947,_country.brazil,];
    map[_name.treze] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-7.25430, -35.88053),
			'O Amigão',25770,1925,_country.brazil,];
    map[_name.tunaluso] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(-1.381, -48.445),
			'Mangueirão',35000,1903,_country.brazil,];
    map[_name.tupi] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-21.787432790, -43.37794),
			'Mário Helênio',31863,1912,_country.brazil,];
    map[_name.uberlandia] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(-18.91340764, -48.2329414),
			'Parque do Sabiá',53350,1922,_country.brazil,];
    map[_name.urt] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-18.596822, -46.52139941),
      'Zamão',4858,1939,_country.brazil,];
    map[_name.voltaredonda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-22.5082739, -44.096673),
			'Raulino de Oliveira',20255,1976,_country.brazil,];
    map[_name.xvjau] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-22.296089, -48.57224110487209),
      'Zezinho Magalhães',12978,1924,_country.brazil,];
    map[_name.xvpiracicaba] = [ClubColors(Colors.black,Colors.white),pattern.horStripes,Coordinates(-22.7294362, -47.636847),
			'Barão de Serra Negra',18000,1913,_country.brazil,];
    map[_name.ypirangaAP] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0.000243024, -51.08084246),
      'Zerão',13680,1963,_country.brazil,];
    map[_name.ypirangaRS] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(-27.65131147, -52.26477924),
			'Colosso da Lagoa',22000,1924,_country.brazil,];


    ///////////////////////////////////////////////
    map[_name.aldosivi] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(-38.017726, -57.5819365),
			'José María Minella',35180,1913,_country.argentina,];
    map[_name.almagro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-34.6140369, -58.5347054),
			'Tres de Febrero',19000,1911,_country.argentina,];
    map[_name.allboys] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.6167200, -58.497540),
			'Islas Malvinas',21500,1913,_country.argentina,];
    map[_name.rafaela] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(-31.2507559, -61.4814668),
      'Estádio Rafaela',16000,1907,_country.argentina,];
    map[_name.atleticoTucuman] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-26.81260955, -65.1987853),
			'Monumental José Fierro',35200,1902,_country.argentina,];
    map[_name.argentinojuniors] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(-34.6059205, -58.47265177),
			'Diego Armando Maradona',25500,1904,_country.argentina,];
    map[_name.arsenalsarandi] = [ClubColors(Colors.blue,Colors.red),pattern.diagonal,Coordinates(-34.678230933, -58.3403085),
			'Julio Humberto Grondona',18500,1957,_country.argentina,];
    map[_name.banfield] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(-34.7506503, -58.38785437),
			'Florencio Sola',34901,1896,_country.argentina,];
    map[_name.barracas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.6474769, -58.39680),
      'Claudio Fabián Tapia',2700,1904,_country.argentina,];
    map[_name.belgrano] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-31.40324361, -64.2064250),
			'Gigante de Alberdi',30000,1905,_country.argentina,];
    map[_name.bocajuniors] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(-34.6350100, -58.3649280),
			'La Bombonera',54000,1905,_country.argentina,[_name.riverplate]];
    map[_name.centralCordoba] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-27.765766, -64.26963233),
			'Único Madre de Ciudades',30000,1919,_country.argentina,];
    map[_name.chacarita] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-34.567153367, -58.52778112),
			'Chacarita Juniors',10000,1906,_country.argentina,];
    map[_name.chaco] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Sarmiento de Resistência',20000,1913,_country.argentina,];
    map[_name.colon] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-31.6625043, -60.72494809),
			'Brigadier General Estanislao López',40000,1905,_country.argentina,];
    map[_name.defensayjusticia] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-34.8212666, -58.28582255),
			'Norberto "Tito" Tomaghello',18000,1935,_country.argentina,];
    map[_name.estudiantes] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.911207200, -57.9387574),
			'Jorge Luis Hirschi',30018,1905,_country.argentina,[_name.gimnasia]];
    map[_name.ferro] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-34.6187825, -58.44715548984141),
			'Arquitecto Ricardo Etcheverri',29442,1904,_country.argentina,];
    map[_name.gimnasia] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.91082898, -57.931958963),
			'Juan Carmelo Zerillo',33000,1887,_country.argentina,[_name.estudiantes]];
    map[_name.godoycruz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-32.889438925, -68.879741553),
			'Feliciano Gambarte',18000,1921,_country.argentina,];
    map[_name.huracan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.64277754540345, -58.396480366),
			'Tómas Adolfo Ducó',48314,1908,_country.argentina,];
    map[_name.independiente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.6697955165, -58.37112617),
			'Libertadores de América',52360,1905,_country.argentina,[_name.racing]];
    map[_name.lanus] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-34.71693165712151, -58.383954833534666),
			'Ciudad de Lanús',47027,1915,_country.argentina,];
    map[_name.newells] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-32.95531568, -60.661299876),
			'Marcelo Bielsa',42000,1903,_country.argentina,[_name.rosariocentral]];
    map[_name.nuevachicago] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(-34.66785282, -58.4998316127),
			'República de Mataderos',29000,1911,_country.argentina,];
    map[_name.olimpo] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-38.72698577, -62.2758727),
      'Roberto Natalio Carminatti',18000,1910,_country.argentina,];
    map[_name.patronato] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-31.742991743, -60.5087660643),
			'Presbítero Bartolomé Grella',22000,1914,_country.argentina,];
    map[_name.platense] = [ClubColors(Colors.grey,Colors.black),pattern.oneHorStripe,Coordinates(-34.54007018, -58.481458314),
			'Ciudad de Vicente López',34500,1905,_country.argentina,];
    map[_name.quilmes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.7408453, -58.2515933),
			'Centenário',30200,1887,_country.argentina,];
    map[_name.racing] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-34.6675,-58.368611),
			'Presidente Perón',51389,1903,_country.argentina,[_name.independiente]];
    map[_name.riverplate] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-34.54518243, -58.44934575),
			'Monumental de Núñez',70074,1901,_country.argentina,[_name.bocajuniors]];
    map[_name.rosariocentral] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(-32.9138952, -60.6744748),
			'Gigante de Arroyito',41654,1889,_country.argentina,[_name.newells]];
    map[_name.sanlorenzo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes3,Coordinates(-34.65058641613853, -58.4400964648805),
			'El Nuevo Gasómetro',47964,1908,_country.argentina,];
    map[_name.sanmartin] = [ClubColors(Colors.green,Colors.black),pattern.stripes3,Coordinates(-31.611908, -68.52756178801768),
			'Estádio del Bicentenario',25286,1907,_country.argentina,];
    map[_name.sarmiento] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.58532867, -60.92932811),
      'Estádio Eva Perón',22000,1911,_country.argentina,];
    map[_name.talleres] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(-31.367984088, -64.2448256165),
			'	Mario Alberto Kempes',57000,1913,_country.argentina,];
    map[_name.temperley] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.78171364, -58.40013736),
			'Alfredo Beranger',23000,1912,_country.argentina,];
    map[_name.tigre] = [ClubColors(Colors.blue,Colors.red),pattern.oneHorStripe,Coordinates(-34.44930541623292, -58.54255425127856),
			'José Dellagiovanna',26282,1902,_country.argentina,];
    map[_name.unionSantaFe] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-31.631730028795666, -60.715128589292696),
			'15 de Abril',28000,1907,_country.argentina,];
    map[_name.velezsarsfield] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.6344873200416, -58.520825644169534),
			'José Amalfitani',49590,1910,_country.argentina,];

    map[_name.penarol] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-34.7963, -56.06693),
			'Campeón del Siglo',40000,1891,_country.uruguay,[_name.nacional]];
    map[_name.nacional] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.8845,-56.159),
			'Estádio Gran Parque Central',34000,1899,_country.uruguay,[_name.penarol]];
    map[_name.cerrouru] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-34.867238122, -56.25201598),
      'Luis Trócolli',25000,1922,_country.uruguay,];
    map[_name.danubio] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-34.8387170, -56.13208784),
			'Jardines del Hipódromo',18000,1932,_country.uruguay,];
    map[_name.defensor] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-34.91616, -56.16653),
			'Estádio Luis Franzini',16000,1913,_country.uruguay,];
    map[_name.fenix] = [ClubColors(Colors.purple,Colors.white),pattern.divided,Coordinates(-34.87338535, -56.212268),
			'Parque Capurro',10000,1916,_country.uruguay,];
    map[_name.liverpoolURU] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-34.8549854, -56.225665),
      'Estádio Belvedere',10000,1915,_country.uruguay,];
    map[_name.montevideo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.82381, -56.32036),
			'Complejo Daniel Marsicano',14000,2007,_country.uruguay,];
    map[_name.plazacolonia] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-34.46715174, -57.8456522),
      'Prof. Alberto Suppici',12000,1917,_country.uruguay,];
    map[_name.rentistas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.776324, -56.165855),
			'Complejo Rentistas',10600,1933,_country.uruguay,];
    map[_name.riverURU] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-34.861929, -56.201579),
			'Federico Omar Saroldi',6000,1932,_country.uruguay,];
    map[_name.wanderers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.859011, -56.203837),
			'Parque Alfredo Víctor Viera',10000,1902,_country.uruguay,];
    map[_name.bellavista] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.uruguay,];
    map[_name.progreso] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.uruguay,];
    map[_name.rocha] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.uruguay,];

    map[_name.olimpia] = [ClubColors(Colors.white,Colors.black),pattern.oneHorStripe,Coordinates(-25.291393476624485, -57.6085912),
			'Manuel Ferreira',25820,1902,_country.paraguay,[_name.cerroporteno]];
    map[_name.cerroporteno] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-25.3,-57.6375),
			'General Pablo Rojas',45000,1912,_country.paraguay,[_name.olimpia]];
    map[_name.octubre] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-25.36745, -57.58476),
      'Luis Alfonso Giagni',11000,1909,_country.paraguay,];
    map[_name.colegiales] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-25.348243, -57.592480),
			'Luciano Zacarías',4500,1977,_country.paraguay,];
    map[_name.guaraniPAR] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-25.30311, -57.61587),
      'Rogelio Livieres',8000,1903,_country.paraguay,];
    map[_name.nacionalPAR] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(-25.29862, -57.63927),
      'Arsenio Erico',8500,1904,_country.paraguay,];
    map[_name.libertad] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-25.2768477, -57.61086),
      'Dr. Nicolás Leoz',10500,1905,_country.paraguay,];
    map[_name.luqueno] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(-25.2723013, -57.493120),
			'Estádio Feliciano Cáceres',27000,1921,_country.paraguay,];
    map[_name.soldeamerica] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-25.36735, -57.58480),
			'Estádio Luis Alfonso Giagni',11000,1909,_country.paraguay,];
    map[_name.tacuary] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-25.2831537, -57.606315),
			'Toribio Vargas',3000,1923,_country.paraguay,];

    map[_name.audaxItaliano] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.540543, -70.577821),
			'Municipal de La Florida',12000,1910,_country.chile,];
    map[_name.cobreloa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(-22.46096, -68.9204540),
			'Municipal de Calama',12000,1977,_country.chile,];
    map[_name.cobresal] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-26.2518641, -69.628662),
			'Estádio El Cobre',12000,1979,_country.chile,];
    map[_name.colocolo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-33.506611,-70.605944),
      'Monumental David Arellano',47017,1925,_country.chile,];
    map[_name.coquimbo] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes,Coordinates(-29.9652247, -71.338293),
			'Francisco Sánchez Rumoroso',15000,1958,_country.chile,];
    map[_name.curico] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-34.9742154, -71.230767),
      'La Granja',8200,1973,_country.chile,];
    map[_name.evertonchi] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-33.014228, -71.535373),
			'Sausalito',23000,1909,_country.chile,];
    map[_name.huachipato] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(-36.75502733, -73.10760524),
      'Estádio CAP',10500,1947,_country.chile,];
    map[_name.iquique] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-20.242358, -70.1331452),
			'Tierra de Campeones',10000,1978,_country.chile,];
    map[_name.laCalera] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-32.784167,-71.199444),
      'Municipal Nicolás Chahuán',9200,1954,_country.chile,];
    map[_name.laserena] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-29.911299, -71.251873),
      'La Portada',14000,1955,_country.chile,];
    map[_name.magallanes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
			'Santiago Bueras',5000,1897,_country.chile,];
    map[_name.nublense] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-36.618249, -72.107945),
      'Nelson Oyarzún Arenas',7000,1916,_country.chile,];
    map[_name.ohiggins] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.1775588, -70.737344506),
      'El Teniente',14450,1955,_country.chile,];
    map[_name.palestino] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(-33.5202176734, -70.67294633),
      'Municipal de La Cisterna',12000,1920,_country.chile,];
    map[_name.unionespanola] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-33.40428485, -70.658703),
			'Santa Laura',22000,1897,_country.chile,];
    map[_name.univcatolica] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-33.39498660, -70.5005379),
      'San Carlos de Apoquindo',14768,1937,_country.chile,];
    map[_name.lau] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.464054, -70.61059),
      'Estádio Nacional',55358,1927,_country.chile,];
    map[_name.santiagowanderers] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.0224104, -71.639742),
			'Elías Figueroa Brander',21113,1892,_country.chile,];
    map[_name.concepcion] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.chile,];
    map[_name.rangersCHI] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.chile,];
    map[_name.sanfelipe] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.chile,];

    map[_name.alwaysReady] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-16.4994122, -68.12262946),
			'Hernando Siles',42000,1933,_country.bolivia,];
    map[_name.aurora] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-17.37968516, -66.1615046),
			'Félix Capriles',32000,1935,_country.bolivia,];
    map[_name.bolivar] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-16.499412183054098, -68.12263),
      'Hernando Siles',42000,1925,_country.bolivia,[_name.theStrongest]];
    map[_name.blooming] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-17.796, -63.1832),
			'Tauhichi Aguilera',38000,1946,_country.bolivia,];
    map[_name.guabira] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-17.34287, -63.261564),
			'Gilberto Parada',18000,1962,_country.bolivia,];
    map[_name.indPetrolero] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-17.34287, -63.261564),
      'Olímpico Patria',32000,1932,_country.bolivia,];
    map[_name.jorge] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-17.37959, -66.1617185),
			'Félix Capriles',32000,1949,_country.bolivia,];
    map[_name.nacionalpotosi] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-19.5793537, -65.7616416),
      'Víctor Agustín Ugarte',32105,1942,_country.bolivia,];
    map[_name.orientePetrolero] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-19.0332323, -65.257856),
			'Estádio Ramón Tahuichi Aguilera',38500,1955,_country.bolivia,];
    map[_name.palmaflor] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-17.3920347, -66.275128),
      'Municipal de Quillacollo',5000,2008,_country.bolivia,];
    map[_name.realsantacruz] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(-17.8058075, -63.1661464),
      'Juan Carlos Durán',15000,1962,_country.bolivia,];
    map[_name.royalpari] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-17.795543, -63.183247),
      'Ramón Tahuichi Aguilera',38000,2002,_country.bolivia,];
    map[_name.sanJoseBOL] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(-17.94613, -67.1108436),
			'Estádio Jesús Bermúdez',39000,1942,_country.bolivia,];
    map[_name.realpotosi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
			'Víctor Ugarte',32000,1986,_country.bolivia,]; //EXTINTO
    map[_name.theStrongest] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-16.499412, -68.12263),
      'Hernando Siles',42000,1908,_country.bolivia,[_name.bolivar]];
    map[_name.sucre] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-19.03347852, -65.2576612),
			'Olímpico Patria',32000,1961,_country.bolivia,];
    map[_name.litoral] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.bolivia,];
    map[_name.octubre31] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.bolivia,];

    map[_name.alianzalima] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-12.06765595, -77.0229485),
			'Alejandro Villanueva',35000,1901,_country.peru,];
    map[_name.binacional] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-15.502587, -70.1233308),
      'Guillermo Briceño Rosamedina',20030,2010,_country.peru,];
    map[_name.carlosmanucci] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(-8.1062, -79.03067),
      'Mansiche',25000,1959,_country.peru,];
    map[_name.cesarvallejo] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(-8.10611593, -79.030676),
      'Mansiche',25000,1996,_country.peru,];
    map[_name.cienciano] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-13.5242097, -71.966351907),
			'Inca Garcilaso de la Vega',45056,1901,_country.peru,];
    map[_name.cusco] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-13.525813, -71.966138),
			'Inca Garcilaso de la Vega',45056,2009,_country.peru,];
    map[_name.depmunicipal] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-12.067919, -77.03348),
      'Nacional José Diáz',45000,1935,_country.peru,];
    map[_name.juanaurich] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.76763163, -79.86207526),
      'Elías Aguirre',25000,1922,_country.peru,];
    map[_name.melgar] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-16.40644668, -71.5202360),
      'Estádio Monumental da UNSA',40370,1915,_country.peru,];
    map[_name.sportboys] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.059966, -77.1197877),
			'Miguel Grau',15000,1927,_country.peru,];
    map[_name.sportingcristal] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-12.0362617, -77.045132758),
      'Alberto Gallardo',11600,1955,_country.peru,];
    map[_name.huancayo] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.072618, -75.201664),
      'Estádio Huancayo',17000,2007,_country.peru,];
    map[_name.universitario] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-12.055024119, -76.9358871764),
      'Monumental de Lima',80093,1924,_country.peru,];
    map[_name.unisanmartin] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-12.06730518, -77.0336576),
      'Nacional de Lima',45000,2004,_country.peru,];
    map[_name.chalaco] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.atltorino] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.arica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.peru,]; //EXTINTO
    map[_name.ugarte] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.coronel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.peru,];
    map[_name.defensorlima] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.leonhuanuco] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.sanagustin] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estadio Nacional',45000,1970,_country.peru,]; //EXISTE, MAS FORA DO SISTEMA DE LIGAS
    map[_name.univtecnica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];
    map[_name.unionhuaral] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,];

    map[_name.aucas] = [ClubColors(Colors.red,Colors.yellow),pattern.dividedHor,Coordinates(-0.2789491, -78.546213),
      'Gonzalo Pozo Ripalda',20000,1945,_country.ecuador,];
    map[_name.barcelonaequ] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-2.18560555, -79.924764),
			'Monumental Isidro Romero Carbo',57267,1925,_country.ecuador,];
    map[_name.delfin] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-0.964043321, -80.702654),
			'Estadio Jocay',17834,1989,_country.ecuador,];
    map[_name.depcuenca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.906627, -79.005685),
			'Alejandro Serrano Aguilar',16500,1971,_country.ecuador,];
    map[_name.depquito] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-0.1777998, -78.47661),
			'Olímpico Atahualpa',40948,1940,_country.ecuador,];
    map[_name.emelec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-2.20565402, -79.893875),
      'George Capwell',40000,1929,_country.ecuador,];
    map[_name.elnacional] = [ClubColors(Colors.red,Colors.blue),pattern.diagonalInv,Coordinates(-0.177371, -78.47598),
      'Olímpico Atahualpa',38500,1964,_country.ecuador,];
    map[_name.guayaquil] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-2.1028473, -79.903678),
      'Christian Benítez Betancourt',8000,2007,_country.ecuador,];
    map[_name.idelvalle] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-0.34883621, -78.4708232),
      'Rumiñahui',10233,1958,_country.ecuador,];
    map[_name.ldu] = [ClubColors(Colors.white,Colors.grey),pattern.solid,Coordinates(-0.10660691, -78.48884),
      'Rodrigo Paz Delgado',41575,1918,_country.ecuador,];
    map[_name.macara] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-1.24482626, -78.623129),
      'Rodrigo Paz Delgado',16467,1939,_country.ecuador,];
    map[_name.mushucruna] = [ClubColors(grena,Colors.green),pattern.solid,Coordinates(-1.30916165, -78.7278448),
      'Estádio Mushuc Runa COAC',6000,2003,_country.ecuador,];
    map[_name.olmedo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-1.6662906, -78.6604288),
			'Olímpico de Riobamba',20000,1919,_country.ecuador,];
    map[_name.uniequ] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(-0.1774, -78.476),
			'Olímpico Atahualpa',38500,1963,_country.ecuador,];
    map[_name.espoli] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.americaquito] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.everestGuayaquil] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.filanbanco] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.nueveoctubre] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.tecnicoUniv] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];
    map[_name.valdez] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,];

    map[_name.alianzaPetrolera] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(7.073057, -73.864671),
      'Daniel Villa Zapata',10400,1991,_country.colombia,];
    map[_name.americadecali] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.43076413, -76.5409550),
			'Olímpico Pascual Guerrero',35405,1927,_country.colombia,];
    map[_name.huila] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(2.93608856, -75.280323806),
      'Guillermo Plazas Alcid',10400,1990,_country.colombia,];
    map[_name.atleticonacional] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(6.2570559, -75.589883235),
			'Atanasio Girardot',52872,1947,_country.colombia,];
    map[_name.boyaca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.54217432, -73.3533631),
      'La Independencia',20000,2002,_country.colombia,];
    map[_name.bucaramanga] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(7.136745, -73.116192),
			'Alfonso López',25000,1949,_country.colombia,];
    map[_name.cucuta] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(7.8946915, -72.50194428901477),
			'General Santander',46519,1924,_country.colombia,];
    map[_name.deportivocali] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(3.52269250, -76.41571171),
      'Estádio Deportivo Cali',55000,1912,_country.colombia,];
    map[_name.depPasto] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(1.19825378, -77.2778826),
      'Departamental Libertad',20700,1949,_country.colombia,];
    map[_name.envigado] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(6.16451557, -75.5989182),
      'Polideportivo Sur',12000,1989,_country.colombia,];
    map[_name.junior] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(10.927145429567, -74.8000172),
      'Metropolitano',46692,1924,_country.colombia,];
    map[_name.imedellin] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(6.256939271, -75.5898773),
      'Atanasio Girardot',45953,1913,_country.colombia,];
    map[_name.laequidad] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(4.62375432, -74.1354781),
      'Metropolitano de Techo',15000,1982,_country.colombia,];
    map[_name.millonarios] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(4.645962128, -74.077269811),
      'El Campín',36343,1937,_country.colombia,];
    map[_name.oncecaldas] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(5.057102, -75.48972667784),
      'Palogrande',42600,1961,_country.colombia,];
    map[_name.patriotas] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.5421279, -73.353390),
      'La Independencia',21000,2003,_country.colombia,];
    map[_name.pereira] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(4.80468765, -75.751995),
      'Hernán Villegas',30313,1944,_country.colombia,];
    map[_name.rioNegroAguilas] = [ClubColors(Colors.amberAccent,Colors.black),pattern.solid,Coordinates(6.14667896, -75.372829),
      'Alberto Grisales',14000,1991,_country.colombia,];
    map[_name.santafe] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(4.646, -74.077),
      'El Campín',36343,1941,_country.colombia,];
    map[_name.tolima] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(4.43018613, -75.21773451564),
      'Manuel Murillo Toro',33000,1954,_country.colombia,];
    map[_name.boyaca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.colombia,];
    map[_name.cortulua] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.colombia,];
    map[_name.uMagdalena] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.colombia,];

    map[_name.carabobo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(10.2230961, -68.0115140),
      'Estádio Misael Delgado',14000,1964,_country.venezuela,];
    map[_name.caracas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(10.49220252, -66.885644393),
			'Estádio Olímpico de Caracas',24900,1967,_country.venezuela,];
    map[_name.laGuaira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(10.492202523, -66.885644393),
			'Estádio Olímpico de Caracas',24900,2008,_country.venezuela,];
    map[_name.deportivoTachira] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(7.787385, -72.1980212),
			'Pueblo Nuevo de San Cristóbal',42000,1974,_country.venezuela,];
    map[_name.estudiantesmerida] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(8.5769590, -71.16485),
			'Guillermo Soto Rosa',16500,1971,_country.venezuela,];
    map[_name.deplara] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(10.0809793, -69.32927),
			'Farid Richa',12480,2009,_country.venezuela,];
    map[_name.metropolitanos] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(10.482750, -66.941810),
      'Brígido Iriarte',10000,2011,_country.venezuela,];
    map[_name.mineros] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(8.31272986, -62.6962946),
			'C.T.E. Cachamay',42000,1981,_country.venezuela,];
    map[_name.monagas] = [ClubColors(Colors.blue,grena),pattern.solid,Coordinates(9.71000338, -63.2677268),
			'Monumental de Maturín',51796,1987,_country.venezuela,];
    map[_name.minerven] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(7.3472689, -61.82695),
			'Héctor Thomas',5000,1985,_country.venezuela,];
    map[_name.portuguesaven] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(9.570767650, -69.21027962),
      'José Antonio Paez',18000,1972,_country.venezuela,];
    map[_name.trujillanos] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(9.33347489, -70.60227),
			'José Alberto Pérez',12000,1981,_country.venezuela,];
    map[_name.zamora] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(8.625075, -70.20694),
			'Estadio Agustín Tovar',28000,1977,_country.venezuela,];
    map[_name.zulia] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(10.6743723, -71.644651),
			'Estádio José Encarnación Romero',45000,2005,_country.venezuela,];
    map[_name.anzoategui] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.depitalia] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.depgalicia] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.laraFC] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.maracaibo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'José Pachencho Romero',35000,2001,_country.venezuela,]; //FALENCIA
    map[_name.margarita] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.maritimoven] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.pepeganga] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.portugues] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.sancristobal] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.uCanarias] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];//EXTINTO
    map[_name.ula] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];
    map[_name.valenciaven] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,];

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    map[_name.atlas] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(20.7051916, -103.3277484),
			'Jalisco',63163,1916,_country.mexico,];
    map[_name.atlante] = [ClubColors(Colors.blue,grena),pattern.stripes2,Coordinates(19.382696, -99.1782815),
			'Estádio Azul',32904,1916,_country.mexico,];
    map[_name.americamex] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(19.30399437, -99.15052764),
			'Estádio Azteca',87000,1916,_country.mexico,];
    map[_name.atlEspanol] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(0, 0),
      'Estádio Azteca',87000,1971,_country.mexico,];//EXTINTO 1982
    map[_name.celaya] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(20.534896, -100.8181567),
      'Emilio Butragueño',26753,1954,_country.mexico,];
    map[_name.chivas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(20.6827395, -103.46255961),
			'Estadio Akron',49850,1906,_country.mexico,];
    map[_name.correcaminos] = [ClubColors(Colors.orange,Colors.white),pattern.oneHorStripe,Coordinates(23.739618, -99.1523884),
      'Marte R. Gómez Segura',19500,1982,_country.mexico,];
    map[_name.cruzazul] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.3837416, -99.1782640),
			'Estádio Azul',32904,1927,_country.mexico,];
    map[_name.dorados] = [ClubColors(Colors.black,Colors.yellow),pattern.divided,Coordinates(24.8305076, -107.404267),
      'Estádio Banorte',20108,2003,_country.mexico,];
    map[_name.irapuato] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(20.68461665, -101.3561041),
      'Sergio León Chavez',30000,1982,_country.mexico,];
    map[_name.jaguares] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(16.7630, -93.0960),
			'Estádio Víctor Manuel Reyna',28000,2002,_country.mexico,];
    map[_name.juarez] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(31.75317, -106.467471),
			'Estadio Olímpico Benito Juárez',19703,2015,_country.mexico,];
    map[_name.leon] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.1163456, -101.65787452),
			'Nou Camp',33943,1944,_country.mexico,];
    map[_name.leonesNegros] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(20.7052, -103.3277),
			'Jalisco',63163,1970,_country.mexico,];
    map[_name.mazatlan] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(23.2360094, -106.432487154),
			'Estadio de Mazatlán',25000,2020,_country.mexico,];
    map[_name.monterrey] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(25.6702825, -100.24467170),
			'Estádio BBVA',51348,1945,_country.mexico,];
    map[_name.morelia] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonalInv,Coordinates(19.7189655, -101.233201),
			'Estadio Morelos',41038,1950,_country.mexico,];
    map[_name.necaxa] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(21.881199555, -102.2754420),
			'Estadio Victoria',22000,1923,_country.mexico,];
    map[_name.pachuca] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(20.10591056, -98.7556673),
			'Estádio Hidalgo',32000,1892,_country.mexico,];
    map[_name.puebla] = [ClubColors(Colors.blue,Colors.white),pattern.diagonalInv,Coordinates(19.07886305, -98.164410348),
			'Estadio Cuauhtemoc',42684,1944,_country.mexico,];
    map[_name.pumas] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.333086463, -99.19217763867),
			'Olímpico Universitário',72000,1954,_country.mexico,];
    map[_name.queretaro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(20.57793742, -100.3662424),
			'Estádio Corregidora',40000,1950,_country.mexico,];
    map[_name.sanluis] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(22.1389898, -100.95071374670914),
			'Estadio Alfonso Lastras Ramírez',25709,2013,_country.mexico,];
    map[_name.santosLaguna] = [ClubColors(Colors.green,Colors.black),pattern.horStripes,Coordinates(25.62846869, -103.3796996),
			'Nuevo Estadio Corona',30000,1983,_country.mexico,];
    map[_name.tampico] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Tamaulipas',19668,1945,_country.mexico,];
    map[_name.tecos] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(20.6937821, -103.4162585),
      'Tres de Marzo',22988,1971,_country.mexico,];
    map[_name.tigres] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(25.7232925346, -100.31197952),
			'Estádio Universitario',42000,1960,_country.mexico,];
    map[_name.tijuana] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(32.5066600, -116.9931046),
			'Caliente',33333,2007,_country.mexico,];
    map[_name.toluca] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(19.2873975, -99.66671939),
      'Estádio Nemesio Díez',30000,1917,_country.mexico,];
    map[_name.torosNeza] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(19.405891107, -98.9871339),
      'Estadio Neza 86',20000,1991,_country.mexico,];
    map[_name.veracruz] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(19.16429626, -96.1252219),
      'Luis "Pirata" Fuente',30000,1943,_country.mexico,];
    map[_name.zacatepec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,1948,_country.mexico,]; //EXTINTO 2020

    //USA
    map[_name.atlanta] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(33.75535771, -84.40062064),
			'Mercedes-Benz Stadium',72035,2014,_country.unitedStates,];
    map[_name.austin] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(30.38794963, -97.7192678),
			'Q2 Stadium',20738,2019,_country.unitedStates,];
    map[_name.minnesota] = [ClubColors(Colors.blue,Colors.grey),pattern.solid,Coordinates(44.95329071, -93.16552316),
			'Allianz Field',19400,2010,_country.unitedStates,];
    map[_name.cincinnati] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(39.1110140, -84.522226),
      'West End Stadium',26000,2015,_country.unitedStates,];
    map[_name.columbuscrew] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.009552335, -82.9910362),
			'Mapfre Stadium',19968,1994,_country.unitedStates,];
    map[_name.charlotte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.225876, -80.852819),
      'Bank of America Stadium',74867,2019,_country.unitedStates,];
    map[_name.chicago] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.765063860516534, -87.80527756829989),
			'Toyota Park',20000,1997,_country.unitedStates,];
    map[_name.colorado] = [ClubColors(grena,Colors.grey),pattern.solid,Coordinates(39.805555555,-104.891944444),
			'DSG Park',19680,1995,_country.unitedStates,];
    map[_name.dcunited] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(38.869081611933176, -77.01259340022942),
			'Audi Field',20000,1995,_country.unitedStates,];
    map[_name.fcdallas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(33.15449939561873, -96.8350561289953),
			'Toyota Stadium',20500,1996,_country.unitedStates,[_name.houston]];
    map[_name.houston] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(29.752578440282296, -95.35189527854703),
			'BBVA Compass Stadium',22000,2005,_country.unitedStates,[_name.fcdallas]];
    map[_name.lagalaxy] = [ClubColors(Colors.white,Colors.blue),pattern.diagonal,Coordinates(33.864814147447696, -118.26112111006496),
			'Dignity Health Sports Park',27000,1994,_country.unitedStates,[_name.losangelesfc]];
    map[_name.losangelesfc] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(34.01283380233556, -118.28357956394143),
			'Banc of California Stadium',22000,2014,_country.unitedStates,[_name.lagalaxy]];
    map[_name.montreal] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.56245239840091, -73.55283927419696),
			'Saputo Stadium',19619,2010,_country.canada,];
    map[_name.nashville] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(36.1301689, -86.7658585),
      'Geodis Park',30000,2016,_country.unitedStates,];
    map[_name.nerevolution] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(42.091105, -71.264239),
			'Gillette Stadium',25000,1996,_country.unitedStates,];
    map[_name.nycity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.8297390634173, -73.9261731193736),
			'Yankee Stadium',33488,2013,_country.unitedStates,[_name.nyredbulls]];
    map[_name.nyredbulls] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.737136159251094, -74.14988141458025),
			'Red Bull Arena',25000,1995,_country.unitedStates,[_name.nycity]];
    map[_name.orlando] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(28.54122030683539, -81.38898748081618),
			'Exploria Stadium',25500,2010,_country.unitedStates,];
    map[_name.portland] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(45.52168918987854, -122.69138305222297),
			'Providence Park',21144,1975,_country.unitedStates,];
    map[_name.seattle] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(47.59539774447109, -122.33119950470088),
			'Lumen Field',68000,2007,_country.unitedStates,];
    map[_name.intermiami] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(26.193247439798213, -80.16061670025503),
			'Lockhart Stadium',17417,2018,_country.unitedStates,];
    map[_name.philadelphia] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(39.83275356055387, -75.3779441855293),
			'PPL Park',18500,2008,_country.unitedStates,];
    map[_name.toronto] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.633340987226894, -79.41830505626623),
			'BMO Field',30000,2005,_country.canada,];
    map[_name.realSaltLake] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(40.58327223014679, -111.89327523514315),
			'Rio Tinto Stadium',20213,2004,_country.unitedStates,];
    map[_name.sanJoseEarthquakes] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(37.35128154438451, -121.9244801339687),
			'Avaya Stadium',18000,1994,_country.unitedStates,];
    map[_name.kansas] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(39.12169273, -94.82291920),
			'Children\'s Mercy Park',18467,1995,_country.unitedStates,];
    map[_name.vancouver] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.2770509, -123.1119131),
			'BC Place',54500,2009,_country.canada,];

    //CANADA
    map[_name.cavalry] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.8840803, -114.0987956),
      'ATCO Field',6000,2018,_country.canada,];
    map[_name.forge] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(43.25220, -79.83009),
      'Tim Hortons Field',23218,2017,_country.canada,];

    //CARIBE
    //COSTA RICA
    map[_name.saprissa] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(9.9656632, -84.07525166),
			'Ricardo Saprissa Aymá',23112,1935,_country.costaRica,];
    map[_name.alajuelense] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(10.0218617, -84.20910),
			'Aleandro Morera Soto',17895,1919,_country.costaRica,];
    map[_name.cartagines] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.85850690, -83.918919),
			'José Rafael Fello Meza Ivankovich',18000,1906,_country.costaRica,];
    map[_name.herediano] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(9.99945, -84.12303),
      'Eladio Rosabal Cordero',17895,1921,_country.costaRica,];
    map[_name.sanCarlos] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(10.32398660, -84.423708),
      'Estádio Carlos Ugalde Álvarez',6200,1965,_country.costaRica,];
    map[_name.sptSanJose] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.94251970, -84.13030),
      'Ernesto Rohrmoser Stadium',3000,2016,_country.costaRica,];
    //HONDURAS
    map[_name.marathon] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(15.47014392, -88.00675),
      'Estadio Olímpico Metropolitano',45000,1925,_country.honduras,];
    map[_name.motagua] = [ClubColors(Colors.blue,darkblue),pattern.solid,Coordinates(14.098298, -87.2039269),
      'Tiburcio Carias Andino',35000,1928,_country.honduras,];
    map[_name.olimpiaHON] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(14.09869, -87.203603),
			'Tiburcio Carias Andino',30000,1965,_country.honduras,];
    map[_name.rcdespana] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(15.507659, -88.033096),
			'Francisco Morazán',26781,1929,_country.honduras,];
    //PANAMA
    map[_name.alianzaPAN] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.03394, -79.470226),
      'Luis Ernesto Cascarita Tapia',1000,1963,_country.panama,];
    map[_name.arabeunido] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.34405, -79.89594),
			'Armando Dely Valdés',4000,1994,_country.panama,];
    map[_name.independienteChorrera] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(8.8873752, -79.775471),
      'Agustín Muquita Sánchez',3000,1982,_country.panama,];
    map[_name.plazaAmador] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(8.945835, -79.549585),
      'Maracaná de Panamá',6000,1955,_country.panama,];
    map[_name.tauro] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.0358766, -79.4693139),
      'Rommel Fernández',32000,1984,_country.panama,];
    //GUATEMALA
    map[_name.antiguaGuatemala] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.5673481, -90.7381967),
      'Estadio Pensativo',9000,1958,_country.guatemala,];
    map[_name.comunicaciones] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(14.6258950, -90.509649),
			'Doroteo Guamuch Flores',26000,1949,_country.guatemala,];
    map[_name.municipal] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.62516724, -90.5101396),
      'Doroteo Guamuch Flores',26000,1936,_country.guatemala,];
    map[_name.xelaju] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.842098, -91.51714438),
      'Mario Camposeco',11000,1928,_country.guatemala,];
    //EL SALVADOR
    map[_name.alianzaELS] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(13.6811446, -89.222373),
      'Estadio Cuscatlán',53400,1958,_country.elsalvador,];
    map[_name.atleticomarte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(13.6812, -89.2224),
      'Estadio Cuscatlán',53400,1950,_country.elsalvador,];
    map[_name.aguila] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(13.482514, -88.16900),
			'Juan Francisco Barraza',15500,1926,_country.elsalvador,];
    map[_name.isidro] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.332095, -89.44904),
      'Jorge "Calero" Suárez',2000,2000,_country.elsalvador,];
    //NICARAGUA
    map[_name.diriangen] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(11.8612898, -86.2433238),
      'Estadio Cacique Diriangén',7500,1917,_country.nicaragua,];
    map[_name.managua] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(12.131400, -86.284694),
      'Olímpico del IND Managua',9000,2006,_country.nicaragua,];
    map[_name.realEsteli] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(13.097860, -86.352943),
      'Estadio Independencia',5000,1961,_country.nicaragua,];
    //CUBA
    map[_name.pinardelrio] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(22.421594, -83.69040778),
      'Estadio Capitán San Luis',8000,1978,_country.cuba,];
    map[_name.santiagoCuba] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(20.0365537, -75.81123),
      'Pista de Atletismo de Rekortan',5000,0,_country.cuba,];
    map[_name.villaclara] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(22.40494586, -79.950525),
			'Augusto César Sandino',18000,1978,_country.cuba,];
    //HAITI
    map[_name.arcahaie] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(18.5585818, -72.3217),
      'Parc Saint-Yves',1000,2017,_country.haiti,];
    map[_name.donBosco] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(18.5189640, -72.2777613),
      'Stade Pétion-Ville',5000,1963,_country.haiti,];
    map[_name.fica] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(19.75364810, -72.20763375),
      'Parc Saint-Victor',7500,1972,_country.haiti,];
    map[_name.racingHAITI] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(18.53614276, -72.34248),
      'Sylvio Cator',15000,1923,_country.haiti,];
    map[_name.violette] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(18.5361821, -72.342520),
			'Sylvio Cator',10500,1918,_country.haiti,];
    //JAMAICA
    map[_name.arnettGardens] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(17.9889844, -76.79935),
      'Anthony Spaulding Sports Complex',7000,1977,_country.jamaica,];
    map[_name.harbourView] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.9565928, -76.717187),
      'Harbour View Stadium',10000,1974,_country.jamaica,];
    map[_name.portmore] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(17.99285, -76.950748),
      'Prison Oval',2000,1985,_country.jamaica,];
    map[_name.tivoliGardens] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(17.9705540, -76.799638),
      'Edward Seaga Sports Complex',5000,1970,_country.jamaica,];
    map[_name.waterhouse] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(18.0013607, -76.77260),
      'Waterhouse Stadium',5000,1968,_country.jamaica,];
    //TRINIDAD TOBAGO
    map[_name.defenseforce] = [ClubColors(Colors.yellow,Colors.lightBlue),pattern.solid,Coordinates(10.661544, -61.533036),
			'Hasely Crawford',27000,1974,_country.trinidadTobago,];
    map[_name.police] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(10.30349244, -61.4417926),
      'Manny Ramjohn Stadium',10000,1975,_country.trinidadTobago,];
    //SURINAME
    map[_name.robinhood] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.8376520, -55.1602422),
			'André Kamperveen Stadion',6000,1945,_country.suriname,];
    map[_name.transvaal] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(5.8377, -55.160),
      'André Kamperveen Stadion',6000,1921,_country.suriname,];

    //////////////////////////////////////////////////////////////////////////////////
    //CHINA
    map[_name.beijingguoan] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(39.865559, 116.272423),
			'Beijing Fengtai Stadium',31043,1992,_country.china,];
    map[_name.changchun] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.836849, 125.39063),
      'Development Area Stadium',25000,1996,_country.china,];
    map[_name.chengdu] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.97869, 103.648159),
      'Chengdu Phoenix Hill',57087,2018,_country.china,];
    map[_name.dalian] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(39.0208235, 121.56178),
			'Dalian Sports Center',61000,2009,_country.china,];
    map[_name.ghuangzhou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(23.138031,113.324661),
      'Tianhe Stadium',58500,1954,_country.china,];
    map[_name.henan] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(34.71675, 113.72510),
			'Zhengzhou Hanghai',29860,1994,_country.china,];
    map[_name.meizhou] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(23.914710, 115.765430),
      'Huitang Stadium',27000,2013,_country.china,];
    map[_name.nantong] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(32.376731, 120.584843),
      'Rugao Olympic Sports Center',15000,2016,_country.china,];
    //map[_name.liaoning] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(41.73902122, 123.4574396),
    //  'Olímpico de Shenyang',60000,1953,_country.china,];
    map[_name.shandong] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(36.6569476, 117.116563),
			'Luneng Stadium',56808,1993,_country.china,];
    map[_name.shanghaisipg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.1835,121.437278),
			'Estádio de Shanghai',56842,2005,_country.china,];
    map[_name.shanghaishenhua] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(31.2734280, 121.476465),
			'Hongkou Stadium',33060,1993,_country.china,];
    map[_name.shenzhen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(22.5620751, 114.0869843),
      'Luneng Stadium',32500,1994,_country.china,];
    map[_name.tianjin] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.03144590, 117.7252421),
			'TEDA Football Stadium',37450,1957,_country.china,];
    map[_name.wuhan] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(30.58665415, 114.27357162),
			'Xinhua Road Sports Center',22000,2009,_country.china,];
    map[_name.zhejiang] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(30.2684601, 120.1288182),
      'Yellow Dragon Sports Center',52672,1998,_country.china,];

    //JAPÃO
    map[_name.albirex] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(37.88270153, 139.05925980),
      'Estádio Big Swan',42300,1955,_country.japan,];
    map[_name.avispa] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(33.5859820, 130.460848),
      'Best Denki Stadium',22563,1982,_country.japan,];
    map[_name.cerezoOsaka] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(34.61412159, 135.5185547),
			'Estádio Nagai',47000,1957,_country.japan,];
    map[_name.fcTokyo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(35.664162, 139.527388),
			'Ajinomoto Stadium',50100,1999,_country.japan,];
    map[_name.gambaOsaka] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(34.802526,135.538278),
			'Suita Stadium',39694,1980,_country.japan,];
    map[_name.jubiloiwata] = [ClubColors(Colors.lightBlueAccent,Colors.blueAccent),pattern.solid,Coordinates(34.7434570, 137.970775),
			'Shizuoka Ecopa',50000,1970,_country.japan,];
    map[_name.kashimaantlers] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(35.992503, 140.64383881),
			'Kashima Soccer Stadium',40728,1994,_country.japan,];
    map[_name.kashiwaReysol] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(35.8485972, 139.975101733),
			'Hitachi Kashiwa Soccer Stadium',15900,1940,_country.japan,];
    map[_name.kawasakifrontale] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(35.585895,139.652731),
			'Todoroki Athletics Stadium',27495,1997,_country.japan,];
    map[_name.kyoto] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(35.017214, 135.5850010),
			'Sanga Stadium',21326,1921,_country.japan,];
    map[_name.hiroshima] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(34.440852708, 132.39482460),
			'Edion Stadium Hiroshima',1938,1938,_country.japan,];
    map[_name.nagoya] = [ClubColors(Colors.red,Colors.orange),pattern.solid,Coordinates(35.084593, 137.17108),
			'Estádio de Toyota',45000,1939,_country.japan,];
    map[_name.sagantosu] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(33.37167358, 130.520184),
      'Best Amenity',24490,1987,_country.japan,];
    map[_name.sapporo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.0151545, 141.4096851),
			'Sapporo Dome',41484,1939,_country.japan,];
    map[_name.shonanbellmare] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(35.3436334, 139.341192),
			'Hiratsuka Athletics',18500,1968,_country.japan,];
    map[_name.tokyoVerdy] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.6634977, 139.52787047),
      'Ajinomoto Stadium',50000,1991,_country.japan,];
    map[_name.urawareddiamonds] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(35.903142,139.717492),
			'Estádio Saitama 2002',63700,1950,_country.japan,];
    map[_name.vegaltaSendai] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(38.31913456, 140.88192),
      'Yurtec Stadium Sendai',19694,1988,_country.japan,];
    map[_name.visselkobe] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(34.65734782, 135.1696),
			'Estádio Kobe Wing',30182,1966,_country.japan,];
    map[_name.yokohamaFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.46916, 139.603706),
      'Mitsuzawa Stadium',15046,1999,_country.japan,];
    map[_name.yokohamamarinos] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(35.5102166, 139.60648),
			'Estádio Internacional de Yokohama',72327,1972,_country.japan,];

    //CORÉIA DO SUL
    map[_name.busan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.190186683, 129.05830),
			'Busan Asiad',53864,1979,_country.southKorea,];
    map[_name.daegu] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(35.881330, 128.588442),
			'DGB Daegu Bank Park',12415,2002,_country.southKorea,];
    map[_name.gangwon] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(37.7737816, 128.897490),
      'Gangneung Stadium',30000,2008,_country.southKorea,];
    map[_name.gimcheon] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.139672, 128.08642078),
      'Gimcheon Stadium',32000,1984,_country.southKorea,];
    map[_name.incheon] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(37.466183, 126.64357953),
			'Incheon Football Stadium',20891,2003,_country.southKorea,];
    map[_name.jeonbuk] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.8683430, 127.064329),
			'Jeonju World Cup Stadium',42477,1994,_country.southKorea,];
    map[_name.jeju] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(33.24632024, 126.509235),
      'Jeju World Cup Stadium',35657,1982,_country.southKorea,];
    map[_name.pohang] = [ClubColors(Colors.grey,Colors.black),pattern.solid,Coordinates(36.0088520, 129.363788),
			'Pohang Steel Yard',25000,1973,_country.southKorea,];
    map[_name.fcseoul] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(37.56837781, 126.897502),
			'Seoul World Cup Stadium',66704,1983,_country.southKorea,];
    map[_name.seongnam] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.4101435, 127.1213833),
			'Tancheon Sports Complex',16146,1989,_country.southKorea,];
    map[_name.suwonsamsung] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(37.28661727286699, 127.0367),
			'Big Bird',43288,1995,_country.southKorea,];
    map[_name.ulsan] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(35.56251396791964, 129.3483643),
			'Munsu Cup Stadium',44474,1983,_country.southKorea,];

    //RESTO ASIA - TAILANDIA
    map[_name.bangkok] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(14.06813405, 100.599042),
			'Thammasat Stadium',25000,1988,_country.thailand,];
    map[_name.buriram] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(14.96592429, 103.0944633),
			'New i-mobile Stadium',32600,1970,_country.thailand,];
    map[_name.pathum] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(14.00078645, 100.679328),
			'Leo Stadium',10114,2006,_country.thailand,];
    map[_name.policeTero] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(13.86733613, 100.578051),
      'Boonyachinda Stadium',3550,1992,_country.thailand,];
    //INDIA
    map[_name.bengaluru] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(12.9698491467, 77.5938683),
			'Sree Kanteerava',19000,2013,_country.india,];
    map[_name.chennaiyin] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(13.0858151, 80.271831),
			'Jawaharlal Nehru',40000,2014,_country.india,];
    map[_name.eastBengal] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(22.55947727, 88.3438917),
      'East Bengal Ground',23500,1920,_country.india,];
    map[_name.goa] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(15.28948422, 73.962551),
			'Fatorda',19000,2014,_country.india,];
    map[_name.hyderabad] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.446364257, 78.34410),
			'G.M.C Balayogi Athletic',30000,2019,_country.india,];
    map[_name.kerala] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(13.08564797, 80.2716407),
			'Jawaharlal Nehru',75000,2014,_country.india,];
    map[_name.mohunBagan] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(22.5622357, 88.34235),
      'Mohun Bagan Ground',20000,2020,_country.india,];
    map[_name.mumbai] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(19.042204573, 73.0269),
			'DY Patil Stadium',55000,2014,_country.india,];
    map[_name.northeast] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(26.115528, 91.760329),
      'Indira Gandhi Athletic Stadium',35000,2004,_country.india,];
    map[_name.odisha] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(20.2880451, 85.82383754),
			'Kalinga Stadium',60000,2014,_country.india,];
    //BANGLADESH
    map[_name.bashundhara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.93206572, 88.845353167),
      'Estádio Sheikh Kamal',21359,2013,_country.bangladesh,];
    map[_name.dhakaAbahani] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(23.72791777, 90.4135417),
      'Bangabandhu National Stadium',60000,1972,_country.bangladesh,];
    map[_name.saif] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.54811565, 90.5364364),
      'Munshigonj District Stadium',10000,2016,_country.bangladesh,];
    map[_name.sheikhJamal] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(23.5477248, 90.53690),
      'Munshigonj District Stadium',10000,1962,_country.bangladesh,];
    //INDONESIA
    map[_name.bali] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-8.5468398, 115.3064336),
      'Kapten I Wayan Dipta',18000,2015,_country.indonesia,];
    map[_name.borneo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.49305867, 117.14939),
      'Segiri Stadium',16000,2014,_country.indonesia,];
    map[_name.persib] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-6.957815877, 107.712158),
      '	Gelora Bandung Lautan Api Stadium',38000,1933,_country.indonesia,];
    map[_name.persebaya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.223110, 112.6228187),
      'Gelora Bung Tomo Stadium',30000,1927,_country.indonesia,];
    map[_name.persipura] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5790803, 140.57361),
			'Lukas Enembe',40263,1963,_country.indonesia,];
    //MONGOLIA
    map[_name.athletic220] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.900222, 106.916315),
      'MFF Football Centre',5000,2016,_country.mongolia,];
    map[_name.erchim] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.888914, 106.79751),
      'Erchim Stadium',2000,1994,_country.mongolia,];
    map[_name.khoromkhon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.9022031, 106.91699),
      'MFF Football Centre',5000,1999,_country.mongolia,];
    map[_name.ulaanbaatar] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.8013018, 106.744977),
      'G-Mobile Arena',5300,2016,_country.mongolia,];
    //VIETNA
    map[_name.hanoi] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(21.0298189, 105.833028),
      'Hàng Đẫy Stadium',22500,2006,_country.vietnam,];
    //PHILIPPINNES
    map[_name.maharlikaManila] = [ClubColors(Colors.black,Colors.purple),pattern.solid,Coordinates(14.563410, 120.9921828),
      'Rizal Memorial Stadium',12873,2020,_country.philippines,];
    map[_name.unitedCity] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(15.3455705, 120.5335554),
      'New Clark City Athletics',20000,2012,_country.philippines,];
    //CAMBOJA
    map[_name.phnomPenhCrown] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(11.6047089, 104.894398),
      'RSN Stadium',5000,2001,_country.cambodia,];
    //NEPAL
    map[_name.machhindra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(27.69569827, 85.3148114),
      'Dasarath Rangasala',15000,1973,_country.nepal,];
    map[_name.manangMarshyangdi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(27.6950160, 85.314920),
      'Dasarath Rangasala',15000,1982,_country.nepal,];
    //MALAYSIA
    map[_name.johorDarul] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.497541866, 103.751479),
      'Larkin Stadium',30000,1970,_country.malaysia,];
    map[_name.kedah] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(6.135977965, 100.3716979),
      '	Darul Aman Stadium',32387,1924,_country.malaysia,];
    map[_name.kualaLumpur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.10071364, 101.721440),
      'Kuala Lumpur Stadium',18000,1974,_country.malaysia,];
    map[_name.selangor] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(3.08214134, 101.54496),
      'Our Tampines Hub',80372,1905,_country.malaysia,];
    //SINGAPORE
    map[_name.warriors] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.391140, 103.74921),
      'Choa Chu Kang Stadium',10000,1975,_country.singapore,];
    map[_name.tampines] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(1.3528877, 103.940622),
      'Our Tampines Hub',5000,1945,_country.singapore,];
    //BRUNEI
    map[_name.brunei] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(1.35453962, 103.851562),
      'Ground Bishan',30000,2000,_country.brunei,];

    //ORIENTE MÉDIO
    //QATAR
    map[_name.alsadd] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(25.267630373861838, 51.48445839148633),
			'Jassim Bin Hamad',15000,1969,_country.qatar,];
    map[_name.alduhail] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.37346857386201, 51.469251555342645),
			'Abdullah bin Khalifa',10221,1938,_country.qatar,];
    map[_name.alrayyan] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(25.32986391889229, 51.34271845785474),
			'Ahmed bin Ali Stadium',27000,1967,_country.qatar,];
    map[_name.alarabi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(25.25861235, 51.520695),
			'Grand Hamad Stadium',18000,1952,_country.qatar,];
    //UAE
    map[_name.ajman] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(25.392500, 55.450728),
      'Estádio Ajman',5537,1974,_country.uae,];
    map[_name.alain] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(24.245059, 55.7170932),
      'Hazza bin Zayed',25053,1968,_country.uae,];
    map[_name.aljazira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(24.452764,54.392019),
			'Estádio Mohammed Bin Zayed',42000,1974,_country.uae,];
    map[_name.alnasrEAU] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(25.23990846, 55.312893),
      'Al Maktoum Stadium',15058,1945,_country.uae,];
    map[_name.alsharjah] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(25.3332735, 55.4195766),
      'Sharjah Stadium',10000,1966,_country.uae,];
    map[_name.alWahda] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(24.469883556, 54.3753338),
			'Estádio Al Nahyan',12000,1974,_country.uae,];
    map[_name.alwasl] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(25.219131, 55.3169737),
      'Zabeel Stadium',18000,1960,_country.uae,];
    map[_name.baniyas] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(24.34986, 54.68571),
      'Baniyas Stadium',9047,1974,_country.uae,];
    map[_name.shababalahli] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(25.279691, 55.3607072),
      'Rashed Stadium',15000,1958,_country.uae,];
    //BAHREIN
    map[_name.alhidd] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.15366, 50.54359),
			'Bahrain National Stadium',24000,1945,_country.bahrein,];
    map[_name.alMuharraq] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(26.25750173, 50.62779),
      'Al Muharraq Stadium',20000,1928,_country.bahrein,];
    map[_name.alRiffa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.1528, 50.542743),
      'Bahrain National Stadium',24000,1953,_country.bahrein,];
    map[_name.manama] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(26.1535, 50.54359),
      'Bahrain National Stadium',24000,1946,_country.bahrein,];
    //SOUTH ARABIA
    map[_name.alahli] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.446627355, 39.2523386),
      'Prince Abdullah al-Faisal Stadium',27000,1937,_country.southArabia,];
    map[_name.alettifaq] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.426514, 50.114128),
      'Prince Mohamed bin Fahd Stadium',26000,1945,_country.southArabia,];
    map[_name.alfateh] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(25.305669, 49.61340246),
      'Prince Abdullah bin Jalawi Stadium',19550,1958,_country.southArabia,];
    map[_name.alhilal] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(24.78903170, 46.8395937),
			'King Fahd Stadium',67000,1957,_country.southArabia,];
    map[_name.alIttihad] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(21.44662735, 39.2524137),
      'Prince Abdullah Al-Faisal Stadium',27000,1927,_country.southArabia,];
    map[_name.alnassr] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(21.76355015, 39.164367968),
			'Universitário Rei Saud',25000,1955,_country.southArabia,];
    map[_name.alQadisiya] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Príncipe Saud bin Jalawi Stadium',15000,1967,_country.southArabia,];
    map[_name.alraed] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.3795, 43.948),
      'King Abdullah Sports City Stadium',30000,1954,_country.southArabia,];
    map[_name.alShabab] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(24.78829136, 46.839111),
      'Estádio Internacional Rei Fahd',75000,1947,_country.southArabia,];
    map[_name.altaawoun] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(26.37901905, 43.9477167),
      'King Abdullah Sport City Stadium',25000,1956,_country.southArabia,];
    map[_name.damac] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(18.3105417, 42.597956),
      'Prince Sultan bin Abdul Aziz Stadium',20000,1972,_country.southArabia,];
    //IRÃ
    map[_name.persepolis] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.72465, 51.27574),
			'Azadi Stadium',100000,1963,_country.iran,];
    map[_name.esteghlal] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.7246, 51.2758),
			'Azadi Stadium',100000,1945,_country.iran,];
    map[_name.saipa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(35.850008586, 50.9585994),
      'Enghelab Stadium',15000,1989,_country.iran,];
    map[_name.sepahan] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.74323273, 51.686141),
			'Naghsh-e Jahan',75000,1953,_country.iran,];
    map[_name.zobahan] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(32.48286848, 51.42148270),
      'Foolad Shahr Stadium',25000,1969,_country.iran,];
    //UZBEQUISTÃO
    map[_name.bunyodkor] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(41.2796393, 69.212486),
      'Milliy Stadioni',34000,2005,_country.uzbekistan,];
    map[_name.pakhtakor] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(41.3156628, 69.26059),
			'Pakhtakor Markaziy Stadium',35000,1956,_country.uzbekistan,];
    //IRAQUE
    map[_name.alzawraa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(33.3443251, 44.36832511),
			'Al-Zawraa Stadium',15443,1969,_country.iraq,];
    map[_name.alQuwaAlJawiya] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(33.3535912, 44.4543854),
			'Al-Zawraa Stadium',6000,1931,_country.iraq,];
    //KUWAIT
    map[_name.alQadsia] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(29.34052466, 48.0307858),
      'Mohammed Al-Hamad Stadium',26000,1960,_country.kuwait,];
    map[_name.alKuwait] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(29.34280293, 47.95224442),
      'Al Kuwait Sports Club',12350,1960,_country.kuwait,];
    //LEBANON
    map[_name.alAhed] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(33.840550954, 35.4898395),
      'Al Ahed',2000,1964,_country.lebanon,];
    map[_name.alAnsar] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(33.8384684, 35.495880),
      'Al Ansar',5000,1951,_country.lebanon,];
    map[_name.nejmeh] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(33.894420, 35.4695427),
      'Prince Mohammed bin Abdul Aziz',5000,1945,_country.lebanon,];
    //SYRIA
    map[_name.alKaramah] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(34.729750, 36.69807434),
      'Khalid ibn al-Walid',32000,1928,_country.syria,];
    map[_name.alJaish] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(33.5227937, 36.3200108),
      'Abbasiyyin Stadium Damascus',30000,1945,_country.syria,];
    map[_name.alShorta] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(33.5048124, 36.288935),
      'Tishreen Stadium',12000,1947,_country.syria,];
    map[_name.tishreen] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(33.5053761, 36.2892507),
      'Tishreen',28000,1947,_country.syria,];

    //////////////////////////////////////////////////////////////////////////
    //OCEANIA
    map[_name.auckland] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(-36.89779, 174.736646117),
			'Kiwitea Street',3500,2004,_country.newZealand,];
    map[_name.wellingtonphoenix] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-41.273115, 174.78582),
			'Westpac Stadium',35000,2007,_country.newZealand,];
    //AUSTRALIA
    map[_name.adelaide] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-34.9074787, 138.56896413),
			'Coopers Stadium',16500,2003,_country.australia,];
    map[_name.brisbane] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-27.464607, 153.0096921280),
			'Suncorp Stadium',53223,2005,_country.australia,];
    map[_name.centralcoast] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-33.42820, 151.3379147192544),
			'Bluetongue Stadium',20119,2004,_country.australia,];
    map[_name.melbournecity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-37.8251, 144.9840),
			'AAMI Park',30050,2009,_country.australia,];
    map[_name.melbournevictory] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-37.825063012, 144.983956),
			'AAMI Park',30050,2004,_country.australia,];
    map[_name.newcastlejets] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-32.918943, 151.726707182),
			'Hunter Stadium',34000,2000,_country.australia,];
    map[_name.perth] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-31.945730, 115.86990),
			'HBF Park Stadium',20500,1995,_country.australia,];
    map[_name.sydney] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.888853, 151.22556784),
			'Sydney Football Stadium',45500,2004,_country.australia,];
    map[_name.sydneywanderers] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-33.8079, 150.99936),
			'Parramatta Stadium',20741,2012,_country.australia,];
    map[_name.westernunited] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-38.157997, 144.355),
			'GMHBA Stadium',26000,2018,_country.australia,];

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    //NORTE AFRICA
    //EGITO
    map[_name.alahly] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.069291, 31.31241),
			'Estádio Internacional do Cairo',71400,1907,_country.egypt,[_name.zamalek]];
    map[_name.almasry] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(31.271395, 32.291329),
      'Porto Said Stadium',18000,1920,_country.egypt,];
    map[_name.cleopatra] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(29.957375, 32.542372),
      'Suez Stadium',27000,2007,_country.egypt,];
    map[_name.future] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(30.174269, 31.435062),
      'Al Salam Stadium',30000,2011,_country.egypt,];
    map[_name.ismaily] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(30.6010391, 32.27382),
			'Ismaília Stadium',35000,1924,_country.egypt,];
    map[_name.pyramids] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.02028, 31.3737282),
			'Estádio 30 de junho',30000,2008,_country.egypt,];
    map[_name.zamalek] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(30.0693, 31.312),
      'Estádio Internacional do Cairo',71400,1911,_country.egypt,[_name.alahly]];
    //MOROCCO
    map[_name.rajacasablanca] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(33.582906, -7.6464496),
			'Stade Mohamed V',67000,1949,_country.morocco,[_name.wydad]];
    map[_name.wydad] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(33.582, -7.64647),
			'Stade Mohamed V',67000,1937,_country.morocco,[_name.rajacasablanca]];
    map[_name.farRabat] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(33.959915, -6.8890915),
			'Estádio Príncipe Moulay Abdellah',53000,1958,_country.morocco,];
    map[_name.maghreb] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(34.0028129, -4.96905145),
      'Complexe Sportif de Fès',45000,1946,_country.morocco,];
    //ALGERIA
    map[_name.belouizdad] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.7456313, 3.0786813),
      'Stade du 20-Août-1955',10000,1955,_country.algeria,];
    map[_name.essetif] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(36.18707773, 5.3937329179),
			'Estádio 8 de Maio',25000,1958,_country.algeria,];
    map[_name.kabylie] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(36.706899, 4.0560295),
			'Stade 1er Novembre',22000,1946,_country.algeria,];
    map[_name.mcalger] = [ClubColors(Colors.green,Colors.red),pattern.horStripes,Coordinates(36.75986425, 2.99499536),
      'Estádio 5 de Julho de 1962',76000,1921,_country.algeria,];
    map[_name.mcOran] = [ClubColors(Colors.white,Colors.red),pattern.horStripes,Coordinates(35.683435418, -0.63621669),
      'Estádio Ahmed Zabana',40000,1917,_country.algeria,];
    map[_name.usmAlger] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.80114535, 3.04854982),
      'Omar Hamadi Stadium',15000,1937,_country.algeria,];
    //LIBYA
    map[_name.alIttihadLIB] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.85989333, 13.1358680),
      'Tripoli Stadium',65000,1944,_country.libya,];
    map[_name.benghazi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.1022578, 20.072776),
      '28 de Março',65000,1950,_country.libya,];
    //TUNISIA
    map[_name.clubAfricain] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.839919, 10.185206),
      'Olympique d\'El Menzah',45000,1920,_country.tunisia,];
    map[_name.esperance] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(36.7477777,10.2727777),
			'Estadio Olímpico de Radès',60500,1919,_country.tunisia,];
    map[_name.etoilesahel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.82355464, 10.6134521),
			'Estádio Olímpico de Sousse',28000,1925,_country.tunisia,];
    map[_name.sfaxien] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(34.73365186, 10.74661154),
			'Estádio Taïeb Mehiri',11000,1928,_country.tunisia,];

    //AFRICA NEGRA
    //AFRICA DO SUL
    map[_name.amazulu] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-29.828736, 31.030474),
      'Moses Mabhida Stadium',52000,1932,_country.southAfrica,];
    map[_name.capetown] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.9034463, 18.411186156),
      'Cape Town Stadium',55000,1962,_country.southAfrica,];
    map[_name.goldenarrows] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-29.824950, 31.029732),
      'Kings Park Stadium',52000,1996,_country.southAfrica,];
    map[_name.kaizer] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-26.23449118, 27.98311136),
			'Soccer City',78000,1970,_country.southAfrica,[_name.orlandopirates]];
    map[_name.maritzburg] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-29.6175844, 30.3856279),
      'Harry Gwala Stadium',12000,1979,_country.southAfrica,];
    map[_name.mamelodi] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-25.75319343, 28.22302862),
			'Loftus Versfeld',51762,1960,_country.southAfrica,];
    map[_name.orlandopirates] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-26.23098107, 27.92291584),
      'Orlando Stadium',40000,1937,_country.southAfrica,[_name.kaizer]];
    //ANGOLA
    map[_name.agosto] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-8.969859115, 13.2837),
      'Estádio Nacional 11 de Novembro',48500,1977,_country.angola,];
    map[_name.petroluanda] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-8.9699, 13.28365),
			'Estádio Nacional 11 de Novembro',48500,1980,_country.angola,];
    map[_name.sagradaesperanca] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-7.3883419, 20.8334375),
      'Estádio Sagrada Esperança',8200,1976,_country.angola,];
    map[_name.sptCabinda] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-5.5079227, 12.240064),
      'Estádio Nacional do Chiazi',20000,1975,_country.angola,];
    //BOTSWANA
    map[_name.gaborone] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-24.6567388, 25.9327138),
			'Botswana National Stadium',22500,1967,_country.botswana,];
    //CAMEROON
    map[_name.cotonsport] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.32640861, 13.3998728),
      'Roumdé Adjia',35000,1986,_country.cameroon,];
    map[_name.canonYaounde] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.8855102, 11.54057732),
      'Ahmadou Ahidjo',42500,1930,_country.cameroon,];
    map[_name.douala] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(4.0560857, 9.7187861),
      'Stade de la Réunification',30000,1958,_country.cameroon,];
    //CAPE VERDE
    map[_name.mindelense] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(16.882555, -24.985470),
      'Estádio Municipal Aderito Sena',5000,1919,_country.capeVerde,];
    map[_name.sptClubePraia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.916149, -23.511936),
      'Estádio da Várzea',8000,1923,_country.capeVerde,];
    //CONGO
    map[_name.diablesNoirs] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-4.27254194, 15.24862744),
      'Stade Alphonse Massemba-Débat',5000,1950,_country.congo,];
    map[_name.otoho] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Complexe Omnisports d’Oyo',1629,2014,_country.congo,];
    map[_name.talangai] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-4.27341746, 15.2487253),
      'Stade Alphonse Massemba-Débat',33037,1935,_country.congo,];
    //RD CONGO
    map[_name.dragons] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-4.32253435, 15.312970),
      'Stade 24 Novembre',24000,1938,_country.congoRD,];
    map[_name.maniema] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33021337, 15.310353),
      'Joseph Kabila Kabange',22000,2005,_country.congoRD,];
    map[_name.mazembe] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-11.67807733, 27.4899193),
      'Stade TP Mazembe',35000,1939,_country.congoRD,];
    map[_name.vita] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33065248, 15.31034443),
      'Stade des Martyrs',80000,1935,_country.congoRD,];
    //ETHIOPIA
    map[_name.fasil] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(12.618048, 37.45961),
      'Fasiledes Stadium',20000,1968,_country.ethiopia,];
    map[_name.stGeorge] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(9.0132947, 38.7565828),
      'Addis Ababa Stadium',24000,1935,_country.ethiopia,];
    //GHANA
    map[_name.asantekotoko] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(6.68225260, -1.6050228),
			'Baba Yara Stadium',43000,1935,_country.ghana,];
    map[_name.heartsoak] = [ClubColors(Colors.red,Colors.purple),pattern.solid,Coordinates(5.55150373, -0.19180352),
			'Ohene Djan Stadium',40000,1911,_country.ghana,];
    //GUINEA
    map[_name.hafia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.54617954, -13.672815),
			'Stade 28 Septembre',25000,1951,_country.guinea,];
    map[_name.horoya] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(9.5462, -13.6728),
      'Stade 28 Septembre',25000,1975,_country.guinea,];
    //KHENYA
    map[_name.gorMahia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-1.294090, 36.842290),
      'City Stadium',15000,1968,_country.kenya,];
    map[_name.mathare] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2300765, 36.8924818),
      'Moi International Sports Centre',60000,1994,_country.kenya,];
    map[_name.tusker] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2345079, 36.8804135),
      'Ruaraka Stadium',1000,1969,_country.kenya,];
    map[_name.ulinzi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.2955202, 36.07390),
      'Afraha Stadium',8200,1995,_country.kenya,];
    //MADAGASCAR
    map[_name.adema] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-18.15230, 49.4160806),
      'Stade Municipal de Toamasina',2500,1955,_country.madagascar,];
    map[_name.cnapsSport] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-18.919411, 47.5259711),
      'Mahamasina Stadium',23000,1990,_country.madagascar,];
    //MOZAMBIQUE
    map[_name.costaDoSol] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-25.9413178, 32.61610373),
      'Estádio do Costa do Sol',10000,1955,_country.mozambique,];
    map[_name.libolo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-25.9173539, 32.52639366),
      'Estádio da Machava',45000,1924,_country.mozambique,];
    //NAMIBIA
    map[_name.blackAfrica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-22.5159386, 17.060735),
      'Sam Nujoma Stadium',25000,1986,_country.namibia,];
    map[_name.africanStars] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.5162, 17.060),
      'Sam Nujoma Stadium',25000,1962,_country.namibia,];
    //NIGERIA
    map[_name.enyimba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.125570, 7.379054),
			'Enyimba International',25000,1976,_country.nigeria,];
    map[_name.heartland] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(5.48386575, 7.043767833),
      'Dan Anyiam Stadium',10000,1976,_country.nigeria,];
    map[_name.kano] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(11.999726271, 8.52926678),
      'Sani Abacha',25000,1990,_country.nigeria,];
    map[_name.rangersInt] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(6.444346813, 7.496462056),
      'Nnamdi Azikiwe Stadium',22000,1970,_country.nigeria,];
    map[_name.riversUtd] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(4.96715013, 6.971510),
      'Adokiye Amiesimaka Stadium',38000,2016,_country.nigeria,];
    map[_name.shootingstars] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(7.39632598, 3.885855),
      'Lekan Salami Stadium',10000,1950,_country.nigeria,];
    map[_name.sunshinestars] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(7.25847070, 5.1896354),
      'Akure Township Stadium',5000,1995,_country.nigeria,];
    //IVORY COAST
    map[_name.africaSports] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(6.1192630, -5.9613877),
      'Stade Robert Champroux',15000,1960,_country.ivorycoast];
    map[_name.asecmimosas] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(5.3049676, -3.99280839),
			'Stade Robert Champroux',10000,1947,_country.ivorycoast];
    map[_name.gagnoa] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(6.1192630, -5.9613877),
      'Stade Victor Biaka Boda',15000,1960,_country.ivorycoast];
    map[_name.omnisport] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(6.8279876, -5.246351),
      'Stade de Yamoussoukro',6000,1932,_country.ivorycoast];
    map[_name.sanPedro] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(4.7607713, -6.638301),
      'Stade Auguste Denise',8000,2004,_country.ivorycoast];
    //SENEGAL
    map[_name.douanes] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(14.711, -17.458),
      'Demba Diop',20000,1980,_country.senegal];
    map[_name.genefoot] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Stade Déni Birame Ndao',1001,2000,_country.senegal];
    map[_name.jaraaf] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(14.7108854, -17.458191),
      'Demba Diop',20000,1933,_country.senegal];
    map[_name.jeannedarc] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.746812323, -17.45177448),
      'Léopold Sédar Senghor',60000,1923,_country.senegal,];
    //SUDÃO
    map[_name.omdurman] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(15.6473138, 32.4749635),
      'Al Hilal Stadium',25000,1930,_country.sudan];
    map[_name.almerrikh] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(15.64140, 32.471581),
      'Al Merriekh Stadium',43645,1908,_country.sudan];
    //TANZANIA
    map[_name.simba] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.85384812, 39.273788814),
			'Mkapa Stadium',60000,1936,_country.tanzania];
    //ZAMBIA
    map[_name.greenEagles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-16.8139242, 26.9879751),
      'Choma Independence Stadium',1000,2002,_country.zambia];
    map[_name.nkana] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-12.847060, 28.2112330),
      'Nkana Stadium',10000,1935,_country.zambia];
    map[_name.zesco] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-12.9751432, 28.611562),
			'Levy Mwanawasa',49800,1974,_country.zambia];
    //ZIMBABWE
    map[_name.dynamos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-17.853630, 31.0376418),
			'Rufaro',45500,1963,_country.zimbabwe];
    map[_name.manicaDiamonds] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-18.996833, 32.6409931),
      'Sakubva',35000,2017,_country.zimbabwe];
    map[_name.platinum] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.306090, 30.0568275),
      'Mandava',15000,1995,_country.zimbabwe];
  }


}