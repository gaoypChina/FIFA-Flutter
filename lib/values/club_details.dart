import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/widgets/kits_crests/patterns.dart';
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
      //print('ERROR GETCOUNTRY: $clubName');
      return '';
    }
  }

  String getState(String clubName){
    try {
      return map[clubName][9];
    }catch (e) {
      //print('ERROR GETCOUNTRY: $clubName');
      return '';
    }
  }

  String getContinent(String clubName){
    return Continents().funcCountryContinents(getCountry(clubName));
  }

  double getOverall(String clubName){
    try {
      return map[clubName][7];
    }catch(e){
      return 50.0;
    }
  }
  List getRivals(String clubName){
    try {
      return map[clubName][8];
    }catch(e){
      return [];
    }
  }

  ClubDetails(){
    var _country = Words.country;
    Color darkblue = const Color(0xFF001050);
    Color darkgreen = const Color(0xFF0B5700);
    Color blue = const Color(0xFF001FBB);
    Color grena = const Color(0xFF760025);
    Color vinho = const Color(0xFF870000);
    Color gold = const Color(0x876A00FF);
    ClubPattern pattern = ClubPattern();

    ClubName _name = ClubName();
    //https://query.wikidata.org/#SELECT%20%3Fclub%20%3FclubLabel%20%3Fvenue%20%3FvenueLabel%20%3Fcoordinates%0AWHERE%0A%7B%0A%09%3Fclub%20wdt%3AP31%20wd%3AQ476028%20.%0A%09%3Fclub%20wdt%3AP115%20%3Fvenue%20.%0A%09%3Fvenue%20wdt%3AP625%20%3Fcoordinates%20.%0A%09SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22pt%22%20%7D%0A%7D
    map[_name.arsenal] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(51.555,-0.108611),
      'Estádio Emirates',60704,1886,_country.england,80.2,[_name.tottenham,_name.chelsea]];
    map[_name.astonvilla] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(52.509166666,-1.884722222),
      'Villa Park',42660,1874,_country.england,78.3,[_name.birmigham]];
    map[_name.bournemouth] = [ClubColors(Colors.black,Colors.red),pattern.stripes3,Coordinates(50.735278,-1.838333),
      'Dean Court',11464,1890,_country.england,73.9,[_name.southampton]];
    map[_name.brentford] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.488167,-0.302639),
      'Griffin Park',17250,1889,_country.england,74.9,[]];
    map[_name.brighton] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(50.861822222,-0.083277777),
      'Falmer Stadium',30750,1901,_country.england,77.5,[_name.crystalpalace]];
    map[_name.crystalpalace] = [ClubColors(Colors.red,Colors.blueAccent),pattern.stripes2,Coordinates(51.398333333,-0.085555555),
      'Selhurst Park',26047,1905,_country.england,76.7,[]];
    map[_name.chelsea] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(51.481666666,-0.191111111),
      'Stamford Brigde',41837,1905,_country.england,84.3,[_name.tottenham,_name.arsenal]];
    map[_name.everton] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(53.438888888,-2.966388888),
      '	Goodison Park',39571,1878,_country.england,79.2,[_name.liverpool]];
    map[_name.fulham] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(51.475,-0.221666666),
      'Craven Cottage',19000,1879,_country.england,74.5,[_name.chelsea,_name.qpr]];
    map[_name.leicester] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.620277777,-1.142222222),
      'King Power Stadium',39571,1884,_country.england,81.0,[]];
    map[_name.leeds] = [ClubColors(Colors.white,Colors.yellow,Colors.blue),pattern.solid,Coordinates(53.777777777,-1.572222222),
      'Elland Road',37890,1919,_country.england,77.0,[]];
    map[_name.liverpool] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.430833333,-2.960833333),
      'Anfield',54167,1892,_country.england,86.5,[_name.manchesterunited,_name.everton]];
    map[_name.manchestercity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(53.483310, -2.20047039),
      'Etihad Stadium',53400,1880,_country.england,86.4,[_name.manchesterunited]];
    map[_name.manchesterunited] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.463055555,-2.291388888),
      'Old Trafford',76212,1878,_country.england,83.8,[_name.manchestercity]];
    map[_name.newcastle] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(54.975555555,-1.621666666),
      'St. James Park',52409,1892,_country.england,78.3,[_name.sunderland]];
    map[_name.nottinghamforest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.94,-1.132778),
      'City Ground',30446,1865,_country.england,70.4,[_name.leicester]];
    map[_name.southampton] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.90583333,-1.39111111),
      'St. Mary\'s',32690,1885,_country.england,76.8,[_name.portsmouth]];
    map[_name.tottenham] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(51.604444444,-0.066388888),
      'Tottenham Hotspur Stadium',62850,1882,_country.england,80.9,[_name.arsenal,_name.chelsea]];
    map[_name.westham] = [ClubColors(grena,Colors.blue),pattern.sleeves,Coordinates(51.538611111,-0.016388888),
      'Olímpico de Londres',60000,1895,_country.england,80.0,[_name.millwall,_name.tottenham]];
    map[_name.wolves] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.590277777,-2.130277777),
      'Molineux Stadium',32050,1877,_country.england,78.64,[_name.westbromwich]];

    map[_name.accrington] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.7654, -2.371048),
      'Crown Ground',6000,1968,_country.england,64.6,[]];
    map[_name.barnsley] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.552222,-1.4675),
      'Oakwell Stadium',23000,1887,_country.england,66.3,[]];
    map[_name.birmigham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.475702777,-1.868188888),
      'St Andrew\'s Stadium',30016,1875,_country.england,70.1,[_name.astonvilla]];
    map[_name.blackburn] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(53.728611111,-2.489166666),
      'Ewood Park',30016,1875,_country.england,72.1,[_name.burnley]];
    map[_name.blackpool] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(53.804722,-3.048056),
      'Bloomfield Road',12555,1887,_country.england,68.5,[]];
    map[_name.bolton] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.580555555,-2.535555555),
      'Reebok Stadium',28723,1874,_country.england,67.9,[]];
    map[_name.burton] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.821944, -1.626888),
      'Pirelli Stadium',6912,1950,_country.england,66.4,[]];
    map[_name.bradford] = [ClubColors(Colors.orangeAccent,grena),pattern.divided,Coordinates(53.804222222,-1.7590222),
      'Valley Parade',25136,1903,_country.england,67.2,[]];
    map[_name.bristol] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.44,-2.620278),
      'Ashton Gate Stadium',21497,1897,_country.england,69.8,[]];
    map[_name.bristolrovers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.4862678, -2.583142),
      'Memorial Stadium',12300,1883,_country.england,64.4,[]];
    map[_name.burnley] = [ClubColors(Colors.purple,Colors.lightBlueAccent),pattern.sleeves,Coordinates(53.789064,-2.230225),
      'Turf Moor',22546,1882,_country.england,77.2,[_name.blackburn]];
    map[_name.bury] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(0,0),
      'JD Stadium',11840,1885,_country.england,56.3,[]];
    map[_name.cambridge] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.212175, 0.15415834),
      'Abbey Stadium',8127,1912,_country.england,63.6,[]];
    map[_name.cardiffCity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.472778,-3.203056),
      'Cardiff City Stadium',33000,1899,_country.wales,69.2,[]];
    map[_name.carlisle] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(54.89551666, -2.91384803),
      'Brunton Park Stadium',18202,1904,_country.england,69.2,[]];
    map[_name.coventry] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.44849844, -1.49621626),
      'Coventry Building Society Arena',32609,1883,_country.england,70.5,[]];
    map[_name.charlton] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(51.487489,0.035632),
      'The Valley',27116,1905,_country.england,66.0,[]];
    map[_name.crewe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.087486, -2.4357888),
      'The Alexandra Stadium',10153,1877,_country.england,62.1,[]];
    map[_name.doncaster] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.5098730, -1.11355670),
      'Keepmoat Rovers Park',15231,1879,_country.england,63.1,[]];
    map[_name.derbycount] = [ClubColors(Colors.white,Colors.white10),pattern.solid,Coordinates(52.915,-1.447222222),
      'Pride Park',33597,1884,_country.england,69.0,[_name.nottinghamforest]];
    map[_name.exeter] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.7308274, -3.52109076),
      'Saint James Park',8541,1914,_country.england,62.8,[]];
    map[_name.fleetwood] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.91654334, -3.024740453),
      'Highbury Stadium',5327,1908,_country.england,61.5,[]];
    map[_name.forestgreen] = [ClubColors(Colors.lightGreenAccent,Colors.black),pattern.horStripes2,Coordinates(51.698995, -2.2377947),
      'The New Lawn',5140,1889,_country.england,63.5,[]];
    map[_name.gillingham] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.3843096, 0.5607898),
      'KRBS Priestfield Stadium',11582,1893,_country.england,65.4,[]];
    map[_name.grimsby] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(53.570176, -0.04632012),
      'Blundell Park',9052,1893,_country.england,62.7,[]];
    map[_name.huddersfield] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.65416666,-1.76833333),
      'Kirklees Stadium',24500,1908,_country.england,70.7,[]];
    map[_name.hullcity] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(53.746111,-0.367777),
      'KCOM Stadium',25400,1904,_country.england,68.4,[]];
    map[_name.ipswichTown] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.05506755, 1.1451992),
      'Portman Road',30311,1878,_country.england,66.5,[]];
    map[_name.leyton] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Brisbane Road',9271,1881,_country.england,54.2,[]];
    map[_name.lincoln] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.218429, -0.54082758),
      'Sincil Bank',10127,1884,_country.england,65.2,[]];
    map[_name.luton] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.883688, -0.4305913),
      'Kenilworth Road',10356,1885,_country.england,70.4,[]];
    map[_name.middlesbrough] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(54.578333,-1.2169444),
      'Riverside Stadium',34988,1876,_country.england,70.8,[_name.newcastle]];
    map[_name.millwall] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(51.485833,-0.050833),
      'The New Den',20146,1885,_country.england,70.6,[]];
    map[_name.mkdons] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(52.0096280, -0.7335208),
      'Stadium MK',30500,2004,_country.england,67.9,[_name.wimbledon]];
    map[_name.morecambe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.061514, -2.867237627),
      'Mazuma Stadium',6476,1920,_country.england,62.4,[]];
    map[_name.northampton] = [ClubColors(grena,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Sixfields Stadium',7798,1897,_country.england,57.2,[]];
    map[_name.norwich] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.622128,1.308653),
      'Carrow Road',27033,1902,_country.england,73.9,[_name.ipswichTown]];
    map[_name.notts] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(52.9425,-1.137222),
      'Meadow Lane',19841,1862,_country.england,66.5,[]];
    map[_name.oldham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.555147, -2.1284515),
      'Boundary Park',10638,1895,_country.england,61.3,[]];
    map[_name.oxford] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.716419,-1.208067),
      'Oxford Stadium',30582,1893,_country.england,62.4,[]];
    map[_name.peterborough] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(52.56483332, -0.240204256),
      'Weston Homes Stadium',15314,1934,_country.england,67.8,[]];
    map[_name.portsmouth] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(50.79638888,-1.0638888),
      'Fratton Park',20688,1898,_country.england,66.5,[]];
    map[_name.portvale] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.0501, -2.19261630),
      'Vale Park',19052,1876,_country.england,60.7,[]];
    map[_name.plymouth] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(50.388055555,-4.150833333),
      'Home Park',19500,1886,_country.england,66.4,[]];
    map[_name.prestonNorthEnd] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.772222222,-2.6880555),
      'Deepdale',23408,1880,_country.england,71.0,[]];
    map[_name.qpr] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(51.50916666,-0.232222222),
      'Loftus Road',18439,1882,_country.england,71.5,[_name.chelsea,_name.fulham]];
    map[_name.reading] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(51.4222,-0.98277),
      'Madejski Stadium',24250,1871,_country.england,70.9,[]];
    map[_name.rotherham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.4279,-1.362),
      'New York Stadium',12021,1925,_country.england,67.6,[]];
    map[_name.scunthorpe] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(0,0),
      'Glanford Park',9088,1889,_country.england,56.2,[]];
    map[_name.stockport] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Edgeley Park',13000,1883,_country.england,53.7,[]];
    map[_name.sheffieldWednesday] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.411388888,-1.50055),
      'Estádio Hillsborough',39732,1867,_country.england,67.6,[_name.sheffieldunited]];
    map[_name.sheffieldunited] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes2,Coordinates(53.3705550, -1.4709732046),
      'Bramall Lane',39859,1889,_country.england,73.2,[_name.sheffieldWednesday]];
    map[_name.shrewsbury] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(52.6887706, -2.749098116),
      'New Meadow',9875,1886,_country.england,65.4,[]];
    map[_name.southend] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Roots Hall',12392,1906,_country.england,60.6,[]];
    map[_name.stoke] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(52.988333333,-2.175555555),
      'Bet365 Stadium',30089,1863,_country.england,69.9,[]];
    map[_name.sunderland] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(54.9144,-1.3882),
      'Stadium of Light',49000,1879,_country.england,66.9,[_name.newcastle]];
    map[_name.swansea] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(51.6422,-3.9351),
      'Liberty Stadium',21088,1912,_country.wales,69.3,[_name.cardiffCity]];
    map[_name.tranmere] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(53.37379415, -3.03251662),
      'Prenton Park',16789,1884,_country.england,59.7,[]];
    map[_name.walsall] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Bescot Stadium',11300,1888,_country.england,61.2,[]];
    map[_name.watford] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(51.649928,-0.401606),
      'Vicarage Road',21577,1881,_country.england,75.2,[_name.luton]];
    map[_name.westbromwich] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(52.509166666,-1.963888888),
      'The Hawthorns',26850,1878,_country.england,72.2,[_name.wolves]];
    map[_name.wigan] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.547778,-2.653889),
      'DW Stadium',25135,1932,_country.england,68.0,[]];
    map[_name.wimbledon] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.431363888,-0.186669444),
      'Plough Lane',9215,2002,_country.england,63.2,[_name.mkdons]];
    map[_name.wrexham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Racecourse Ground',15550,1872,_country.england,57.2,[]];
    map[_name.wycombe] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.divided,Coordinates(51.6305577, -0.8001325),
      'Adams Park',10137,1887,_country.england,65.7,[]];
    map[_name.york] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(53.98449, -1.052972250),
      'York Community Stadium',8500,1922,_country.england,63.4,[]];

    //ITALIA
    map[_name.atalanta] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.708889,9.680833),
      'Atleti Azzurri d\'Italia',21300,1907,_country.italy,80.3,[]];
    map[_name.bologna] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.49362,11.309719),
      'Renato Dall\'Ara',39444,1909,_country.italy,74.8,[]];
    map[_name.cagliari] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(39.199888888,9.137583333),
      'Unipol Domus',16416,1920,_country.italy,74.1,[]];
    map[_name.cremonese] = [ClubColors(Colors.red,Colors.grey),pattern.stripes3,Coordinates(45.140424475662854, 10.034943289585),
      'Estádio Giovanni Zini',16003,1913,_country.italy,72.0,[]];
    map[_name.empoli] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.726389,10.955),
      'Carlo Castellanni',19847,1920,_country.italy,73.4,[]];
    map[_name.fiorentina] = [ClubColors(Colors.purple,Colors.white),pattern.oneHorStripe,Coordinates(43.780822,11.282258),
      'Artemio Franchi',47282,1926,_country.italy,76.8,[]];
    map[_name.hellasVerona] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(45.435356,10.968647),
      'Marcantonio Bentegodi',39371,1903,_country.italy,75.5,[]];
    map[_name.inter] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(45.478055,9.123947),
      'Giuseppe Meazza',80018,1908,_country.italy,83.2,[_name.milan,_name.juventus]];
    map[_name.juventus] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(45.109594,7.641247),
      'Allianz Stadium',41507,1897,_country.italy,83.4,[_name.milan,_name.inter]];
    map[_name.milan] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(45.4786,9.1244),
      'Giuseppe Meazza',80018,1899,_country.italy,82.5,[_name.juventus,_name.inter]];
    map[_name.monza] = [ClubColors(Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(45.582778,9.308056),
      'Stadio Brianteo',18568,1912,_country.italy,70.7,[]];
    map[_name.lazio] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(41.933872,12.454714),
      'Stadio Olimpico',73261,1900,_country.italy,79.6,[_name.roma]];
    map[_name.lecce] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(40.3654579445129, 18.20937082941416),
      'Via del Mare',36285,1908,_country.italy,71.3,[]];
    map[_name.napoli] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(40.827967,14.193008),
      'Diego Armando Maradona',54726,1926,_country.italy,81.55,[_name.juventus]];
    map[_name.roma] = [ClubColors(grena,Colors.orange),pattern.solid,Coordinates(41.9339,12.454),
      'Stadio Olimpico',73261,1900,_country.italy,80.0,[_name.lazio]];
    map[_name.salernitana] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(40.64574181157901, 14.82401436498),
      'Arechi',38000,1919,_country.italy,73.8,[]];
    map[_name.sampdoria] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(44.4164,8.9524),
      'Luigi Ferraris',36600,1946,_country.italy,75.0,[_name.genoa]];
    map[_name.sassuolo] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(44.714722,10.649722),
      'MAPEI Stadium',23717,1920,_country.italy,75.7,[]];
    map[_name.spezia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.102222,9.808611),
      'Alberto Picco',11466,1906,_country.italy,72.2,[]];
    map[_name.torino] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(45.041667,7.65),
      'Olímpico Grande Torino',27994,1906,_country.italy,75.0,[]];
    map[_name.udinese] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(46.081603,13.200136),
      'Friuli',25000,1896,_country.italy,74.5,[]];

    map[_name.albinoleffe] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.sleeves,Coordinates(0,0),
      'Atleti Azzurri d\'Italia',26562,1998,_country.italy,62.5,[]];
    map[_name.alessandria] = [ClubColors(Colors.grey,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio Giuseppe Moccagatta',6000,1912,_country.italy,63.4,[]];
    map[_name.ancona] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio del Conero',26000,1905,_country.italy,62.7,[]];
    map[_name.arezzo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Città di Arezzo',13128,1923,_country.italy,57.7,[]];
    map[_name.ascoli] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(42.861111,13.594167),
      'Stadio Cino e Lillo Del Duca',20000,1898,_country.italy,73.7,[]];
    map[_name.avellino] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.92713726, 14.792281517),
      'Stadio Partenio',26308,1912,_country.italy,68.6,[]];
    map[_name.bari] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(41.084736,16.840072),
      'San Nicola',58270,1908,_country.italy,73.1,[]];
    map[_name.benevento] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(41.116691, 14.78177738),
      'Municipal Stadium Ciro Vigorito',17554,1929,_country.italy,70.7,[]];
    map[_name.brescia] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(45.570556,10.236944),
      'Estádio Mario Rigamonti',27592,1911,_country.italy,74.3,[]];
    map[_name.campobasso] = [ClubColors(darkblue,Colors.red),pattern.stripes3,Coordinates(0,0),
      '	Stadio Nuovo Romagnoli',25000,1919,_country.italy,56.7,[]];
    map[_name.carpi] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Stadio Sandro Cabassi',15500,1909,_country.italy,59.2,[]];
    map[_name.catania] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(37.515833,15.071389),
      'Angelo Massimino',26000,1946,_country.italy,70.4,[]];
    map[_name.cesena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.140556,12.261944),
      'Dino Manuzzi',23860,1940,_country.italy,68.2,[]];
    map[_name.cittadella] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(45.642930, 11.7809924),
      'Pier Cesare Tombolato',7623,1973,_country.italy,66.7,[]];
    map[_name.chievo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.435356,10.968647),
      'Estádio Marcantonio Bentegodi',39371,1929,_country.italy,65.8,[]];
    map[_name.como] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8142475, 9.07235),
      'Giuseppe Sinigaglia',13602,1907,_country.italy,70.0,[]];
    map[_name.cosenza] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(39.31004544, 16.23091),
      'Stadio San Vito-Gigi Marulla',24209,1929,_country.italy,69.8,[]];
    map[_name.crotone] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(39.079167,17.116667),
      'Ezio Scida',16547,1923,_country.italy,67.7,[]];
    map[_name.foggia] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(41.45503127, 15.542573),
      'Pino Zaccheria',25085,1920,_country.italy,71.2,[]];
    map[_name.frosinone] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(41.6349811, 13.32167292),
      'Benito Stirpe',16227,1906,_country.italy,72.2,[]];
    map[_name.genoa] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.416431,8.952428),
      'Luigi Ferraris',36600,1893,_country.italy,73.3,[_name.sampdoria]];
    map[_name.grosseto] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Carlo Zecchini',10200,1912,_country.italy,55.8,[]];
    map[_name.latina] = [ClubColors(Colors.black,darkblue),pattern.stripes3,Coordinates(0,0),
      'Domenico Francioni',8000,1945,_country.italy,58.9,[]];
    map[_name.lecco] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Estádio Rigamonti-Ceppi',5000,1912,_country.italy,60.3,[]];
    map[_name.legnano] = [ClubColors(Colors.purpleAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Giovanni Mari',5000,1913,_country.italy,51.7,[]];
    map[_name.livorno] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.52680444, 10.3144784728),
      'Stadio Armando Picchi',20000,1915,_country.italy,66.3,[]];
    map[_name.lucchese] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Porta Elisa',7400,1905,_country.italy,59.2,[]];
    map[_name.mantova] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(0,0),
      'Estádio Danilo Martelli',7100,1911,_country.italy,56.2,[]];
    map[_name.messina] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(44.65350542, 10.9231108),
      'Stadio San Filippo',38722,1947,_country.italy,64.5,[]];
    map[_name.modena] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Alberto Braglia',20500,1912,_country.italy,62.7,[]];
    map[_name.novara] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Silvio Piola',17875,1908,_country.italy,62.0,[]];
    map[_name.padova] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.43245775, 11.858382067),
      'Estádio Euganeo',32336,1910,_country.italy,63.1,[]];
    map[_name.palermo] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(38.152767,13.342275),
      'Renzo Barbera',36871,1900,_country.italy,69.8,[]];
    map[_name.parma] = [ClubColors(Colors.yellow,darkblue),pattern.dividedHor,Coordinates(44.794916666,10.338444444),
      'Ennio Tardini',22359,1913,_country.italy,72.8,[]];
    map[_name.perugia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.1064162086, 12.3574171183),
      'Estádio Renato Curi',23625,1905,_country.italy,73.1,[]];
    map[_name.pescara] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.4552707276, 14.229580317),
      'Adriático',24500,1936,_country.italy,69.9,[]];
    map[_name.piacenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.02977717, 9.690407817),
      'Leonardo Garilli',21608,1919,_country.italy,69.5,[]];
    map[_name.pisa] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(43.725629, 10.400910245),
      'Stadio Romeo Anconetani',17000,1909,_country.italy,74.6,[]];
    map[_name.pistoiese] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Marcello Melani',13000,1921,_country.italy,60.7,[]];
    map[_name.pordenone] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(45.957921, 12.648520),
      'Stadio Ottavio Bottecchia',3000,1928,_country.italy,72.7,[]];
    map[_name.potenza] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Stadio Alfredo Viviani',5500,1919,_country.italy,56.6,[]];
    map[_name.propatria] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Carlo Speroni',4627,1919,_country.italy,59.4,[]];
    map[_name.ravenna] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Bruno Benelli',4000,1913,_country.italy,55.5,[]];
    map[_name.reggina] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(38.0928237, 15.6357327),
      'Stadio Oreste',27763,1914,_country.italy,67.5,[]];
    map[_name.rimini] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stadio Romeo Neri',9768,1912,_country.italy,53.4,[]];
    map[_name.sambe] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Riviera delle Palme',15000,1923,_country.italy,60.2,[]];
    map[_name.siena] = [ClubColors(grena,Colors.white),pattern.stripes2,Coordinates(43.3218490, 11.32611057),
      'Artemio Franchi',15373,1901,_country.italy,68.6,[]];
    map[_name.spal] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(44.839722,11.6075),
      'Estádio Paolo Mazza',16751,1907,_country.italy,72.7,[]];
    map[_name.taranto] = [ClubColors(darkblue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Erasmo Iacovone',27584,1927,_country.italy,57.8,[]];
    map[_name.ternana] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(42.5621775, 12.635254),
      'Libero Liberati',22000,1925,_country.italy,66.5,[]];
    map[_name.trapani] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Polisportivo Provinciale',7750,1905,_country.italy,52.8,[]];
    map[_name.treviso] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Estádio Omobono Tenni',10000,1896,_country.italy,55.3,[]];
    map[_name.triestina] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Nereo Rocco',32454,1918,_country.italy,63.1,[]];
    map[_name.varese] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Franco Ossola',10000,1910,_country.italy,65.3,[]];
    map[_name.venezia] = [ClubColors(Colors.black,Colors.orange,Colors.green),pattern.solid,Coordinates(45.427761,12.363731),
      'Pierluigi Penzo',9977,1907,_country.italy,73.2,[]];
    map[_name.vicenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.544167,11.555556),
      'Estádio Romeo Menti',17163,1902,_country.italy,67.2,[]];
    map[_name.virtusentella] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Estádio Comunalle',4154,1914,_country.italy,62.4,[]];
    map[_name.virtuslanciano] = [ClubColors(Colors.black,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Guido Biondi',4678,1919,_country.italy,54.6,[]];

    //ESPANHA
    map[_name.almeria] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.84,-2.435278),
      'Estadio de los Juegos Mediterráneos',22000,1989,_country.spain,73.6,[]];
    map[_name.athleticbilbao] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(43.264205,-2.949369),
      'San Mamés',53289,1898,_country.spain,80.3,[_name.realsociedad]];
    map[_name.atleticomadrid] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(40.436111,-3.599444),
      'Wanda Metropolitano',67829,1903,_country.spain,83.5,[_name.realmadrid]];
    map[_name.barcelona] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(41.380833,2.1225),
      'Camp Nou',99354,1899,_country.spain,84.3,[_name.realmadrid]];
    map[_name.cadiz] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(36.50274029685163, -6.272703671625995),
      'Estadio Ramón de Carranza',20724,1910,_country.spain,75.6,[]];
    map[_name.celtavigo] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(42.211861,-8.740328),
      'Balaídos',29000,1923,_country.spain,77.3,[]];
    map[_name.elche] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(38.266944,-0.663333),
      'Martínez Valero',31388,1922,_country.spain,75.0,[]];
    map[_name.espanyol] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(41.347861,2.075667),
      'Cornellà-El Prat',40500,1900,_country.spain,78.0,[]];
    map[_name.getafe] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(40.325556,-3.714722),
      'Coliseum Alfonso Pérez',17700,1983,_country.spain,76.2,[]];
    map[_name.girona] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(41.961560623544194, 2.8289012665501416),
      'Estádio Montilivi',13500,1930,_country.spain,72.55,[]];
    map[_name.levante] = [ClubColors(grena,Colors.blue),pattern.stripes2,Coordinates(39.494722,-0.364167),
      '	Ciutat de Valencia',25534,1909,_country.spain,76.5,[_name.valencia]];
    map[_name.mallorca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(39.59,2.63),
      'Iberostar Estádio',23142,1916,_country.spain,74.1,[]];
    map[_name.osasuna] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(42.796667,-1.636944),
      'Reyno de Navarra',19800,1920,_country.spain,76.3,[]];
    map[_name.rayoVallecano] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(40.391944,-3.658961),
      'Vallecas Campo de Futebol',15105,1924,_country.spain,75.0,[]];
    map[_name.realbetis] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.356403,-5.981611),
      'Benito Villamarín',60720,1907,_country.spain,79.6,[_name.sevilla]];
    map[_name.realmadrid] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(40.45306,-3.68835),
      'Santiago Bernabeu',81044,1902,_country.spain,86.0,[_name.barcelona,_name.atleticomadrid]];
    map[_name.realsociedad] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.301378,-1.973617),
      'Anoeta',39500,1909,_country.spain,80.5,[_name.athleticbilbao]];
    map[_name.sevilla] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.383878,-5.970467),
      'Ramón Sánchez Pizjuán',43883,1890,_country.spain,82.0,[_name.realbetis]];
    map[_name.valladolid] = [ClubColors(Colors.purple,Colors.white),pattern.stripes2,Coordinates(41.644444,-4.761111),
      'José Zorrilla',26512,1928,_country.spain,74.2,[]];
    map[_name.valencia] = [ClubColors(Colors.white,Colors.orange),pattern.solid2,Coordinates(39.474722,-0.358333),
      'Mestalla',48600,1919,_country.spain,78.7,[]];
    map[_name.villareal] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(39.944167,-0.103611),
      'La Cerámica',23500,1923,_country.spain,81.2,[]];

    map[_name.alaves] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(42.837224, -2.68794204),
      'Mendizorroza',19840,1921,_country.spain,75.9,[]];
    map[_name.albacete] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(38.9812011, -1.851626737),
      'Carlos Belmonte',17300,1940,_country.spain,67.6,[]];
    map[_name.alcorcon] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(40.33883725, -3.84051384),
      'Municipal de Santo Domingo',6000,1971,_country.spain,65.1,[]];
    map[_name.barcelonaB] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(41.37443652, 2.050680580),
      'Estadi Johan Cruyff',6000,1970,_country.spain,67.8,[]];
    map[_name.badajoz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.8590980, -7.005712641),
      'Nuevo Vivero',14898,1905,_country.spain,60.7,[]];
    map[_name.barakaldo] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes4,Coordinates(0,0),
      'Lasesarre',7960,1917,_country.spain,55.6,[]];
    map[_name.athleticbilbaoB] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Instalaciones de Lezama',1500,1964,_country.spain,62.6,[]];
    map[_name.burgos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.344459, -3.680311585),
      'Estádio Municipal de El Plantío',12200,1994,_country.spain,68.6,[]];
    map[_name.cartagena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.609976073, -0.996185027),
      'Estádio Cartagonova',15105,1995,_country.spain,61.0,[]];
    map[_name.castellon] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(39.9962101, -0.038633183),
      'El Nou Estadi Castalia',12500,1922,_country.spain,62.9,[]];
    map[_name.ciudadmurcia] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(0,0),
      'José Barnés',2500,2010,_country.spain,56.4,[]];
    map[_name.compostela] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.88266376, -8.51672248),
      'Vero Boquete',13000,1962,_country.spain,61.7,[]];
    map[_name.cordoba] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.872294,-4.764642),
      'Estadio Nuevo Arcángel',25100,1954,_country.spain,68.5,[]];
    map[_name.culturalleonesa] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio Reino de León',48600,1923,_country.spain,65.3,[]];
    map[_name.eibar] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(43.181937, -2.475632),
      'Municipal de Ipurua',8164,1940,_country.spain,73.8,[]];
    map[_name.extremadura] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Francisco de la Hera',11580,1924,_country.spain,65.4,[]];
    map[_name.ferrol] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal de A Malata',12042,1919,_country.spain,60.6,[]];
    map[_name.figueres] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Vilatenim',9472,1919,_country.spain,57.1,[]];
    map[_name.fuenlabrada] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Fernando Torres',7500,1975,_country.spain,63.5,[]];
    map[_name.tarragona] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.19020153, 2.4763709658),
      'Nou Estadi',14500,1886,_country.spain,66.1,[]];
    map[_name.granada] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(37.152967,-3.595736),
      'Nuevo Los Cármenes',22524,1931,_country.spain,78.4,[]];
    map[_name.hercules] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(38.3580625, -0.4914326032),
      'José Rico Pérez',29500,1922,_country.spain,70.4,[]];
    map[_name.huelva] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(37.24660814, -6.9540283),
      'Estadio Nuevo Colombino',21670,1889,_country.spain,68.8,[]];
    map[_name.huesca] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(42.131944,-0.424444),
      'Estádio El Alcoraz',8000,1960,_country.spain,69.4,[]];
    map[_name.ibiza] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(38.913791833, 1.415050),
      'Estádio Municipal de Can Misses',4500,2015,_country.spain,68.5,[]];
    map[_name.jaen] = [ClubColors(Colors.white,Colors.purple),pattern.oneHorStripe,Coordinates(0,0),
      'Nuevo La Victoria',12569,1929,_country.spain,57.3,[]];
    map[_name.lacoruna] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.368667,-8.417372),
      'Municipal de Riazor',35600,1906,_country.spain,69.8,[]];
    map[_name.lasPalmas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(28.1,-15.456667),
      'Estádio Gran Canaria',31250,1949,_country.spain,71.1,[]];
    map[_name.leganes] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(40.3406935, -3.7602580),
      'Municipal de Butarque',10958,1928,_country.spain,70.2,[]];
    map[_name.lleida] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(41.62148448, 0.61420973),
      'Camp d´Esports',13500,1939,_country.spain,62.8,[]];
    map[_name.logrones] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(42.45328234, -2.453517217),
      'Estadio Las Gaunas',16000,1940,_country.spain,63.2,[]];
    map[_name.lugo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(43.003350, -7.57097154),
      'Anxo Carro',7070,1953,_country.spain,66.1,[]];
    map[_name.malaga] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(36.734092,-4.426422),
      'La Rosaleda',30044,1948,_country.spain,70.0,[]];
    map[_name.merida] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.9144846, -6.33649039),
      'Estadio Romano',14600,1912,_country.spain,63.6,[]];
    map[_name.mirandes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.6809190, -2.93530024),
      'Municipal de Anduva',6000,1927,_country.spain,62.5,[]];
    map[_name.murcia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.0424994, -1.14406194),
      'Nueva Condomina',33900,1908,_country.spain,65.3,[]];
    map[_name.numancia] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.754444,-2.467778),
      'Nuevo Estadio Los Pajaritos',9025,1945,_country.spain,66.7,[]];
    map[_name.ponferradina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.5574263, -6.599923),
      'El Toralín',8200,1922,_country.spain,68.7,[]];
    map[_name.pontevedra] = [ClubColors(vinho,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Estádio Municipal de Pasarón',12000,1941,_country.spain,62.4,[]];
    map[_name.realmadridB] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(40.477060, -3.61423761),
      'Estádio Alfredo Di Stéfano',12000,1930,_country.spain,68.0,[]];
    map[_name.reus] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Camp Nou Municipal',4300,1909,_country.spain,60.2,[]];
    map[_name.salamanca] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.995500, -5.664743645),
      'El Helmántico',17341,2013,_country.spain,60.2,[]];
    map[_name.sanandres] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1988,_country.spain,50.3,[]];
    map[_name.sportingGijon] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.536111,-5.637222),
      'El Molinón',30000,1905,_country.spain,71.0,[]];
    map[_name.tenerife] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(28.463192602, -16.2608979),
      'Heliodoro López',24000,1912,_country.spain,71.0,[]];
    map[_name.toledo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(39.86914546, -4.0182605),
      'Salto del Caballo',5500,1928,_country.spain,58.6,[]];
    map[_name.racingSantander] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(43.476370, -3.7933152),
      'Estádio El Sardinero',22400,1913,_country.spain,67.5,[]];
    map[_name.realOviedo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.3608751, -5.86979084),
      'Novo Estádio Carlos Tartiere',30500,1926,_country.spain,68.2,[]];
    map[_name.sabadell] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(41.5546512, 2.09199163),
      'Nova Creu Alta',11908,1903,_country.spain,61.7,[]];
    map[_name.sestao] = [ClubColors(Colors.black,Colors.green),pattern.stripes3,Coordinates(0,0),
      'Las Llanas',8905,1916,_country.spain,56.3,[]];
    map[_name.xerez] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(36.6896000, -6.1198111),
      'Estadio de Chapín',20523,1947,_country.spain,64.7,[]];
    map[_name.zaragoza] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.636592,-0.901822),
      'La Romareda',34596,1932,_country.spain,70.6,[]];

    //ALEMANHA
    map[_name.augsburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.32333464205292, 10.886761848412458),
      'SGL Arena',30660,1907,_country.germany,73.6,[]];
    map[_name.leverkusen] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(51.038255555,7.002205555),
      'BayArena',30210,1904,_country.germany,80.4,[]];
    map[_name.bayernmunique] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.218775,11.624752777),
      'Allianz Arena',75024,1900,_country.germany,85.2,[]];
    map[_name.bochum] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.489944,7.236489),
      'Vonovia Ruhrstadion',27599,1848,_country.germany,72.9,[]];
    map[_name.dortmund] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.4925,7.451667),
      'Signal Iduna Park',81359,1909,_country.germany,82.5,[_name.schalke04]];
    map[_name.moenchengladbach] = [ClubColors(Colors.white,Colors.green,Colors.black),pattern.solid,Coordinates(51.174583333,6.385463888),
      'Borussia-Park',54022,1900,_country.germany,79.6,[]];
    map[_name.colonia] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.933611,6.875),
      'RheinEnergieStadion',50000,1948,_country.germany,75.4,[]];
    map[_name.eintrachtfrankfurt] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.068611,8.645278),
      'Deutsche Bank Park',51500,1899,_country.germany,78.5,[]];
    map[_name.freiburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.988889,7.893056),
      'Europa-Park Stadion',34700,1904,_country.germany,76.5,[]];
    map[_name.herthaberlim] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(52.514722222,13.239444444),
      'Olímpico de Berlim',74649,1892,_country.germany,75.5,[]];
    map[_name.hoffenheim] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.239,8.888278),
      'Rhein-Neckar-Arena',30150,1899,_country.germany,78.1,[]];
    map[_name.mainz05] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.984167,8.224167),
      'Opel Arena',34034,1905,_country.germany,75.55,[]];
    map[_name.rbleipzig] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.345833,12.348056),
      'Red Bull Arena',42146,2009,_country.germany,81.8,[]];
    map[_name.schalke04] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.554502777,7.067588888),
      'Veltins-Arena',62271,1904,_country.germany,74.6,[_name.dortmund]];
    map[_name.stuttgart] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(48.792222,9.231944),
      'Mercedes-Benz Arena',60441,1893,_country.germany,75.6,[]];
    map[_name.unionBerlin] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.457222,13.568056),
      'An der Alten Försterei',22012,1966,_country.germany,74.2,[]];
    map[_name.werderbremen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.066389,8.8375),
      'Wohninvest Weserstadion',42100,1899,_country.germany,73.1,[]];
    map[_name.wolfsburg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.431944,10.803889),
      'Volkswagen Arena',30000,1945,_country.germany,78.5,[]];

    map[_name.aachen] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(50.7933333,6.09722222),
      'New Tivoli',32960,1900,_country.germany,65.8,[]];
    map[_name.arminiaBiefeld] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(52.031389,8.516944),
      'Bielefelder Alm',27300,1905,_country.germany,73.3,[]];
    map[_name.berliner] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.54062157, 13.4768246),
      'Dynamo-Sportforum',10000,1953,_country.germany,61.6,[]];
    map[_name.brieske] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Elsterkampfbahn',6000,1919,_country.germany,48.0,[]];
    map[_name.carlzeissjena] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(50.9160646, 11.582811),
      'Ernst-Abbe-Sportfeld',13000,1903,_country.germany,63.4,[]];
    map[_name.chemnitzer] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(50.842245, 12.945568),
      'Stadion an der Gellertstraße',15200,1966,_country.germany,61.2,[]];
    map[_name.darmstadt] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.85781666, 8.672877134887),
      'Merck-Stadion am Böllenfalltor',17000,1898,_country.germany,70.1,[]];
    map[_name.duisburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.409028,6.778639),
      'MSV-Arena',31500,1902,_country.germany,66.8,[]];
    map[_name.dynamoDresden] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.040278,13.747778),
      'DDV-Stadion',32066,1953,_country.germany,68.2,[]];
    map[_name.braunschweiger] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(52.29,10.521389),
      'Eintracht-Stadion',23325,1895,_country.germany,69.3,[]];
    map[_name.energieCottbus] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.751389,14.345556),
      'Stadion der Freundschaft',25450,1966,_country.germany,66.5,[]];
    map[_name.erzgebirgeaue] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(50.5975,12.711111),
      'Erzgebirgsstadion',15711,1946,_country.germany,64.3,[]];
    map[_name.fortunaDusseldorf] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.261539,6.733083),
      'Merkur Spielarena',54600,1895,_country.germany,70.8,[]];
    map[_name.frankfurt1] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(51.75182257, 14.34562709),
      'Stadion der Freundschaft',12000,1951,_country.germany,58.7,[]];
    map[_name.greutherFurth] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(49.4870762463, 11.0000170),
      'Stadion am Laubenweg',15500,1903,_country.germany,69.6,[]];
    map[_name.hallescher] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Leuna Chemie Stadion',15057,1966,_country.germany,61.2,[]];
    map[_name.hamburgo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(53.5872273, 9.89854),
      'Volksparkstadion',57000,1887,_country.germany,71.9,[]];
    map[_name.hannover96] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(52.3601348913, 9.73151458536),
      'HDI-Arena',49000,1896,_country.germany,69.6,[]];
    map[_name.hansaRostock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.08495,12.095188888),
      'Ostseestadion',29000,1965,_country.germany,67.1,[]];
    map[_name.heidenheim] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(48.66851956, 10.13918217),
      'Voith-Arena',15000,1911,_country.germany,62.0,[]];
    map[_name.holsteinkiel] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.349072, 10.12361715),
      'Holstein-Stadion',15034,1900,_country.germany,60.6,[]];
    map[_name.ingolstadt] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.745434, 11.485777),
      'Audi-Sportpark',15445,2004,_country.germany,64.3,[]];
    map[_name.jahnregensburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.99090071, 12.1074654),
      'Jahnstadion Regensburg',15210,1907,_country.germany,64.1,[]];
    map[_name.kaiserslautern] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.43448525, 7.77761161),
      'Fritz Walter',49850,1900,_country.germany,66.9,[]];
    map[_name.karlsruher] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.02,8.41305555),
      'Wildparkstadion',32306,1894,_country.germany,63.5,[]];
    map[_name.kickersOffenbach] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Sparda Bank Hessen Stadium',20500,1901,_country.germany,59.6,[]];
    map[_name.lokleipzig] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.3029417, 12.4192716),
      'Bruno-Plache-Stadion',15600,1893,_country.germany,62.9,[]];
    map[_name.magdeburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.1254076, 11.6705710),
      'MDCC-Arena',30098,1965,_country.germany,64.8,[]];
    map[_name.munique1860] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(48.110833,11.574444),
      'Grünwalder Stadion',15000,1860,_country.germany,70.6,[]];
    map[_name.neunkirchen] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Ellenfeldstadion',23000,1905,_country.germany,55.6,[]];
    map[_name.nurnberg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.42632233, 11.126222),
      'Max-Morlock-Stadion',49923,1900,_country.germany,70.4,[]];
    map[_name.paderborn] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.731389,8.710833),
      'Benteler-Arena',15000,1907,_country.germany,69.6,[]];
    map[_name.preubenmunster] = [ClubColors(darkgreen,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Preussenstadion',15050,1906,_country.germany,56.2,[]];
    map[_name.rotWeissEssen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.4867758, 6.9768),
      'Georg-Melches-Stadion',22500,1907,_country.germany,61.7,[]];
    map[_name.erfurt] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Steigerwaldstadion',18611,1966,_country.germany,61.5,[]];
    map[_name.sachsenleipzig] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[]];
    map[_name.sandhausen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.3322165, 8.647684677),
      'BWT-Stadion am Hardtwald',16003,1916,_country.germany,60.8,[]];
    map[_name.saarbrucken] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(49.2475,6.984167),
      'Ludwigsparkstadion',15414,1903,_country.germany,63.6,[]];
    map[_name.stutKickers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Gazi-Stadion auf der Waldau',11436,1899,_country.germany,60.3,[]];
    map[_name.stPauli] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(53.554444,9.967778),
      'Millerntor-Stadion',29546,1910,_country.germany,70.4,[]];
    map[_name.tasmania] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Sportpark Neukölln',0,1900,_country.germany,56.5,[]];
    map[_name.uerdigen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.339167,6.603611),
      'Grotenburg-Stadion',34500,1905,_country.germany,62.0,[]];
    map[_name.vorwarts] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.germany,50.0,[]];
    map[_name.waldhofMannheim] = [ClubColors(Colors.blue,Colors.black,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Carl-Benz-Stadium',27500,1907,_country.germany,50.0,[]];
    map[_name.zwickau] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Westsachsenstadion',14200,1966,_country.germany,58.6,[]];


    map[_name.brandenburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion Am Quenz',15500,1950,_country.germany,53.4,[]];
    map[_name.dresdner] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Heinz-Steyer-Stadion',5000,1898,_country.germany,56.4,[]];
    map[_name.stahlriesa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Nudelarena',4000,1903,_country.germany,51.4,[]];

    //FRANÇA
    map[_name.ajaccio] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.931255913, 8.777428344),
      'François Coty',12000,1910,_country.france,68.6,[]];
    map[_name.angers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(47.4606232855, -0.5314198073),
      'Stade Jean-Bouin',18752,1919,_country.france,74.1,[]];
    map[_name.auxerre] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid2,Coordinates(47.78717964, 3.5894887694),
      'Stade l\'Abbé-Deschamps',23467,1905,_country.france,69.5,[]];
    map[_name.bordeaux] = [ClubColors(darkblue,Colors.white),pattern.oneHorStripe,Coordinates(44.8974722523, -0.561285887),
      'Matmut Atlantique',42052,1881,_country.france,73.2,[]];
    map[_name.brest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.402932,-4.461694),
      'Stade Francis-Le Blé',15000,1950,_country.france,74.2,[]];
    map[_name.clermont] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(45.81592183512457, 3.1208739),
      'Stade Gabriel-Montpied',10607,1990,_country.france,72.4,[]];
    map[_name.lens] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonal,Coordinates(50.43300186, 2.81536255633),
      'Félix Bollaert',41229,1906,_country.france,75.6,[]];
    map[_name.lille] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(50.611944,3.130556),
      'Pierre-Mauroy',50186,1944,_country.france,77.6,[]];
    map[_name.lorient] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(47.74833585, -3.36818605),
      'Stade du Moustoir',18500,1926,_country.france,50.0,[]];
    map[_name.lyon] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.stripeCrest,Coordinates(45.765224,4.982131),
      'Parc Olympique Lyonnais',59186,1950,_country.france,78.9,[]];
    map[_name.monaco] = [ClubColors(Colors.red,Colors.white),pattern.monaco,Coordinates(43.727615426, 7.415587736),
      'Louis II',18523,1924,_country.france,78.2,[]];
    map[_name.montpellier] = [ClubColors(darkblue,Colors.orange),pattern.horStripesThin,Coordinates(43.269722222,5.395833333),
      'Stade de la Mosson',32939,1919,_country.france,75.8,[_name.nimes]];
    map[_name.nantes] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(47.25625627, -1.524267292),
      'Stade de la Beaujoire',37463,1943,_country.france,75.6,[]];
    map[_name.nice] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(43.705138888,7.192583333),
      'Allianz Riviera',35624,1904,_country.france,77.5,[]];
    map[_name.om] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(43.26998307, 5.3962199073),
      'Vélodrome',67395,1899,_country.france,78.4,[_name.psg]];
    map[_name.psg] = [ClubColors(darkblue,Colors.red),pattern.oneVertStripe,Coordinates(48.8413888,2.2530555),
      'Parc des Princes',48583,1970,_country.france,86.5,[_name.om]];
    map[_name.reims] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.246667,4.025),
      'Auguste Delaune',21668,1931,_country.france,74.3,[]];
    map[_name.rennes] = [ClubColors(Colors.red,Colors.black),pattern.solid2,Coordinates(48.107472222,-1.712861111),
      'Roazhon Park',29778,1901,_country.france,78.1,[]];
    map[_name.strasbourg] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.560064,7.754969),
      'Stade de la Meinau',26109,1906,_country.france,76.0,[]];
    map[_name.toulouse] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(43.583296,1.434055),
      'Stade de Toulouse',35500,1937,_country.france,70.0,[]];
    map[_name.troyes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(48.30766856, 4.0987888),
      'Stade de l\'Aube',20400,1900,_country.france,72.5,[]];

    map[_name.amiens] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.89432771, 2.26331715),
      'Stade de la Licorne',12097,1901,_country.france,67.4,[]];
    map[_name.angouleme] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Lebon',6500,1920,_country.france,57.6,[]];
    map[_name.annecy] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(45.9165575, 6.1180684),
      'Parc des Sports',15714,1927,_country.france,65.1,[]];
    map[_name.bastia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6514,9.442619),
      'Stade Armand Cesari',16500,1905,_country.france,68.6,[]];
    map[_name.caen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.17955728, -0.3960764),
      'Michel d\'Ornano',21500,1913,_country.france,68.7,[]];
    map[_name.cannes] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.55317462, 6.964876416),
      'Pierre de Coubertin',17500,1909,_country.france,63.6,[]];
    map[_name.chamois] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.3170594, -0.48961761),
      'Stade René-Gaillard',10898,1919,_country.france,66.4,[]];
    map[_name.dijon] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.3249340, 5.06840377),
      'Stade Gaston-Gérard',16000,1998,_country.france,69.3,[]];
    map[_name.evian] = [ClubColors(Colors.purpleAccent,Colors.white),pattern.dividedHor,Coordinates(45.9160, 6.11834259),
      'Parc des Sports',15660,2007,_country.france,62.6,[]];
    map[_name.grenoble] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.1875313, 5.740180234),
      'Stade des Alpes',20062,1892,_country.france,62.4,[]];
    map[_name.guingamp] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.56549284, -3.1643878),
      'Stade du Roudourou',18256,1912,_country.france,65.6,[]];
    map[_name.lavallois] = [ClubColors(Colors.orange,Colors.orange),pattern.solid,Coordinates(48.082332, -0.754686),
      'Stade Francis-Le-Basser',18739,1902,_country.france,58.6,[]];
    map[_name.lehavre] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.4988613, 0.1698838),
      'Stade Océane',25178,1872,_country.france,63.1,[]];
    map[_name.lemans] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(47.95919009, 0.223153075),
      'MMArena',17500,1985,_country.france,64.6,[]];
    map[_name.metz] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(49.11020796, 6.1603276020),
      'Stade Saint-Symphorien',26700,1919,_country.france,73.5,[]];
    map[_name.nancy] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.6955,6.210687),
      'Stade Marcel Picot',20085,1967,_country.france,66.6,[]];
    map[_name.nimes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.8161358, 4.359880),
      'Stade des Costières',18482,1937,_country.france,70.5,[_name.montpellier]];
    map[_name.orleans] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.8406476, 1.9414294),
      'Stade de la Source',8000,1902,_country.france,66.9,[]];
    map[_name.parisFC] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.818611,2.346667),
      'Stade Sébastien Charléty',20000,1969,_country.france,68.5,[]];
    map[_name.pau] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(43.309443, -0.3169603),
      'Stade du Hameau',13966,1920,_country.france,60.0,[]];
    map[_name.quevilly] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(49.427630, 1.0512107),
      'Amable Lozai',2500,1902,_country.france,60.4,[]];
    map[_name.racingParis] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(0,0),
      'Stade Yves-du-Manoir',7000,1882,_country.france,56.4,[]];
    map[_name.redstar] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(48.90659978, 2.34197952),
      'Stade Bauer',10000,1897,_country.france,64.6,[]];
    map[_name.rodez] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(44.351570, 2.5637119),
      'Stade Paul-Lignon',5955,1929,_country.france,62.7,[]];
    map[_name.rouen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(49.41143361, 1.07069394),
      'Stade Robert Diochon',12018,1899,_country.france,60.6,[]];
    map[_name.saintetienne] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(45.460833,4.39),
      'Geoffroy-Guichard',42000,1919,_country.france,73.5,[]];
    map[_name.sedan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(49.69404732, 4.93880095),
      'Stade Louis Dugauguez',23189,1919,_country.france,63.2,[]];
    map[_name.sochaux] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.512403,6.811094),
      'Auguste Bonal',20005,1928,_country.france,66.3,[]];
    map[_name.stadeFrancais] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Centre sportif du Haras Lupin',0,1900,_country.france,50.0,[]]; //ESTINTO 1990
    map[_name.toulon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.126298, 5.9023646),
      'Stade de Bon Rencontre',8000,1944,_country.france,60.4,[]];
    map[_name.valenciennes] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(50.3490100, 3.5325451),
      'Stade du Hainaut',25172,1913,_country.france,61.3,[]];
    map[_name.vendee] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Stade Massabielle',5000,1919,_country.france,56.3,[]];
    map[_name.villefranche] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.00, 4.7073536),
      'Stade Armand Chouffet',5000,1927,_country.france,58.6,[]];

    //PORTUGAL
    map[_name.benfica] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.75301495, -9.1844710),
      'Estádio da Luz',64642,1904,_country.portugal,79.5,[_name.porto,_name.sporting]];
    map[_name.porto] = [ClubColors(Colors.blueAccent,Colors.white),pattern.stripes2,Coordinates(41.161758,-8.583933),
      'Estádio do Dragão',50035,1893,_country.portugal,78.9,[_name.benfica,_name.sporting]];
    map[_name.sporting] = [ClubColors(darkgreen,Colors.white),pattern.horStripes4,Coordinates(38.76119444,-9.16078333),
      'José Alvalade',50095,1906,_country.portugal,78.6,[_name.porto,_name.benfica]];
    map[_name.alverca] = [ClubColors(grena,darkblue),pattern.stripes2,Coordinates(38.897982, -9.0350067),
      'Alverca do Ribatejo',7705,1939,_country.portugal,60.6,[]];
    map[_name.arouca] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(40.933557625, -8.249067289),
      'Estádio Municipal de Arouca',5000,1952,_country.portugal,65.6,[]];
    map[_name.aves] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio do Clube Desportivo das Aves',8560,1930,_country.portugal,61.6,[]];
    map[_name.atleticoPT] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(0,0),
      'Estádio da Tapadinha',4000,1942,_country.portugal,57.7,[]];
    map[_name.barreirense] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Campo da Verderena',1500,1911,_country.portugal,57.8,[]];
    map[_name.beiramar] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.6478986, -8.593620),
      'Municipal de Aveiro',32830,1923,_country.portugal,62.8,[]];
    map[_name.braga] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(41.56272876, -8.429015524),
      'Municipal de Braga',30286,1921,_country.portugal,75.3,[_name.vitoriaguimaraes]];
    map[_name.boavista] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(41.162222,-8.64277777),
      'Estádio do Bessa Século XXI',28263,1903,_country.portugal,71.4,[]];
    map[_name.belenenses] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.702778,-9.207778),
      'Estádio do Restelo',32000,1919,_country.portugal,68.3,[]];
    map[_name.casapia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(38.73764642, -9.20340044),
      'Estádio Pina Manique',5000,1920,_country.portugal,67.7,[]];
    map[_name.chaves] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(41.75094886, -7.464533445),
      'Estádio Municipal de Chaves',9000,1949,_country.portugal,67.5,[]];
    map[_name.coimbra] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.2035513, -8.406711275),
      'Estádio Cidade de Coimbra',29622,1887,_country.portugal,68.1,[]];
    map[_name.covilha] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.2828334, -7.5122373),
      'Municipal José Santos Pinto',3500,1923,_country.portugal,66.4,[]];
    map[_name.cuf] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Alfredo da Silva',21498,1937,_country.portugal,54.2,[]];
    map[_name.espinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0021047, -8.64512619),
      'Estádio Comendador Manuel',7500,1914,_country.portugal,62.6,[]];
    map[_name.estoril] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(38.7153065, -9.40573817),
      'António Coimbra da Mota',8000,1939,_country.portugal,66.8,[]];
    map[_name.estrelaamadora] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(38.75216476, -9.22726611),
      'Estádio José Gomes',9288,1932,_country.portugal,64.5,[]];
    map[_name.evora] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Campo Estrela',10000,1911,_country.portugal,56.7,[]];
    map[_name.famalicao] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(41.4016829, -8.52243319),
      'Estádio Municipal de Famalicão',5307,1931,_country.portugal,71.2,[]];
    map[_name.farense] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.02232811, -7.928202),
      'Estádio de São Luís',7000,1910,_country.portugal,61.6,[]];
    map[_name.feirense] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.926660, -8.545820),
      'Marcolino de Castro',5600,1918,_country.portugal,63.5,[]];
    map[_name.gilVicente] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.533888888,-8.611111111),
      'Estádio Cidade de Barcelos',12046,1924,_country.portugal,71.0,[]];
    map[_name.leixoes] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(41.1842451364265, -8.666396418),
      'Estádio do Mar',9821,1907,_country.portugal,66.5,[]];
    map[_name.mafra] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-26.1286357, -49.80125986),
      'Municipal de Mafra',1257,1965,_country.portugal,63.5,[]];
    map[_name.maritimo] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(32.645561,-16.928331),
      'Estádio dos Barreiros',10932,1910,_country.portugal,71.1,[]];
    map[_name.moreirense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3782047, -8.3542469),
      'Comendador Joaquim de Almeida Freitas',6153,1938,_country.portugal,69.8,[]];
    map[_name.nacionalMadeira] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.670625,-16.883525),
      'Estádio da Madeira',5500,1910,_country.portugal,66.7,[]];
    map[_name.naval] = [ClubColors(Colors.green,Colors.white),pattern.horStripes2,Coordinates(40.162827, -8.85902270),
      'José Bento Pessoa',9000,1893,_country.portugal,59.3,[]];
    map[_name.pacosDeFerreira] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(41.27144668, -8.38488781),
      'Capital do Móvel',9077,1950,_country.portugal,68.2,[]];
    map[_name.penafiel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.211768, -8.27777600),
      'Estádio Municipal 25 de Abril',5300,1951,_country.portugal,65.1,[]];
    map[_name.portimonense] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.13588, -8.540001),
      'Estádio Municipal de Portimão',6000,1914,_country.portugal,70.9,[]];
    map[_name.olhanense] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(37.029370, -7.84837313),
      'Estádio José Arcanjo',10080,1912,_country.portugal,60.4,[]];
    map[_name.oriental] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Engº Carlos Salema',5000,1946,_country.portugal,53.1,[]];
    map[_name.rioAve] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3628257, -8.73965321),
      'Estádio dos Arcos',5000,1939,_country.portugal,67.8,[]];
    map[_name.salgueiros] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.15904746, -8.572435608),
      'Complexo Desportivo de Campanhã',1500,1911,_country.portugal,58.7,[]];
    map[_name.santaClara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(37.76392847, -25.622288584),
      'Estádio de São Miguel',10000,1927,_country.portugal,67.5,[]];
    map[_name.leiria] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(39.74945449, -8.81260997427),
      'Estádio Dr. Magalhães Pessoa',25000,1966,_country.portugal,63.0,[]];
    map[_name.tirsense] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Estádio Abel Alves de Figueiredo',15000,1938,_country.portugal,53.7,[]];
    map[_name.tondela] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(40.51203795, -8.082878165),
      'Estádio João Cardoso',5000,1933,_country.portugal,64.6,[]];
    map[_name.torreense] = [ClubColors(vinho,darkblue),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio Manuel Marques',12000,1917,_country.portugal,54.8,[]];
    map[_name.tomar] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripes2,Coordinates(40.659553216, -7.9003969788),
      'Estádio Municipal de Tomar',500,1914,_country.portugal,49.4,[]];
    map[_name.varzim] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.3879700136, -8.771977516024036),
      'Estádio do Varzim Sport Club',7280,1915,_country.portugal,61.5,[]];
    map[_name.vilafranquense] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(38.94535, -8.99430208),
      'Campo do Cevadeiro',2500,1957,_country.portugal,57.4,[]];
    map[_name.viseu] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.659553216, -7.9003969788),
      'Estádio do Fontelo',6912,1914,_country.portugal,67.8,[]];
    map[_name.vizela] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.38882478, -8.306887911),
      'Estádio do Futebol Clube de Vizela',6000,1939,_country.portugal,66.1,[]];
    map[_name.vitoriaguimaraes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.446135622, -8.300460355),
      'D. Afonso Henriques',30146,1922,_country.portugal,72.7,[_name.braga]];
    map[_name.setubal] = [ClubColors(Colors.white,Colors.green),pattern.stripes2,Coordinates(38.53138889,-8.891111),
      'Estádio do Bonfim',21530,1910,_country.portugal,69.6,[]];

    //HOLANDA
    map[_name.ajax] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(52.3141666,4.9419444),
      'Johan Cruijff Arena',54990,1900,_country.netherlands,81.1,[_name.psv,_name.feyenoord]];
    map[_name.feyenoord] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(51.89389444,4.52325277),
      'De Kuip',51577,1908,_country.netherlands,77.2,[_name.psv,_name.ajax]];
    map[_name.psv] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.4418878, 5.46784477),
      'Philips Stadion',35000,1912,_country.netherlands,78.2,[_name.ajax,_name.feyenoord]];
    map[_name.az] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.6130966, 4.742401887),
      'AFAS Stadium',17023,1967,_country.netherlands,74.2,[]];
    map[_name.blauwwit] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Sportpark Sloten',2000,1902,_country.netherlands,50.0,[]]; //EXTINTO 2015
    map[_name.cambuur] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(53.2055474, 5.8145969),
      'Cambuur Stadion',10000,1964,_country.netherlands,64.6,[]];
    map[_name.denhaag] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.0628811, 4.383067425),
      'Estádio Cars Jeans',15000,1905,_country.netherlands,68.6,[]];
    map[_name.denbosch] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'de Vliert',8500,1965,_country.netherlands,61.2,[]];
    map[_name.emmen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(52.77479885, 6.9456866),
      'Univé Stadion',8700,1925,_country.netherlands,65.5,[]];
    map[_name.excelsior] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(51.9170728, 4.520500),
      'Stadion Woudestein',3531,1902,_country.netherlands,64.4,[]];
    map[_name.fortunasittard] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(50.9919321, 5.8437577),
      'Wagner & Partners Stadion',12500,1968,_country.netherlands,68.0,[]];
    map[_name.goaheadeagles] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.2604448, 6.1726971),
      'De Adelaarshorst',10500,1902,_country.netherlands,67.6,[]];
    map[_name.groningen] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(53.2062203, 6.59170906),
      'Euroborg',22329,1915,_country.netherlands,70.6,[]];
    map[_name.haarlem] = [ClubColors(Colors.blue,Colors.red),pattern.sleeves,Coordinates(0,0),
      'Haarlem Stadion',3442,1889,_country.netherlands,50.0,[]]; //EXTINTO 2010
    map[_name.heerenveen] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(52.9588595, 5.93625977),
      'Abe Lenstra',12080,1920,_country.netherlands,69.1,[]];
    map[_name.heracles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.3389281, 6.650802339),
      'Polman Stadion',26100,1903,_country.netherlands,62.7,[]];
    map[_name.mvv] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.85747083, 5.717886173),
      'De Geusselt',10000,1902,_country.netherlands,61.0,[]];
    map[_name.nacbreda] = [ClubColors(Colors.yellow,Colors.black),pattern.diagonal,Coordinates(51.59486073, 4.750421595),
      'Rat Verlegh',17064,1912,_country.netherlands,64.5,[]];
    map[_name.necnijmegen] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.822486, 5.837214),
      'Stadion de Goffert',12500,1900,_country.netherlands,63.7,[]];
    map[_name.roda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(50.8572678, 6.0058343),
      'Parkstad Limburg Stadion',9790,1962,_country.netherlands,65.1,[]];
    map[_name.rapidjc] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Gemeentelijk Sportpark Kaalheide',25000,1954,_country.netherlands,50.0,[]];    //EXTINTO vira roda jc
    map[_name.spartarotterdam] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.9200241, 4.4337761),
      'Sparta Stadion Het Kasteel',11026,1888,_country.netherlands,50.0,[]];
    map[_name.twente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.2366666,6.8375),
      'De Grolsch Veste',30205,1965,_country.netherlands,70.7,[]];
    map[_name.utrecht] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.0785286, 5.14622137),
      'Galgenwaard',24426,1970,_country.netherlands,71.3,[]];
    map[_name.vitesse] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(51.96292454, 5.8930736),
      'GelreDome',21248,1892,_country.netherlands,71.1,[]];
    map[_name.volendam] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.4945818, 5.06643744),
      'Kras Stadion',6260,1920,_country.netherlands,62.4,[]];
    map[_name.vvv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.3521076, 6.179960356),
      'De Koel',8000,1903,_country.netherlands,60.6,[]];
    map[_name.waalwijk] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(51.686679, 5.089090),
      'Mandemakers Stadion',7500,1940,_country.netherlands,63.6,[]];
    map[_name.willem] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(51.5430195, 5.067781659),
      'Willen II Stadion',45500,1896,_country.netherlands,65.3,[]];
    map[_name.zwolle] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5171852, 6.120810235),
      'IJsseldeltastadion',12500,1910,_country.netherlands,64.4,[]];
    map[_name.dws] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.netherlands,50.0,[]];

    //BELGICA
    map[_name.anderlecht] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(50.8344335, 4.2979681),
      'Constant Vanden Stock',28063,1908,_country.belgium,73.9,[_name.brugge]];
    map[_name.beerschot] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(51.18521358, 4.38191755),
      '	Olympisch Stadion',12771,1921,_country.belgium,65.6,[]];
    map[_name.beveren] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.2143650, 4.2442212),
      'Freethiel Stadion',13290,1936,_country.belgium,61.6,[]];
    map[_name.brugge] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.1933339, 3.180370),
      'Jan Breydel',30000,1891,_country.belgium,76.9,[_name.anderlecht]];
    map[_name.cerclebrugge] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(51.1934139, 3.1807351),
      'Jan Breydel',29062,1899,_country.belgium,68.1,[]];
    map[_name.charleroi] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(50.4148749, 4.45318367),
      'Stade du Pays de Charleroi',25000,1904,_country.belgium,69.5,[]];
    map[_name.genk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.0050548, 5.5335494),
      'Cristal Arena',24604,1988,_country.belgium,74.2,[]];
    map[_name.gent] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.01671567, 3.73471876),
      'Ghelamco Arena',20000,1900,_country.belgium,72.4,[]];
    map[_name.kaseupen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.6263931, 6.04539),
      'Kehrwegstadion',8366,1945,_country.belgium,65.8,[]];
    map[_name.kortrijk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.83036, 3.2491287),
      'Guldensporenstadion',9500,1901,_country.belgium,60.5,[]];
    map[_name.waregemKSV] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Regenboogstadion',8500,1925,_country.belgium,50.0,[]]; //EXTINTO 2001
    map[_name.lierse] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.1443335, 4.57393474),
      'Herman Vanderpoorten Stadion',15500,1906,_country.belgium,63.7,[]];
    map[_name.lokeren] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(51.1165361, 3.98735088),
      'Daknamstadion',9271,1923,_country.belgium,62.6,[]];
    map[_name.mechelen] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes2,Coordinates(51.036870, 4.487291538),
      'AFAS Stadion',10000,1904,_country.belgium,67.3,[]];
    map[_name.mouscron] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Le Canonnier',10571,2010,_country.belgium,64.6,[]];
    map[_name.oostende] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.2169176, 2.886586),
      'Albertparkstadion',10000,1904,_country.belgium,62.4,[]];
    map[_name.royalAntwerp] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.23260, 4.47252263),
      'Stadium “BOSUIL“',10000,1880,_country.belgium,67.8,[]];
    map[_name.liegeois] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.6006919, 5.50389739),
      'Stade du Pairay',14236,1892,_country.belgium,63.2,[]];
    map[_name.standardliege] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.609929, 5.544381876),
      'Maurice Dufrasne',30030,1898,_country.belgium,70.6,[]];
    map[_name.sttruidense] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.8134616, 5.166361),
      'Estádio Stayen',11250,1933,_country.belgium,65.5,[]];
    map[_name.saintgilloise] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(50.8178096, 4.329303),
      'Stade Joseph Marien',6000,1897,_country.belgium,68.2,[]];
    map[_name.westerlo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.0947729, 4.928768),
      'Het Kuipje',7982,1933,_country.belgium,62.6,[]];
    map[_name.zulteWaregem] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.88311, 3.42904),
      'Regenboogstadion',8500,1950,_country.belgium,63.8,[]];
    map[_name.molenbeek] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Edmond Machtens Stadium',12266,1909,_country.belgium,65.0,[]]; //EXTINTO 2012
    map[_name.waterschei] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,1919,_country.belgium,50.0,[]];//EXTINTO 1988

    //ESCOCIA
    map[_name.aberdeen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.15986178, -2.0880853),
      'Pittodrie Stadium',22199,1903,_country.scotland,71.6,[]];
    map[_name.airdrieonians] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Excelsior Stadium',10101,1878,_country.scotland,56.0,[]];
    map[_name.ayr] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Somerset Park',12000,1910,_country.scotland,56.0,[]];
    map[_name.celtic] = [ClubColors(Colors.green,Colors.white),pattern.horStripes4,Coordinates(55.84971111,-4.20558889),
      'Celtic Park',60355,1888,_country.scotland,74.2,[_name.rangers]];
    map[_name.clyde] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Broadwood Stadium',8000,1877,_country.scotland,58.8,[]];
    map[_name.dundee] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.4748207, -2.9686031),
      'Tannadice Park',14209,1909,_country.scotland,70.4,[]];
    map[_name.dundeefc] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(56.4747776, -2.9689532),
      'Dens Park',11506,1899,_country.scotland,65.8,[]];
    map[_name.dunfermline] = [ClubColors(Colors.white,Colors.black),pattern.stripesThin,Coordinates(0,0),
      'East End Park',12509,1885,_country.scotland,61.6,[]];
    map[_name.eastfife] = [ClubColors(Colors.brown,Colors.black),pattern.solid,Coordinates(0,0),
      'Bayview Stadium',1980,1903,_country.scotland,56.4,[]];
    map[_name.falkirk] = [ClubColors(Colors.black,Colors.white),pattern.stripesThin,Coordinates(56.005469, -3.7525251),
      'Falkirk Stadium',8000,1876,_country.scotland,63.5,[]];
    map[_name.hamilton] = [ClubColors(Colors.red,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'New Douglas Park',5396,1874,_country.scotland,62.3,[]];
    map[_name.hibernian] = [ClubColors(darkgreen,Colors.white),pattern.sleeves,Coordinates(55.96189876, -3.1650656),
      'Easter Road',20421,1875,_country.scotland,69.5,[]];
    map[_name.hearts] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(55.9389923, -3.232460),
      'Tynecastle Stadium',20099,1874,_country.scotland,66.6,[]];
    map[_name.inverness] = [ClubColors(Colors.blue,Colors.red),pattern.oneVertStripe,Coordinates(57.4950677, -4.2173463),
      'Caledonian Stadium',7711,1994,_country.scotland,63.2,[]];
    map[_name.kilmarnock] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(55.604225,-4.508122),
      'Rugby Park',18128,1869,_country.scotland,66.7,[]];
    map[_name.livingston] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.88594835, -3.522035),
      'Almondvale Stadium',9521,1943,_country.scotland,65.2,[]];
    map[_name.morton] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Cappielow Park',11589,1874,_country.scotland,59.5,[]];
    map[_name.motherwell] = [ClubColors(Colors.yellow,Colors.redAccent),pattern.solid,Coordinates(55.7804536, -3.9800776),
      'Fir Park',13742,1886,_country.scotland,63.6,[]];
    map[_name.partick] = [ClubColors(Colors.red,Colors.yellow,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Firhill Stadium',10102,1876,_country.scotland,60.5,[]];
    map[_name.raithrovers] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stark\'s Park',8867,1883,_country.scotland,58.9,[]];
    map[_name.rangers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.8530555,-4.309166666),
      'Ibrox Stadium',50817,1872,_country.scotland,75.2,[_name.celtic]];
    map[_name.rossCounty] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(57.59589451, -4.4187127),
      'Victoria Park',6310,1929,_country.scotland,64.5,[]];
    map[_name.stmirren] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(55.8506123, -4.4442139),
      'St Mirren Park',7937,1877,_country.scotland,63.1,[]];
    map[_name.stjohnstone] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.409916, -3.4767773),
      'McDiarmid Park',10696,1884,_country.scotland,65.0,[]];
    //IRLANDA DO NORTE
    map[_name.ards] = [ClubColors(blue,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Clandeboye Park',2000,1900,_country.northernIreland,56.4,[]];
    map[_name.cliftonville] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(54.61942914, -5.947241266),
      'Solitude Stadium',6224,1879,_country.northernIreland,62.7,[]];
    map[_name.coleraine] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.1329222, -6.65989578),
      'The Showgrounds',2496,1927,_country.northernIreland,59.6,[]];
    map[_name.crusaders] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(54.624341808, -5.92197737),
      'Seaview',3054,1898,_country.northernIreland,63.3,[]];
    map[_name.glenavon] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Mourneview Park',5000,1889,_country.northernIreland,59.4,[]];
    map[_name.glentoran] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(54.6030087, -5.8911762),
      'The Oval',26556,1882,_country.northernIreland,61.5,[]];
    map[_name.linfield] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.582700, -5.95480680),
      'Windsor Park',21000,1886,_country.northernIreland,64.0,[]];
    map[_name.portadown] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Shamrock Park',3942,1889,_country.northernIreland,61.0,[]];
    // GALES
    map[_name.bangorcity] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(53.2251826, -4.1483997),
      'Nantporth',3000,1876,_country.wales,61.9,[]];
    map[_name.barrytown] = [ClubColors(Colors.yellow,Colors.blue),pattern.diagonal,Coordinates(51.4113524, -3.26553879),
      'Jenner Park Stadium',2000,1912,_country.wales,58.5,[]];
    map[_name.balatown] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(52.9124643, -3.601483437),
      'Maes Tegid',3004,1880,_country.wales,61.6,[]];
    map[_name.connahs] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.2254096, -3.07649671),
      'Deeside Stadium',500,1946,_country.wales,62.5,[]];
    map[_name.cwmbran] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Cwmbran Stadium',10500,1951,_country.wales,55.7,[]];
    map[_name.llanelli] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.6839597, -4.1478377),
      'Stebonheath Park',3700,1884,_country.wales,60.3,[]];
    map[_name.neath] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0, 0),
      'The Gnoll',6000,2005,_country.wales,50.0,[]]; //EXTINTO 2012
    map[_name.newsaints] = [ClubColors(Colors.white,Colors.green),pattern.dividedHor,Coordinates(52.8759,-3.02631),
      'Park Hall',2034,1896,_country.wales,65.4,[]];
    map[_name.newtown] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.5115521, -3.3228284),
      'Latham Park',5000,1875,_country.wales,63.0,[]];
    map[_name.rhyl] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0, 0),
      'The Corbett Sports Stadium',3000,1879,_country.wales,50.0,[]]; //EXTINTO 2020
    //IRLANDA
    map[_name.athlone] = [ClubColors(darkblue,Colors.black),pattern.stripes4,Coordinates(0,0),
      'St. Mel\'s Park',7500,1887,_country.ireland,59.9,[]];
    map[_name.bohemian] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.3615383, -6.274242753),
      'Dalymount Park',8030,1890,_country.ireland,66.6,[]];
    map[_name.cork] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(51.8855177012, -8.468353748),
      'Turner Cross',7000,1984,_country.ireland,62.6,[]];
    map[_name.corkceltic] = [ClubColors(darkgreen,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Turner Cross',15000,1935,_country.ireland,62.6,[]];//EXTINTO 1979
    map[_name.derry] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.99085262, -7.336110758),
      'Brandywell',7700,1928,_country.ireland,64.0,[]];
    map[_name.drogheda] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(0,0),
      'United Park',6400,1919,_country.ireland,60.9,[]];
    map[_name.dundalk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.999213461, -6.41599349),
      'Oriel Park',13600,1919,_country.ireland,67.1,[]];
    map[_name.limerick] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Hogan Park',10000,1937,_country.ireland,56.9,[]];
    map[_name.drumcondra] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(0,0),
      '',0,1924,_country.ireland,52.9,[]];//EXTINTO 1972
    map[_name.shamrock] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.28363777, -6.373458012),
      'Estádio de Tallaght',6000,1899,_country.ireland,67.4,[]];
    map[_name.shellbourne] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.3674709, -6.2518031),
      'Tolka Park',9681,1895,_country.ireland,58.7,[]];
    map[_name.sligo] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.27006, -8.487299),
      'Showgrounds',5500,1926,_country.ireland,60.4,[]];
    map[_name.stpatricks] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.341094, -6.3167397),
      'Richmond Park',5340,1929,_country.ireland,60.8,[]];
    map[_name.waterford] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.2459668, -7.12492168),
      'Waterford Regional Sports Central',8000,1930,_country.ireland,58.9,[]];

    //NORDICOS
    //NORUEGA
    map[_name.aalesund] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(62.46965856, 6.1872397),
      'Color Line Stadion',10778,1914,_country.norway,66.8,[]];
    map[_name.brann] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(60.3670435, 5.3577909),
      'Brann Stadion',18500,1908,_country.norway,62.9,[]];
    map[_name.fredrikstad] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(59.2116267, 10.9374700),
      'Nye Fredrikstad Stadion',13300,1903,_country.norway,65.4,[]];
    map[_name.glimt] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(67.27666691, 14.38474245),
      'Aspmyra Stadion',7354,1916,_country.norway,67.9,[]];
    map[_name.haugesund] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Haugesund Stadion',8754,1993,_country.norway,63.8,[]];
    map[_name.kongsvinger] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Gjemselund Stadion',6700,1892,_country.norway,54.7,[]];
    map[_name.kristiansund] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Kristiansund Stadion',4444,2003,_country.norway,64.5,[]];
    map[_name.larvik] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Lovisenlund',0,1865,_country.norway,54.6,[]];
    map[_name.lillestrom] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(59.962752,11.063458),
      'Åråsen Stadion',12000,1917,_country.norway,67.1,[]];
    map[_name.lyn] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.9491344, 10.734334),
      'Ullevaal Stadion',25572,1896,_country.norway,67.4,[]];
    map[_name.molde] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.73348179, 7.1483130),
      'Aker Stadion',11167,1911,_country.norway,69.6,[_name.rosenborg]];
    map[_name.moss] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.norway,50.0,[]];
    map[_name.odd] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(59.2114814, 9.5900116),
      'Skagerak Arena',13500,1894,_country.norway,64.4,[]];
    map[_name.rosenborg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(63.41251977, 10.405168),
      'Lerkendal Stadion',21405,1917,_country.norway,69.1,[_name.molde]];
    map[_name.sanderfjord] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Release Arena',6582,1998,_country.norway,61.3,[]];
    map[_name.sarpsborg] = [ClubColors(Colors.blue,Colors.white),pattern.oneVertStripe,Coordinates(59.2863530, 11.0975386),
      'Sarpsborg Stadion',4700,2008,_country.norway,58.6,[]];
    map[_name.skeid] = [ClubColors(Colors.red,Colors.blue,Colors.black),pattern.solid,Coordinates(59.925121, 10.73346175),
      'Bislett Stadion',1100,1915,_country.norway,61.6,[]];
    map[_name.stabaek] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(59.90305236, 10.62399937),
      'Telenor Arena',15000,1912,_country.norway,66.3,[]];
    map[_name.start] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(58.15372466, 8.02913169),
      'Sør Arena',14300,1905,_country.norway,58.3,[]];
    map[_name.stromsgodset] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(59.734386744, 10.20155324),
      'Marienlyst Stadion',8500,1907,_country.norway,65.8,[]];
    map[_name.tromso] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(69.6488819, 18.9343386),
      'Alfheim Stadium',7500,1920,_country.norway,65.0,[]];
    map[_name.valerenga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(59.9492525, 10.7344950),
      'Ullevaal Stadion',25000,1913,_country.norway,65.3,[]];
    map[_name.viking] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(58.9146757, 5.73094724),
      'Viking Stadion',16000,1899,_country.norway,66.1,[]];
    //SUECIA
    map[_name.aik] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(57.705889, 11.98060),
      'Estádio Gamla Ullevi',18416,1904,_country.sweden,70.6,[]];
    map[_name.brage] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Domnarvsvallen',6500,1925,_country.sweden,59.9,[]];
    map[_name.degerfors] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stora Valla',7500,1907,_country.sweden,63.9,[]];
    map[_name.djurgarden] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(59.291191, 18.084667),
      'Stockholmsarenan',33000,1899,_country.sweden,67.6,[]];
    map[_name.elfsborg] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(57.734357, 12.9347772),
      'Arena de Borås',17000,1904,_country.sweden,68.4,[]];
    map[_name.gais] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Estádio Gamla Ullevi',18800,1894,_country.sweden,63.3,[]];
    map[_name.hacken] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(57.71921, 11.93074),
      'Bravida Arena',8480,1940,_country.sweden,65.1,[]];
    map[_name.halmstads] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(56.684534, 12.86680328),
      'Örjans vall',15500,1914,_country.sweden,66.8,[]];
    map[_name.hammarby] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(59.290854, 18.085401),
      'Tele2 Arena',33000,1915,_country.sweden,70.6,[]];
    map[_name.helsingborg] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.345391, 18.0790722),
      'Stockholm Olympic Stadium',17100,1907,_country.sweden,66.2,[]];
    map[_name.kalmar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.6693123, 16.3598183),
      'Stade Fredriksskans',10000,1910,_country.sweden,66.6,[]];
    map[_name.ifkgoteborg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(57.706313, 11.980112),
      'Gamla Ullevi',18416,1904,_country.sweden,70.4,[]];
    map[_name.malmo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.583611,12.987777),
      'Eleda Stadion',24000,1910,_country.sweden,71.6,[]];
    map[_name.mjallby] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(56.0120291, 14.71628237),
      'Strandvallen',6750,1939,_country.sweden,64.6,[]];
    map[_name.norrkoping] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(58.584254, 16.1730),
      'Nya Parken',17234,1897,_country.sweden,65.1,[]];
    map[_name.orebro] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Behrn Arena',14500,1937,_country.sweden,61.9,[]];
    map[_name.orgryte] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
    'Gamla Ullevi',0,1887,_country.sweden,63.5,[]];
    map[_name.osters] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(56.8800057, 14.7770021),
      'Myresjöhus Arena',12000,1930,_country.sweden,65.1,[]];
    map[_name.sirius] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(59.849614, 17.6454),
      'Studenternas IP',7600,1907,_country.sweden,64.2,[]];
    map[_name.atvidabergs] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(58.1947123, 15.99574039),
      'Kopparvallen',8600,1907,_country.sweden,60.6,[]];
    //DINAMARCA
    map[_name.aalborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.052210, 9.899045278),
      'Estádio Aalborg',13800,1885,_country.denmark,69.3,[]];
    map[_name.aarhus] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(56.1319897, 10.19663695),
      'NRGi Park',20032,1880,_country.denmark,64.6,[]];
    map[_name.ab] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(55.73300, 12.49662372),
      'Gladsaxe Stadion',13507,1889,_country.denmark,63.1,[]];
    map[_name.b1913] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Campus Road',0,1913,_country.denmark,60.1,[]];
    map[_name.brondby] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(55.648923276, 12.41797939),
      'Brøndby Stadion',29000,1964,_country.denmark,69.1,[]];
    map[_name.copenhague] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.70280149, 12.57258422),
      'Parken Stadium',42358,1992,_country.denmark,72.7,[]];
    map[_name.esbjerg] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(55.48228994, 8.43983205),
      'Blue Water Arena',18000,1924,_country.denmark,67.8,[]];
    map[_name.frem] = [ClubColors(Colors.red,Colors.blue),pattern.horStripes4,Coordinates(0,0),
      'Valby Idrætspark',12000,1886,_country.denmark,64.4,[]];
    map[_name.herfolge] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(55.4136397, 12.1339835),
      'Estadio Herfolge',8000,1921,_country.denmark,66.7,[]];
    map[_name.horsens] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.871661, 9.8576635128),
      'CASA Arena Horsens',10400,1994,_country.denmark,66.7,[]];
    map[_name.kb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Frederiksberg I P Opvisning',16000,1876,_country.denmark,72.7,[]];
    map[_name.lyngby] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.780791023, 12.5061700),
      'Lyngby Stadion',12000,1921,_country.denmark,67.8,[]];
    map[_name.midtjylland] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(56.117084943, 8.952439451),
      'MCH Arena',11800,1999,_country.denmark,72.2,[]];
    map[_name.naestved] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'TintShop Park',10000,1939,_country.denmark,62.7,[]];
    map[_name.nordsjaelland] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(55.81610534, 12.35249887),
      'Farum Park',10000,1991,_country.denmark,69.5,[]];
    map[_name.obodense] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.39794088, 10.35053547),
      'TRE-FOR Park',15761,1887,_country.denmark,68.4,[]];
    map[_name.randers] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(56.46572077, 10.00950067),
      'AutoC Park Randers',10300,2003,_country.denmark,70.6,[]];
    map[_name.silkeborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.157916, 9.5540119),
      'MASCOT Park',10000,1917,_country.denmark,65.1,[]];
    map[_name.sonderjysk] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(55.26142977, 9.48772190),
      'Sydbank Park',10000,2004,_country.denmark,64.9,[]];
    map[_name.vejle] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.71376447, 9.55639463),
      'Vejle Stadion',10491,1891,_country.denmark,65.4,[]];
    map[_name.viborg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(56.455972956, 9.4020026),
      'Viborg Stadium',9566,1896,_country.denmark,64.0,[]];
    map[_name.b1903] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[]];
    map[_name.b1909] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[]];
    map[_name.hvidovre] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[]];
    map[_name.kb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[]];
    map[_name.koge] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[]];
    //FINLANDIA
    map[_name.haka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(61.2680806, 24.02085023),
      'Tehtaan kenttä',6400,1934,_country.finland,64.6,[]];
    map[_name.helsinki] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(60.1876315, 24.9233446),
      'Bolt Arena',10770,1907,_country.finland,66.1,[]];
    map[_name.helsingfors] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Bolt Arena',10770,1897,_country.finland,62.4,[]];
    map[_name.honka] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Tapiolan Urheilupuisto',6000,1957,_country.finland,58.2,[]];
    map[_name.ilves] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(61.5003270, 23.7854713),
      'Tammela Stadion',5040,1931,_country.finland,63.1,[]];
    map[_name.jazz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Porin stadion',12000,1992,_country.finland,61.4,[]];
    map[_name.jokerit] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Sonera Stadium',10770,1999,_country.finland,50.0,[]]; //EXTINTO 2004
    map[_name.kups] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(62.884580, 27.6718364),
      'Väre Areena',4700,1923,_country.finland,64.1,[]];
    map[_name.lahti] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(60.98651281, 25.65060111),
      'Lahden Stadion',14465,1996,_country.finland,63.8,[]];
    map[_name.kuusysi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Kisapuisto',4400,1934,_country.finland,57.0,[]];
    map[_name.mariehamn] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Wiklöf Holding Arena',4000,1912,_country.finland,60.4,[]];
    map[_name.mypa] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Kymenlaakson Sähkö Stadion',4167,1947,_country.finland,55.6,[]];
    map[_name.sjk] = [ClubColors(Colors.black,gold),pattern.solid,Coordinates(0,0),
      'OmaSP Stadion',5817,2007,_country.finland,61.6,[]];
    map[_name.tampere] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Tammelan Stadion',5500,1998,_country.finland,58.6,[]];
    map[_name.tps] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Paavo Nurmi Stadium',13000,1922,_country.finland,56.6,[]];
    map[_name.turku] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(60.44283325, 22.292024),
      'Veritas Stadion',9372,1990,_country.finland,62.8,[]];
    //ISLANDIA
    map[_name.akraness] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(64.3181903, -22.05713664),
      'Akranesvöllur',6000,1946,_country.iceland,63.8,[]];
    map[_name.breidablik] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(64.10421594, -21.8969209),
      'Kópavogsvöllur',5501,1950,_country.iceland,62.6,[]];
    map[_name.fh] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(64.07608583, -21.935295742),
      'Kaplakriki',6450,1928,_country.iceland,61.7,[]];
    map[_name.framIslandia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(64.14358486, -21.87923343),
      'Laugardalsvöllur',9800,1908,_country.iceland,56.3,[]];
    map[_name.keflavik] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(63.9979812, -22.559169),
      'Keflavíkurvöllur',4957,1929,_country.iceland,54.3,[]];
    map[_name.ibv] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(63.4394649, -20.2880367),
      'Hásteinsvöllur',2300,1903,_country.iceland,58.7,[]];
    map[_name.reykjavik] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(64.14640062, -21.96675625),
      'KR-völlur',6000,1899,_country.iceland,64.8,[]];
    map[_name.valur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(64.13294129158774, -21.9229681),
      'Vodafonevöllurinn',3000,1911,_country.iceland,64.2,[]];
    map[_name.vikingur] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(64.11637343, -21.85500321),
      'Víkingsvöllur',1450,1908,_country.iceland,62.3,[]];
    //ILHAS FAROE
    map[_name.b36] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.019293, -6.7805902),
      'Gundadalur',5000,1936,_country.faroe,60.7,[]];
    map[_name.hb] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(62.0192123, -6.7779013),
      'Gundadalur',5000,1904,_country.faroe,62.5,[]];
    map[_name.klaksvik] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.224696, -6.580514426),
      'Djúpumýra Klaksvík',1500,1904,_country.faroe,61.8,[]];
    map[_name.vikingurFaroe] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(62.199574, -6.7458078),
      'Serpugerdi Stadium',16000,2008,_country.faroe,62.6,[]];

    //AUSTRIA
    map[_name.admira] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(48.097542, 16.3113277),
      'Bundesstadion Südstadt',10000,1905,_country.austria,67.5,[]];
    map[_name.altach] = [ClubColors(Colors.yellow,Colors.black),pattern.diagonal,Coordinates(47.3541995, 9.63664412),
      'Cashpoint Arena',8900,1929,_country.austria,65.6,[]];
    map[_name.austria] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(46.609157, 14.278102),
      'Franz Horr',17656,1911,_country.austria,69.4,[]];
    map[_name.austriaKlagenfurt] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(47.2811738, 15.9776617),
      'Wörthersee Stadion',32000,2007,_country.austria,64.3,[]];
    map[_name.bregenz] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Casino Stadium',12000,1919,_country.austria,54.1,[]];
    map[_name.firstViena] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Hohe-Warte-Stadion',5000,1894,_country.austria,58.0,[]];
    map[_name.grazer] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.0463164, 15.45477457),
      'UPC-Arena',15450,1902,_country.austria,62.6,[]];
    map[_name.grodig] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(0,0),
      'Untersberg-Arena',4128,1948,_country.austria,54.2,[]];
    map[_name.hartberg] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(47.2811738, 15.9776617),
      'Arena Hartberg',4500,1946,_country.austria,63.2,[]];
    map[_name.laskLinz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(48.2938258, 14.2766143),
      'Linzer Stadion',30138,1908,_country.austria,69.6,[]];
    map[_name.mattersburg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Pappelstadion',17100,1922,_country.austria,65.1,[]]; //EXTINTO 2020
    map[_name.pasching] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(46.77307336, 15.6994585),
      'Waldstadion',7152,1946,_country.austria,69.6,[]];
    map[_name.rapidviena] = [ClubColors(Colors.green,Colors.white),pattern.dividedHor,Coordinates(48.19810877, 16.2660961),
      'Allianz Stadion',28000,1899,_country.austria,70.5,[]];
    map[_name.rbsalzburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.8163615, 12.9986015),
      'Red Bull Arena',31895,2005,_country.austria,74.4,[]];
    map[_name.ried] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(48.207823, 13.478552),
      'Keine Sorgen Arena',7680,1912,_country.austria,66.4,[]];
    map[_name.sturmGraz] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.0466456, 15.4552685),
      'Merkur Arena',16400,1909,_country.austria,67.2,[]];
    map[_name.tirol] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.255992, 11.4113934),
      'Tivoli Stadium',16008,1930,_country.austria,65.8,[]];
    map[_name.wolfsberger] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(46.8263069, 14.852003),
      'Lavanttal-Arena',7300,1930,_country.austria,66.9,[]];
    map[_name.innsbruck] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,50.0,[]];
    map[_name.stahlLinz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'ASKÖ Neue Heimat',0,1947,_country.austria,50.0,[]]; //extinto 1997
    map[_name.stpolten] = [ClubColors(Colors.greenAccent,darkblue),pattern.sleeves,Coordinates(48.220719, 15.6535139),
      'NV Arena',8000,2000,_country.austria,63.6,[]];
    map[_name.wackerInnsbruck] = [ClubColors(Colors.green,Colors.black),pattern.stripes3,Coordinates(47.2560956, 11.41106589),
      'Tivoli-Neu',16008,2002,_country.austria,62.1,[]];
    map[_name.wiener] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,50.0,[]];
    //SUIÇA
    map[_name.aarau] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(47.3834198, 8.05997331),
      'Brügglifeld',8000,1902,_country.switzerland,66.4,[]];
    map[_name.basel] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(47.54169074, 7.62067642),
      'St. Jakob-Park',42500,1893,_country.switzerland,72.2,[]];
    map[_name.bellinzona] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(46.19800256, 9.022140574),
      'Stadio Comunale Bellinzona',5000,1904,_country.switzerland,56.5,[]];
    map[_name.bielBienne] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1896,_country.switzerland,52.1,[]];
    map[_name.chiasso] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(45.8341383, 9.01664266),
      'Stadio Comunale',11160,1905,_country.switzerland,58.5,[]];
    map[_name.grasshoppers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38286, 8.5036),
      'Letzigrund',26500,1886,_country.switzerland,70.4,[]];
    map[_name.grenchen] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stadium Brühl',15100,1906,_country.switzerland,53.4,[]];
    map[_name.lausanne] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(46.5329620, 6.62447646),
      'Stade Olympique',15850,1896,_country.switzerland,65.3,[]];
    map[_name.lugano] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(46.023828, 8.96135788),
      'Stadio de Cornaredo',10500,1908,_country.switzerland,68.2,[]];
    map[_name.luzern] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.03307, 8.3051154),
      'Swissporarena',13000,1901,_country.switzerland,66.5,[]];
    map[_name.sion] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(46.23353628, 7.37640473),
      'Estádio Tourbillon',14500,1909,_country.switzerland,67.3,[]];
    map[_name.servette] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(46.177778,6.1275),
      'Stade de Genève',30084,1890,_country.switzerland,66.1,[]];
    map[_name.stgallen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.408398945, 9.3057807),
      'Kybunpark',19694,1879,_country.switzerland,68.3,[]];
    map[_name.thun] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.7439056, 7.60663322),
      'Stockhorn Arena',10300,1898,_country.switzerland,65.3,[]];
    map[_name.youngBoys] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(46.9633758, 7.4653358),
      'Estádio da Suíça',32000,1898,_country.switzerland,73.3,[]];
    map[_name.winterthur] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.5008475, 8.717600),
      'Schützenwiese',8550,1896,_country.switzerland,65.0,[]];
    map[_name.zurich] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38279,8.503801),
      'Letzigrund',26500,1896,_country.switzerland,69.8,[]];
    map[_name.chauxdefonds] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Centre Sportif de la Charrière',12700,1894,_country.switzerland,64.2,[]];
    map[_name.neuchatel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(46.9950997, 6.944111255),
      'Stade de la Maladière',12000,1912,_country.switzerland,50.0,[]];
    //POLONIA
    map[_name.cracovia] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.05799319, 19.9205966),
      'Estádio Józef Piłsudski',15016,1906,_country.poland,66.1,[]];
    map[_name.gornik] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.296646268, 18.7696376),
      'Estádio Ernest Pohl',24563,1948,_country.poland,68.8,[]];
    map[_name.gwardia] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(52.19919178, 20.99196),
      'Stadion WKS Gwardia',9000,1948,_country.poland,61.6,[]];
    map[_name.jagiellonia] = [ClubColors(Colors.red,Colors.yellow),pattern.horStripes3,Coordinates(53.106088, 23.149288),
      'Estádio Municipal Białystok',22386,1920,_country.poland,67.5,[]];
    map[_name.katowice] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(50.2797120, 19.001128977),
      'Estádio GKS Katowice',9511,1964,_country.poland,61.4,[]];
    map[_name.korona] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(50.8616560, 20.625024),
      'Municipal de Kielce',15550,1973,_country.poland,67.2,[]];
    map[_name.legiaWarszawa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.220579264, 21.0408855),
      'Pepsi Arena',31000,1916,_country.poland,70.4,[]];
    map[_name.lechiagdansk] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(54.3900689, 18.6404273),
      'PGE Arena Gdańsk',43165,1945,_country.poland,66.4,[]];
    map[_name.lechPoznan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.39775183, 16.8587159),
      'Estádio Municipal de Poznań',41609,1922,_country.poland,69.8,[]];
    map[_name.lksLodz] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(51.7589447, 19.42655367),
      'Estádio Municipal em Łódź',18029,1908,_country.poland,62.3,[]];
    map[_name.piastGliwice] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(50.3066789, 18.695438),
      'Stadion Miejski im. Piotra Wieczorka',9913,1945,_country.poland,64.5,[]];
    map[_name.poloniaWarsaw] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(52.255523, 21.0011222),
      'Polonii Warszawa',6860,1911,_country.poland,64.2,[]];
    map[_name.pogon] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(53.43655020, 14.51868017),
      'Estádio Florian Krygier',8990,1948,_country.poland,65.1,[]];
    map[_name.rakow] = [ClubColors(Colors.red,Colors.blue),pattern.stripes3,Coordinates(50.7767924, 19.159192),
      'Miejski Stadion Piłkarski',5500,1921,_country.poland,64.6,[]];
    map[_name.radomiak] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(51.396545, 21.1462516),
      'Stadion im. Braci Czachorów',8840,1910,_country.poland,63.5,[]];
    map[_name.ruchchorzow] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.28228733, 18.94527638),
      'Stadion Ruchu Chorzów',9300,1920,_country.poland,66.8,[]];
    map[_name.slaskwrocklaw] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(51.14125077, 16.94370316),
      'Municipal de Wroclaw',44416,1947,_country.poland,65.2,[]];
    map[_name.stalmielec] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(50.2987453, 21.4359145),
      'Estádio MOSiR',6864,1939,_country.poland,71.6,[]];
    map[_name.wislaPlock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5620205, 19.68411),
      'Estádio Kazimierz Górski',12800,1947,_country.poland,67.8,[]];
    map[_name.wislaKrakow] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.0638402, 19.91199072),
      'Estádio Henryk Reyman',33326,1906,_country.poland,67.3,[]];
    map[_name.wartaPoznan] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.3935359, 16.9312640),
      'Stadion przy Drodze Dębińskiej',2500,1912,_country.poland,62.5,[]];
    map[_name.widzew] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.764935, 19.51160286),
      'MOSiR Widzew Łódź',18008,1922,_country.poland,63.7,[]];
    map[_name.zaglebieLubin] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(51.4140686, 16.1983108),
      'Lubin City Stadium',16100,1945,_country.poland,65.4,[]];
    map[_name.poloniabytom] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.poland,50.0,[]];
    map[_name.szombierki] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(50.3306972, 18.89811724),
      'Stadion Szombierek',20000,1919,_country.poland,52.6,[]];

    //TURQUIA
    map[_name.adanaspor] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(37.06372554, 35.37545482),
      'Novo Estádio de Adana',33543,1954,_country.turkey,67.6,[]];
    map[_name.adanaDemispor] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Novo Estádio de Adana',33543,1940,_country.turkey,65.2,[]];
    map[_name.akhisar] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      '	Estádio Municipal de Akhisar',12139,1970,_country.turkey,65.5,[]];
    map[_name.alanyaspor] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(36.5626171, 32.0791125),
      'Estádio do Colégio Bahçeşehir',10842,1948,_country.turkey,71.5,[]];
    map[_name.altay] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(38.43717939, 27.150778738),
      'Mustafa Denizli de Alsancak',14000,1914,_country.turkey,66.8,[]];
    map[_name.ankaraDemispor] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(39.94182728, 32.77232843),
      'TCDD Ankara Demirspor Stadium',3000,1930,_country.turkey,65.6,[]];
    map[_name.ankaragucu] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(39.98048096, 32.614368196),
      'Estádio de Eryaman',33543,1910,_country.turkey,66.7,[]];
    map[_name.antalyaspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.8884456, 30.66902964),
      'Estádio de Antália',32539,1966,_country.turkey,72.6,[]];
    map[_name.besiktas] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0394909, 28.99474848),
      'Vodafone Park',41903,1903,_country.turkey,77.2,[_name.fenerbahce,_name.galatasaray]];
    map[_name.boluspor] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(40.7362020, 31.60693457),
      'Bolu Atatürk Stadyumu',8456,1965,_country.turkey,56.2,[]];
    map[_name.bursaspor] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(40.210638, 29.009436),
      'Municipal Metropolitano de Bursa',42331,1963,_country.turkey,73.1,[]];
    map[_name.denizlispor] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(37.76621147, 29.08265607),
      'Denizli Atatürk Stadyumu',18745,1966,_country.turkey,68.4,[]];
    map[_name.eskisehirspor] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(39.7626458, 30.467788155),
      'Estádio Atatürk de Esquiceir',34930,1965,_country.turkey,65.3,[]];
    map[_name.fenerbahce] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(40.9877951, 29.036899),
      'Şükrü Saraçoğlu',50509,1907,_country.turkey,76.5,[_name.galatasaray,_name.besiktas]];
    map[_name.galatasaray] = [ClubColors(Colors.orange,Colors.red),pattern.divided,Coordinates(41.103388888,28.991),
      'NEF Stadyumu',52280,1905,_country.turkey,77.4,[_name.fenerbahce,_name.besiktas]];
    map[_name.genclerbirligi] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(39.9799511, 32.61372983),
      'Estádio de Eryaman',20560,1923,_country.turkey,70.4,[]];
    map[_name.karagumruk] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.07463764, 28.765735),
      'Estádio Olímpico Atatürk',75145,1926,_country.turkey,67.1,[]];
    map[_name.kasimpasa] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(41.0327862, 28.9723363),
      'Estádio Recep Tayyip Erdoğan',14234,1921,_country.turkey,68.6,[]];
    map[_name.kayserispor] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(38.7373165, 35.42329044),
      'Estádio Kadir Has',32864,1966,_country.turkey,66.5,[]];
    map[_name.goztepe] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(38.3955952, 27.0760464),
      'Estádio Gürsel Aksel',20035,1925,_country.turkey,69.5,[]];
    map[_name.hatayspor] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(36.258447, 36.2078878),
      'New Hatay Stadium',26600,1967,_country.turkey,65.6,[]];
    map[_name.instanbul] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.12323595, 28.808461462),
      'Fatih Terim de Başakşehir',17319,1990,_country.turkey,73.5,[]];
    map[_name.istanbulspor] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(41.02455327, 28.6977618),
      'Necmi Kadıoğlu Stadyumu',4488,1926,_country.turkey,67.1,[]];
    map[_name.kocaelispor] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(40.774943, 30.017681438),
      'Estádio de Cocaeli',34712,1966,_country.turkey,63.4,[]];
    map[_name.konyaspor] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(37.9463311, 32.48842835),
      'Estádio Municipal Metropolitano de Cônia',41981,1922,_country.turkey,70.8,[]];
    map[_name.gaziantepspor] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.1230653, 37.3837841),
      'Estádio de Gaziantepe',35574,1988,_country.turkey,70.4,[]];
    map[_name.malatyaspor] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(38.337827, 38.4464651),
      'Novo Estádio de Malatya',27044,1986,_country.turkey,69.4,[]];
    map[_name.rizespor] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(41.0420904, 40.5733391),
      'Novo Estádio Municipal de Rize',15568,1953,_country.turkey];
    map[_name.samsunspor] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(41.228053, 36.4579017),
      'Estádio 19 de Maio de Samsun',33919,1965,_country.turkey,70.6,[]];
    map[_name.sivasspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.7286940, 36.9840344),
      'Yeni Sivas 4 Eylül Stadı',27532,1967,_country.turkey,72.8,[]];
    map[_name.trabzonspor] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(39.6463,40.9987),
      'Şenol Güneş Stadium',41461,1967,_country.turkey,75.9,[]];
    //GRECIA
    map[_name.apollonAthens] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(38.02826459, 23.7410119365),
      'Estádio Georgios Kamaras',14200,1908,_country.greece,60.2,[]];
    map[_name.larissa] = [ClubColors(Colors.brown,Colors.white),pattern.solid,Coordinates(39.64869675, 22.4121200),
      'Estádio Alkazar',13108,1964,_country.greece,65.8,[]];
    map[_name.aek] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(38.036111111,23.7875),
      'Olímpico de Atenas',71030,1924,_country.greece,74.3,[]];
    map[_name.aris] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(40.600069,22.9695),
      'Kleanthis Vikelidis',22800,1914,_country.greece,71.5,[_name.paok]];
    map[_name.asteras] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(37.50264465, 22.388388),
      'Asteras Tripolis Stadium',6430,1931,_country.greece,68.6,[]];
    map[_name.atromitos] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(38.0051223, 23.68987660),
      'Peristeri Stadium',10050,1923,_country.greece,67.5,[]];
    map[_name.egaleo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes4,Coordinates(37.98724401, 23.67627500),
      'Stavros Mavrothalassitis Stadium',8217,1931,_country.greece,63.5,[]];
    map[_name.ergotelis] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes2,Coordinates(0,0),
      'Pankritio Stadium',26240,1929,_country.greece,58.2,[]];
    map[_name.pasGiannina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(39.6676117, 20.84881764),
      'Zosimades Stadium',7500,1966,_country.greece,66.6,[]];
    map[_name.ionikos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(37.9772289, 23.634989),
      'Neapolis Nikaia',5000,1965,_country.greece,68.2,[]];
    map[_name.iraklis] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Kaftanzoglio Stadium',28028,1908,_country.greece,62.6,[]];
    map[_name.levadiakos] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Levadia Municipal Stadium',5915,1961,_country.greece,54.2,[]];
    map[_name.ofi] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(35.3368787, 25.106282),
      'Pankritio',26400,1925,_country.greece,66.7,[]];
    map[_name.olympiacos] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(37.946169,23.664536),
      'Karaiskákis',32130,1925,_country.greece,77.8,[_name.panathinaikos]];
    map[_name.panathinaikos] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(37.987606, 23.753651),
      'Apostolos Nikolaidis',16003,1908,_country.greece,72.6,[_name.olympiacos]];
    map[_name.panionios] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(37.9432934, 23.7092861),
      'Panionios Stadium',11700,1890,_country.greece,62.6,[]];
    map[_name.paok] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(40.613839,22.972422),
      'Toumba Stadium',29000,1926,_country.greece,74.2,[_name.aris]];
    map[_name.panetolikos] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(38.6300163, 21.4118706),
      'Panetolikos Stadium',7500,1926,_country.greece,58.6,[]];
    map[_name.pireu] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1923,_country.greece,55.2,[]];
    map[_name.lamia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.9099234, 22.4304807),
      'Lamia Municipal Stadium',5500,1964,_country.greece,60.6,[]];
    map[_name.platanias] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Dimotiko Gipedo Perivolia',4000,1931,_country.greece,58.6,[]];
    map[_name.volos] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripes3,Coordinates(35.3368787, 25.106282),
      'Panthessaliko Stadium',22700,2017,_country.greece,66.0,[]];
    map[_name.xanthi] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.1214320, 24.9493135),
      'Xanthi FC Arena',7361,1967,_country.greece,63.6,[]];
    //CHIPRE
    map[_name.aeklarnaca] = [ClubColors(Colors.yellow,Colors.green),pattern.oneHorStripe,Coordinates(34.9264739, 33.5976785),
      'AEK arena',13032,1994,_country.cyprus,70.9,[]];
    map[_name.apoel] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(35.1145399, 33.3630869672),
      'GSP Stadium',22859,1926,_country.cyprus,71.7,[]];
    map[_name.apollon] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(34.700914,33.022975),
      'Tsirion Stadium',13331,1954,_country.cyprus,70.4,[]];
    map[_name.arislimassol] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Alphamega Stadium',10700,1930,_country.cyprus,62.2,[]];
    map[_name.omonia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.1145, 33.3631),
      'GSP Stadium',22859,1948,_country.cyprus,71.2,[]];
    map[_name.anorthosis] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(34.93734087, 33.620755),
      'Antonis Papadopoulos Stadium',10230,1911,_country.cyprus,65.0,[]];
    map[_name.neasalamis] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Ammochostos Stadium',5500,1948,_country.cyprus,61.4,[]];
    map[_name.pafos] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Stelios Kyriakides Stadium',8500,2014,_country.cyprus,64.7,[]];
    map[_name.olynikosia] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(0,0),
      'Makario Stadium',16000,1931,_country.cyprus,62.2,[]];
    //ISRAEL
    map[_name.ashdod] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(31.8104802, 34.648333),
      'Estádio HaYud-Alef',8200,1999,_country.israel,65.4,[]];
    map[_name.bneiYehuda] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(32.0511055, 34.7619853),
      'Bloomfield Stadium',29400,1936,_country.israel,66.4,[]];
    map[_name.bneiSakhnin] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Doha Stadium',5000,1996,_country.israel,62.5,[]];
    map[_name.beitarJerusalem] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(31.7513445, 35.190685),
      'Teddy Stadium',34000,1936,_country.israel,68.3,[]];
    map[_name.hapoelBerSheva] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.2734850, 34.779789),
      'Terner Stadium',16000,1949,_country.israel,69.7,[]];
    map[_name.hapoelHaifa] = [ClubColors(Colors.red,Colors.red),pattern.stripes3,Coordinates(32.783110, 34.9651566),
      'Sammy Ofer',14002,1924,_country.israel,66.9,[]];
    map[_name.hapoelPetah] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(32.10420617, 34.86521629),
      'HaMoshava Stadium',11500,1934,_country.israel,64.3,[]];
    map[_name.hapoelTelAviv] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.0518, 34.7618),
      'Bloomfield Stadium',29400,1927,_country.israel,70.6,[]];
    map[_name.kiryatShmona] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(33.207899, 35.575889),
      'Irony Stadium',5300,2000,_country.israel,63.6,[]];
    map[_name.maccabiHaifa] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(32.7830479, 34.9658581),
      'Sammy Ofer',10000,1913,_country.israel,71.5,[]];
    map[_name.maccabiNetanya] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(32.29447084, 34.86460658),
      'Netanya Stadium',13610,1934,_country.israel,67.5,[]];
    map[_name.maccabiPetach] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(32.10424539, 34.8652313),
      'HaMoshava Stadium',11500,1912,_country.israel,64.6,[]];
    map[_name.maccabiTelAviv] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(32.0517917, 34.761783),
      'Bloomfield Stadium',29400,1906,_country.israel,72.4,[]];
    map[_name.ramatGan] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      '',0,0,_country.israel,62.3,[]];

    //RUSSIA
    map[_name.amkar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(57.990748180, 56.244622619),
      'Zvezda Stadium',19500,1993,_country.russia,69.5,[]];
    map[_name.akhmatGrozny] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(43.3244449, 45.6900699),
      'Sultan Bilimkhanov',10200,1958,_country.russia,71.3,[]];
    map[_name.anzhi] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(42.9079000, 47.618420),
      'Arena Anji',10000,1991,_country.russia,67.3,[]];
    map[_name.tula] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(54.17481890, 37.6025909),
      'Arsenal Stadium',20048,1946,_country.russia,72.4,[]];
    map[_name.baltika] = [ClubColors(Colors.white,Colors.blue),pattern.divided,Coordinates(0,0),
      'Estádio de Kaliningrado',35212,1954,_country.russia,67.3,[]];
    map[_name.cska] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(55.7921064, 37.5159460),
      'VEB Arena',30000,1911,_country.russia,76.6,[]];
    map[_name.dinamoMoscou] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(55.79095156, 37.5610590),
      'Dinamo Lev Yashin Stadium',36000,1923,_country.russia,76.7,[]];
    map[_name.kamaz] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.7322693, 52.4179218),
      'KAMAZ Stadium',6504,1981,_country.russia,61.5,[]];
    map[_name.khimki] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(55.8854723, 37.454475),
      'Arena Khimki',18636,1997,_country.russia,70.1,[]];
    map[_name.krasnodar] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(45.0450492, 39.0294265),
      'Estádio Krasnodar',35074,2008,_country.russia,74.9,[]];
    map[_name.krylyaSovetov] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.277987, 50.2374051),
      'Solidarnost Arena',44918,1942,_country.russia,70.6,[]];
    map[_name.kubanKrasnodar] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Kuban Stadium',31654,1928,_country.russia,64.8,[]];
    map[_name.lokomotivMoscou] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.80355,37.741169),
      'Estádio Lokomotiv de Moscou',28800,1922,_country.russia,73.6,[]];
    map[_name.nizhnyNovgorod] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(56.3374867, 43.963353),
      'Nizhny Novgorod Stadium',44900,2015,_country.russia,71.0,[]];
    map[_name.moskva] = [ClubColors(grena,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Eduard Streltsov',14274,1997,_country.russia,66.6,[]]; //EXTINTO 2010
    map[_name.orenburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.7851665, 55.2210744),
      'Estádio Gazovik',4950,1976,_country.russia,68.9,[]];
    map[_name.rostov] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.20833333,39.74166667),
      'Rostov Arena',45000,1930,_country.russia,71.2,[]];
    map[_name.rotor] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.73463702, 44.54914292288772),
      'Volgograd Arena',45568,1929,_country.russia,70.4,[]];
    map[_name.rubinKazan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.82109839, 49.161094869),
      'Arena Kazan',45379,1958,_country.russia,75.2,[]];
    map[_name.saturn] = [ClubColors(darkblue,Colors.black),pattern.stripes2,Coordinates(55.57756461, 38.2263080),
      'Saturn Stadium',14685,1946,_country.russia,67.8,[]];
    map[_name.shinnikYaroslavl] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(57.62856073, 39.8670769),
      'Shinnik Stadium',22990,1957,_country.russia,66.4,[]];
    map[_name.skaRostov] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'SKA SKVO Stadium',27300,1937,_country.russia,56.8,[]];
    map[_name.sochi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.401925, 39.9562793781204),
      'Fisht',47659,2018,_country.russia,75.2,[]];
    map[_name.spartakmoscou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.8178315, 37.4406002),
      'Otkrytie Arena',44929,1922,_country.russia,77.2,[]];
    map[_name.spartakNalchik] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.46994792, 43.59084541),
      'Spartak Stadium de Nalchik',14400,1935,_country.russia,60.8,[]];
    map[_name.tomtomsk] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(56.4743242, 84.956598),
      'Estádio Trud',15000,1921,_country.russia,66.4,[]];
    map[_name.torpedo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(55.7164327, 37.6563151),
      'Eduard Streltsov',13400,1930,_country.russia,69.4,[]];
    map[_name.ufa] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(54.82587214, 56.0614233),
      'Neftyanik',16500,2009,_country.russia,69.8,[]];
    map[_name.ural] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.8325198, 60.573520),
      'Arena Ekaterinburg',35163,1930,_country.russia,71.2,[]];
    map[_name.alania] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(43.0233065, 44.69528968),
      'Republican Spartak Stadium',32464,1921,_country.russia,68.5,[]];
    map[_name.zenit] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(59.97280838, 30.2220053),
      'Gazprom Arena',69000,1925,_country.russia,78.2,[]];

    //UKRAINE
    map[_name.odesa] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(46.48055848, 30.7556973),
      'Chornomorets Stadium',40003,1925,_country.ukraine,69.4,[]];
    map[_name.desna] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.50177025, 31.327121),
      'Yurii Haharin Stadium',12060,1960,_country.ukraine,68.6,[]];
    map[_name.dinamokiev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.4334322, 30.52202498),
      'Olímpico de Kiev',70050,1927,_country.ukraine,77.3,[_name.shaktardonetsk]];
    map[_name.dnipro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Dnipro Arena',31003,1918,_country.ukraine,73.3,[]]; //FALIU
    map[_name.dnipro1] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(48.46047234, 35.03251905),
      'Dnipro Arena',31003,2017,_country.ukraine,73.3,[]];
    map[_name.karpatyLviv] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(49.8191412, 24.0478958),
      'Ukraina Stadium',28051,1963,_country.ukraine,62.9,[]];
    map[_name.kolosKovalivka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.35419316, 30.95251878),
      'Kolos Stadium',5000,2012,_country.ukraine,68.3,[]];
    map[_name.lviv] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7749650, 24.02770639),
      'Arena Lviv',34915,1992,_country.ukraine,70.6,[]];
    map[_name.metalist] = [ClubColors(Colors.black,Colors.blue),pattern.oneVertStripe,Coordinates(49.9810, 36.2617732),
      'OSC Metalist',34164,1936,_country.ukraine,73.8,[]];
    map[_name.oleksandriya] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(48.674966326, 33.1038229),
      'CSC Nika',7000,1948,_country.ukraine,67.8,[]];
    map[_name.rukhLviv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.7742804, 24.02852715),
      'Arena Lviv',34915,2003,_country.ukraine,67.0,[]];
    map[_name.shaktardonetsk] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(50.433542433, 30.522135),
      'Donbass Arena',52187,1936,_country.ukraine,78.0,[_name.dinamokiev]];
    map[_name.veresRivne] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.6236054, 22.2762846),
      'Avanhard Stadium',12080,1957,_country.ukraine,66.4,[]];
    map[_name.vorskla] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(49.5948672, 34.5490243),
      'Butovsky Memorial Vorskla',25000,1955,_country.ukraine,69.6,[]];
    map[_name.zorya] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.859599, 35.097371331),
      'Slavutych Arena',22888,1923,_country.ukraine,72.5,[]];
    //EX-URSS
    //MOLDOVA
    map[_name.daciaChisinau] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Stadionul Dacia',8550,1999,_country.moldova,50.0,[]]; //EXTINTO 2018
    map[_name.milsami] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.37443160, 28.819647943),
      'Complexul Sportiv Raional Orhei',3023,2005,_country.moldova,66.9,[]];
    map[_name.sheriffTiraspol] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(46.8383774, 29.558222),
      'Sheriff Stadium',12746,1997,_country.moldova,70.7,[]];
    map[_name.zimbru] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(46.9803721, 28.86797756),
      'Zimbru Stadium',10400,1947,_country.moldova,68.6,[]];
    //BELARUS
    map[_name.bate] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(54.1927777,28.475694444),
      'Borisov Arena',12900,1973,_country.belarus,72.1,[]];
    map[_name.dinamoBrest] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(52.089810, 23.6836123),
      'Sport Complex Brestskiy',10060,1960,_country.belarus,70.2,[]];
    map[_name.dinamoMinsk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.881454, 27.6175440),
      'Traktar Stadium',16500,1927,_country.belarus,70.8,[]];
    map[_name.dnepr] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.9054588, 30.34092),
      'Spartak Stadion',11200,1960,_country.belarus,61.2,[]];
    map[_name.energetik] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(53.859588, 27.5017443),
      'RCOP-BGU Stadium',15000,1996,_country.belarus,68.1,[]];
    map[_name.gomel] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(52.436713874, 31.0121813),
      'Central Stadium',14307,1959,_country.belarus,65.5,[]];
    map[_name.slaviamozyr] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.09769, 25.3062183),
      'Yunost Stadium',5353,1987,_country.belarus,58.6,[]];
    map[_name.soligorsk] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.79859758, 27.5382051),
      'Estádio Stroitel',4200,1961,_country.belarus,67.3,[]];
    //AZERBAIJÃO
    map[_name.baku] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'FC Baku Training Base',2500,1997,_country.azerbaijan,50.0,[]]; //EXTINTO 2018
    map[_name.shamakhi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.41097398, 49.89786188),
      'Shafa Stadium',2200,1997,_country.azerbaijan,64.8,[]];
    map[_name.neftci] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(40.4001566, 49.9438641),
      'Bakcell Arena',11000,1906,_country.azerbaijan,70.6,[]];
    map[_name.kapaz] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(40.70590163, 46.36198384),
      'Ganja City Stadium',25000,1959,_country.azerbaijan,64.4,[]];
    map[_name.khazar] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(0,0),
      'Lankaran City Stadium',2000,2004,_country.azerbaijan,50.0,[]]; //EXTINTO 2016
    map[_name.neftchiFargona] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(40.358953392, 50.29314366),
      'Zira Olympic Sport Complex',1200,2014,_country.azerbaijan,67.4,[]];
    map[_name.qabala] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(40.9845888, 47.834242336),
      'Gabala City Stadium',4500,1995,_country.azerbaijan,69.5,[]];
    map[_name.qarabag] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.3974049, 49.852724642),
      'Estádio Tofig Bahramov',31200,1951,_country.azerbaijan,71.5,[]];
    map[_name.sabahFK] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(60.20558128, 24.929022),
      'Alinjaa Arena',13000,2017,_country.azerbaijan,65.5,[]];
    map[_name.shamkir] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Shamkir Olympic Sport Complex Stadium',2000,1954,_country.azerbaijan,50.0,[]]; // EXTINTO 2017
    map[_name.zira] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(40.358953392, 50.29314366),
      'Zira Olympic Sport Complex',1200,2014,_country.azerbaijan,67.4,[]];
    //CAZAQUISTÃO
    map[_name.aktobe] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(50.29155, 57.15927),
      'Aktobe Central Stadium',13200,1967,_country.kazakhstan,68.2,[]];
    map[_name.almaata] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Almaty Central Stadium',23804,2000,_country.kazakhstan,60.5,[]]; //EXTINTO 2008
    map[_name.atyrau] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.0939371, 51.90870177),
      'Munayshy Stadium',9000,1980,_country.kazakhstan,63.1,[]];
    map[_name.astana] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(51.1083829, 71.4031747),
      'Astana Arena',30000,2009,_country.kazakhstan,71.7,[]];
    map[_name.ekibastuzets] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Shakhter',6300,2003,_country.kazakhstan,58.8,[]];
    map[_name.irtysh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Central Stadium',20000,1965,_country.kazakhstan,50.0,[]]; //EXTINTO 2020
    map[_name.kairat] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(43.238482, 76.924193),
      'Central Stadium',23804,1954,_country.kazakhstan,69.6,[]];
    map[_name.kaisar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Gany Muratbayev',7000,1968,_country.kazakhstan,64.5,[]];
    map[_name.okzhetpes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.285220, 69.3924265),
      'Okzhetpes Stadium',10000,1957,_country.kazakhstan,64.2,[]];
    map[_name.ordabasy] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(42.335537, 69.59348),
      'Kazhimukan Munaitpasov Stadium',20000,1958,_country.kazakhstan,67.3,[]];
    map[_name.shakhter] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(49.8186566, 73.0752474),
      'Shakhter Stadium',19000,1958,_country.kazakhstan,69.5,[]];
    map[_name.semey] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(50.4148987, 80.241398),
      'Spartak Stadium',8000,1964,_country.kazakhstan,62.5,[]];
    map[_name.taraz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.902019, 71.382288),
      'Taraz Central Stadium',12525,1967,_country.kazakhstan,65.0,[]];
    map[_name.tobol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(53.2263205, 63.636574),
      'Tsentralny Kostanay',8323,1967,_country.kazakhstan,64.4,[]];
    map[_name.zhenis] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.162695, 71.4133405),
      'K.Munaitpasov Stadium',12343,1964,_country.kazakhstan,63.5,[]];
    map[_name.zhetysu] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.019810, 78.3668398),
      'Stadion Zhetysu',5500,1981,_country.kazakhstan,63.1,[]];

    //GEORGIA
    map[_name.tbilisi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.722937, 44.78977),
      'Boris Paichadze Dinamo Arena',54549,1925,_country.georgia,70.6,[]];
    map[_name.batumi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.8126276, 41.77440),
      'Chele Arena',6000,1923,_country.georgia,68.6,[]];
    map[_name.dila] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.983075, 44.1038858),
      'Tengiz Burjanadze',8230,1949,_country.georgia,66.4,[]];
    map[_name.georgia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Shevardeni Stadim',10000,1968,_country.georgia,64.1,[]];
    map[_name.kutaisi] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(42.25514748, 42.683279),
      'Estádio Givi Kiladze',14700,1946,_country.georgia,67.5,[]];
    map[_name.metrustavi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Poladi Stadium',3000,1948,_country.georgia,50.0,[]]; //EXTINTO 2016
    map[_name.olirustavi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Poladi Stadium',3000,1948,_country.georgia,50.0,[]]; //EXTINTO 2016
    map[_name.saburtalo] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(41.7096506, 44.7464957),
      'Estádio Mikheil Meskhi',25453,1999,_country.georgia,68.1,[]];
    map[_name.samtredia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Erosi Manjgaladze Stadium',3000,1936,_country.georgia,62.6,[]];
    map[_name.zestafoni] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'David Abashidze Stadium',4558,2004,_country.georgia,61.6,[]];
    //ARMENIA
    map[_name.araratArmenia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(40.1713237, 44.5255822),
      'Vazgen Sargsyan Republican',14530,2017,_country.armenia,69.1,[]];
    map[_name.araratYerevan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.18052, 44.4948721),
      'Hrazdan Stadium',53849,1935,_country.armenia,70.5,[]];
    map[_name.alashkent] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.15448480, 44.47532),
      'Alashkert Stadium',22570,1921,_country.armenia,68.2,[]];
    map[_name.mika] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Mika Stadium',8000,1985,_country.armenia,50.0,[]];//EXTINTO 2016
    map[_name.pyunikyerevan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.17168518, 44.5257160),
      'Hanrapetakan Stadium',15000,1992,_country.armenia,67.7,[]];
    map[_name.shirak] = [ClubColors(Colors.orange,Colors.white),pattern.oneHorStripe,Coordinates(40.7854547, 43.8336913),
      'Gyumri City Stadium',3000,1958,_country.armenia,63.1,[]];
    map[_name.ulisses] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Hanrapetakan Stadium',15000,2000,_country.armenia,50.0,[]];//EXTINTO 2016
    map[_name.urartu] = [ClubColors(Colors.purple,Colors.orange),pattern.solid,Coordinates(0,0),
      'Banants Stadium',6000,1992,_country.armenia,61.6,[]];
    //BALTICOS
    //ESTONIA
    map[_name.norma] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Norma Staadion',1000,1959,_country.estonia,50.0,[]]; //EXTINTO 1997
    map[_name.floratallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.421331, 24.73216),
      'A. Le Coq Arena',10340,1990,_country.estonia,67.5,[]];
    map[_name.kajlu] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(59.3857124, 24.6593233),
      'Hiiu staadion',500,1923,_country.estonia,57.5,[]];
    map[_name.lantana] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Viimsi Stadium',2000,1994,_country.estonia,50.0,[]]; //EXTINTO 1999
    map[_name.levadiatallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.434562537, 24.7830739),
      'Kadrioru Stadium',4700,1998,_country.estonia,66.2,[]];
    map[_name.narvatrans] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(59.3638292, 28.18413),
      'Kreenholmi Staadion',3000,1979,_country.estonia,61.2,[]];
    map[_name.paide] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(58.8783763, 25.54076747),
      'ÜG Stadium',250,1990,_country.estonia,65.4,[]];
    map[_name.tvmk] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Kadrioru Staadion',4750,1951,_country.estonia,50.0,[]]; //EXTINTO 2008
    //LATVIA
    map[_name.jurmala] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.9495508, 23.6100709),
      'Slokas Stadium',2500,2007,_country.latvia,58.6,[]];
    map[_name.liepaja] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(56.954951357, 24.1588003),
      'Daugava Stadium',5083,2014,_country.latvia,61.3,[]];
    map[_name.rigafc] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(56.961413, 24.116308),
      'Skonto',9100,2014,_country.latvia,68.4,[]];
    map[_name.rigaRFS] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.90891835, 24.15514115),
      'LNK Sporta Parks',1000,2011,_country.latvia,68.0,[]];
    map[_name.skonto] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Skonto Stadions',10000,1991,_country.latvia,50.0,[]]; //EXTINTO 2016
    map[_name.valmiera] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(57.5410309, 25.4417177),
      'Jānis Daliņš',2000,1996,_country.latvia,67.2,[]];
    map[_name.ventspils] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(57.38822925, 21.571723),
      'Ventspils Olimpiskais Stadions',3200,1997,_country.latvia,50.0,[]];
    //LITHUANIA
    map[_name.ekranas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(55.730649, 24.371222),
      'Draugystes Stadium',4000,1964,_country.lithuania,64.8,[]];
    map[_name.suduva] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(54.5747184, 23.365261),
      'Marijampolės futbolo arena',6250,1968,_country.lithuania,68.7,[]];
    map[_name.kaunu] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(54.89744355, 23.937322),
      'Dariaus ir Girėno stadionas',15315,2004,_country.lithuania,67.1,[]];
    map[_name.zalgiris] = [ClubColors(Colors.green,Colors.greenAccent),pattern.stripes2,Coordinates(54.669264, 25.2951),
      'LFF Stadium',5400,1947,_country.lithuania,70.5,[]];

    //SERVIA
    map[_name.estrelavermelha] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(44.783172, 20.465097),
      'Rajko Mitić',55538,1945,_country.serbia,75.3,[_name.partizan]];
    map[_name.partizan] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(44.7886175, 20.45902),
      'Stadion Partizana',32710,1945,_country.serbia,74.6,[_name.estrelavermelha]];
    map[_name.backaTopola] = [ClubColors(darkblue,Colors.black),pattern.stripes4,Coordinates(45.8157165, 19.6273806),
      'TSC Arena',4500,1913,_country.serbia,62.7,[]];
    map[_name.cukaricki] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.7603344, 20.4245656),
      'Čukarički Stadion',7000,1926,_country.serbia,67.6,[]];
    map[_name.obilic] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(44.79161557, 20.49474531),
      'FK Obilić Stadium',4600,1924,_country.serbia,66.7,[]];
    map[_name.ofkBelgrade] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(44.815326, 20.4938369),
      'Omladinski Stadion',20000,1911,_country.serbia,68.6,[]];
    map[_name.radnik] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.6924068, 22.1655271),
      'Surdulica City Stadium',3312,1926,_country.serbia,63.3,[]];
    map[_name.radnicki] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(43.31552, 21.9088012),
      'Čair Stadium',18151,1923,_country.serbia,67.5,[]];
    map[_name.subotica] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(46.0818169, 19.6768421),
      'Gradski Stadium',13000,1945,_country.serbia,63.5,[]];
    map[_name.velezMostar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.3784511, 17.85448365),
      'Stadion Rođeni',7000,1922,_country.serbia,68.1,[]];
    map[_name.vojvodina] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(45.24694, 19.8417566),
      'Stadium of Vojvodina',15754,1914,_country.serbia,71.4,[]];
    map[_name.vozdovac] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.7748805, 20.4901423),
      'Voždovac Stadium',5200,1912,_country.serbia,65.1,[]];
    //BULGARIA
    map[_name.beroe] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(42.4326854, 25.61541325),
      'Estádio Beroe',12128,1916,_country.bulgaria,67.5,[]];
    map[_name.botevPlovdiv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(42.86054836, 25.3195),
      'Hristo Botev Stadium',18777,1912,_country.bulgaria,64.8,[]];
    map[_name.chernomore] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(43.215765, 27.9311821),
      'Ticha',12500,1913,_country.bulgaria,64.2,[]];
    map[_name.cskaSofia] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.6842594, 23.339714),
      'Balgarska Armiya Stadium',22015,1948,_country.bulgaria,72.7,[]];
    map[_name.levskiSofia] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.7054198, 23.3632712),
      'Georgi Aspraruhov',29980,1914,_country.bulgaria,70.6,[]];
    map[_name.litexLovech] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(43.1429592, 24.72480435),
      'Lovech Stadium',8000,1921,_country.bulgaria,68.6,[]];
    map[_name.lokplovdiv] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.1338578, 24.77161877),
      'Lokomotiv',11800,1926,_country.bulgaria,69.3,[]];
    map[_name.loksofia] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.737672, 23.314724),
      'Lokomotiv Stadium',22000,1929,_country.bulgaria,66.5,[]];
    map[_name.ludogorets] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(43.5344062, 26.5281217),
      'Ludogorets Arena',12500,1940,_country.bulgaria,75.6,[]];
    map[_name.slaviaSofia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.675321, 23.27190),
      'Slavia Stadium',15992,1913,_country.bulgaria,69.6,[]];
    map[_name.sofia1948] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.5910188, 23.3634639),
      'Stadion Bistritsa',2500,1948,_country.bulgaria,68.7,[]];
    map[_name.spartakPlovdiv] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(42.1315663, 24.74390948),
      'Todor Diev Stadium',3500,1947,_country.bulgaria,63.4,[]];
    //CROATIA
    map[_name.dinamozagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.818673, 16.018165),
      'Maksimir',38923,1911,_country.croatia,77.5,[_name.hadjuksplit]];
    map[_name.gorica] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.7239381, 16.0730582),
      'Gradski stadion Velika Gorica',5200,2009,_country.croatia,67.4,[]];
    map[_name.hadjuksplit] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.5198462, 16.432361),
      'Polijud',35000,1911,_country.croatia,73.2,[_name.dinamozagreb]];
    map[_name.istra] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(44.86177027, 13.8514561),
      'Stadion Aldo Drosina',9800,1961,_country.croatia,63.2,[]];
    map[_name.lokZagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8045, 15.96078837),
      'Stadion Kranjčevićeva',8850,1914,_country.croatia,67.5,[]];
    map[_name.nkzagreb] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.8040032, 15.96063943),
      'Stadion Kranjčevićeva',8850,1903,_country.croatia,64.1,[]];
    map[_name.osijek] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.5449856, 18.6955684),
      '	Stadion Gradski vrt',18856,1947,_country.croatia,69.8,[]];
    map[_name.rijeka] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(45.347946972, 14.4026226413),
      'Kantrida',12600,1906,_country.croatia,72.2,[]];
    //REP. TCHECA
    map[_name.banikostrava] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.845337, 18.2991878),
      'Bazaly',17400,1922,_country.czechRepublic,71.8,[]];
    map[_name.bohemians] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.067005, 14.454192422766054),
      'Ďolíček',5000,1905,_country.czechRepublic,69.8,[]];
    map[_name.brno] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.22719586, 16.586590),
      'Městský fotbalový Stadion Srbská',12550,1913,_country.czechRepublic,67.5,[]];
    map[_name.jablonec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.715097, 15.16240467),
      'Stadion Střelnice',6280,1945,_country.czechRepublic,68.5,[]];
    map[_name.sigmaOlomouc] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.6001989, 17.24822126),
      'Andrův stadion',12566,1919,_country.czechRepublic,64.0,[]];
    map[_name.slaviaPraha] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(50.06761576, 14.4717161),
      'Stadion Eden',21000,1892,_country.czechRepublic,76.1,[_name.spartapraga]];
    map[_name.slovacko] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.914364, 14.619126),
      'Městský fotbalový Miroslava Valenty',8121,1927,_country.czechRepublic,68.8,[]];
    map[_name.slovanLiberec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.77632357, 15.0500971),
      'Stadion u Nisy',10000,1921,_country.czechRepublic,70.6,[]];
    map[_name.spartapraga] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(50.0999540, 14.41632580),
      'Generali Arena',20111,1893,_country.czechRepublic,75.2,[_name.slaviaPraha]];
    map[_name.teplice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.6400542, 13.81769347),
      'Na Stínadlech',18221,1945,_country.czechRepublic,69.6,[]];
    map[_name.viktoriaPlzen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7500716, 13.385528253),
      'Doosan Arena',12500,1911,_country.czechRepublic,73.8,[]];
    map[_name.dukla] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.czechRepublic,50.0,[]];
    map[_name.hradec] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.czechRepublic,50.0,[]];
    map[_name.vitkovice] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.czechRepublic,50.0,[]];
    //HUNGRIA
    map[_name.csepel] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0 ,0),
      'Béke téri Stadion',10000,1912,_country.hungary,62.5,[]];
    map[_name.debreceni] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.55435955, 21.63374620),
      'Nagyerdei Stadion',20020,1902,_country.hungary,68.5,[]];
    map[_name.dunaujvaros] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.9556349, 18.9473997),
      'Dunaferr Arena',12000,1952,_country.hungary,62.5,[]]; //EXTINTO 2009
    map[_name.fehervar] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(47.17372825, 18.41546374),
      'MOL Aréna Sóstó',14201,1941,_country.hungary,66.8,[]];
    map[_name.ferencvaros] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(47.475396323, 19.0958288),
      'Gouprama Arena',22000,1899,_country.hungary,73.2,[]];
    map[_name.gyori] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.69580, 17.663847462),
      'ETO Park',16000,1904,_country.hungary,69.0,[]];
    map[_name.haladas] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.2348707, 16.606894),
      'Haladás Sportkomplexum',9859,1919,_country.hungary,63.5,[]];
    map[_name.honved] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.442567, 19.1553822),
      'József Bozsik',15000,1909,_country.hungary,72.4,[]];
    map[_name.kisvarda] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.23324767, 22.0744867),
      'Várkert Sportpálya',2750,1911,_country.hungary,65.7,[]];
    map[_name.mezokovesd] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Városi',5000,1975,_country.hungary,60.5,[]];
    map[_name.mtk] = [ClubColors(Colors.blue,Colors.white),pattern.diagonal,Coordinates(47.490919444,19.106725),
      'Hidegkuti Nándor Stadion',12700,1888,_country.hungary,68.1,[]];
    map[_name.paks] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Fehérvári úti Stadion',6150,1952,_country.hungary,61.6,[]];
    map[_name.pecsi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(46.068974316, 18.19581976),
      'Stadium of Újmecsekalja',7000,1950,_country.hungary,64.6,[]];
    map[_name.puskas] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(47.4640167, 18.586763),
      'Pancho Aréna',3816,2005,_country.hungary,67.5,[]];
    map[_name.tatabanya] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(47.72165907, 18.7381678),
      'Stadion Gyula Grosics',5021,1910,_country.hungary,61.5,[]];
    map[_name.ujpest] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(47.5750, 19.085368),
      'Ferenc Szusza',13600,1885,_country.hungary,68.6,[]];
    map[_name.vac] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(47.767658, 19.13800025),
      'Stadion Városi Vác',9000,1899,_country.hungary,62.5,[]];
    map[_name.vasas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(47.537036, 19.080578381),
      'Rudolf Illovszky',18000,1911,_country.hungary,70.3,[]];
    map[_name.vasutas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(47.5235393, 19.0915621),
      'Szőnyi úti Stadion',12000,1911,_country.hungary,56.2,[]];
    map[_name.zalaegerszeg] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(46.84870487, 16.84871709),
      'ZTE Arena',14000,1920,_country.hungary,61.3,[]];
    //ROMENIA
    map[_name.aerostarBacau] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(46.5297339, 26.91247324),
      'Aerostar',1500,1977,_country.romania,63.0,[]];
    map[_name.argesPitesti] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(44.8466756, 24.866616),
      'Stadionul Nicolae Dobrin',15000,1953,_country.romania,68.9,[]];
    map[_name.astragiurgiu] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(43.89618939, 25.98156285),
      'Marin Anastasovici',8500,1921,_country.romania,56.8,[]];
    map[_name.brasov] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(45.664853, 25.5857),
      'Estádio Silviu Ploeşteanu',8850,1936,_country.romania,55.7,[]];
    map[_name.cluj] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.779678,23.577247),
      'Stadionul Dr. Constantin Rădulescu',21000,1907,_country.romania,70.8,[]];
    map[_name.dinamoBucuresti] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.455083,26.102444),
      'Stadionul Dinamo',15300,1948,_country.romania,68.5,[]];
    map[_name.nationalbuc] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(44.42769962, 26.0747849),
      'Stadionul Cotroceni',14542,1944,_country.romania,64.3,[]];
    map[_name.rapidBucuresti] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(44.45708788, 26.05564517),
      'Estádio Giulești-Valentin Stănescu',19100,1929,_country.romania,67.2,[]];
    map[_name.steauaBucuresti] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(44.43741937, 26.15314218),
      'Arena Națională',55634,1947,_country.romania,71.2,[]];
    map[_name.arad] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(46.15233222, 21.319844858),
      'Stadionul Motorul',2000,1945,_country.romania,64.8,[]];
    map[_name.craiova] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(44.3140987, 23.7841649),
      'Stadionul Ion Oblemenco',30983,1948,_country.romania,66.4,[]];
    map[_name.otelul] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.solid,Coordinates(45.430125, 28.0224765),
      'Stadionul Oțelul',13500,1964,_country.romania,65.7,[]];
    map[_name.petrolul] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(44.9406576, 26.03463332),
      'Stadionul Ilie Oană',15500,1952,_country.romania,62.1,[]];
    map[_name.sepsi] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(45.8813477, 25.80823296),
      'Sepsi Arena',8400,2011,_country.romania,63.8,[]];
    map[_name.sportul] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0, 0),
      'Regie',10020,1916,_country.romania,60.6,[]]; //EXTINTO 2017
    map[_name.targuMures] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio Trans-Sil',8200,2004,_country.romania,61.6,[]];
    map[_name.timisoara] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0, 0),
      '',0,2012,_country.romania,50.0,[]]; //EXTINTO 2021
    map[_name.unirea] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Tineretului',7000,1954,_country.romania,62.1,[]]; //EXTINTO 2015
    map[_name.vitorul] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(44.236319, 28.56572443),
      'Stadionul Viitorul',4500,2009,_country.romania,64.7,[]];
    //ESLOVAQUIA
    map[_name.dac1904] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(50.91490, 14.6191298),
      'Mestský Stadion',16410,1904,_country.slovakia,64.5,[]];
    map[_name.interBratislava] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(48.1760430, 17.05031259),
      'Stadium ŠKP Inter Dúbravka',10200,1940,_country.slovakia,68.3,[]];
    map[_name.kosice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(48.69671807, 21.2451513),
      'Košická futbalová aréna',5836,2018,_country.slovakia,62.8,[]];
    map[_name.petrzalka] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Štadión Rapid',10000,1898,_country.slovakia,64.4,[]];
    map[_name.ruzomberok] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(0, 0),
      'Štadión pod Čebraťom',4876,1906,_country.slovakia,60.4,[]];
    map[_name.slovanBratislava] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(48.1659626, 17.14220898),
      'Pasienky',30085,1919,_country.slovakia,72.7,[]];
    map[_name.trencin] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.slovakia,60.4,[]];
    map[_name.trnava] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.3736672, 17.5916824),
      'Štadión Antona Malatinského',18448,1923,_country.slovakia,68.1,[]];
    map[_name.zilina] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(49.229209, 18.7446925),
      'Štadión pod Dubňom',11258,1908,_country.slovakia,67.3,[]];

    //OUTROS
    //ALBANIA
    map[_name.dinamoTirana] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.318298, 19.8241820),
      'Arena Kombëtare',21690,1950,_country.albania,64.0,[]];
    map[_name.elbasani] = [ClubColors(Colors.yellow,Colors.blue),pattern.horStripes3,Coordinates(41.6424706, 19.711743),
      'Stadiumi “Elbasan Arena”',12800,1913,_country.albania,60.3,[]];
    map[_name.flamurtari] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(40.4558467, 19.48874438),
      'Flamurtari Stadium',8500,1923,_country.albania,61.6,[]];
    map[_name.tiranafk] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(41.319399, 19.81133),
      'Selman Stermasi Stadium',7000,1920,_country.albania,68.1,[]];
    map[_name.kukesi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.079203526, 20.42031655),
      'Zeqir Ymeri Stadium',6000,1930,_country.albania,63.2,[]];
    map[_name.laci] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(41.6424706, 19.711743),
      'Laçi Stadium',4500,1960,_country.albania,65.3,[]];
    map[_name.partizanitirane] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.3191655, 19.8114063),
      'Selman Stërmasi Stadium',20600,1946,_country.albania,64.7,[]];
    map[_name.skenderbeu] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(40.626209, 20.7830302),
      'Skënderbeu Stadium',12000,1909,_country.albania,63.8,[]];
    map[_name.teutaDurres] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.3262515, 19.4497168),
      'Stadioni Niko Dovana',13000,1920,_country.albania,62.0,[]];
    map[_name.vllaznia] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(42.07005, 19.5066547),
      'Loro-Boriçi Stadium',20300,1919,_country.albania,63.5,[]];
    //ESLOVENIA
    map[_name.celje] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(46.2465780, 15.2699934),
      'Arena Petrol',13006,1919,_country.slovenia,65.6,[]];
    map[_name.domzale] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(46.136925, 14.60178),
      'Športni Park',3212,1921,_country.slovenia,66.2,[]];
    map[_name.koper] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.54241704, 13.730497),
      'Bonifika',4047,1920,_country.slovenia,62.2,[]];
    map[_name.ljublijana] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(46.0804351, 14.524180),
      'Športni park Stožice',16038,2005,_country.slovenia,69.5,[]];
    map[_name.maribor] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(46.5625,15.640556),
      'Ljudski vrt',12702,1960,_country.slovenia,70.8,[]];
    map[_name.mura] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(46.6685624, 16.1575858),
      'Fazanerija',3782,2012,_country.slovenia,68.7,[]];
    //MACEDONIA
    map[_name.akaPandev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.437822, 22.768785),
      'Stadion Kukuš',1500,2010,_country.macedonia,62.3,[]];
    map[_name.makedonija] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(42.002417, 21.359890),
      'Gjorče Petrov Stadium',5000,1932,_country.macedonia,65.8,[]];
    map[_name.pobeda] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.3436145, 21.562009),
      'Stadion Goce Delčev',15000,1941,_country.macedonia,65.6,[]];
    map[_name.rabotnicki] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.0057251, 21.4255607),
      'Philip II Arena',24000,1937,_country.macedonia,63.2,[]];
    map[_name.silekskratovo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes4,Coordinates(42.0808824, 22.1640989),
      'Gradski stadion Kratovo',1800,1965,_country.macedonia,67.5,[]];
    map[_name.shkendija] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(42.0186995, 20.97822),
      'Čair Stadium',15000,1979,_country.macedonia,64.4,[]];
    map[_name.shkupi] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.015522, 21.4446538),
      'Čair Stadium',6000,1927,_country.macedonia,64.1,[]];
    map[_name.sloga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Čair Stadium',6000,1927,_country.macedonia,50.0,[]]; //EXTINTO 2009
    map[_name.vardar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(42.0060954, 21.425804),
      'Nacional Arena Philip II Macedônia',24000,1947,_country.macedonia,68.2,[]];
    //BOSNIA
    map[_name.posusje] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(43.4693346, 17.32777),
      'Stadion Mokri Dolac',8000,1950,_country.bosnia,63.6,[]];
    map[_name.sarajevo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.87391863, 18.409078),
      'Asim Ferhatović Hase',35630,1946,_country.bosnia,65.9,[]];
    map[_name.siroki] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.378697, 17.5979072),
      'Pecara Stadium',8000,1948,_country.bosnia,61.5,[]];
    map[_name.zeljeznicar] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.8465035, 18.3874076),
      'Stadion Grbavica',20841,1921,_country.bosnia,66.1,[]];
    map[_name.zrinjski] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(43.3456540, 17.795418),
      'Bijeli Brijeg Stadium',25000,1905,_country.bosnia,68.0,[]];
    //KOSOVO
    map[_name.ballkani] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(42.38421140, 20.434450),
      'Suva Reka City Stadium',1500,1947,_country.kosovo,64.8,[]];
    map[_name.drita] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.46440065, 21.476240),
      '	Gjilan City Stadium',15000,1947,_country.kosovo,63.0,[]];
    map[_name.llapi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.90515045, 21.19488228),
      'Zahir Pajaziti Stadium',5000,1932,_country.kosovo,63.5,[]];
    map[_name.prishtina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6628634, 21.15705135),
      'Estádio Pristina City',16200,1922,_country.kosovo,64.6,[]];
    //MONTENEGRO
    map[_name.decic] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.360000, 19.32624168),
      'Stadion Tuško Polje',2000,1926,_country.montenegro,62.1,[]];
    map[_name.iskra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.7849487, 18.9537585),
      'Braća Velašević Stadium',2500,1919,_country.montenegro,60.7,[]];
    map[_name.mogren] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stadion Lugovi',1500,1920,_country.montenegro,50.0,[]]; //EXTINTO 2017
    map[_name.podgorica] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(42.44493750, 19.26417934),
      'Podgorica City Stadium',12000,1925,_country.montenegro,66.1,[]];
    map[_name.rudar] = [ClubColors(darkblue,Colors.red),pattern.horStripes3,Coordinates(45.72432, 16.0732426),
      'Gradski stadion',5140,1920,_country.montenegro,61.5,[]];
    map[_name.sutjeska] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(45.72432, 16.0734067),
      'Gradski stadion',5214,1927,_country.montenegro,63.8,[]];
    map[_name.titograd] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.429458, 19.282983),
      'Mladost Stadium',1250,1951,_country.montenegro,59.8,[]];
    map[_name.zeta] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.32850749, 19.2405928),
      'Stadion Trešnjica',4000,1927,_country.montenegro,59.3,[]];
    //LUXEMBURGO
    map[_name.arisbennevoie] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Stade Josy Barthel',8054,1922,_country.luxembourg,50.0,[]]; //EXTINTO 2001
    map[_name.avenir] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.6464919, 6.135636),
      'Stade rue Henri Dunant',4830,1915,_country.luxembourg,62.7,[]];
    map[_name.differdange] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade du Thillenberg',7150,1907,_country.luxembourg,50.0,[]]; //EXTINTO 2003
    map[_name.dudelange] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.473037, 6.08512806),
      'Jos Nosbaum',2558,1921,_country.luxembourg,64.4,[]];
    map[_name.folaesch] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(49.492051311, 5.989538023),
      'Stade Émile Mayrisch',7826,1906,_country.luxembourg,58.4,[]];
    map[_name.grevenmacher] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Op Flohr Stadion',4062,1909,_country.luxembourg,52.1,[]];
    map[_name.jeunesseesch] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(49.48596292, 5.97704983),
      'Stade de la Frontière',8200,1907,_country.luxembourg,63.1,[]];
    map[_name.niederkorn] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Stade Jos Haupert',4830,1919,_country.luxembourg,54.4,[]];
    map[_name.rumelange] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade Municipal',2950,1908,_country.luxembourg,52.1,[]];
    map[_name.sporalux] = [ClubColors(darkblue,Colors.yellow),pattern.oneHorStripe,Coordinates(0, 0),
      'Stade Josy Barthel,',8054,1923,_country.luxembourg,50.0,[]]; //EXTINTO 2005 VIROU RACING LUXEMBURG
    map[_name.stadedud] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Stade Aloyse Meyer',3000,1913,_country.luxembourg,50.0,[]]; //VIROU F91 DUDELANGE
    map[_name.unionlux] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(49.60474, 6.1402570),
      'Stade Achille Hammerel',7611,1925,_country.luxembourg,58.3,[]];
    //Liechtenstein
    map[_name.balzers] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.073456, 9.494012),
      'Sportplatz Rheinau',2000,1932,_country.liechtenstein,62.8,[]];
    map[_name.eschenMauren] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(47.20567226, 9.53788747),
      'Sportpark Eschen-Mauren',6000,1963,_country.liechtenstein,64.7,[]];
    map[_name.rugell] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(47.246507411, 9.52702523),
      'Freizeitpark Widau',500,1958,_country.liechtenstein,61.6,[]];
    map[_name.schaan] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(47.16575044, 9.49254718),
      'Sportanlage Rheinwiese',1500,1949,_country.liechtenstein,59.5,[]];
    map[_name.triesen] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.110492, 9.519495),
      'Sportanlage Blumenau',2100,1932,_country.liechtenstein,55.4,[]];
    map[_name.vaduz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.1404698, 9.51056035),
      'Rheinpark Stadion',7838,1932,_country.liechtenstein,68.3,[]];
    //MALTA
    map[_name.balzan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'St Aloysius College',0,1937,_country.malta,55.5,[]];
    map[_name.birkirkara] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(35.895129, 14.45902679),
      'Infetti Ground',1500,1950,_country.malta,53.5,[]];
    map[_name.floriana] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(35.8951638, 14.5057624),
      'Independence Ground',3000,1894,_country.malta,56.4,[]];
    map[_name.gzira] = [ClubColors(grena,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      '',0,1947,_country.malta,62.3,[]];
    map[_name.hamrun] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(35.8874298, 14.49243820),
      'Victor Tedesco Stadium',2000,1907,_country.malta,61.4,[]];
    map[_name.hiberniansMALTA] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(35.8826548, 14.5131219),
      'Hibernians Stadium',2968,1922,_country.malta,66.1,[]];
    map[_name.marsaxlokk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.83648264, 14.543407218),
      'Marsaxlokk Ground',1000,1949,_country.malta,56.5,[]];
    map[_name.rabatajax] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(35.89291065, 14.401519269),
      'Rabat Ajax Football Ground',700,1930,_country.malta,52.5,[]];
    map[_name.sliema] = [ClubColors(Colors.blueAccent,Colors.blue),pattern.solid,Coordinates(35.89488, 14.415361),
      'Estádio Ta\' Qali',18000,1909,_country.malta,63.6,[]];
    map[_name.valletta] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(35.8950, 14.414893),
      'Estádio Ta\' Qali',18000,1943,_country.malta,65.1,[]];
    //SAN MARINO
    map[_name.cailungo] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(44.41178756, 11.91494792),
      'Stadio Domagnano e Piccolo Maracana',1000,1974,_country.sanMarino,54.3,[]];
    map[_name.cosmos] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(43.97129379, 12.476970436),
      'San Marino Stadium',7000,1979,_country.sanMarino,52.5,[]];
    map[_name.dogana] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico de San Marino',6664,2000,_country.sanMarino,51.3,[]];
    map[_name.domagnano] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(43.945397197, 12.46627922),
      'Campo Sportivo di Domagnano',1000,1966,_country.sanMarino,55.8,[]];
    map[_name.faetano] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(43.9714, 12.476),
      'San Marino Stadium',7000,1962,_country.sanMarino,58.6,[]];
    map[_name.fiorentino] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(43.9086611, 12.44787658),
      'Estádio de Fiorentino',700,1974,_country.sanMarino,51.5,[]];
    map[_name.folgore] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(43.97135136, 12.4772219),
      'San Marino Stadium',7000,1972,_country.sanMarino,58.6,[]];
    map[_name.lafiorita] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(43.91492856, 12.48212),
      'Estádio Igor Crescentini',4000,1967,_country.sanMarino,62.5,[]];
    map[_name.libertas] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.935015, 12.4518146),
      'Campo sportivo di Borgo Maggiore',1000,1928,_country.sanMarino,57.4,[]];
    map[_name.murata] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(43.9454066, 12.4661100),
      'Campo Sportivo di Montegiardino',1000,1966,_country.sanMarino,53.6,[]];
    map[_name.pennarossa] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(43.9036489, 12.42405876),
      'Campo Sportivo di Chiesanuova',1000,1968,_country.sanMarino,57.4,[]];
    map[_name.sangiovanni] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Stadio Borgo Maggiore',1000,1948,_country.sanMarino,52.3,[]];
    map[_name.trefiori] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.9086749, 12.4480538),
      'Campo Sportivo di Fiorentino',1000,1949,_country.sanMarino,59.5,[]];
    map[_name.trepenne] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.oneHorStripe,Coordinates(43.92955, 12.4428307),
      'Stadio Fonte dell\'Ovo',500,1956,_country.sanMarino,60.1,[]];
    map[_name.virtus] = [ClubColors(darkgreen,Colors.black),pattern.stripes3,Coordinates(43.946989, 12.4100658),
      'Stadio di Acquaviva',2000,1964,_country.sanMarino,55.1,[]];
    //GIBRALTAR
    map[_name.britannia] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Victoria Stadium',2000,1907,_country.gibraltar,50.0,[]]; //EXTINTO 2016
    map[_name.europa] = [ClubColors(Colors.black,Colors.green),pattern.stripes2,Coordinates(36.1491889, -5.3500741),
      'Victoria Stadium',2000,1925,_country.gibraltar,62.6,[]];
    map[_name.gibraltar] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.1492, -5.351),
      'Victoria Stadium',2000,1943,_country.gibraltar,55.3,[]];
    map[_name.glacis] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(36.1491, -5.350),
      'Victoria Stadium',2000,1965,_country.gibraltar,52.6,[]];
    map[_name.manchester62] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.1490, -5.349),
      'Victoria Stadium',2000,1962,_country.gibraltar,56.7,[]];
    map[_name.gibraltar] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.1492, -5.351),
      'Victoria Stadium',2000,1943,_country.gibraltar,55.3,[]];
    map[_name.stJosephs] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(36.1497253, -5.350840),
      'Victoria Stadium',2000,1912,_country.gibraltar,56.5,[]];
    //ANDORRA
    map[_name.andorra] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(42.50127, 1.514),
      'Estádio Comunal de Aixovall',1800,1942,_country.andorra,65.6,[]];
    map[_name.encamp] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Camp de Futbol \'Encamp',550,1950,_country.andorra,52.1,[]];
    map[_name.escaldes] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(42.50082, 1.51367674),
      'Estádio Comunal de Aixovall',1800,1993,_country.andorra,63.4,[]];
    map[_name.fcrangers] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Andorra Football Federation stadiums',1800,1981,_country.andorra,47.1,[]];
    map[_name.lusitanos] = [ClubColors(Colors.white,darkgreen),pattern.solid,Coordinates(0, 0),
      'Andorra Football Federation stadiums',1800,1999,_country.andorra,52.1,[]]; //EXTINTO 2020
    map[_name.principat] = [ClubColors(Colors.purple,Colors.black),pattern.oneHorStripe,Coordinates(0, 0),
      'Andorra Football Federation stadiums',1800,1989,_country.andorra,50.0,[]]; //EXTINTO 2015
    map[_name.santacoloma] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.50147, 1.514271),
      'Estádio Comunal de Aixovall',1800,1986,_country.andorra,62.1,[]];
    map[_name.santjulia] = [ClubColors(Colors.orange,Colors.white),pattern.sleeves,Coordinates(42.50118, 1.51387),
      'Estádio Comunal de Aixovall',1800,1982,_country.andorra,60.2,[]];


    ///////////////////////////////////////////////////////////////////////////
    map[_name.atleticomg] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-19.86583,-43.97080),
      'Mineirão',61927,1900,_country.brazil,78.6,[_name.cruzeiro],_country.mg];
    map[_name.atleticopr] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(-25.448333,-49.276944),
      'Arena da Baixada',42372,1924,_country.brazil,74.5,[_name.coritiba],_country.pr];
    map[_name.botafogo] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-22.893172,-43.292269),
      'Nilton Santos',46831,1904,_country.brazil,75.7,[_name.flamengo,_name.vasco,_name.fluminense],_country.rj];
    map[_name.cruzeiro] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(-19.865833,-43.970833),
      'Mineirão',61927,1921,_country.brazil,74.3,[_name.atleticomg],_country.mg];
    map[_name.corinthians] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.545555,-46.474),
      'Neo Química Arena',47605,1910,_country.brazil,77.2,[_name.palmeiras,_name.saopaulo,_name.santos],_country.sp];
    map[_name.coritiba] = [ClubColors(Colors.white,Colors.green,Colors.green),pattern.sp,Coordinates(-25.421111,-49.2595),
      'Couto Pereira',40502,1909,_country.brazil,73.8,[_name.atleticopr],_country.pr];
    map[_name.flamengo] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-22.911357, -43.230113),
      'Maracanã',78838,1895,_country.brazil,80.2,[_name.botafogo,_name.vasco,_name.fluminense],_country.rj];
    map[_name.fluminense] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(-22.913116, -43.2303602),
      'Maracanã',78838,1902,_country.brazil,76.1,[_name.flamengo,_name.vasco,_name.botafogo],_country.rj];
    map[_name.fortaleza] = [ClubColors(Colors.red,Colors.blue),pattern.horStripes2,Coordinates(-3.807,-38.522),
      'Castelão',63904,1918,_country.brazil,74.0,[_name.ceara],_country.ce];
    map[_name.gremio] = [ClubColors(Colors.lightBlueAccent,Colors.black,Colors.white),pattern.stripesTricolor,Coordinates(-29.972884, -51.1949268),
      'Arena do Grêmio',55662,1903,_country.brazil,74.6,[_name.internacional],_country.rs];
    map[_name.internacional] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-30.06485477, -51.23599),
      'Beira-Rio',50128,1909,_country.brazil,76.8,[_name.gremio],_country.rs];
    map[_name.palmeiras] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-23.52744641540078, -46.6784),
      'Allianz Parque',43713,1914,_country.brazil,79.3,[_name.saopaulo,_name.corinthians,_name.santos],_country.sp];
    map[_name.santos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.9510286, -46.338936366),
      'Vila Belmiro',17923,1912,_country.brazil,74.8,[_name.palmeiras,_name.corinthians,_name.saopaulo],_country.sp];
    map[_name.saopaulo] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-23.600125,-46.720155555),
      'Morumbi',66795,1930,_country.brazil,76.4,[_name.palmeiras,_name.corinthians,_name.santos],_country.sp];
    map[_name.vasco] = [ClubColors(Colors.black,Colors.white),pattern.diagonal,Coordinates(-22.890916666,-43.228252777),
      'São Januário',21880,1898,_country.brazil,73.3,[_name.flamengo,_name.fluminense,_name.botafogo],_country.rj];

    map[_name.americamg] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(-19.9074787, -43.91821561),
      'Independência',23018,1912,_country.brazil,73.2,[_name.atleticomg,_name.cruzeiro],_country.mg];
    map[_name.atleticogo] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(-16.653152, -49.284273482),
      'Antônio Accioly',12500,1937,_country.brazil,72.9,[_name.goias,_name.vilanova],_country.go];
    map[_name.avai] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-27.66578267, -48.53165186),
      'Ressacada',17800,1923,_country.brazil,50.0,[],_country.sc];
    map[_name.bahia] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-12.978819444,-38.504252777),
      'Arena Fonte Nova',50025,1931,_country.brazil,72.4,[_name.vitoria,_name.sport],_country.ba];
    map[_name.bragantino] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-22.965414,-46.536936),
      'Nabi Abi Chedid',12332,1928,_country.brazil,75.0,[],_country.sp];
    map[_name.brusque] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-27.10126696, -48.916319),
      'Augusto Bauer',5000,1987,_country.brazil,69.4,[],_country.sc];
    map[_name.ceara] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-3.8075,-38.5225),
      'Castelão',63904,1900,_country.brazil,74.2,[_name.fortaleza],_country.ce];
    map[_name.cuiaba] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(-15.60186930, -56.121367),
      'Arena Pantanal',44097,2001,_country.brazil,73.5,[],_country.mt];
    map[_name.chapecoense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-27.10339550, -52.6068313),
      'Arena Condá',22600,1973,_country.brazil,70.1,[],_country.sc];
    map[_name.crb] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(-9.67054432, -35.75930852),
      'Rei Pelé',17126,1912,_country.brazil,70.9,[_name.csa],_country.al];
    map[_name.criciuma] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-28.684329, -49.36763),
      'Heriberto Hülse',19300,1947,_country.brazil,68.55,[],_country.sc];
    map[_name.csa] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-9.6705, -35.7593),
      'Rei Pelé',17126,1913,_country.brazil,71.2,[_name.crb],_country.al];
    map[_name.figueirense] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-27.585556,-48.586667),
      'Orlando Scarpelli',19584,1921,_country.brazil,67.6,[],_country.sc];
    map[_name.goias] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.698889,-49.233889),
      'Serrinha',16500,1943,_country.brazil,72.9,[_name.atleticogo,_name.vilanova],_country.go];
    map[_name.novorizontino] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-21.466885, -49.231995),
      'Estádio Jorge Ismael de Biasi',18000,1973,_country.brazil,69.6,[],_country.sp];
    map[_name.guarani] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.909782888, -47.043755),
      'Brinco de Ouro',29130,1911,_country.brazil,68.7,[_name.pontepreta],_country.sp];
    map[_name.ituano] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-23.2803369, -47.287407674),
      'Novelli Júnior',16749,1947,_country.brazil,50.0,[],_country.sp];
    map[_name.juventude] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-29.162,-51.176),
      'Alfredo Jaconi',19924,1913,_country.brazil,72.3,[],_country.rs];
    map[_name.londrina] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-23.282222,-51.165),
      'Estádio do Café',36000,1956,_country.brazil,67.1,[],_country.pr];
    map[_name.nautico] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-8.040533, -34.89678093),
      'Aflitos',22856,1901,_country.brazil,69.8,[_name.sport,_name.santacruz],_country.pe];
    map[_name.operarioPR] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-25.115991, -50.156180),
      'Germano Krüger',10632,1912,_country.brazil,70.5,[],_country.pr];
    map[_name.paysandu] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-1.381095, -48.44458),
      'Mangueirão',35000,1914,_country.brazil,50.0,[_name.remo],_country.pa];
    map[_name.pontepreta] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-22.913611,-47.051389),
      'Moisés Lucarelli',17728,1900,_country.brazil,71.4,[_name.guarani],_country.sp];
    map[_name.portuguesa] = [ClubColors(Colors.red,Colors.green),pattern.horStripes2,Coordinates(-23.520556,-46.618333),
      'Canindé',21004,1920,_country.brazil,50.0,[],_country.sp];
    map[_name.remo] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-1.3811, -48.4447),
      'Mangueirão',35000,1905,_country.brazil,50.0,[_name.paysandu],_country.pa];
    map[_name.sport] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-8.062888888,-34.902888888),
      'Ilha do Retiro',26418,1905,_country.brazil,72.3,[_name.nautico,_name.santacruz,_name.bahia],_country.pe];
    map[_name.tombense] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-20.90766468, -42.030541527),
      'Antônio Guimarães de Almeida',3050,1914,_country.brazil,69.3,[],_country.mg];
    map[_name.vilanova] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-16.673543, -49.236922),
      'Onésio Brasileiro Alvarenga',11788,1943,_country.brazil,67.4,[],_country.go];
    map[_name.vitoria] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-12.91850220, -38.42813070),
      'Barradão',30618,1899,_country.brazil,67.3,[_name.bahia],_country.ba];

    map[_name.julho4] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-4.27619893, -41.78598826),
      'Arena Ytacoatiara',8500,1987,_country.brazil,50.0,[],_country.pi];
    map[_name.abc] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.888405361, -35.17937587),
      'Frasqueirão',18000,1915,_country.brazil,50.0,[],_country.rn];
    map[_name.adesg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0, 0),
      'Naborzão',2000,1982,_country.brazil,50.0,[],_country.ac];
    map[_name.afogados] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Vianão',1735,2013,_country.brazil,50.0,[],_country.pe];
    map[_name.aguasanta] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-23.723344, -46.612920),
      'Arena Inamar',10000,1981,_country.brazil,50.0,[],_country.sp];
    map[_name.aguiamaraba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-5.3520618, -49.138324615),
      'Zinho de Oliveira',4500,1982,_country.brazil,50.0,[],_country.pa];
    map[_name.aguianegra] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[]];
    map[_name.aimore] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-29.782430, -51.1554674),
      'Estádio João Corrêa da Silveira',10000,1936,_country.brazil,50.0,[],_country.rs];
    map[_name.alagoinhas] = [ClubColors(Colors.red,Colors.black,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Antônio Carneiro',16000,1970,_country.brazil,50.0,[],_country.ba];
    map[_name.alecrim] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Frasqueirão',18000,1915,_country.brazil,50.0,[],_country.rn];
    map[_name.alegrense] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Benedito Teixeira Leão',0,1971,_country.brazil,50.0,[],_country.es];
    map[_name.altos] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(-5.038122163, -42.44551040),
      'Felipão',4000,2013,_country.brazil,50.0,[],_country.pi];
    map[_name.alvorada] = [ClubColors(Colors.white,darkgreen),pattern.solid,Coordinates(0,0),
      'Elias Natan Coelho',1200,1993,_country.brazil,50.0,[],_country.to];
    map[_name.amapa] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Zerão',10000,1944,_country.brazil,50.0,[],_country.ap];
    map[_name.amazonas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-3.0844007, -59.9838851),
      'Estádio Municipal Carlos Zamith',5000,2019,_country.brazil,50.0,[],_country.am];
    map[_name.americaAM] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Arena da Amazônia',44000,1939,_country.brazil,50.0,[],_country.am];
    map[_name.americaCE] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Antony Costa',3000,1920,_country.brazil,50.0,[],_country.ce];
    map[_name.americaPE] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal Ademir Cunha',12500,1914,_country.brazil,50.0,[],_country.pe];
    map[_name.americaRJ] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.7953107, -43.41957718),
      'Giulite Coutinho',13544,1904,_country.brazil,50.0,[],_country.rj];
    map[_name.americaRN] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-5.93371016, -35.28271557),
      'Arena América',5000,1915,_country.brazil,50.0,[],_country.rn];
    map[_name.americaSC] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico',2500,1914,_country.brazil,50.0,[],_country.sc];
    map[_name.americaSP] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Teixeirão',32936,1946,_country.brazil,50.0,[],_country.sp];
    map[_name.americanoRJ] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-21.7597338, -41.340689),
      'Estádio Godofredo Cruz',13700,1914,_country.brazil,50.0,[],_country.rj];
    map[_name.anapolina] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-16.345930, -48.95587463),
      'Jonas Duarte',20000,1948,_country.brazil,50.0,[],_country.go];
    map[_name.andira] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arena da Floresta',20000,1964,_country.brazil,50.0,[],_country.ac];
    map[_name.aparecidense] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-16.81970, -49.245532),
      'Anníbal Batista de Toledo',5000,1985,_country.brazil,50.0,[],_country.go];
    map[_name.aquidauanense] = [ClubColors(blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      '',0,2001,_country.brazil,50.0,[],_country.ms];
    map[_name.aracruz] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Eugênio Antônio Bitti',5058,1954,_country.brazil,50.0,[],_country.es];
    map[_name.araguaina] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Mirandão',10000,1997,_country.brazil,50.0,[],_country.to];
    map[_name.ariquemes] = [ClubColors(Colors.red,Colors.green,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Valerião',5000,1996,_country.brazil,50.0,[],_country.rr];
    map[_name.asa] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-9.7474835, -36.66681596),
      'Fumeirão',15000,1952,_country.brazil,50.0,[],_country.al];
    map[_name.assu] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Edgar Borges Montenegro',4000,2002,_country.brazil,50.0,[],_country.rn];
    map[_name.atleticoAC] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-10.0021, -67.8041498),
      'Arena da Floresta',13700,1952,_country.brazil,50.0,[],_country.ac];
    map[_name.atleticoCE] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(-3.745500, -38.5373544),
      'Presidente Vargas',20268,1997,_country.brazil,50.0,[],_country.ce];
    map[_name.atleticoMT] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Arena Pantanal',44097,1948,_country.brazil,50.0,[],_country.mt];
    map[_name.atleticoRR] = [ClubColors(vinho,Colors.green,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Estádio Canarinho',4556,1944,_country.brazil,50.0,[],_country.rr];
    map[_name.athleticMG] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio Joaquim Portugal',3500,1909,_country.brazil,50.0,[],_country.mg];
    map[_name.audaxSP] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'José Liberatti',17430,1985,_country.brazil,50.0,[],_country.sp];
    map[_name.autoesporte] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.pb];
    map[_name.autoesporteAM] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes4,Coordinates(0,0),
      '',0,1950,_country.brazil,50.0,[],_country.am]; //EXTINTO
    map[_name.avenida] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Eucaliptos',3600,1944,_country.brazil,50.0,[],_country.rs];
    map[_name.azuriz] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-26.2110895, -52.679588977),
      'Os Pioneiros',8000,2018,_country.brazil,50.0,[],_country.pr];
    map[_name.bahiafeira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-12.27632, -38.93577856),
      'Arena Cajueiro',7000,1937,_country.brazil,50.0,[],_country.ba];
    map[_name.bangu] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.8719064, -43.456439277),
      'Moça Bonita',9500,1904,_country.brazil,50.0,[],_country.rj];
    map[_name.baraunas] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Nogueirão',5000,1960,_country.brazil,50.0,[],_country.rn];
    map[_name.barcelonaRO] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Portal da Amazônia',7000,2016,_country.brazil,50.0,[],_country.ro];
    map[_name.bare] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Flamarion Vasconcelos',4556,1946,_country.brazil,50.0,[],_country.rr];
    map[_name.barras] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Juca Fortes',4870,2004,_country.brazil,50.0,[],_country.pi];
    map[_name.blumenau] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Aderbal Ramos da Silva',1000,1919,_country.brazil,50.0,[],_country.sc]; //EXTINTO
    map[_name.boaesporte] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Melão',15471,1947,_country.brazil,50.0,[],_country.mg];
    map[_name.boavistaRJ] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.8954655, -42.4771417),
      'Elcyr Resende de Mendonça',8000,1961,_country.brazil,50.0,[],_country.rj];
    map[_name.bonsucesso] = [ClubColors(Colors.red,darkblue),pattern.stripes2,Coordinates(0,0),
      'Leônidas da Silva',2390,1913,_country.brazil,50.0,[],_country.rj];
    map[_name.botafogoPB] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-7.1668181, -34.873362768),
      'Almeidão',19000,1931,_country.brazil,50.0,[],_country.pb];
    map[_name.botafogoSP] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-21.201866, -47.78959753222946),
      'Estádio Santa Cruz',22292,1918,_country.brazil,50.0,[],_country.sp];
    map[_name.brasilia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-15.78318347, -47.8993050727),
      'Mané Garrincha',69349,1975,_country.brazil,50.0,[],_country.df];
    map[_name.brasiliense] = [ClubColors(Colors.yellow,Colors.white),pattern.oneVertStripe,Coordinates(-15.835889, -48.0801529),
      'Boca do Jacaré',27000,2000,_country.brazil,50.0,[_name.gama],_country.df];
    map[_name.brasilPelotas] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-31.7712377, -52.332841550),
      'Bento Freitas',10200,1911,_country.brazil,50.0,[],_country.rs];
    map[_name.cabofriense] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Correão',4200,1997,_country.brazil,50.0,[],_country.rj];
    map[_name.cajazeirense] = [ClubColors(blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Perpetão',12000,1948,_country.brazil,50.0,[],_country.pb];
    map[_name.caldense] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-21.7778067, -46.60602626),
      'Estádio Dr. Ronaldo Junqueira',7600,1925,_country.brazil,50.0,[],_country.mg];
    map[_name.camboriu] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-27.0214440, -48.64794059),
      'Robertão',3500,2003,_country.brazil,50.0,[],_country.sc];
    map[_name.cameta] = [ClubColors(Colors.red,Colors.green),pattern.horStripes3,Coordinates(0,0),
      'Parque do Bacurau',8000,2007,_country.brazil,50.0,[],_country.pa];
    map[_name.campinense] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-7.25366757188, -35.88033665),
      'O Amigão',25770,1915,_country.brazil,50.0,[],_country.pb];
    map[_name.canoas] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Francisco Novelleto Neto',5000,1957,_country.brazil,50.0,[],_country.rs];
    map[_name.cantorio] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes2,Coordinates(0,0),
      'Alzirão',900,1913,_country.brazil,50.0,[],_country.rj];
    map[_name.capelense] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Manoel Moreira',8000,1946,_country.brazil,50.0,[],_country.al];
    map[_name.carlosrenaux] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Augusto Bauer',5000,1913,_country.brazil,50.0,[],_country.sc];
    map[_name.cascavel] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-24.9750456, -53.502418),
      'Olímpico Regional',28125,2008,_country.brazil,50.0,[],_country.pr];
    map[_name.castanhal] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-1.286085617, -47.9271335),
      'Modelão',5000,1924,_country.brazil,50.0,[],_country.pa];
    map[_name.catuense] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Antônio Pena',8000,1974,_country.brazil,50.0,[],_country.ba];
    map[_name.caucaia] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Raimundão',4000,2004,_country.brazil,50.0,[],_country.ce];
    map[_name.caxias] = [ClubColors(grena,darkblue),pattern.stripes3,Coordinates(-29.1649520, -51.1964163918332),
      'Centenário',30000,1935,_country.brazil,50.0,[],_country.rs];
    map[_name.caxiasSC] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Ernestão',5000,1920,_country.brazil,50.0,[],_country.sc];
    map[_name.ceilandia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-15.828076, -48.1103452),
      'Abadião',4000,1979,_country.brazil,50.0,[],_country.df];
    map[_name.cene] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1999,_country.brazil,50.0,[],_country.ms]; //EXTINTO 2018
    map[_name.central] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-8.2785053, -35.972948033),
      'Lacerdão',20000,1919,_country.brazil,50.0,[],_country.pe];
    map[_name.cfa] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Aluízio Ferreira',7000,2001,_country.brazil,50.0,[],_country.ro];
    map[_name.chapadao] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      '',0,1981,_country.brazil,50.0,[],_country.ms];
    map[_name.cianorte] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.66138978, -52.5938666),
      'Albino Turbay',4000,1993,_country.brazil,50.0,[],_country.pr];
    map[_name.colatina] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Justiniano de Mello e Silva',2600,1998,_country.brazil,50.0,[],_country.es];
    map[_name.colinas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Concessão Municipal',2000,2001,_country.brazil,50.0,[],_country.to];
    map[_name.colorado] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Vila Capanema',20083,1971,_country.brazil,50.0,[],_country.pr]; //EXTINTO 1989
    map[_name.comercial] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-21.1865312, -47.788333),
      'Estádio Palma Travassos',18277,1911,_country.brazil,50.0,[],_country.sp];
    map[_name.comercialms] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      '',0,1943,_country.brazil,50.0,[],_country.ms];
    map[_name.confianca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-10.8944975, -37.0538261),
      'Sabino Ribeiro',3000,1936,_country.brazil,50.0,[],_country.al];
    map[_name.corinthiansAL] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,1991,_country.brazil,50.0,[],_country.al]; //EXTINTO 2013
    map[_name.corumbaense] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arthur Marinho',0,1914,_country.brazil,50.0,[],_country.ms];
    map[_name.coruripe] = [ClubColors(Colors.white,Colors.green,Colors.orange,),pattern.solid,Coordinates(0,0),
      'Gerson Amaral',7000,2003,_country.brazil,50.0,[],_country.al];
    map[_name.coxim] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes2,Coordinates(0,0),
      '',0,2002,_country.brazil,50.0,[],_country.ms];
    map[_name.crac] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.go];
    map[_name.cristalAP] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Municipal Glicério Marques',3500,1969,_country.brazil,50.0,[],_country.ap];
    map[_name.cruzeiroRS] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Arena Cruzeiro',16000,1913,_country.brazil,50.0,[],_country.rs];
    map[_name.cse] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Juca Sampaio',8000,1947,_country.brazil,50.0,[],_country.al];
    map[_name.democrata] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Mamudão',8675,1932,_country.brazil,50.0,[],_country.mg];
    map[_name.desportiva] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-20.33414206, -40.3561058),
      'Engenheiro Araripe',7700,1963,_country.brazil,50.0,[],_country.es];
    map[_name.dombosco] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arena Pantanal',44097,1925,_country.brazil,50.0,[],_country.mt];
    map[_name.douradense] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Douradão',30000,1974,_country.brazil,50.0,[],_country.ms];
    map[_name.duque] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(-22.5854488,-43.305297),
      'Marrentão',3334,2005,_country.brazil,50.0,[],_country.rj];
    map[_name.espigao] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Luizinho Turatti',2000,2008,_country.brazil,50.0,[],_country.ro];
    map[_name.esportivo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Montanha dos Vinhedos',12859,1919,_country.brazil,50.0,[],_country.rs];
    map[_name.estreladomar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1953,_country.brazil,50.0,[],_country.pb];
    map[_name.estrelanorte] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(-20.85331473, -41.11303147),
      'Estádio do Sumaré ',6000,1916,_country.brazil,50.0,[],_country.es];
    map[_name.farroupilha] = [ClubColors(Colors.green,Colors.red,Colors.yellow),pattern.stripesTricolor,Coordinates(0, 0),
      'Nicolau Fico',5441,1926,_country.brazil,50.0,[],_country.rs];
    map[_name.fast] = [ClubColors(Colors.white,Colors.red,Colors.blue),pattern.sp,Coordinates(-3.12155505, -60.03779047),
      'Colina',10000,1930,_country.brazil,50.0,[],_country.am];
    map[_name.ferroviaria] = [ClubColors(grena,Colors.black),pattern.solid,Coordinates(-21.7750702, -48.1701263),
      'Fonte Luminosa',20000,1950,_country.brazil,50.0,[],_country.sp];
    map[_name.ferroviario] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.diagonal,Coordinates(-3.70871165, -38.588464),
      'Elzir Cabral',4200,1933,_country.brazil,50.0,[],_country.ce];
    map[_name.ferroviarioAL] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Cleto Marques Luz',4000,1937,_country.brazil,50.0,[],_country.al];
    map[_name.ferroviarioMA] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Nhozinho Santos',21000,1941,_country.brazil,50.0,[],_country.ma];
    map[_name.ferroviarioPR] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-3.12155505, -60.03779047),
      'Vila Capanema',20083,1930,_country.brazil,50.0,[],_country.pr]; //VIROU COLORADO EM 1971
    map[_name.flamengoPI] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Albertão',44200,1937,_country.brazil,50.0,[],_country.pi];
    map[_name.floresta] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-3.74584449, -38.5369219),
      'Presidente Vargas',20000,1954,_country.brazil,50.0,[],_country.ce];
    map[_name.fluminenseFeira] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Joia da Princesa',16274,1941,_country.brazil,50.0,[],_country.rj];
    map[_name.fluminensePI] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Albertão',52300,1938,_country.brazil,50.0,[],_country.pi];
    map[_name.friburguense] = [ClubColors(Colors.white,Colors.purple),pattern.solid,Coordinates(0,0),
      'Eduardo Guinle',6550,1980,_country.brazil,50.0,[],_country.rj];
    map[_name.galicia] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Parque Santiago',2000,1933,_country.brazil,50.0,[],_country.ba];
    map[_name.galvez] = [ClubColors(Colors.yellow,darkgreen),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.ac];
    map[_name.gama] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.01127196, -48.06133544),
      'Bezerrão',20310,1975,_country.brazil,50.0,[_name.brasiliense],_country.df];
    map[_name.gas] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Ribeirão',3000,1965,_country.brazil,50.0,[],_country.rr];
    map[_name.gentilandia] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      '',0,1934,_country.brazil,50.0,[],_country.ce];
    map[_name.genus] = [ClubColors(Colors.yellow,grena),pattern.solid,Coordinates(0,0),
      'Aluízio Ferreira',7000,1991,_country.brazil,50.0,[],_country.ro];
    map[_name.globo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.6489411, -35.46004640),
      'Barretão',10000,2012,_country.brazil,50.0,[]];
    map[_name.goiania] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico',13500,1938,_country.brazil,50.0,[],_country.go];
    map[_name.goianesia] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Valedir José de Oliveira',6000,1955,_country.brazil,50.0,[],_country.go];
    map[_name.goiatuba] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Divinão',15000,1970,_country.brazil,50.0,[],_country.go];
    map[_name.goytacaz] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-21.76202402, -41.31634627),
      'Ary de Oliveira e Souza',15000,1912,_country.brazil,50.0,[],_country.rj];
    map[_name.gremioanapolis] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Jonas Duarte',20000,1999,_country.brazil,50.0,[],_country.go];
    map[_name.gremioBarueri] = [ClubColors(Colors.white,Colors.yellow,darkblue),pattern.solid,Coordinates(0,0),
      'Arena Barueri',31452,1989,_country.brazil,50.0,[],_country.sp];
    map[_name.gremiocoariense] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio José Rosquildes',7000,1977,_country.brazil,50.0,[],_country.am];
    map[_name.maringa] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Willie Davids',21600,1961,_country.brazil,50.0,[],_country.pr];
    map[_name.guajara] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'João Saldanha',3000,1952,_country.brazil,50.0,[],_country.ro];
    map[_name.guara] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'CAVE',16500,1957,_country.brazil,50.0,[],_country.df]; //EXTINTO 2019
    map[_name.guarany] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Junco',10000,1938,_country.brazil,50.0,[],_country.ce];
    map[_name.guaranybage] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estrela D\'Alva',10000,1907,_country.brazil,50.0,[],_country.rs];
    map[_name.guarapari] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Davino Mattos',3000,1930,_country.brazil,50.0,[],_country.es];
    map[_name.guaratingueta] = [ClubColors(Colors.red,Colors.blue,Colors.white),pattern.sleeves,Coordinates(-22.8072350, -45.18529197),
      'Dario Rodrigues Leite',16095,1998,_country.brazil,50.0,[],_country.sp];
    map[_name.gurupi] = [ClubColors(darkgreen,Colors.yellow),pattern.solid,Coordinates(-11.7385131, -49.09281345),
      'Resendão',4000,1988,_country.brazil,50.0,[],_country.to];
    map[_name.hercilioluz] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0, 0),
      'Estádio Aníbal Torres Costa',8000,1918,_country.brazil,50.0,[],_country.sc];
    map[_name.holanda] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Carlos Zamith',5000,2007,_country.brazil,50.0,[],_country.am];
    map[_name.humaita] = [ClubColors(Colors.white,Colors.red,Colors.green),pattern.solid2,Coordinates(-10.002439, -67.80401096),
      'Arena da Floresta',20000,2003,_country.brazil,50.0,[],_country.ac];
    map[_name.ibis] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-7.963256319, -34.840713),
      'Ademir Cunha',10000,1938,_country.brazil,50.0,[],_country.pe];
    map[_name.icasa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.22376, -39.317673),
      'Arena Romeirão',17000,2002,_country.brazil,50.0,[],_country.ce];
    map[_name.ilheus] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(0,0),
      'Mário Pessoa',10000,1948,_country.brazil,50.0,[],_country.ba];
    map[_name.imperatriz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-5.5253426, -47.488588),
      'Frei Epifânio',10100,1962,_country.brazil,50.0,[],_country.ma];
    map[_name.indtucurui] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Navegantão',8200,1972,_country.brazil,50.0,[],_country.pa];
    map[_name.independencia] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Marinho Monte',1000,1946,_country.brazil,50.0,[],_country.ac];
    map[_name.independenteAP] = [ClubColors(darkgreen,Colors.white),pattern.oneVertStripe,Coordinates(0,0),
      'Augusto Antunes',5000,1962,_country.brazil,50.0,[],_country.ap];
    map[_name.interLimeira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.555294,-47.385042),
      'Major José Levy Sobrinho',27000,1913,_country.brazil,50.0,[],_country.sp];
    map[_name.intercap] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Pereirão',2300,1992,_country.brazil,50.0,[],_country.to];
    map[_name.interporto] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'General Sampaio',2000,1990,_country.brazil,50.0,[],_country.to];
    map[_name.ipatinga] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-19.470869944, -42.541159),
      'Ipatingão',22000,1998,_country.brazil,50.0,[],_country.mg];
    map[_name.ipora] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio Ferreirão',6520,2000,_country.brazil,50.0,[],_country.go];
    map[_name.itabaiana] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-10.68849961, -37.4319),
      'Etelvino Mendonça',12000,1938,_country.brazil,50.0,[],_country.se];
    map[_name.itumbiara] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'JK',14455,1970,_country.brazil,50.0,[],_country.go];
    map[_name.ivinhema] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneVertStripe,Coordinates(0,0),
      'Luiz Saraiva Vieira',0,2006,_country.brazil,50.0,[],_country.ms];
    map[_name.jabaquara] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes2,Coordinates(0,0),
      'Espanha',8031,1914,_country.brazil,50.0,[],_country.sp];
    map[_name.jacuipense] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-11.8078703, -39.37936807),
      'Estádio Eliel Martins',5000,1965,_country.brazil,50.0,[],_country.ba];
    map[_name.jataiense] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Arapucão',30000,1952,_country.brazil,50.0,[],_country.go];
    map[_name.jiparana] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Biancão',5000,1991,_country.brazil,50.0,[],_country.rr];
    map[_name.joinville] = [ClubColors(Colors.red,Colors.black),pattern.oneHorStripe,Coordinates(-26.31645224, -48.83343633),
      'Arena Joinville',22100,1976,_country.brazil,50.0,[],_country.sc];
    map[_name.juazeirense] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.ba];
    map[_name.juventusMooca] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-23.5531052, -46.60451048),
      'Estádio Conde Rodolfo Crespi',5000,1924,_country.brazil,50.0,[],_country.sp];
    map[_name.juventusAC] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.ac];
    map[_name.juventusAP] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Glicério Marques',5630,1959,_country.brazil,50.0,[],_country.ap]; //EXTINTO
    map[_name.kabure] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',2000,1985,_country.brazil,50.0,[],_country.to];
    map[_name.lagartense] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Barretão',8000,1992,_country.brazil,50.0,[],_country.se];
    map[_name.lagarto] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-10.9215613, -37.67235613),
      'Barretão',8000,2009,_country.brazil,50.0,[],_country.se];
    map[_name.lajeadense] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Alviazul',7000,1911,_country.brazil,50.0,[],_country.rs];
    map[_name.lages] = [ClubColors(Colors.red,Colors.white),pattern.monaco,Coordinates(0,0),
      'Vidal Ramos Júnior',9600,1949,_country.brazil,50.0,[],_country.sc];
    map[_name.leonico] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Edgard Santos',30000,1940,_country.brazil,50.0,[],_country.ba];
    map[_name.linense] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(-21.666501905, -49.763218818),
      'Gilbertão',15770,1927,_country.brazil,50.0,[],_country.sp];
    map[_name.linhares] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estádio Guilherme Augusto de Carvalho',5000,1991,_country.brazil,50.0,[],_country.es];
    map[_name.luverdense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-13.07439827, -55.923762246),
      'Passo das Emas',10000,2004,_country.brazil,50.0,[_name.cuiaba],_country.mt];
    map[_name.luziania] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Zequinha Roriz',21564,1926,_country.brazil,50.0,[],_country.df];
    map[_name.macae] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-22.3563513, -41.77086),
      'Moacyrzão',15000,1990,_country.brazil,50.0,[],_country.rj];
    map[_name.macapa] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Zerão',13000,1941,_country.brazil,50.0,[],_country.ap];
    map[_name.madureira] = [ClubColors(Colors.purple,Colors.yellow),pattern.stripes3,Coordinates(-22.869530143, -43.337035425),
      'Conselheiro Galvão',5014,1914,_country.brazil,50.0,[],_country.rj];
    map[_name.manaus] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-3.082731444, -60.02706630),
      'Arena da Amazônia',44000,2013,_country.brazil,50.0,[],_country.am];
    map[_name.maranhao] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.ma];
    map[_name.marciliodias] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-26.90812438, -48.65977444),
      'Hercílio Luz',6000,1919,_country.brazil,50.0,[],_country.sc];
    map[_name.marilia] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes2,Coordinates(-22.21940335, -49.93949715),
      'Bento de Abreu',19800,1942,_country.brazil,50.0,[],_country.sp];
    map[_name.maringaFC] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(-23.414, -51.938378),
      'Willie Davids',20600,2010,_country.brazil,50.0,[],_country.pr];
    map[_name.matonense] = [ClubColors(blue,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Hudson Buck Ferreira',6000,1976,_country.brazil,50.0,[],_country.sp];
    map[_name.metropol] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'João Estevão de Souza',5000,1945,_country.brazil,50.0,[],_country.sc];
    map[_name.mirassol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-20.821404501, -49.5065208),
      'José Maria de Campos Maia',15000,1925,_country.brazil,50.0,[],_country.sp];
    map[_name.mixto] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-15.60386, -56.1210),
      'Arena Pantanal',44097,1934,_country.brazil,50.0,[_name.luverdense,_name.cuiaba],_country.mt];
    map[_name.mogimirim] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.439263926, -46.9617167107),
      'Estádio Vail Chaves',19900,1932,_country.brazil,50.0,[],_country.sp];
    map[_name.montealegre] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Dr. Horácio Klabin',5000,1946,_country.brazil,50.0,[],_country.pr]; //EXTINTO 1957
    map[_name.motoclub] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5483, -44.2600),
      'Castelão',40149,1937,_country.brazil,50.0,[],_country.ma];
    map[_name.murici] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'José Gomes da Costa',3500,1974,_country.brazil,50.0,[],_country.al];
    map[_name.nacionalAM] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-3.084092564, -60.02796159),
      'Arena da Amazônia',44000,2013,_country.brazil,50.0,[],_country.am];
    map[_name.nacionalSP] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-23.5180334948, -46.6851971843),
      'Nicolau Alayon',10723,1919,_country.brazil,50.0,[],_country.sp];
    map[_name.nauticoRR] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Canarinho',4556,1962,_country.brazil,50.0,[],_country.rr];
    map[_name.naviraiense] = [ClubColors(Colors.orange,Colors.green),pattern.stripes2,Coordinates(0,0),
      'Virotão',6000,2005,_country.brazil,50.0,[],_country.ms];
    map[_name.noroeste] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.3242, -49.09748),
      'Alfredo de Castilho',18866,1910,_country.brazil,50.0,[],_country.sp];
    map[_name.novaandradina] = [ClubColors(Colors.red,Colors.green),pattern.horStripes3,Coordinates(0,0),
      '',0,2008,_country.brazil,50.0,[],_country.ms];
    map[_name.novaiguacu] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-22.74785706, -43.460851929),
      'Jânio Moraes',4700,1990,_country.brazil,50.0,[],_country.rj];
    map[_name.novamutum] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Municipal Valdir Doilho Wons',1200,1988,_country.brazil,50.0,[],_country.mt];
    map[_name.novembro15] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Sady Arnildo Schmidt',3500,1911,_country.brazil,50.0,[],_country.rs];
    map[_name.novohamburgo] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-29.7262180, -51.143800),
      'Estádio do Vale',5196,1911,_country.brazil,50.0,[],_country.rs];
    map[_name.novohorizonte] = [ClubColors(Colors.black,Colors.yellow),pattern.diagonalInv,Coordinates(0,0),
      'Durval Ferreira Franco',3100,1968,_country.brazil,50.0,[],_country.go];
    map[_name.oeste] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-23.51223575, -46.89928345),
      'Arena Barueri',31452,1921,_country.brazil,50.0,[],_country.sp];
    map[_name.olaria] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Rua Bariri',8300,1915,_country.brazil,50.0,[],_country.rj];
    map[_name.operarioms] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-20.50119164, -54.610060),
      'Morenão',16000,1938,_country.brazil,50.0,[],_country.ms];
    map[_name.operarioMT] = [ClubColors(Colors.red,Colors.green,Colors.white),pattern.stripesTricolor,Coordinates(-15.6453985, -56.1070940),
      'Estádio Dito Souza',2600,1949,_country.brazil,50.0,[],_country.mt];
    map[_name.palmas] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-10.2822114, -48.330556),
      'Nilton Santos',12000,1997,_country.brazil,50.0,[],_country.to];
    map[_name.parana] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(-25.436122, -49.25595888),
      'Durival Britto',17140,1989,_country.brazil,50.0,[_name.coritiba,_name.atleticopr],_country.pr];
    map[_name.paranavai] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Waldemiro Wagner',25000,1946,_country.brazil,50.0,[],_country.pr];
    map[_name.parnahyba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Pedro Alelaf',5000,1913,_country.brazil,50.0,[],_country.pi];
    map[_name.paularamos] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      '',0,1937,_country.brazil,50.0,[],_country.sc];
    map[_name.paulista] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-23.1880264, -46.8597525),
      'Jayme Cintra',10210,1909,_country.brazil,50.0,[],_country.sp];
    map[_name.pelotas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Boca do Lobo',23336,1908,_country.brazil,50.0,[],_country.rs];
    map[_name.penapolense] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Tenente Carriço',8769,1944,_country.brazil,50.0,[],_country.sp];
    map[_name.penarolAM] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.am];
    map[_name.penedense] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Alfredo Leahy',6000,1932,_country.brazil,50.0,[],_country.al];
    map[_name.perdigao] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Luis Leoni',1500,1964,_country.brazil,50.0,[],_country.sc];
    map[_name.piaui] = [ClubColors(darkblue,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Estádio Lindolfo Monteiro',9760,1948,_country.brazil,50.0,[],_country.pi];
    map[_name.picos] = [ClubColors(Colors.yellow,Colors.green),pattern.oneHorStripe,Coordinates(0,0),
      'Gigantão da Malva',7200,1976,_country.brazil,50.0,[],_country.pi];
    map[_name.pinheirosPR] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Vila Olímpica',10000,1971,_country.brazil,50.0,[],_country.pr]; //EXTINTO 1989
    map[_name.pirambu] = [ClubColors(Colors.yellow,Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'André Moura',3000,1931,_country.brazil,50.0,[],_country.se];
    map[_name.placidocastro] = [ClubColors(blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Ferreirão',1200,1979,_country.brazil,50.0,[],_country.es];
    map[_name.portovelho] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-8.75714855, -63.9105997),
      'Aluízio Ferreira',7000,2018,_country.brazil,50.0,[],_country.ro];
    map[_name.portuguesaRJ] = [ClubColors(Colors.white,Colors.green,Colors.red),pattern.sp,Coordinates(-22.8016378, -43.2078454),
      'Luso-Brasileiro',6437,1924,_country.brazil,50.0,[],_country.rj];
    map[_name.portuguesasantista] = [ClubColors(Colors.red,Colors.green),pattern.horStripes2,Coordinates(-23.94715573, -46.3372746),
      'Ulrico Mursa',7635,1917,_country.brazil,50.0,[],_country.sp];
    map[_name.potiguar] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Nogueirão',5000,1945,_country.brazil,50.0,[],_country.rn];
    map[_name.princesasolimoes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-3.283451615, -60.6316817),
      'Gilbertão',15000,1971,_country.brazil,50.0,[],_country.am];
    map[_name.progressoRR] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal de Mucajaí',1000,0,_country.brazil,50.0,[],_country.rr];
    map[_name.prudentina] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Félix Ribeiro Marcondes',6000,1936,_country.brazil,50.0,[],_country.sp]; //EXTINTO 1967
    map[_name.pousoalegre] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-22.2514043, -45.92152478),
      'Manduzão',26000,1913,_country.brazil,50.0,[],_country.mg];
    map[_name.realArquimedes] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Gentil Valério',2500,2011,_country.brazil,50.0,[],_country.rr];
    map[_name.realNoroeste] = [ClubColors(Colors.red,Colors.green,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Ninho da Águia',5281,2008,_country.brazil,50.0,[],_country.es];
    map[_name.renner] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Tiradentes',6000,1931,_country.brazil,50.0,[],_country.rs]; //EXTINTO 1957
    map[_name.resende] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-22.4638346, -44.456106),
      'Estádio do Trabalhador',7500,1909,_country.brazil,50.0,[],_country.rj];
    map[_name.retro] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-8.040662488, -35.00816974),
      'Arena de Pernambuco',44300,2016,_country.brazil,50.0,[],_country.pe];
    map[_name.riverPI] = [ClubColors(Colors.red,Colors.black,Colors.black),pattern.sp,Coordinates(-5.116047825, -42.792511),
      'Albertão',52216,1946,_country.brazil,50.0,[],_country.pi];
    map[_name.riobrancoAC] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-9.97037785, -67.8079834),
      'José de Melo',6000,1919,_country.brazil,50.0,[],_country.ac];
    map[_name.riobrancoES] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-20.33280029, -40.38518316),
      'Kleber Andrade',21000,1913,_country.brazil,50.0,[],_country.es];
    map[_name.riobrancoSP] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.734535, -47.3479962),
      'Décio Vitta',16300,1913,_country.brazil,50.0,[],_country.sp];
    map[_name.rioclaro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-22.4223454, -47.56188026),
      'Schmidtão',8284,1909,_country.brazil,50.0,[],_country.sp];
    map[_name.rionegro] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio Carlos Zamith',5500,1913,_country.brazil,50.0,[],_country.am];
    map[_name.rionegroRR] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0, 0),
      'Flamarion Vasconcelos',4556,1971,_country.brazil,50.0,[],_country.rr];
    map[_name.riopreto] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.83460, -49.4012242),
      'Anísio Haddad',14126,1919,_country.brazil,50.0,[],_country.sp];
    map[_name.riverRR] = [ClubColors(Colors.green,Colors.yellow),pattern.diagonal,Coordinates(0,0),
      'Flamarion Vasconcelos',4556,1973,_country.brazil,50.0,[],_country.rr];
    map[_name.riverSE] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(0,0),
      'Fernando França',5000,1967,_country.brazil,50.0,[],_country.se]; //EXTINTO 2013
    map[_name.rondoniense] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Aluízio Ferreira',7000,2007,_country.brazil,50.0,[],_country.ro];
    map[_name.salgueiro] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-8.0758843, -39.1194243),
      'Cornélio de Barros',12070,1972,_country.brazil,50.0,[],_country.pe];
    map[_name.sampaio] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(-2.54823, -44.2599829),
      'Castelão',40149,1923,_country.brazil,50.0,[],_country.ma];
    map[_name.santacruz] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-8.026711,-34.891175),
      'Arruda',60044,1914,_country.brazil,50.0,[],_country.pe];
    map[_name.santacruzPB] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Teixeirão',5000,1939,_country.brazil,50.0,[],_country.pb];
    map[_name.santahelena] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Pedro Romualdo Cabral',10000,1965,_country.brazil,50.0,[],_country.go];
    map[_name.santamaria] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Presidente Vargas',12000,1928,_country.brazil,50.0,[],_country.rs];
    map[_name.santanaAP] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Augusto Antunes',5000,1955,_country.brazil,50.0,[],_country.ap];
    map[_name.santoandre] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.669687, -46.50901102),
      'Estádio Bruno José Daniel',12000,1967,_country.brazil,50.0,[_name.saocaetano],_country.sp];
    map[_name.santoantonio] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Rubens Gomes',0,1919,_country.brazil,50.0,[],_country.es];
    map[_name.saobento] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.4902975, -47.44815),
      'Estádio Walter Ribeiro',13772,1913,_country.brazil,50.0,[],_country.sp];
    map[_name.saobernardo] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(-23.699738, -46.55637),
      'Primeiro de Maio',15159,2004,_country.brazil,50.0,[],_country.sp];
    map[_name.saocaetano] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-23.630661, -46.560448),
      'Anacleto Campanella',16744,1989,_country.brazil,50.0,[_name.santoandre],_country.sp];
    map[_name.saocristovao] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Ronaldo Nazário',1000,1898,_country.brazil,50.0,[],_country.rj];
    map[_name.saofranciscoRR] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Ribeirão',3000,0,_country.brazil,50.0,[],_country.rr];
    map[_name.saojose] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.1884290, -45.8698296),
      'Martins Pereira',15317,1933,_country.brazil,50.0,[],_country.sp];
    map[_name.saojoseAP] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-30.006611, -51.173485531),
      'Estádio Milton Corrêa',13000,1946,_country.brazil,50.0,[],_country.ap];
    map[_name.saojoseRS] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-30.006611, -51.173485531),
      'Passo D\'Areia',13000,1913,_country.brazil,50.0,[],_country.rs];
    map[_name.saomateus] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Sernamby',4500,1963,_country.brazil,50.0,[],_country.es];
    map[_name.saoraimundo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-3.1215126, -60.037779),
      'Ismael Benigno',10000,1918,_country.brazil,50.0,[],_country.am];
    map[_name.saoraimundoRR] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(2.818876055, -60.7208497),
      'Ribeirão',3000,1963,_country.brazil,50.0,[],_country.rr];
    map[_name.serra] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-20.12764236, -40.304361721),
      'Roberto Siqueira Costa',2000,1930,_country.brazil,50.0,[],_country.es];
    map[_name.sergipe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-10.92337996, -37.07210),
      'João Hora',6000,1909,_country.brazil,50.0,[],_country.se];
    map[_name.serjuventude] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Asa Delta',12000,1982,_country.brazil,50.0,[],_country.mt];
    map[_name.sertaozinho] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Frederico Dalmaso',7860,1944,_country.brazil,50.0,[],_country.sp];
    map[_name.setembro7] = [ClubColors(Colors.white,Colors.yellow,Colors.red),pattern.oneHorStripe,Coordinates(0,0),
      'Fredis Saldivar',30000,1994,_country.brazil,50.0,[],_country.ms];
    map[_name.siderurgica] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Praia do Ó',5000,1930,_country.brazil,50.0,[],_country.mg];
    map[_name.sinop] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.mt];
    map[_name.sobradinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-15.6526257, -47.7852544),
      'Augustinho Lima',10000,1975,_country.brazil,50.0,[],_country.df];
    map[_name.sorocaba] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Walter Ribeiro',13722,1991,_country.brazil,50.0,[],_country.sp];
    map[_name.sorriso] = [ClubColors(Colors.green,Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      '',0,1991,_country.brazil,50.0,[],_country.mt];
    map[_name.sousa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.7559593, -38.2232163),
      'Marizão',12400,1991,_country.brazil,50.0,[],_country.pb];
    map[_name.sulamerica] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Colina',10000,1932,_country.brazil,50.0,[],_country.am];
    map[_name.taguatinga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Serejão',20000,1974,_country.brazil,50.0,[],_country.df];
    map[_name.taubate] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.02785, -45.57043134),
      'Joaquinzão',10000,1914,_country.brazil,50.0,[],_country.sp];
    map[_name.tiradentes] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Presidente Vargas',20268,1961,_country.brazil,50.0,[],_country.pi];
    map[_name.tocantinopolis] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.3429743, -47.4276875),
      'João Ribeiro',8000,1989,_country.brazil,50.0,[],_country.to];
    map[_name.trem] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(0.0006848359, -51.0808365),
      'Zerão',13680,1947,_country.brazil,50.0,[],_country.ap];
    map[_name.treze] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-7.25430, -35.88053),
      'O Amigão',25770,1925,_country.brazil,50.0,[],_country.pb];
    map[_name.tunaluso] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(-1.381, -48.445),
      'Mangueirão',35000,1903,_country.brazil,50.0,[],_country.pa];
    map[_name.tupi] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-21.787432790, -43.37794),
      'Mário Helênio',31863,1912,_country.brazil,50.0,[],_country.mg];
    map[_name.uberaba] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Uberabão',25000,1917,_country.brazil,50.0,[],_country.mg];
    map[_name.uberlandia] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(-18.91340764, -48.2329414),
      'Parque do Sabiá',53350,1922,_country.brazil,50.0,[],_country.mg];
    map[_name.ubiratan] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],_country.ms];
    map[_name.ulbra] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Biancão',5000,2005,_country.brazil,50.0,[],_country.ro]; //EXTINTO 2008
    map[_name.uniaobandeirante] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Comendador Luís Meneghel',8000,1964,_country.brazil,50.0,[],_country.pr]; //EXTINTO 2006
    map[_name.uniaobarbarense] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Antônio Lins Ribeiro Guimarães',14913,1914,_country.brazil,50.0,[],_country.sp];
    map[_name.ucacoalense] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Aglair Tonelli',8000,1982,_country.brazil,50.0,[],_country.rr];
    map[_name.uniaoSaoJoao] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-22.3591769, -47.3406513),
      'Hermínio Ometto',16096,1981,_country.brazil,50.0,[],_country.sp];
    map[_name.urt] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-18.596822, -46.52139941),
      'Zamão',4858,1939,_country.brazil,50.0,[],_country.mg];
    map[_name.vascoAC] = [ClubColors(Colors.black,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Florestão',10000,1952,_country.brazil,50.0,[],_country.ac];
    map[_name.veranopolis] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Antônio David Farina',4720,1992,_country.brazil,50.0,[],_country.rs];
    map[_name.villanova] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Castor Cifuentes',5000,1908,_country.brazil,50.0,[],_country.mg];
    map[_name.vilhena] = [ClubColors(Colors.red,Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Portal da Amazônia',7000,1991,_country.brazil,50.0,[],_country.rr];
    map[_name.vilhenense] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Portal da Amazônia',7000,2017,_country.brazil,50.0,[],_country.ro];
    map[_name.vitoriaES] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-20.3163616, -40.3081515),
      'Salvador Venâncio',3000,1912,_country.brazil,50.0,[],_country.es];
    map[_name.voltaredonda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-22.5082739, -44.096673),
      'Raulino de Oliveira',20255,1976,_country.brazil,50.0,[],_country.rj];
    map[_name.xvjau] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-22.296089, -48.57224110487209),
      'Zezinho Magalhães',12978,1924,_country.brazil,50.0,[],_country.sp];
    map[_name.xvpiracicaba] = [ClubColors(Colors.black,Colors.white),pattern.horStripes2,Coordinates(-22.7294362, -47.636847),
      'Barão de Serra Negra',18000,1913,_country.brazil,50.0,[],_country.sp];
    map[_name.ypirangaAP] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0.000243024, -51.08084246),
      'Zerão',13680,1963,_country.brazil,50.0,[],_country.ap];
    map[_name.ypirangaBA] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Vila Canária',4000,1906,_country.brazil,50.0,[],_country.ba];
    map[_name.ypirangaRS] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(-27.65131147, -52.26477924),
      'Colosso da Lagoa',22000,1924,_country.brazil,50.0,[],_country.rs];


    ///////////////////////////////////////////////
    map[_name.aldosivi] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(-38.017726, -57.5819365),
      'José María Minella',35180,1913,_country.argentina,67.6,[]];
    map[_name.almagro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-34.6140369, -58.5347054),
      'Tres de Febrero',19000,1911,_country.argentina,66.4,[]];
    map[_name.allboys] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.6167200, -58.497540),
      'Islas Malvinas',21500,1913,_country.argentina,64.5,[]];
    map[_name.atlantaARG] = [ClubColors(Colors.yellow,darkblue),pattern.stripes2,Coordinates(-34.594865, -58.449197),
      'Estádio Don León Kolbowski',14000,1904,_country.argentina,61.5,[]];
    map[_name.rafaela] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(-31.2507559, -61.4814668),
      'Estádio Rafaela',16000,1907,_country.argentina,63.2,[]];
    map[_name.atleticoTucuman] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-26.81260955, -65.1987853),
      'Monumental José Fierro',35200,1902,_country.argentina,70.6,[]];
    map[_name.argentinojuniors] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(-34.6059205, -58.47265177),
      'Diego Armando Maradona',25500,1904,_country.argentina,70.7,[]];
    map[_name.arsenalsarandi] = [ClubColors(Colors.blue,Colors.red),pattern.diagonal,Coordinates(-34.678230933, -58.3403085),
      'Julio Humberto Grondona',18500,1957,_country.argentina,68.4,[]];
    map[_name.banfield] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(-34.7506503, -58.38785437),
      'Florencio Sola',34901,1896,_country.argentina,70.0,[]];
    map[_name.barracas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.6474769, -58.39680),
      'Claudio Fabián Tapia',2700,1904,_country.argentina,67.1,[]];
    map[_name.belgrano] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-31.40324361, -64.2064250),
      'Gigante de Alberdi',30000,1905,_country.argentina,69.8,[]];
    map[_name.bocajuniors] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(-34.6350100, -58.3649280),
      'La Bombonera',54000,1905,_country.argentina,75.8,[_name.riverplate]];
    map[_name.centralCordoba] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-27.765766, -64.26963233),
      'Único Madre de Ciudades',30000,1919,_country.argentina,66.7,[]];
    map[_name.chacarita] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-34.567153367, -58.52778112),
      'Chacarita Juniors',10000,1906,_country.argentina,65.1,[]];
    map[_name.chaco] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Sarmiento de Resistência',20000,1913,_country.argentina,62.4,[]];
    map[_name.colon] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-31.6625043, -60.72494809),
      'Brigadier General Estanislao López',40000,1905,_country.argentina,73.3,[]];
    map[_name.defensayjusticia] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-34.8212666, -58.28582255),
      'Norberto "Tito" Tomaghello',18000,1935,_country.argentina,72.3,[]];
    map[_name.depEspanol] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-34.6577354, -58.46437356),
      'Estádio Nueva España',32500,1956,_country.argentina,61.6,[]];
    map[_name.estudiantes] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.911207200, -57.9387574),
      'Jorge Luis Hirschi',30018,1905,_country.argentina,73.9,[_name.gimnasia]];
    map[_name.ferro] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-34.6187825, -58.44715549),
      'Arquitecto Ricardo Etcheverri',29442,1904,_country.argentina,67.7,[]];
    map[_name.gimnasia] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.91082898, -57.931958963),
      'Juan Carmelo Zerillo',33000,1887,_country.argentina,69.0,[_name.estudiantes]];
    map[_name.gimJujuy] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      '23 de Agosto',24000,1931,_country.argentina,58.6,[]];
    map[_name.godoycruz] = [ClubColors(Colors.blue,Colors.white),pattern.stripesThin,Coordinates(-32.889438925, -68.879741553),
      'Feliciano Gambarte',18000,1921,_country.argentina,69.2,[]];
    map[_name.huracan] = [ClubColors(Colors.red,Colors.white),pattern.solid2,Coordinates(-34.64277754540345, -58.396480366),
      'Tómas Adolfo Ducó',48314,1908,_country.argentina,69.2,[]];
    map[_name.independiente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.6697955165, -58.37112617),
      'Libertadores de América',52360,1905,_country.argentina,72.5,[_name.racing]];
    map[_name.instituto] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-31.3837438, -64.180317245),
      'Juan Domingo Perón',38000,1918,_country.argentina,65.4,[]];
    map[_name.lanus] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-34.71693165, -58.38395483),
      'Ciudad de Lanús',47027,1915,_country.argentina,72.2,[]];
    map[_name.newells] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-32.95531568, -60.661299876),
      'Marcelo Bielsa',42000,1903,_country.argentina,71.3,[_name.rosario]];
    map[_name.nuevachicago] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(-34.66785282, -58.49983161),
      'República de Mataderos',29000,1911,_country.argentina,62.2,[]];
    map[_name.olimpo] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-38.72698577, -62.2758727),
      'Roberto Natalio Carminatti',18000,1910,_country.argentina,61.7,[]];
    map[_name.patronato] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-31.742991743, -60.5087660643),
      'Presbítero Bartolomé Grella',22000,1914,_country.argentina,66.8,[]];
    map[_name.platense] = [ClubColors(Colors.grey,Colors.black),pattern.oneHorStripe,Coordinates(-34.54007018, -58.481458314),
      'Ciudad de Vicente López',34500,1905,_country.argentina,64.6,[]];
    map[_name.quilmes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.7408453, -58.2515933),
      'Centenário',30200,1887,_country.argentina,62.3,[]];
    map[_name.racing] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-34.6675,-58.368611),
      'Presidente Perón',51389,1903,_country.argentina,74.5,[_name.independiente]];
    map[_name.riverplate] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-34.54518243, -58.44934575),
      'Monumental de Núñez',70074,1901,_country.argentina,76.7,[_name.bocajuniors]];
    map[_name.rosario] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(-32.9138952, -60.6744748),
      'Gigante de Arroyito',41654,1889,_country.argentina,71.4,[_name.newells]];
    map[_name.sanlorenzo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes3,Coordinates(-34.652035, -58.4400335),
      'El Nuevo Gasómetro',47964,1908,_country.argentina,71.2,[]];
    map[_name.sanmartin] = [ClubColors(Colors.green,Colors.black),pattern.stripes3,Coordinates(-31.611908, -68.527561788),
      'Estádio del Bicentenario',25286,1907,_country.argentina,66.7,[]];
    map[_name.sarmiento] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.58532867, -60.92932811),
      'Estádio Eva Perón',22000,1911,_country.argentina,65.4,[]];
    map[_name.talleres] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(-31.367984088, -64.2448256165),
      '	Mario Alberto Kempes',57000,1913,_country.argentina,72.7,[]];
    map[_name.temperley] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.78171364, -58.40013736),
      'Alfredo Beranger',23000,1912,_country.argentina,64.4,[]];
    map[_name.tigre] = [ClubColors(Colors.blue,Colors.red),pattern.oneHorStripe,Coordinates(-34.44930541, -58.54255425),
      'José Dellagiovanna',26282,1902,_country.argentina,67.8,[]];
    map[_name.tiroFederal] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(0,0),
      'Fortín de Ludueña',18000,1905,_country.argentina,56.5,[]];
    map[_name.unionSantaFe] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-31.6317300, -60.715128589),
      '15 de Abril',28000,1907,_country.argentina,70.1,[]];
    map[_name.velez] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.6344873, -58.52082564),
      'José Amalfitani',49590,1910,_country.argentina,73.7,[]];

    map[_name.bostonriver] = [ClubColors(Colors.green,Colors.red),pattern.divided,Coordinates(-34.3292745, -56.7107625),
      'Luis Trócolli',25000,1939,_country.uruguay,65.6,[]];
    map[_name.buceo] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(0, 0),
      'Parque Huracán',10000,1937,_country.uruguay,61.7,[]];
    map[_name.centralespanol] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(0, 0),
      'Parque Palermo',6500,1905,_country.uruguay,61.7,[]];
    map[_name.cerroLargo] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(-32.3595878, -54.1693633),
      'Arquitecto Antonio Ubilla',9000,2002,_country.uruguay,67.3,[]];
    map[_name.cerrouru] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-34.867238, -56.252016),
      'Luis Trócolli',25000,1922,_country.uruguay,66.2,[]];
    map[_name.danubio] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-34.8387170, -56.13208784),
      'Jardines del Hipódromo',18000,1932,_country.uruguay,65.0,[]];
    map[_name.defensor] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-34.91616, -56.16653),
      'Estádio Luis Franzini',16000,1913,_country.uruguay,67.1,[]];
    map[_name.depMaldonado] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(-34.9144, -54.9553425),
      'Estádio Domingo Burgueño',22000,1928,_country.uruguay,62.8,[]];
    map[_name.fenix] = [ClubColors(Colors.purple,Colors.white),pattern.divided,Coordinates(-34.87338535, -56.212268),
      'Parque Capurro',10000,1916,_country.uruguay,67.5,[]];
    map[_name.liverpoolURU] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-34.8549854, -56.225665),
      'Estádio Belvedere',10000,1915,_country.uruguay,70.1,[]];
    map[_name.montevideoCity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-34.82381, -56.32036),
      'Complejo Daniel Marsicano',14000,2007,_country.uruguay,69.5,[]];
    map[_name.montWanderers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.859011, -56.203837),
      'Parque Alfredo Víctor Viera',10000,1902,_country.uruguay,69.5,[]];
    map[_name.nacional] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.8845,-56.159),
      'Estádio Gran Parque Central',34000,1899,_country.uruguay,73.5,[_name.penarol]];
    map[_name.paysanduuru] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(0, 0),
      'Parque Artigas',25000,2003,_country.uruguay,58.8,[]];
    map[_name.penarol] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-34.7963, -56.06693),
      'Campeón del Siglo',40000,1891,_country.uruguay,72.4,[_name.nacional]];
    map[_name.plazacolonia] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-34.4671517, -57.8456522),
      'Prof. Alberto Suppici',12000,1917,_country.uruguay,69.8,[]];
    map[_name.progreso] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(-34.8732457, -56.234474),
      'Parque Abraham Paladino',8000,1917,_country.uruguay,65.1,[]];
    map[_name.racinguru] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Parque Osvaldo Roberto',8500,1919,_country.uruguay,61.6,[]];
    map[_name.rampla] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(0, 0),
      'Olímpico de Montevidéu',6000,1914,_country.uruguay,62.3,[]];
    map[_name.rentistas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.776324, -56.165855),
      'Complejo Rentistas',10600,1933,_country.uruguay,66.4,[]];
    map[_name.riverURU] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-34.861929, -56.201579),
      'Federico Omar Saroldi',6000,1932,_country.uruguay,68.2,[]];
    map[_name.sudamerica] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(0, 0),
      'Parque Carlos Ángel Fossa',6000,1914,_country.uruguay,63.2,[]];
    map[_name.bellavista] = [ClubColors(Colors.yellow,Colors.white),pattern.divided,Coordinates(0, 0),
      'Parque José Nasazzi',8000,1920,_country.uruguay,64.7,[]];
    map[_name.rocha] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.divided,Coordinates(0,0),
      'Doctor Mario Sobrero',10000,1999,_country.uruguay,50.0,[]];

    map[_name.olimpia] = [ClubColors(Colors.white,Colors.black),pattern.oneHorStripe,Coordinates(-25.2913934, -57.6085912),
      'Manuel Ferreira',25820,1902,_country.paraguay,74.6,[_name.cerroporteno]];
    map[_name.cerroporteno] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-25.3,-57.6375),
      'General Pablo Rojas',45000,1912,_country.paraguay,74.4,[_name.olimpia]];
    map[_name.octubre12] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-25.36745, -57.58476),
      'Luis Alfonso Giagni',11000,1909,_country.paraguay,65.8,[]];
    map[_name.capiata] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(-25.360567, -57.4374838),
      'Erico Galeano Segovia',15000,2008,_country.paraguay,63.0,[]];
    map[_name.colegiales] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-25.348243, -57.592480),
      'Luciano Zacarías',4500,1977,_country.paraguay,66.5,[]];
    map[_name.febrero3] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-25.5268770, -54.6123046),
      'Antonio Aranda',28000,1970,_country.paraguay,60.7,[]];
    map[_name.generalDiaz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-25.2632793, -57.5186521),
      'General Adrián Jara',3300,1917,_country.paraguay,61.3,[]];
    map[_name.generalCaballero] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-25.235591, -57.55797252),
      'Estadio Hugo Bogado Vaceque',5000,1918,_country.paraguay,63.7,[]];
    map[_name.guairena] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-25.76343534, -56.439635675),
      'Estadio Parque del Guairá',12000,2016,_country.paraguay,64.8,[]];
    map[_name.guaraniPAR] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-25.30311, -57.61587),
      'Rogelio Livieres',8000,1903,_country.paraguay,71.7,[]];
    map[_name.nacionalPAR] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(-25.29862, -57.63927),
      'Arsenio Erico',8500,1904,_country.paraguay,69.5,[]];
    map[_name.libertad] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-25.2768477, -57.61086),
      'Dr. Nicolás Leoz',10500,1905,_country.paraguay,74.3,[]];
    map[_name.luqueno] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(-25.2723013, -57.493120),
      'Estádio Feliciano Cáceres',27000,1921,_country.paraguay,67.2,[]];
    map[_name.presidenteHayes] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Estádio Kiko Reyes',5000,1907,_country.paraguay,57.6,[]];
    map[_name.resistencia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-25.279565, -57.6254939),
      'Estadio Tomás Beggan Correa',3500,1917,_country.paraguay,63.8,[]];
    map[_name.riverPAR] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Estadio River Plate',6500,1911,_country.paraguay,61.7,[]];
    map[_name.rubionu] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-25.257535, -57.575178),
      'La Arboleda',4500,1913,_country.paraguay,62.5,[]];
    map[_name.sanlorenzoPAR] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Estadio Gunther Vogel',5000,1930,_country.paraguay,60.5,[]];
    map[_name.soldeamerica] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-25.36735, -57.58480),
      'Estádio Luis Alfonso Giagni',11000,1909,_country.paraguay,68.2,[]];
    map[_name.tacuary] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-25.2831537, -57.606315),
      'Toribio Vargas',3000,1923,_country.paraguay,63.1,[]];

    map[_name.antofagasta] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(-23.6700873, -70.4045056),
      'Bicentenario Calvo y Bascuñán',21178,1966,_country.chile,64.5,[]];
    map[_name.audaxItaliano] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.540543, -70.577821),
      'Municipal de La Florida',12000,1910,_country.chile,66.3,[]];
    map[_name.cobreloa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(-22.46096, -68.9204540),
      'Municipal de Calama',12000,1977,_country.chile,65.4,[]];
    map[_name.cobresal] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-26.2518641, -69.628662),
      'Estádio El Cobre',12000,1979,_country.chile,62.0,[]];
    map[_name.colocolo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-33.506611,-70.605944),
      'Monumental David Arellano',47017,1925,_country.chile,72.5,[]];
    map[_name.coquimbo] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-29.9652247, -71.338293),
      'Francisco Sánchez Rumoroso',15000,1958,_country.chile,66.8,[]];
    map[_name.curico] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-34.9742154, -71.230767),
      'La Granja',8200,1973,_country.chile,64.7,[]];
    map[_name.iquique] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-20.242358, -70.1331452),
      'Tierra de Campeones',10000,1978,_country.chile,64.5,[]];
    map[_name.evertonchi] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-33.014228, -71.535373),
      'Sausalito',23000,1909,_country.chile,67.5,[]];
    map[_name.greenCross] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estadio Nacional',70000,1916,_country.chile,50.0,[]]; //EXTINTO 1961
    map[_name.huachipato] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(-36.75502733, -73.10760524),
      'Estádio CAP',10500,1947,_country.chile,69.3,[]];
    map[_name.laCalera] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-32.784167,-71.199444),
      'Municipal Nicolás Chahuán',9200,1954,_country.chile,67.8,[]];
    map[_name.laserena] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-29.911299, -71.251873),
      'La Portada',14000,1955,_country.chile,63.5,[]];
    map[_name.lau] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.464054, -70.61059),
      'Estádio Nacional',55358,1927,_country.chile,72.8,[]];
    map[_name.magallanes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Santiago Bueras',5000,1897,_country.chile,59.2,[]];
    map[_name.nublense] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-36.618249, -72.107945),
      'Nelson Oyarzún Arenas',7000,1916,_country.chile,64.1,[]];
    map[_name.ohiggins] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.1775588, -70.737344506),
      'El Teniente',14450,1955,_country.chile,64.8,[]];
    map[_name.palestino] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(-33.5202176734, -70.67294633),
      'Municipal de La Cisterna',12000,1920,_country.chile,68.2,[]];
    map[_name.unionespanola] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-33.40428485, -70.658703),
      'Santa Laura',22000,1897,_country.chile,68.5,[]];
    map[_name.univcatolica] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-33.39498660, -70.5005379),
      'San Carlos de Apoquindo',14768,1937,_country.chile,74.7,[]];
    map[_name.santiagowanderers] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.0224104, -71.639742),
      'Elías Figueroa Brander',21113,1892,_country.chile,66.3,[]];
    map[_name.concepcion] = [ClubColors(Colors.yellow,darkblue),pattern.sleeves,Coordinates(-36.8157111, -73.02371368),
      'Municipal de Concepción',35000,1994,_country.chile,62.0,[]];
    map[_name.rangersCHI] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-35.4202449, -71.6740666),
      'Fiscal de Talca',8230,1902,_country.chile,63.8,[]];
    map[_name.sanfelipe] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.chile,50.0,[]];

    map[_name.alwaysReady] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-16.4994122, -68.12262946),
      'Hernando Siles',42000,1933,_country.bolivia,67.2,[]];
    map[_name.aurora] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-17.37968516, -66.1615046),
      'Félix Capriles',32000,1935,_country.bolivia,64.5,[]];
    map[_name.blooming] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-17.796, -63.1832),
      'Tauhichi Aguilera',38000,1946,_country.bolivia,63.6,[]];
    map[_name.bolivar] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-16.499412183054098, -68.12263),
      'Hernando Siles',42000,1925,_country.bolivia,70.8,[_name.theStrongest]];
    map[_name.chacoPetrolero] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-16.5,-68.12),
      'Hernando Siles',42000,1944,_country.bolivia,62.1,[]];
    map[_name.guabira] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-17.34287, -63.261564),
      'Gilberto Parada',18000,1962,_country.bolivia,65.1,[]];
    map[_name.indPetrolero] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-17.34287, -63.261564),
      'Olímpico Patria',32000,1932,_country.bolivia,65.0,[]];
    map[_name.jorge] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-17.37959, -66.1617185),
      'Félix Capriles',32000,1949,_country.bolivia,69.4,[]];
    map[_name.lapaz] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Hernando Siles',42000,1989,_country.bolivia,62.4,[]]; //EXTINTO 2013
    map[_name.municipalBOL] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Luis Lastra',10000,1944,_country.bolivia,58.6,[]];
    map[_name.nacionalpotosi] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-19.5793537, -65.7616416),
      'Víctor Agustín Ugarte',32105,1942,_country.bolivia,63.6,[]];
    map[_name.orientePetrolero] = [ClubColors(Colors.green,Colors.white),pattern.solid2,Coordinates(-19.0332323, -65.257856),
      'Estádio Ramón Tahuichi Aguilera',38500,1955,_country.bolivia,64.2,[]];
    map[_name.palmaflor] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-17.3920347, -66.275128),
      'Municipal de Quillacollo',5000,2008,_country.bolivia,63.7,[]];
    map[_name.realsantacruz] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(-17.8058075, -63.1661464),
      'Juan Carlos Durán',15000,1962,_country.bolivia,60.8,[]];
    map[_name.realtomayapo] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(-21.5327864, -64.7248547),
      'Estadio IV Centenario',15000,1999,_country.bolivia,58.6,[]];
    map[_name.royalpari] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-17.795543, -63.183247),
      'Ramón Tahuichi Aguilera',38000,2002,_country.bolivia,63.1,[]];
    map[_name.sanJoseBOL] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(-17.94613, -67.1108436),
      'Estádio Jesús Bermúdez',39000,1942,_country.bolivia,64.5,[]];
    map[_name.realpotosi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Víctor Ugarte',32000,1986,_country.bolivia,60.8,[]]; //EXTINTO
    map[_name.theStrongest] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-16.499412, -68.12263),
      'Hernando Siles',42000,1908,_country.bolivia,71.7,[_name.bolivar]];
    map[_name.sucre] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-19.03347852, -65.2576612),
      'Olímpico Patria',32000,1961,_country.bolivia,67.5,[]];
    map[_name.univVinto] = [ClubColors(Colors.white,Colors.red),pattern.solid2,Coordinates(-17.397434717, -66.3175044),
      'Estadio Hipólito Lazarte',2000,2005,_country.bolivia,63.6,[]];
    map[_name.litoral] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(0,0),
      'Félix Capriles',32000,1936,_country.bolivia,50.0,[]];
    map[_name.octubre31] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Hernando Siles',42000,1954,_country.bolivia,50.0,[]];

    map[_name.alianzalima] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-12.06765595, -77.0229485),
      'Alejandro Villanueva',35000,1901,_country.peru,70.9,[]];
    map[_name.alianzaSullana] = [ClubColors(Colors.white,Colors.blue),pattern.diagonal,Coordinates(-4.8969179, -80.68456517),
      'Campeones del 36',4000,1920,_country.peru,70.9,[]];
    map[_name.atlGrau] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(-12.059699, -77.119953),
      'Estadio Miguel Grau',25000,1919,_country.peru,65.2,[]];
    map[_name.ayacucho] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(-13.1514774, -74.2200140),
      'Ciudad de Cumaná',12000,2008,_country.peru,64.5,[]];
    map[_name.binacional] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-15.502587, -70.1233308),
      'Guillermo Briceño Rosamedina',20030,2010,_country.peru,64.6,[]];
    map[_name.carlosStein] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-6.6972361, -79.904482),
      'César Flores Marigorda',7000,2012,_country.peru,63.1,[]];
    map[_name.ayacucho] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(-13.1514774, -74.2200140),
      'Ciudad de Cumaná',12000,2008,_country.peru,63.5,[]];
    map[_name.cantolao] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(-12.0601314, -77.12002745),
      'Estadio Miguel Grau',17000,1981,_country.peru,64.0,[]];
    map[_name.carlosmanucci] = [ClubColors(Colors.blue,Colors.white),pattern.oneVertStripe,Coordinates(-8.1060255, -79.0307551),
      'Estadio Mansiche',23214,1959,_country.peru,64.1,[]];
    map[_name.cesarvallejo] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(-8.10611593, -79.030676),
      'Mansiche',25000,1996,_country.peru,63.8,[]];
    map[_name.cienciano] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-13.5242097, -71.966351907),
      'Inca Garcilaso de la Vega',45056,1901,_country.peru,68.1,[]];
    map[_name.coronel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-18.00503048, -70.253158),
      'Estádio Jorge Basadre',25000,1929,_country.peru,65.1,[]];
    map[_name.cusco] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-13.525813, -71.966138),
      'Inca Garcilaso de la Vega',45056,2009,_country.peru,66.3,[]];
    map[_name.depmunicipal] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-12.067919, -77.03348),
      'Nacional José Diáz',45000,1935,_country.peru,65.8,[]];
    map[_name.juanaurich] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.76763163, -79.86207526),
      'Elías Aguirre',25000,1922,_country.peru,65.1,[]];
    map[_name.leonhuanuco] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(-9.94045133, -76.25269378),
      'Estadio Heraclio Tapia',14000,1946,_country.peru,62.7,[]];
    map[_name.melgar] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-16.40644668, -71.5202360),
      'Estádio Monumental da UNSA',40370,1915,_country.peru,71.4,[]];
    map[_name.ancash] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(0, 0),
      'Estadio Rosas Pampa',18000,1967,_country.peru,62.8,[]];
    map[_name.sportboys] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.059966, -77.1197877),
      'Miguel Grau',15000,1927,_country.peru,63.7,[]];
    map[_name.sportingcristal] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-12.0362617, -77.045132758),
      'Alberto Gallardo',11600,1955,_country.peru,72.6,[]];
    map[_name.huancayo] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.072618, -75.201664),
      'Estádio Huancayo',17000,2007,_country.peru,67.3,[]];
    map[_name.universitario] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-12.055024119, -76.9358871764),
      'Monumental de Lima',80093,1924,_country.peru,69.8,[]];
    map[_name.unisanmartin] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-12.06730518, -77.0336576),
      'Nacional de Lima',45000,2004,_country.peru,64.8,[]];
    map[_name.cajamarca] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-7.1616760, -78.51101415),
      'Estádio Héroes de San Ramón',18000,1954,_country.peru,65.3,[]];
    map[_name.unionhuaral] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-11.49677572, -77.217294),
      'Estádio Julio Lores Colán',6000,1947,_country.peru,59.6,[]];
    map[_name.chalaco] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[]];
    map[_name.atltorino] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[]];
    map[_name.arica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.peru,50.0,[]]; //EXTINTO
    map[_name.ugarte] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[]];
    map[_name.defensorlima] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[]];
    map[_name.sanagustin] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estadio Nacional',45000,1970,_country.peru,55.4,[]]; //EXISTE, MAS FORA DO SISTEMA DE LIGAS

    map[_name.aucas] = [ClubColors(Colors.red,Colors.yellow),pattern.dividedHor,Coordinates(-0.2789491, -78.546213),
      'Gonzalo Pozo Ripalda',20000,1945,_country.ecuador,69.4,[]];
    map[_name.barcelonaequ] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-2.18560555, -79.924764),
      'Monumental Isidro Romero Carbo',57267,1925,_country.ecuador,72.8,[]];
    map[_name.delfin] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-0.964043321, -80.702654),
      'Estadio Jocay',17834,1989,_country.ecuador,66.6,[]];
    map[_name.depcuenca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.906627, -79.005685),
      'Alejandro Serrano Aguilar',16500,1971,_country.ecuador,67.5,[]];
    map[_name.depquito] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-0.1777998, -78.47661),
      'Olímpico Atahualpa',40948,1940,_country.ecuador,70.1,[]];
    map[_name.emelec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-2.20565402, -79.893875),
      'George Capwell',40000,1929,_country.ecuador,73.2,[]];
    map[_name.elnacional] = [ClubColors(Colors.red,Colors.blue),pattern.diagonalInv,Coordinates(-0.177371, -78.47598),
      'Olímpico Atahualpa',38500,1964,_country.ecuador,67.1,[]];
    map[_name.espoli] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Etho Vega',0,1986,_country.ecuador,57.5,[]];
    map[_name.guayaquil] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-2.1028473, -79.903678),
      'Christian Benítez Betancourt',8000,2007,_country.ecuador,64.6,[]];
    map[_name.idelvalle] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-0.34883621, -78.4708232),
      'Rumiñahui',10233,1958,_country.ecuador,74.1,[]];
    map[_name.ldu] = [ClubColors(Colors.white,Colors.grey),pattern.solid,Coordinates(-0.10660691, -78.48884),
      'Rodrigo Paz Delgado',41575,1918,_country.ecuador,72.5,[]];
    map[_name.lduLoja] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-4.0008733, -79.1965533),
      'Federativo Reina del Cisne',15000,1979,_country.ecuador,64.2,[]];
    map[_name.macara] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-1.24482626, -78.623129),
      'Estádio Bella Vista',16467,1939,_country.ecuador,66.7,[]];
    map[_name.mushucruna] = [ClubColors(grena,Colors.green),pattern.solid,Coordinates(-1.30916165, -78.7278448),
      'Estádio Mushuc Runa COAC',6000,2003,_country.ecuador,65.2,[]];
    map[_name.nueveoctubre] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(-2.1794787, -79.89441178),
      'Modelo Alberto Spencer',42000,1912,_country.ecuador,68.9,[]];
    map[_name.octubre9] = [ClubColors(Colors.white,Colors.blue),pattern.stripesThin,Coordinates(0,0),
      'Modelo Alberto Spencer',42000,1912,_country.ecuador,63.6,[]];
    map[_name.olmedo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-1.6662906, -78.6604288),
      'Olímpico de Riobamba',20000,1919,_country.ecuador,62.6,[]];
    map[_name.orense] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(-3.25437008, -79.9627357),
      'Estadio 9 de Mayo',17800,2009,_country.ecuador,62.3,[]];
    map[_name.tecnicoUniv] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-1.2443898, -78.62354027),
      'Estadio Bellavista',18000,1971,_country.ecuador,63.1,[]];
    map[_name.uniequ] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(-0.1774, -78.476),
      'Olímpico Atahualpa',38500,1963,_country.ecuador,60.2,[]];
    map[_name.americaquito] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[]];
    map[_name.everestGuayaquil] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[]];
    map[_name.filanbanco] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[]];
    map[_name.valdez] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[]];

    map[_name.alianzaPetrolera] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(7.073057, -73.864671),
      'Daniel Villa Zapata',10400,1991,_country.colombia,66.5,[]];
    map[_name.americadecali] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.43076413, -76.5409550),
      'Olímpico Pascual Guerrero',35405,1927,_country.colombia,73.6,[]];
    map[_name.huila] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(2.93608856, -75.280323806),
      'Guillermo Plazas Alcid',10400,1990,_country.colombia,63.1,[]];
    map[_name.atleticonacional] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(6.2570559, -75.589883235),
      'Atanasio Girardot',52872,1947,_country.colombia,75.0,[]];
    map[_name.boyaca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.54217432, -73.3533631),
      'La Independencia',20000,2002,_country.colombia,63.4,[]];
    map[_name.bucaramanga] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(7.136745, -73.116192),
      'Alfonso López',25000,1949,_country.colombia,64.6,[]];
    map[_name.cortulua] = [ClubColors(Colors.red,Colors.green),pattern.oneVertStripe,Coordinates(4.07490263, -76.2016262),
      'Doce de Octubre',16000,1967,_country.colombia,67.6,[]];
    map[_name.cucuta] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(7.8946915, -72.50194428901477),
      'General Santander',46519,1924,_country.colombia,65.3,[]];
    map[_name.deportivocali] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(3.52269250, -76.41571171),
      'Estádio Deportivo Cali',55000,1912,_country.colombia,72.3,[]];
    map[_name.depPasto] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(1.19825378, -77.2778826),
      'Departamental Libertad',20700,1949,_country.colombia,67.2,[]];
    map[_name.pereira] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(4.80468765, -75.751995),
      'Hernán Villegas',30313,1944,_country.colombia,66.5,[]];
    map[_name.envigado] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(6.16451557, -75.5989182),
      'Polideportivo Sur',12000,1989,_country.colombia,67.6,[]];
    map[_name.junior] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(10.927145429567, -74.8000172),
      'Metropolitano',46692,1924,_country.colombia,74.2,[]];
    map[_name.imedellin] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(6.256939271, -75.5898773),
      'Atanasio Girardot',45953,1913,_country.colombia,71.6,[]];
    map[_name.laequidad] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(4.62375432, -74.1354781),
      'Metropolitano de Techo',15000,1982,_country.colombia,70.5,[]];
    map[_name.millonarios] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(4.645962128, -74.077269811),
      'El Campín',36343,1937,_country.colombia,73.4,[]];
    map[_name.oncecaldas] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(5.057102, -75.48972667784),
      'Palogrande',42600,1961,_country.colombia,70.8,[]];
    map[_name.patriotas] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.5421279, -73.353390),
      'La Independencia',21000,2003,_country.colombia,67.8,[]];
    map[_name.quindio] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(4.515824983, -75.6986710),
      'Centenário',25000,1951,_country.colombia,59.3,[]];
    map[_name.rioNegroAguilas] = [ClubColors(Colors.amberAccent,Colors.black),pattern.solid,Coordinates(6.14667896, -75.372829),
      'Alberto Grisales',14000,1991,_country.colombia,68.1,[]];
    map[_name.santafe] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(4.646, -74.077),
      'El Campín',36343,1941,_country.colombia,73.1,[]];
    map[_name.tolima] = [ClubColors(Colors.yellow,Colors.orange),pattern.solid,Coordinates(4.43018613, -75.21773451564),
      'Manuel Murillo Toro',33000,1954,_country.colombia,74.2,[]];
    map[_name.uMagdalena] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(11.2398636, -74.19507816),
      'Eduardo Santos',23000,1951,_country.colombia,66.1,[]];

    map[_name.aragua] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(10.2589723, -67.6123306),
      'Olimpico Hermanos Ghersi Paez',18000,2002,_country.venezuela,60.1,[]];
    map[_name.carabobo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(10.2230961, -68.0115140),
      'Estádio Misael Delgado',14000,1964,_country.venezuela,62.7,[]];
    map[_name.caracas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(10.49220252, -66.885644393),
      'Estádio Olímpico de Caracas',24900,1967,_country.venezuela,68.9,[]];
    map[_name.laGuaira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(10.492202523, -66.885644393),
      'Estádio Olímpico de Caracas',24900,2008,_country.venezuela,66.0,[]];
    map[_name.tachira] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(7.787385, -72.1980212),
      'Pueblo Nuevo de San Cristóbal',42000,1974,_country.venezuela,67.8,[]];
    map[_name.estudiantesmerida] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(8.5769590, -71.16485),
      'Guillermo Soto Rosa',16500,1971,_country.venezuela,63.4,[]];
    map[_name.deplara] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(10.0809793, -69.32927),
      'Farid Richa',12480,2009,_country.venezuela,64.0,[]];
    map[_name.metropolitanos] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(10.482750, -66.941810),
      'Brígido Iriarte',10000,2011,_country.venezuela,65.1,[]];
    map[_name.mineros] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(8.31272986, -62.6962946),
      'C.T.E. Cachamay',42000,1981,_country.venezuela,62.6,[]];
    map[_name.minerven] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(7.3472689, -61.82695),
      'Héctor Thomas',5000,1985,_country.venezuela,61.3,[]];
    map[_name.monagas] = [ClubColors(Colors.blue,grena),pattern.solid,Coordinates(9.71000338, -63.2677268),
      'Monumental de Maturín',51796,1987,_country.venezuela,64.5,[]];
    map[_name.portuguesaven] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(9.570767650, -69.21027962),
      'José Antonio Paez',18000,1972,_country.venezuela,61.7,[]];
    map[_name.puertoCabello] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(10.467987195, -68.00974328),
      'Complejo Deportivo Socialista',7500,2014,_country.venezuela,61.1,[]];
    map[_name.trujillanos] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(9.33347489, -70.60227),
      'José Alberto Pérez',12000,1981,_country.venezuela,60.6,[]];
    map[_name.zamora] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(8.625075, -70.20694),
      'Estadio Agustín Tovar',28000,1977,_country.venezuela,60.8,[]];
    map[_name.zulia] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(10.6743723, -71.644651),
      'Estádio José Encarnación Romero',45000,2005,_country.venezuela,62.7,[]];
    map[_name.anzoategui] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.depitalia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.depgalicia] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.laraFC] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.maracaibo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'José Pachencho Romero',35000,2001,_country.venezuela,50.0,[]]; //FALENCIA
    map[_name.margarita] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.maritimoven] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.pepeganga] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.portugues] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.sancristobal] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Polideportivo de Pueblo Nuevo',38755,1980,_country.venezuela,50.0,[]]; //EXTINTO
    map[_name.uCanarias] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];//EXTINTO
    map[_name.ula] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];
    map[_name.valenciaven] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[]];

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    map[_name.atlas] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(20.7051916, -103.3277484),
      'Jalisco',63163,1916,_country.mexico,73.6,[]];
    map[_name.atlante] = [ClubColors(Colors.blue,grena),pattern.stripes2,Coordinates(19.382696, -99.1782815),
      'Estádio Azul',32904,1916,_country.mexico,68.4,[]];
    map[_name.americamex] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(19.30399437, -99.15052764),
      'Estádio Azteca',87000,1916,_country.mexico,77.5,[]];
    map[_name.atlEspanol] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(0, 0),
      'Estádio Azteca',87000,1971,_country.mexico,50.0,[]];//EXTINTO 1982
    map[_name.celaya] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(20.534896, -100.8181567),
      'Emilio Butragueño',26753,1954,_country.mexico,66.7,[]];
    map[_name.chivas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(20.6827395, -103.46255961),
      'Estadio Akron',49850,1906,_country.mexico,74.5,[]];
    map[_name.correcaminos] = [ClubColors(Colors.orange,Colors.white),pattern.oneHorStripe,Coordinates(23.739618, -99.1523884),
      'Marte R. Gómez Segura',19500,1982,_country.mexico,67.3,[]];
    map[_name.cruzazul] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.3837416, -99.1782640),
      'Estádio Azul',32904,1927,_country.mexico,76.8,[]];
    map[_name.dorados] = [ClubColors(Colors.black,Colors.yellow),pattern.divided,Coordinates(24.8305076, -107.404267),
      'Estádio Banorte',20108,2003,_country.mexico,65.6,[]];
    map[_name.irapuato] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(20.68461665, -101.3561041),
      'Sergio León Chavez',30000,1982,_country.mexico,64.5,[]];
    map[_name.jaguares] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(16.7630, -93.0960),
      'Estádio Víctor Manuel Reyna',28000,2002,_country.mexico,67.7,[]];
    map[_name.juarez] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(31.75317, -106.467471),
      'Estadio Olímpico Benito Juárez',19703,2015,_country.mexico,69.5,[]];
    map[_name.leon] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.1163456, -101.65787452),
      'Nou Camp',33943,1944,_country.mexico,73.9,[]];
    map[_name.leonesNegros] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(20.7052, -103.3277),
      'Jalisco',63163,1970,_country.mexico,68.3,[]];
    map[_name.mazatlan] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(23.2360094, -106.432487154),
      'Estadio de Mazatlán',25000,2020,_country.mexico,71.0,[]];
    map[_name.monterrey] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(25.6702825, -100.24467170),
      'Estádio BBVA',51348,1945,_country.mexico,78.2,[]];
    map[_name.morelia] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonalInv,Coordinates(19.7189655, -101.233201),
      'Estadio Morelos',41038,1950,_country.mexico,70.1,[]];
    map[_name.necaxa] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(21.881199555, -102.2754420),
      'Estadio Victoria',22000,1923,_country.mexico,68.9,[]];
    map[_name.depNeza] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estadio Neza 86',28000,1978,_country.mexico,53.0,[]];
    map[_name.pachuca] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(20.10591056, -98.7556673),
      'Estádio Hidalgo',32000,1892,_country.mexico,73.9,[]];
    map[_name.puebla] = [ClubColors(Colors.blue,Colors.white),pattern.diagonalInv,Coordinates(19.07886305, -98.164410348),
      'Estadio Cuauhtemoc',42684,1944,_country.mexico,71.6,[]];
    map[_name.pumas] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.333086463, -99.19217763867),
      'Olímpico Universitário',72000,1954,_country.mexico,72.5,[]];
    map[_name.queretaro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(20.57793742, -100.3662424),
      'Estádio Corregidora',40000,1950,_country.mexico,69.4,[]];
    map[_name.oro] = [ClubColors(Colors.yellow,Colors.white),pattern.stripes3,Coordinates(0, 0),
      '',0,0,_country.mexico,50.0,[]];
    map[_name.sanluis] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(22.1389898, -100.95071374670914),
      'Estadio Alfonso Lastras Ramírez',25709,2013,_country.mexico,68.7,[]];
    map[_name.santosLaguna] = [ClubColors(Colors.green,Colors.white),pattern.horStripes2,Coordinates(25.62846869, -103.3796996),
      'Nuevo Estadio Corona',30000,1983,_country.mexico,72.9,[]];
    map[_name.tampico] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Tamaulipas',19668,1945,_country.mexico,65.6,[]];
    map[_name.tecos] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(20.6937821, -103.4162585),
      'Tres de Marzo',22988,1971,_country.mexico,66.1,[]];
    map[_name.tigres] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(25.7232925346, -100.31197952),
      'Estádio Universitario',42000,1960,_country.mexico,78.0,[]];
    map[_name.tijuana] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(32.5066600, -116.9931046),
      'Caliente',33333,2007,_country.mexico,71.5,[]];
    map[_name.toluca] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(19.2873975, -99.66671939),
      'Estádio Nemesio Díez',30000,1917,_country.mexico,75.4,[]];
    map[_name.torosNeza] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(19.405891107, -98.9871339),
      'Estadio Neza 86',20000,1991,_country.mexico,68.4,[]];
    map[_name.veracruz] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(19.16429626, -96.1252219),
      'Luis "Pirata" Fuente',30000,1943,_country.mexico,66.8,[]];
    map[_name.zacatepec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,1948,_country.mexico,50.0,[]]; //EXTINTO 2020

    //USA
    map[_name.atlanta] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(33.75535771, -84.40062064),
      'Mercedes-Benz Stadium',72035,2014,_country.unitedStates,71.4,[]];
    map[_name.austin] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(30.38794963, -97.7192678),
      'Q2 Stadium',20738,2019,_country.unitedStates,68.6,[]];
    map[_name.minnesota] = [ClubColors(Colors.blue,Colors.grey),pattern.solid,Coordinates(44.95329071, -93.16552316),
      'Allianz Field',19400,2010,_country.unitedStates,70.8,[]];
    map[_name.cincinnati] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(39.1110140, -84.522226),
      'West End Stadium',26000,2015,_country.unitedStates,69.6,[]];
    map[_name.columbuscrew] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.009552335, -82.9910362),
      'Mapfre Stadium',19968,1994,_country.unitedStates,72.0,[]];
    map[_name.charlotte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.225876, -80.852819),
      'Bank of America Stadium',74867,2019,_country.unitedStates,67.4,[]];
    map[_name.chicago] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.765063860516534, -87.80527756829989),
      'Toyota Park',20000,1997,_country.unitedStates,69.6,[]];
    map[_name.chivasUSA] = [ClubColors(Colors.red,Colors.white,darkblue),pattern.stripes3,Coordinates(0,0),
      'StubHub Center',27000,2004,_country.unitedStates,50.0,[]];
    map[_name.coloradorapids] = [ClubColors(grena,Colors.grey),pattern.solid,Coordinates(39.805555555,-104.891944444),
      'DSG Park',19680,1995,_country.unitedStates,70.3,[]];
    map[_name.dcunited] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(38.8690816, -77.0125934),
      'Audi Field',20000,1995,_country.unitedStates,70.2,[]];
    map[_name.fcdallas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(33.15449939561873, -96.835056129),
      'Toyota Stadium',20500,1996,_country.unitedStates,70.9,[_name.houston]];
    map[_name.houston] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(29.752578440, -95.35189528),
      'BBVA Compass Stadium',22000,2005,_country.unitedStates,68.5,[_name.fcdallas]];
    map[_name.intermiami] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(26.19324744, -80.1606167),
      'Lockhart Stadium',17417,2018,_country.unitedStates,69.9,[]];
    map[_name.lagalaxy] = [ClubColors(Colors.white,Colors.blue),pattern.diagonal,Coordinates(33.8648141474, -118.2611211),
      'Dignity Health Sports Park',27000,1994,_country.unitedStates,69.7,[_name.losangelesfc]];
    map[_name.losangelesfc] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(34.0128338, -118.283579),
      'Banc of California Stadium',22000,2014,_country.unitedStates,72.7,[_name.lagalaxy]];
    map[_name.miamiFusion] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Lockhart Stadium',20450,1997,_country.unitedStates,64.9,[]]; //EXTINTO 2001
    map[_name.montreal] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.5624524, -73.552839),
      'Saputo Stadium',19619,2010,_country.canada,66.7,[]];
    map[_name.nashville] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(36.1301689, -86.7658585),
      'Geodis Park',30000,2016,_country.unitedStates,67.3,[]];
    map[_name.nerevolution] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(42.091105, -71.264239),
      'Gillette Stadium',25000,1996,_country.unitedStates,71.9,[]];
    map[_name.nycosmos] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0, 0),
      '',0,1970,_country.unitedStates,50.0,[]]; //EXTINTO 1985
    map[_name.nycity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.82973906, -73.9261731193736),
      'Yankee Stadium',33488,2013,_country.unitedStates,71.6,[_name.nyredbulls]];
    map[_name.nyredbulls] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.73713616, -74.149881),
      'Red Bull Arena',25000,1995,_country.unitedStates,69.2,[_name.nycity]];
    map[_name.orlando] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(28.5412203, -81.38898748),
      'Exploria Stadium',25500,2010,_country.unitedStates,70.5,[]];
    map[_name.portland] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(45.52168919, -122.69138305),
      'Providence Park',21144,1975,_country.unitedStates,71.1,[]];
    map[_name.seattle] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(47.5953977, -122.3311995),
      'Lumen Field',68000,2007,_country.unitedStates,72.5,[]];
    map[_name.philadelphia] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(39.83275356, -75.3779441855293),
      'PPL Park',18500,2008,_country.unitedStates,68.4,[]];
    map[_name.toronto] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.63334099, -79.41830505),
      'BMO Field',30000,2005,_country.canada,68.1,[]];
    map[_name.realSaltLake] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(40.5832722, -111.89327523),
      'Rio Tinto Stadium',20213,2004,_country.unitedStates,67.7,[]];
    map[_name.sanJoseEarthquakes] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(37.3512815, -121.9244801),
      'Avaya Stadium',18000,1994,_country.unitedStates,66.5,[]];
    map[_name.tampabay] = [ClubColors(Colors.green,Colors.yellow),pattern.horStripes3,Coordinates(0,0),
      'Al Lang Stadium',7000,1996,_country.unitedStates,61.9,[]];
    map[_name.kansas] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(39.12169273, -94.82291920),
      'Children\'s Mercy Park',18467,1995,_country.unitedStates,68.2,[]];
    map[_name.vancouver] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.2770509, -123.1119131),
      'BC Place',54500,2009,_country.canada,69.0,[]];
    map[_name.chicagosting] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Soldier Field',55000,1974,_country.unitedStates,50.0,[]]; //EXTINTO 1988
    map[_name.dallastornado] = [ClubColors(Colors.white,Colors.blue),pattern.sleeves,Coordinates(0, 0),
      '',0,1967,_country.unitedStates,50.0,[]]; //EXTINTO 1981
    map[_name.laaztecs] = [ClubColors(Colors.white,Colors.blue,Colors.orange),pattern.solid,Coordinates(0, 0),
      '',0,1973,_country.unitedStates,50.0,[]]; //EXTINTO 1981

    //CANADA
    map[_name.cavalry] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.8840803, -114.0987956),
      'ATCO Field',6000,2018,_country.canada,65.3,[]];
    map[_name.forge] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(43.25220, -79.83009),
      'Tim Hortons Field',23218,2017,_country.canada,64.8,[]];

    //CARIBE
    //COSTA RICA
    map[_name.saprissa] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(9.9656632, -84.07525166),
      'Ricardo Saprissa Aymá',23112,1935,_country.costaRica,66.8,[]];
    map[_name.alajuelense] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(10.0218617, -84.20910),
      'Aleandro Morera Soto',17895,1919,_country.costaRica,67.2,[]];
    map[_name.cartagines] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.85850690, -83.918919),
      'José Rafael Fello Meza Ivankovich',18000,1906,_country.costaRica,64.6,[]];
    map[_name.herediano] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(9.99945, -84.12303),
      'Eladio Rosabal Cordero',17895,1921,_country.costaRica,65.3,[]];
    map[_name.perezZeledon] = [ClubColors(Colors.blue,darkblue),pattern.solid,Coordinates(9.3687800, -83.704733),
      'Estadio Municipal Pérez Zeledón',6000,1991,_country.costaRica,61.2,[]];
    map[_name.puntarenas] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(9.9763940, -84.838985),
      'Estadio Lito Pérez',4100,2004,_country.costaRica,62.7,[]];
    map[_name.sanCarlos] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(10.32398660, -84.423708),
      'Estádio Carlos Ugalde Álvarez',6200,1965,_country.costaRica,62.4,[]];
    map[_name.santosGuapiles] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(10.211370, -83.789813258),
      'Estadio Ebal Rodríguez',3000,1961,_country.costaRica,63.1,[]];
    map[_name.sptSanJose] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.94251970, -84.13030),
      'Ernesto Rohrmoser Stadium',3000,2016,_country.costaRica,63.6,[]];
    //EL SALVADOR
    map[_name.alianzaELS] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(13.6811446, -89.222373),
      'Estadio Cuscatlán',53400,1958,_country.elsalvador,66.4,[]];
    map[_name.atleticomarte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(13.6812, -89.2224),
      'Estadio Cuscatlán',53400,1950,_country.elsalvador,62.1,[]];
    map[_name.aguila] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(13.482514, -88.16900),
      'Juan Francisco Barraza',15500,1926,_country.elsalvador,65.4,[]];
    map[_name.fas] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(13.976406867, -89.56907633),
      'Estádio Óscar Quiteño',17500,1947,_country.elsalvador,64.7,[]];
    map[_name.firpo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(13.34976510, -88.43801966),
      'Estádio Sergio Torres Rivera',10000,1923,_country.elsalvador,64.4,[]];
    map[_name.isidro] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.332095, -89.44904),
      'Jorge "Calero" Suárez',2000,2000,_country.elsalvador,63.2,[]];
    map[_name.santaTecla] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(13.6717297, -89.29938447),
      'Estádio Las Delicias',10000,2007,_country.elsalvador,62.0,[]];
    //GUATEMALA
    map[_name.antiguaGuatemala] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.5673481, -90.7381967),
      'Estadio Pensativo',9000,1958,_country.guatemala,65.0,[]];
    map[_name.comunicaciones] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(14.6258950, -90.509649),
      'Doroteo Guamuch Flores',26000,1949,_country.guatemala,66.1,[]];
    map[_name.municipal] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.62516724, -90.5101396),
      'Doroteo Guamuch Flores',26000,1936,_country.guatemala,66.8,[]];
    map[_name.xelaju] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.842098, -91.51714438),
      'Mario Camposeco',11000,1928,_country.guatemala,64.6,[]];
    map[_name.depGuastatoya] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(14.860097, -90.07192),
      'Estadio David Cordón Hichos',3100,1990,_country.guatemala,62.8,[]];
    //HONDURAS
    map[_name.marathon] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(15.47014392, -88.00675),
      'Estadio Olímpico Metropolitano',45000,1925,_country.honduras,64.3,[]];
    map[_name.motagua] = [ClubColors(Colors.blue,darkblue),pattern.solid,Coordinates(14.098298, -87.2039269),
      'Tiburcio Carias Andino',35000,1928,_country.honduras,66.4,[]];
    map[_name.olimpiaHON] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(14.09869, -87.203603),
      'Tiburcio Carias Andino',30000,1965,_country.honduras,68.2,[]];
    map[_name.rcdespana] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(15.507659, -88.033096),
      'Francisco Morazán',26781,1929,_country.honduras,63.7,[]];
    map[_name.vida] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio Nilmo Edwards',18000,1940,_country.honduras,61.2,[]];
    //NICARAGUA
    map[_name.diriangen] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(11.8612898, -86.2433238),
      'Estadio Cacique Diriangén',7500,1917,_country.nicaragua,63.1,[]];
    map[_name.managua] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(12.131400, -86.284694),
      'Olímpico del IND Managua',9000,2006,_country.nicaragua,64.6,[]];
    map[_name.realEsteli] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(13.097860, -86.352943),
      'Estadio Independencia',5000,1961,_country.nicaragua,65.9,[]];
    map[_name.walterferreti] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico del IND Manágua',14000,1987,_country.nicaragua,61.4,[]];
    //PANAMA
    map[_name.alianzaPAN] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.03394, -79.470226),
      'Luis Ernesto Cascarita Tapia',1000,1963,_country.panama,63.3,[]];
    map[_name.arabeunido] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.34405, -79.89594),
      'Armando Dely Valdés',4000,1994,_country.panama,60.2,[]];
    map[_name.independienteChorrera] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(8.8873752, -79.775471),
      'Agustín Muquita Sánchez',3000,1982,_country.panama,61.4,[]];
    map[_name.plazaAmador] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(8.945835, -79.549585),
      'Maracaná de Panamá',6000,1955,_country.panama,63.6,[]];
    map[_name.sanMiguelito] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Estadio Los Andes II',1450,1989,_country.panama,64.8,[]];
    map[_name.tauro] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.0358766, -79.4693139),
      'Rommel Fernández',32000,1984,_country.panama,64.4,[]];

    //CARIBE
    //BELIZE
    map[_name.bandits] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(17.2516295, -88.7635945),
      'Isidoro Beaton Stadium',2500,1978,_country.belize,63.1,[]];
    map[_name.sanPedroPirates] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(17.90472143, -87.9790900),
      'Ambergris Stadium',1000,2017,_country.belize,61.1,[]];
    map[_name.verdes] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(17.1601597, -89.0699064),
      'Norman Broaster Stadium',2000,1976,_country.belize,62.5,[]];
    //CUBA
    map[_name.camaguey] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Terreno Sebastopol',1000,1912,_country.cuba,53.1,[]];
    map[_name.ciegoavila] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0, 0),
      'Complejo Deportivo Sergio Alonso Grandal',3000,1978,_country.cuba,56.1,[]];
    map[_name.cienfuegos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Luis Pérez Lozano',4000,1978,_country.cuba,59.1,[]];
    map[_name.lahabana] = [ClubColors(Colors.purple,darkblue),pattern.stripes2,Coordinates(0, 0),
      'Estadio La Polar',2000,1915,_country.cuba,58.1,[]];
    map[_name.pinardelrio] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(22.421594, -83.69040778),
      'Estadio Capitán San Luis',8000,1978,_country.cuba,61.4,[]];
    map[_name.santiagoCuba] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(20.0365537, -75.81123),
      'Pista de Atletismo de Rekortan',5000,0,_country.cuba,59.6,[]];
    map[_name.villaclara] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(22.40494586, -79.950525),
      'Augusto César Sandino',18000,1978,_country.cuba,62.1,[]];
    //HAITI
    map[_name.arcahaie] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(18.5585818, -72.3217),
      'Parc Saint-Yves',1000,2017,_country.haiti,64.2,[]];
    map[_name.cavaly] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(19.9298295, -72.71602628),
      'Parc Julia Vilbon',1000,1975,_country.haiti,61.2,[]];
    map[_name.donbosco] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(18.5189640, -72.2777613),
      'Stade Pétion-Ville',5000,1963,_country.haiti,58.2,[]];
    map[_name.fica] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(19.75364810, -72.20763375),
      'Parc Saint-Victor',7500,1972,_country.haiti,62.1,[]];
    map[_name.mirebalais] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Parc Nelson Petit-Frère',2000,2000,_country.haiti,55.6,[]];
    map[_name.racingHAITI] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(18.53614276, -72.34248),
      'Sylvio Cator',15000,1923,_country.haiti,57.8,[]];
    map[_name.tempete] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Parc Levelt',10000,1970,_country.haiti,59.6,[]];
    map[_name.violette] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(18.5361821, -72.342520),
      'Sylvio Cator',10500,1918,_country.haiti,64.3,[]];
    //JAMAICA
    map[_name.arnettGardens] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(17.9889844, -76.79935),
      'Anthony Spaulding Sports Complex',7000,1977,_country.jamaica,59.5,[]];
    map[_name.harbourView] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.9565928, -76.717187),
      'Harbour View Stadium',10000,1974,_country.jamaica,56.2,[]];
    map[_name.portmore] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(17.99285, -76.950748),
      'Prison Oval',2000,1985,_country.jamaica,57.6,[]];
    map[_name.tivoliGardens] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(17.9705540, -76.799638),
      'Edward Seaga Sports Complex',5000,1970,_country.jamaica,60.6,[]];
    map[_name.waterhouse] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(18.0013607, -76.77260),
      'Waterhouse Stadium',5000,1968,_country.jamaica,61.1,[]];
    //REP. DOMINICANA
    map[_name.cibao] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(19.44559127, -70.67974268),
      'Estadio Cibao FC',10000,2015,_country.dominicanRepublic,58.4,[]];
    map[_name.omFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(18.48131234, -69.9187132),
      'Estadio Olímpico Félix Sánchez',27000,2010,_country.dominicanRepublic,59.3,[]];
    map[_name.moca] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(19.38392934, -70.5341363),
      'Estadio Complejo Deportivo Moca 86',7000,1971,_country.dominicanRepublic,56.4,[]];
    map[_name.pantoja] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(18.480455936, -69.91863266),
      'Estadio Olímpico Félix Sánchez',27000,2000,_country.dominicanRepublic,60.1,[]];
    //SURINAME
    map[_name.intermoengotapoe] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(5.6214317, -54.4016037),
      'Ronnie Brunswijkstadion',5000,1992,_country.suriname,61.5,[]];
    map[_name.leovictor] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Dr. Ir. Franklin Essed Stadion',3500,1934,_country.suriname,57.2,[]];
    map[_name.robinhood] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.8376520, -55.1602422),
      'André Kamperveen Stadion',6000,1945,_country.suriname,61.2,[]];
    map[_name.transvaal] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(5.8377, -55.160),
      'André Kamperveen Stadion',6000,1921,_country.suriname,60.4,[]];
    map[_name.voorwaarts] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Voorwaartsveld',1500,1919,_country.suriname,56.6,[]];
    map[_name.walking] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Franklin Essed Stadion',3500,1997,_country.suriname,57.1,[]]; //EXTINTO 2019
    //TRINIDAD TOBAGO
    map[_name.centralFC] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(10.42489512, -61.41732595),
      'Ato Boldon Stadium',10000,2012,_country.trinidadTobago,56.6,[]];
    map[_name.connection] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(10.303194782, -61.44113680),
      'Manny Ramjohn Stadium',10000,1999,_country.trinidadTobago,58.6,[]];
    map[_name.defenseforce] = [ClubColors(Colors.yellow,Colors.lightBlue),pattern.solid,Coordinates(10.661544, -61.533036),
      'Hasely Crawford',27000,1974,_country.trinidadTobago,61.0,[]];
    map[_name.police] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(10.30349244, -61.4417926),
      'Manny Ramjohn Stadium',10000,1975,_country.trinidadTobago,57.3,[]];
    map[_name.stAnnRangers] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(10.6615435, -61.53307856),
      'Hasely Crawford Stadium',24000,1979,_country.trinidadTobago,55.1,[]];

    //////////////////////////////////////////////////////////////////////////////////
    //CHINA
    map[_name.beijingguoan] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(39.865559, 116.272423),
      'Beijing Fengtai Stadium',31043,1992,_country.china,71.6,[]];
    map[_name.changchun] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.836849, 125.39063),
      'Development Area Stadium',25000,1996,_country.china,69.3,[]];
    map[_name.chengdu] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.97869, 103.648159),
      'Chengdu Phoenix Hill',57087,2018,_country.china,67.3,[]];
    map[_name.chongqing] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,64.7,[]];
    map[_name.dalian] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(39.0208235, 121.56178),
      'Dalian Sports Center',61000,2009,_country.china,71.2,[]];
    map[_name.ghuangzhou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(23.1405485, 113.319334),
      'Tianhe Stadium',58500,1954,_country.china,65.3,[]];
    map[_name.ghuangzhouCity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,63.1,[]];
    map[_name.hebei] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,66.2,[]];
    map[_name.henan] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(34.71675, 113.72510),
      'Zhengzhou Hanghai',29860,1994,_country.china,68.6,[]];
    map[_name.jiangsu] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0, 0),
      'Nanjing Olympic Sports Centre',61443,1958,_country.china,50.0,[]]; //EXTINTO 2021
    map[_name.meizhou] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(23.914710, 115.765430),
      'Huitang Stadium',27000,2013,_country.china,62.7,[]];
    map[_name.nantong] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(32.376731, 120.584843),
      'Rugao Olympic Sports Center',15000,2016,_country.china,63.8,[]];
    map[_name.liaoning] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(0,0),
      'Olímpico de Shenyang',60000,1953,_country.china,50.0,[]];
    map[_name.shandong] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(36.656062, 117.11020),
      'Luneng Stadium',56808,1993,_country.china,73.0,[]];
    map[_name.shanghaisipg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.1835,121.437278),
      'Estádio de Shanghai',56842,2005,_country.china,73.2,[]];
    map[_name.shanghaishenhua] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(31.2734280, 121.476465),
      'Hongkou Stadium',33060,1993,_country.china,72.5,[]];
    map[_name.shenzhen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(22.5620751, 114.0869843),
      'Luneng Stadium',32500,1994,_country.china,70.8,[]];
    map[_name.tianjin] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.03144590, 117.7252421),
      'TEDA Football Stadium',37450,1957,_country.china,71.2,[]];
    map[_name.wuhan] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(30.58665415, 114.27357162),
      'Xinhua Road Sports Center',22000,2009,_country.china,69.6,[]];
    map[_name.zhejiang] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(30.2684601, 120.1288182),
      'Yellow Dragon Sports Center',52672,1998,_country.china,65.7,[]];
    //HONG KONG
    map[_name.easternSC] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(22.326124787, 114.1731577),
      'Mong Kok Stadium',6664,1932,_country.china,62.6,[]];
    map[_name.kitchee] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(22.3260865, 114.1730563),
      'Mong Kok Stadium',6769,1931,_country.china,64.2,[]];
    map[_name.leeMan] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(22.3119310, 114.2638485),
      'Tseung Kwan O Sports Ground',3500,2017,_country.china,61.5,[]];
    //TAIWAN
    map[_name.tainanCity] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.3208436, 120.3129334),
      'Tainan Football Field',2000,2016,_country.taiwan,62.7,[]];
    map[_name.taiPower] = [ClubColors(grena,Colors.green),pattern.solid,Coordinates(22.70342824, 120.29450958),
      'Kaoshiung National Stadium',55000,1978,_country.taiwan,62.0,[]];

    //JAPÃO
    map[_name.albirex] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(37.88270153, 139.05925980),
      'Estádio Big Swan',42300,1955,_country.japan,67.5,[]];
    map[_name.avispa] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(33.5859820, 130.460848),
      'Best Denki Stadium',22563,1982,_country.japan,68.6,[]];
    map[_name.cerezoOsaka] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(34.61412159, 135.5185547),
      'Estádio Nagai',47000,1957,_country.japan,71.7,[]];
    map[_name.fcTokyo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(35.664162, 139.527388),
      'Ajinomoto Stadium',50100,1999,_country.japan,70.4,[]];
    map[_name.gambaOsaka] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(34.802526,135.538278),
      'Suita Stadium',39694,1980,_country.japan,72.4,[]];
    map[_name.jefUnited] = [ClubColors(Colors.yellow,Colors.green,Colors.red),pattern.solid,Coordinates(35.5775392, 140.122862),
      'Fukuda Denshi Arena',19781,1946,_country.japan,66.4,[]];
    map[_name.jubiloiwata] = [ClubColors(Colors.lightBlueAccent,Colors.blueAccent),pattern.solid,Coordinates(34.7434570, 137.970775),
      'Shizuoka Ecopa',50000,1970,_country.japan,71.3,[]];
    map[_name.kashimaantlers] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(35.992503, 140.64383881),
      'Kashima Soccer Stadium',40728,1994,_country.japan,72.6,[]];
    map[_name.kashiwaReysol] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(35.8485972, 139.975101733),
      'Hitachi Kashiwa Soccer Stadium',15900,1940,_country.japan,71.7,[]];
    map[_name.kawasakifrontale] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(35.585895,139.652731),
      'Todoroki Athletics Stadium',27495,1997,_country.japan,72.3,[]];
    map[_name.kyoto] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(35.017214, 135.5850010),
      'Sanga Stadium',21326,1921,_country.japan,69.7,[]];
    map[_name.hiroshima] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(34.440852708, 132.39482460),
      'Edion Stadium Hiroshima',1938,1938,_country.japan,68.6,[]];
    map[_name.nagoya] = [ClubColors(Colors.red,Colors.orange),pattern.solid,Coordinates(35.084593, 137.17108),
      'Estádio de Toyota',45000,1939,_country.japan,68.3,[]];
    map[_name.omiyaardija] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(0,0),
      'NACK5 Stadium Omiya',15500,1964,_country.japan,64.3,[_name.urawareddiamonds]];
    map[_name.oitatrinita] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Big Eye',43000,1994,_country.japan,62.6,[]];
    map[_name.sagantosu] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(33.37167358, 130.520184),
      'Best Amenity',24490,1987,_country.japan,66.8,[]];
    map[_name.sapporo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.0151545, 141.4096851),
      'Sapporo Dome',41484,1939,_country.japan,68.4,[]];
    map[_name.shimizuSPulse] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(34.7430896, 137.9709125),
      'Shizuoka Stadium',51349,1991,_country.japan,68.7,[]];
    map[_name.shonanbellmare] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(35.3436334, 139.341192),
      'Hiratsuka Athletics',18500,1968,_country.japan,66.1,[]];
    map[_name.tokyoVerdy] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.6634977, 139.52787047),
      'Ajinomoto Stadium',50000,1991,_country.japan,65.7,[]];
    map[_name.urawareddiamonds] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(35.903142,139.717492),
      'Estádio Saitama 2002',63700,1950,_country.japan,74.2,[]];
    map[_name.vegaltaSendai] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(38.31913456, 140.88192),
      'Yurtec Stadium Sendai',19694,1988,_country.japan,67.7,[]];
    map[_name.visselkobe] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(34.65734782, 135.1696),
      'Estádio Kobe Wing',30182,1966,_country.japan,74.0,[]];
    map[_name.yokohamaFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.46916, 139.603706),
      'Mitsuzawa Stadium',15046,1999,_country.japan,70.4,[]];
    map[_name.yokohamamarinos] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(35.5102166, 139.60648),
      'Estádio Internacional de Yokohama',72327,1972,_country.japan,72.0,[]];

    //SOUTH KOREA
    map[_name.busan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.190186683, 129.05830),
      'Busan Asiad',53864,1979,_country.southKorea,67.6,[]];
    map[_name.daegu] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(35.881330, 128.588442),
      'DGB Daegu Bank Park',12415,2002,_country.southKorea,66.8,[]];
    map[_name.gangwon] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(37.7737816, 128.897490),
      'Gangneung Stadium',30000,2008,_country.southKorea,64.7,[]];
    map[_name.gimcheon] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.139672, 128.08642078),
      'Gimcheon Stadium',32000,1984,_country.southKorea,63.5,[]];
    map[_name.gwangju] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Gwangju World Cup Stadium',40074,2010,_country.southKorea,62.5,[]];
    map[_name.gyeongnam] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(0,0),
      'Changwon Football Center',15074,2006,_country.southKorea,66.5,[]];
    map[_name.incheon] = [ClubColors(Colors.blue,Colors.black),pattern.stripes4,Coordinates(37.466183, 126.64357953),
      'Incheon Football Stadium',20891,2003,_country.southKorea,68.9,[]];
    map[_name.jeonnam] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Gwang-Yang Stadium',14284,1994,_country.southKorea,65.1,[]];
    map[_name.jeonbuk] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.8683430, 127.064329),
      'Jeonju World Cup Stadium',42477,1994,_country.southKorea,71.8,[]];
    map[_name.jeju] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(33.24632024, 126.509235),
      'Jeju World Cup Stadium',35657,1982,_country.southKorea,67.5,[]];
    map[_name.pohang] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(36.0088520, 129.363788),
      'Pohang Steel Yard',25000,1973,_country.southKorea,70.8,[]];
    map[_name.fcseoul] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(37.56837781, 126.897502),
      'Seoul World Cup Stadium',66704,1983,_country.southKorea,68.4,[]];
    map[_name.seongnam] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.4101435, 127.1213833),
      'Tancheon Sports Complex',16146,1989,_country.southKorea,66.7,[]];
    map[_name.suwonFC] = [ClubColors(Colors.red,darkblue),pattern.stripes2,Coordinates(0,0),
      'Suwon Sports Complex',11808,2016,_country.southKorea,63.1,[]];
    map[_name.suwonsamsung] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(37.2866172728, 127.0367),
      'Big Bird',43288,1995,_country.southKorea,70.1,[]];
    map[_name.ulsan] = [ClubColors(Colors.blue,Colors.blueAccent),pattern.stripes3,Coordinates(35.56251397, 129.3483643),
      'Munsu Cup Stadium',44474,1983,_country.southKorea,73.0,[]];
    //NORTH KOREA
    map[_name.april25] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.0495805, 125.775884),
      'Rungrado 1st of May',114000,1983,_country.northKorea,64.2,[]];
    map[_name.kigwancha] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.11040, 124.41391785),
      'Sinuiju Stadium',17500,1956,_country.northKorea,62.5,[]];
    map[_name.pyongyang] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.solid,Coordinates(39.04828881, 125.77541058),
      'Rungrado 1st of May',114000,1956,_country.northKorea,62.0,[]];

    //RESTO ASIA - TAILANDIA
    map[_name.bangkok] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(14.06813405, 100.599042),
      'Thammasat Stadium',25000,1988,_country.thailand,50.0,[]];
    map[_name.bangkokBank] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(0,0),
      'Bangkok Bank Ground',2000,1955,_country.thailand,50.0,[]];
    map[_name.buriram] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(14.96592429, 103.0944633),
      'New i-mobile Stadium',32600,1970,_country.thailand,50.0,[]];
    map[_name.chainat] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(15.2192277, 100.155405),
      'Khao Plong Stadium',12000,2009,_country.thailand,50.0,[]];
    map[_name.chiangrai] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(19.9569382, 99.87459810),
      'Leo Chiangrai Stadium',11354,2009,_country.thailand,50.0,[]];
    map[_name.chonburi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(13.411198007, 100.9935489),
      'Chonburi Stadium',8680,1997,_country.thailand,50.0,[]];
    map[_name.khonkaen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(16.412952125, 102.8276527),
      'Khon Kaen Provincial',7000,2014,_country.thailand,50.0,[]];
    map[_name.muangthong] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(13.918021654, 100.5473407),
      'Thunderdome Stadium',15000,1989,_country.thailand,50.0,[]];
    map[_name.nakhon] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(14.92710584, 102.0494550),
      '80th Birthday Stadium',24641,1999,_country.thailand,50.0,[]];
    map[_name.nongbuaPitchaya] = [ClubColors(Colors.purpleAccent,Colors.blue),pattern.solid,Coordinates(17.1942153, 102.43564512),
      'Pitchaya Stadium',6000,2010,_country.thailand,50.0,[]];
    map[_name.pattaya] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Nong Prue Stadium',5500,1989,_country.thailand,54.0,[]];
    map[_name.pathum] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(14.00078645, 100.679328),
      'Leo Stadium',10114,2006,_country.thailand,50.0,[]];
    map[_name.prachuap] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(11.81750065, 99.7886435),
      'Sam Ao Stadium',5000,2009,_country.thailand,50.0,[]];
    map[_name.portFC] = [ClubColors(Colors.blue,Colors.orange),pattern.divided,Coordinates(13.7151569, 100.55962713),
      'PAT Stadium',8000,1967,_country.thailand,50.0,[]];
    map[_name.becToroSasana] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(13.86733613, 100.578051),
      'Boonyachinda Stadium',3550,1992,_country.thailand,50.0,[]];
    map[_name.ratchaburi] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(13.52162906, 99.7698381),
      'Mitr Phol Stadium',10000,2004,_country.thailand,50.0,[]];
    map[_name.thaiAirForce] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Thupatemi Stadium',25000,1937,_country.thailand,54.0,[]];
    map[_name.samutPrakan] = [ClubColors(Colors.blue,Colors.lightGreenAccent),pattern.horStripes2,Coordinates(13.5792926, 100.7946855),
      'Samut Prakarn SAT Stadium',5100,2019,_country.thailand,50.0,[]];
    map[_name.suphanburi] = [ClubColors(darkblue,Colors.orange),pattern.solid,Coordinates(14.4740419, 100.08671126),
      'Estádio Municipal de Suphanburi',25000,1998,_country.thailand,50.0,[]];
    map[_name.thai] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(0,0),
      'Kasikorn Bank Stadium',5000,1987,_country.thailand,50.0,[]];
    //INDIA
    map[_name.aizawl] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Rajiv Gandhi Stadium',20000,1984,_country.india,57.8,[]];
    map[_name.atk] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Salt Lake Stadium',85000,2014,_country.india,50.0,[]]; //EXTNTO 2020
    map[_name.bengaluru] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(12.9698491, 77.5938683),
      'Sree Kanteerava',19000,2013,_country.india,63.5,[]];
    map[_name.chennaiyin] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(13.0858151, 80.271831),
      'Jawaharlal Nehru',40000,2014,_country.india,64.8,[]];
    map[_name.churchill] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Fatorda Stadium',27300,1951,_country.india,55.5,[]];
    map[_name.delhi] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(20.28804185, 85.8236558),
      'Kalinga Stadium',60000,2014,_country.india,65.6,[]];
    map[_name.dempo] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(15.28902862, 73.96277713),
      'Fatorda Stadium',24500,1968,_country.india,58.6,[]];
    map[_name.eastBengal] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(22.55947727, 88.3438917),
      'East Bengal Ground',23500,1920,_country.india,65.0,[]];
    map[_name.jamshedpur] = [ClubColors(Colors.red,Colors.blue),pattern.sleeves,Coordinates(22.8062110, 86.19337526),
      'JRD Tata Sports Complex',23887,2017,_country.india,63.6,[]];
    map[_name.jct] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Guru Nanak Stadium',22000,1971,_country.india,50.0,[]]; //EXTINOTO 2011
    map[_name.goa] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(15.28948422, 73.962551),
      'Fatorda Stadium',24500,2014,_country.india,66.3,[]];
    map[_name.hyderabad] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.446364257, 78.34410),
      'G.M.C Balayogi Athletic',30000,2019,_country.india,64.1,[]];
    map[_name.kerala] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(13.08564797, 80.2716407),
      'Jawaharlal Nehru',75000,2014,_country.india,63.3,[]];
    map[_name.mohunBagan] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(22.5622357, 88.34235),
      'Mohun Bagan Ground',20000,2020,_country.india,61.5,[]];
    map[_name.mumbai] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(19.042204573, 73.0269),
      'DY Patil Stadium',55000,2014,_country.india,65.8,[]];
    map[_name.pune] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,2014,_country.india,50.8,[]]; //EXTINTO 2019
    map[_name.northeast] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(26.115528, 91.760329),
      'Indira Gandhi Athletic Stadium',35000,2004,_country.india,66.2,[]];
    map[_name.odisha] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(20.2880451, 85.82383754),
      'Kalinga Stadium',60000,2014,_country.india,62.6,[]];
    map[_name.salgaocar] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(0, 0),
      '',0,0,_country.india,50.0,[]];
    //BANGLADESH
    map[_name.bashundhara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.93206572, 88.845353167),
      'Estádio Sheikh Kamal',21359,2013,_country.bangladesh,61.8,[]];
    map[_name.dhakaAbahani] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(23.72791777, 90.4135417),
      'Bangabandhu National Stadium',60000,1972,_country.bangladesh,60.1,[]];
    map[_name.mohammedan] = [ClubColors(Colors.black,Colors.white),pattern.sleeves,Coordinates(22.56896939, 88.4089041),
      'Vivekananda Yuba Bharati Krirangan',85000,1891,_country.bangladesh,63.3,[]];
    map[_name.saif] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.54811565, 90.5364364),
      'Munshigonj District Stadium',10000,2016,_country.bangladesh,58.3,[]];
    map[_name.sheikhJamal] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(23.5477248, 90.53690),
      'Munshigonj District Stadium',10000,1962,_country.bangladesh,56.8,[]];
    //CAMBOJA
    map[_name.boeungKet] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(11.536736, 104.9561471),
      'Cambodia Airways Stadium',2500,2008,_country.cambodia,60.5,[]];
    map[_name.nagaworld] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(11.4883311, 104.483529),
      'Kampong Speu Stadium',3000,2001,_country.cambodia,61.2,[]];
    map[_name.phnomPenhCrown] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(11.6047089, 104.894398),
      'RSN Stadium',5000,2001,_country.cambodia,63.1,[]];
    map[_name.preahKhan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(11.082494, 105.802971),
      'Svay Rieng Stadium',2150,1997,_country.cambodia,62.6,[]];
    map[_name.visakha] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(11.62644372, 104.8736629),
      'Prince Stadium',10000,2016,_country.cambodia,62.0,[]];
    //INDONESIA
    map[_name.bali] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-8.5468398, 115.3064336),
      'Kapten I Wayan Dipta',18000,2015,_country.indonesia,67.1,[]];
    map[_name.borneo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.49305867, 117.14939),
      'Segiri Stadium',16000,2014,_country.indonesia,65.4,[]];
    map[_name.persib] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-6.957815877, 107.712158),
      '	Gelora Bandung Lautan Api Stadium',38000,1933,_country.indonesia,63.6,[]];
    map[_name.persebaya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.223110, 112.6228187),
      'Gelora Bung Tomo Stadium',30000,1927,_country.indonesia,66.1,[]];
    map[_name.persipura] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5790803, 140.57361),
      'Lukas Enembe',40263,1963,_country.indonesia,65.1,[]];
    map[_name.psmMakassar] = [ClubColors(grena,Colors.yellow),pattern.solid,Coordinates(-4.03674060, 119.6459761),
      'Gelora B.J. Habibie Stadium',20000,1915,_country.indonesia,61.6,[]];
    map[_name.psmsMedan] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(3.5649591, 98.6956563),
      'Teladan Stadium',20000,1950,_country.indonesia,62.6,[]];
    //LAOS
    map[_name.chanthabouly] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(18.0615339, 102.703581),
      'New Laos National Stadium',25000,2013,_country.laos,58.8,[]];
    map[_name.youngElephants] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(18.0620644, 102.703995),
      'New Laos National Stadium',25000,2015,_country.laos,59.5,[]];
    //MALAYSIA
    map[_name.johorDarul] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.497541866, 103.751479),
      'Larkin Stadium',30000,1970,_country.malaysia,68.4,[]];
    map[_name.kedah] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(6.135977965, 100.3716979),
      'Darul Aman Stadium',32387,1924,_country.malaysia,62.6,[]];
    map[_name.kelantan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(6.1242980, 102.243682),
      'Sultan Muhammad IV Stadium',22000,1946,_country.malaysia,63.4,[]];
    map[_name.kualaLumpur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.10071364, 101.721440),
      'Kuala Lumpur Stadium',18000,1974,_country.malaysia,65.8,[]];
    map[_name.penang] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.26120426, 100.437613187),
      'Penang State Stadium',40000,1921,_country.malaysia,66.1,[]];
    map[_name.sabah] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(5.98317860, 116.0955644),
      'Likas Stadium',35000,1950,_country.malaysia,59.3,[]];
    map[_name.sripahang] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(3.814934281, 103.3237541),
      'Darul Makmur Stadium',40000,1959,_country.malaysia,61.5,[]];
    map[_name.selangor] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(3.08214134, 101.54496),
      'Our Tampines Hub',80372,1905,_country.malaysia,65.4,[]];
    //MALDIVES
    map[_name.maziya] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(4.174317668, 73.513048572),
      'National Football Stadium',11850,1956,_country.maldives,58.6,[]];
    //MYANMAR
    map[_name.ayeyawady] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(21.97699345, 96.0992539),
      'Ayar Stadium',3000,2009,_country.myanmar,59.0,[]];
    map[_name.shanUnited] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(16.4950564, 97.62395418),
      'KBZ Stadium',7000,2005,_country.myanmar,61.6,[]];
    map[_name.yadanarbon] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(21.97707786, 96.099176),
      'Bahtoo Stadium',17000,2009,_country.myanmar,59.6,[]];
    map[_name.yangon] = [ClubColors(darkblue,Colors.greenAccent),pattern.solid,Coordinates(16.8473329, 96.1271126),
      'Yangon United Sports Complex',3500,2009,_country.myanmar,62.0,[]];
    //MONGOLIA
    map[_name.athletic220] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.900222, 106.916315),
      'MFF Football Centre',5000,2016,_country.mongolia,56.1,[]];
    map[_name.erchim] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.888914, 106.79751),
      'Erchim Stadium',2000,1994,_country.mongolia,58.7,[]];
    map[_name.khoromkhon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.9022031, 106.91699),
      'MFF Football Centre',5000,1999,_country.mongolia,57.6,[]];
    map[_name.ulaanbaatar] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.8013018, 106.744977),
      'G-Mobile Arena',5300,2016,_country.mongolia,59.5,[]];
    //VIETNA
    map[_name.becamex] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(10.97050, 106.67195),
      'Gò Đậu Stadium',18250,1976,_country.vietnam,58.5,[]];
    map[_name.danang] = [ClubColors(Colors.orange,Colors.purple),pattern.solid,Coordinates(10.97050, 106.67195),
      'Hòa Xuân Stadium',20500,1976,_country.vietnam,61.2,[]];
    map[_name.dongtam] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Long An Stadium',19975,2000,_country.vietnam,62.1,[]];
    map[_name.haiphong] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(20.851882, 106.688773),
      'Lạch Tray Stadium',30000,1952,_country.vietnam,60.5,[]];
    map[_name.hanoi] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(21.0298189, 105.833028),
      'Hàng Đẫy Stadium',22500,2006,_country.vietnam,64.6,[]];
    map[_name.giaLai] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(13.9791847, 108.0048264),
      'Pleiku Stadium',25000,2001,_country.vietnam,57.8,[]];
    map[_name.hochiminh] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(10.76034756, 106.66339),
      'Thống Nhất Stadium',15000,1960,_country.vietnam,62.1,[]];
    map[_name.quangNam] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(15.559992, 108.50684),
      'Tam Ky Stadium',15624,1997,_country.vietnam,60.2,[]];
    map[_name.saigon] = [ClubColors(Colors.purpleAccent,Colors.purple),pattern.solid,Coordinates(10.761339, 106.663524),
      'Thong Nhat Stadium',15000,2016,_country.vietnam,64.0,[]];
    map[_name.songLam] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(18.669197, 105.669119),
      'Vinh Stadium',18000,1979,_country.vietnam,59.5,[]];
    map[_name.thanhoa] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(19.799246, 105.772764),
      'Thanh Hóa Stadium',14000,1962,_country.vietnam,58.1,[]];
    map[_name.viettel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(21.0303177, 105.832964),
      'Hàng Đẫy Stadium',22500,1954,_country.vietnam,62.5,[]];
    //PHILIPPINNES
    map[_name.globalCebu] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(10.300411, 123.8953386),
      'Cebu City Sports Center',5500,2000,_country.philippines,62.1,[]];
    map[_name.kaya] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(10.7119240, 122.56245),
      'Iloilo Sports Complex',7000,1996,_country.philippines,61.3,[]];
    map[_name.maharlikaManila] = [ClubColors(Colors.black,Colors.purple),pattern.solid,Coordinates(14.563410, 120.9921828),
      'Rizal Memorial Stadium',12873,2020,_country.philippines,65.3,[]];
    map[_name.stallionLaguna] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(14.3149952, 121.0779346),
      'Biñan Football Stadium',2580,2002,_country.philippines,62.1,[]];
    map[_name.unitedCity] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(15.3455705, 120.5335554),
      'New Clark City Athletics',20000,2012,_country.philippines,64.6,[]];
    //NEPAL
    map[_name.machhindra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(27.69569827, 85.3148114),
      'Dasarath Rangasala',15000,1973,_country.nepal,61.8,[]];
    map[_name.manangMarshyangdi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(27.6950160, 85.314920),
      'Dasarath Rangasala',15000,1982,_country.nepal,60.3,[]];
    //SINGAPORE
    map[_name.albirexSINGAPORE] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(1.346770647, 103.7298978),
      'Jurong East Stadium',2700,2004,_country.singapore,62.1,[]];
    map[_name.lionSitySailors] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(1.310122578, 103.86030328),
      'Estádio Jalan Besar',6000,1946,_country.singapore,61.6,[]];
    map[_name.tampines] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(1.3528877, 103.940622),
      'Our Tampines Hub',5000,1945,_country.singapore,64.2,[]];
    map[_name.warriors] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.391140, 103.74921),
      'Choa Chu Kang Stadium',10000,1975,_country.singapore,63.6,[]];
    //BRUNEI
    map[_name.bruneidpmm] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(1.35453962, 103.851562),
      'Ground Bishan',30000,2000,_country.brunei,62.4,[]];

    //ORIENTE MÉDIO
    //QATAR
    map[_name.alarabi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.25861235, 51.520695),
      'Grand Hamad Stadium',18000,1952,_country.qatar,68.4,[]];
    map[_name.alduhail] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.373468, 51.469251),
      'Abdullah bin Khalifa',10221,1938,_country.qatar,71.2,[]];
    map[_name.algharafa] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(25.3448014, 51.4405835),
      'Al-Gharafa Stadium',25000,1979,_country.qatar,69.5,[]];
    map[_name.alrayyan] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(25.329864, 51.342718),
      'Ahmed bin Ali Stadium',27000,1967,_country.qatar,70.2,[]];
    map[_name.alsadd] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(25.267630, 51.484458),
      'Jassim Bin Hamad',15000,1969,_country.qatar,71.8,[]];
    map[_name.alwakrah] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Al-Wakrah Stadium',20000,1959,_country.qatar,63.2,[]];
    map[_name.eljaish] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(25.372635, 51.4686),
      'Abdullah bin Khalifa Stadium',12000,2017,_country.qatar,67.5,[]];
    map[_name.qatar] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(25.31702622, 51.51216724),
      'Suheim bin Hamad Stadium',15000,1961,_country.qatar,65.6,[]];
    map[_name.ummSalal] = [ClubColors(Colors.redAccent,Colors.orange),pattern.solid,Coordinates(25.3169538, 51.5122531),
      'Qatar SC Stadium',20000,1979,_country.qatar,64.2,[]];
    //UAE
    map[_name.ajman] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(25.392500, 55.450728),
      'Estádio Ajman',5537,1974,_country.uae,68.1,[]];
    map[_name.alain] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(24.245059, 55.7170932),
      'Hazza bin Zayed',25053,1968,_country.uae,71.6,[]];
    map[_name.aljazira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(24.452764,54.392019),
      'Estádio Mohammed Bin Zayed',42000,1974,_country.uae,73.2,[]];
    map[_name.alnasrEAU] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(25.23990846, 55.312893),
      'Al Maktoum Stadium',15058,1945,_country.uae,70.3,[]];
    map[_name.alShababEAU] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(25.2398565, 55.3129988),
      'Al Maktoum',20000,1958,_country.uae,64.7,[]];
    map[_name.alsharjah] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(25.3332735, 55.4195766),
      'Sharjah Stadium',10000,1966,_country.uae,69.1,[]];
    map[_name.alWahda] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(24.469883556, 54.3753338),
      'Estádio Al Nahyan',12000,1974,_country.uae,71.2,[]];
    map[_name.alwasl] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(25.219131, 55.3169737),
      'Zabeel Stadium',18000,1960,_country.uae,70.4,[]];
    map[_name.baniyas] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(24.34986, 54.68571),
      'Baniyas Stadium',9047,1974,_country.uae,66.2,[]];
    map[_name.shababalahli] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(25.279691, 55.3607072),
      'Rashed Stadium',15000,1958,_country.uae,68.4,[]];
    //BAHREIN
    map[_name.alahliBAH] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(25.2633977, 51.4475668),
      'Khalifa International Stadium',50000,1950,_country.bahrein,66.8,[]];
    map[_name.alhidd] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.15366, 50.54359),
      'Bahrain National Stadium',24000,1945,_country.bahrein,65.6,[]];
    map[_name.alMuharraq] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(26.25750173, 50.62779),
      'Al Muharraq Stadium',20000,1928,_country.bahrein,68.7,[]];
    map[_name.alRiffa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.1528, 50.542743),
      'Bahrain National Stadium',24000,1953,_country.bahrein,66.2,[]];
    map[_name.bahrain] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(26.2576, 50.6278),
      'Al Muharraq Stadium',20000,1928,_country.bahrein,61.3,[]];
    map[_name.eastRiffa] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(26.15307, 50.543223),
      'Bahrain National Stadium',24000,1958,_country.bahrein,64.3,[]];
    map[_name.manama] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(26.1535, 50.54359),
      'Bahrain National Stadium',24000,1946,_country.bahrein,66.5,[]];
    //SOUTH ARABIA
    map[_name.alahli] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.446627355, 39.2523386),
      'Prince Abdullah al-Faisal Stadium',27000,1937,_country.southArabia,69.7,[]];
    map[_name.alettifaq] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.426514, 50.114128),
      'Prince Mohamed bin Fahd Stadium',26000,1945,_country.southArabia,68.4,[]];
    map[_name.alFaisalyARABIA] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(25.88693735, 45.36807),
      'Al Majma\'ah Sports City',7000,1954,_country.southArabia,66.3,[]];
    map[_name.alfateh] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(25.305669, 49.61340246),
      'Prince Abdullah bin Jalawi Stadium',19550,1958,_country.southArabia,67.2,[]];
    map[_name.alhilal] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(24.78903170, 46.8395937),
      'King Fahd Stadium',67000,1957,_country.southArabia,74.6,[]];
    map[_name.alIttihad] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes3,Coordinates(21.44662735, 39.2524137),
      'Prince Abdullah Al-Faisal Stadium',27000,1927,_country.southArabia,72.5,[]];
    map[_name.alnahda] = [ClubColors(darkblue,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Prince Mohamed bin Fahd Stadium',26000,1949,_country.southArabia,61.6,[]];
    map[_name.alnassr] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(21.76355015, 39.164367968),
      'Universitário Rei Saud',25000,1955,_country.southArabia,73.1,[]];
    map[_name.alQadisiya] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Príncipe Saud bin Jalawi Stadium',15000,1967,_country.southArabia,65.3,[]];
    map[_name.alraed] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.3795, 43.948),
      'King Abdullah Sports City Stadium',30000,1954,_country.southArabia,67.1,[]];
    map[_name.alriad] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0, 0),
      'Prince Faisal bin Fahd Stadium',24000,1953,_country.southArabia,61.8,[]];
    map[_name.alShabab] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(24.78829136, 46.839111),
      'Estádio Internacional Rei Fahd',75000,1947,_country.southArabia,70.2,[]];
    map[_name.altaawoun] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(26.37901905, 43.9477167),
      'King Abdullah Sport City Stadium',25000,1956,_country.southArabia,68.4,[]];
    map[_name.altai] = [ClubColors(Colors.grey,Colors.black),pattern.solid,Coordinates(27.50443671, 41.697737),
      'Prince Abdul Aziz bin Musa\'ed Stadium',12250,1961,_country.southArabia,65.6,[]];
    map[_name.alwehda] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(0,0),
      'King Abdul Aziz Stadium',38000,1945,_country.southArabia,66.1,[]];
    map[_name.damac] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(18.3105417, 42.597956),
      'Prince Sultan bin Abdul Aziz Stadium',20000,1972,_country.southArabia,66.6,[]];
    //IRÃ
    map[_name.persepolis] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.72465, 51.27574),
      'Azadi Stadium',100000,1963,_country.iran,70.6,[]];
    map[_name.esteghlal] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.7246, 51.2758),
      'Azadi Stadium',100000,1945,_country.iran,70.0,[]];
    map[_name.foolad] = [ClubColors(Colors.red,Colors.yellow),pattern.dividedHor,Coordinates(31.27940887, 48.779954),
      'Foolad Arena',30655,1971,_country.iran,68.5,[]];
    map[_name.malavan] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(37.4656557, 49.4555056),
      'Ghayeghran Stadium',8000,1969,_country.iran,63.7,[]];
    map[_name.naftTehran] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(0,0),
      'Estádio Takhti',30122,1950,_country.qatar,62.2,[]];
    map[_name.pastehran] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Shahid Dastgerdi Stadium',8250,1963,_country.iran,0,[]]; //EXTINTO 2007
    map[_name.saipa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(35.850008586, 50.9585994),
      'Enghelab Stadium',15000,1989,_country.iran,67.4,[]];
    map[_name.sepahan] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.74323273, 51.686141),
      'Naghsh-e Jahan',75000,1953,_country.iran,68.4,[]];
    map[_name.tractor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.026986, 46.29611924),
      'Sahand Stadium',66833,1970,_country.iran,66.5,[]];
    map[_name.zobahan] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(32.48286848, 51.42148270),
      'Foolad Shahr Stadium',25000,1969,_country.iran,66.1,[]];
    //IRAQUE
    map[_name.alShortaIRAQ] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(33.324906, 44.435304),
      'Al-Shaab Stadium',34200,1932,_country.iraq,66.3,[]];
    map[_name.alQuwaAlJawiya] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(33.3535912, 44.4543854),
      'Al-Zawraa Stadium',6000,1931,_country.iraq,67.2,[]];
    map[_name.alTalaba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.iraq,50.0,[]];
    map[_name.alzawraa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(33.3443251, 44.36832511),
      'Al-Zawraa Stadium',15443,1969,_country.iraq,66.6,[]];
    map[_name.dohuk] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      '',0,1970,_country.iraq,50.0,[]];
    map[_name.erbil] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.iraq,50.0,[]];
    //JORDAN
    map[_name.alFaisalyJORD] = [ClubColors(Colors.lightBlue,Colors.white),pattern.solid,Coordinates(31.9846345, 35.902814),
      'Estádio Internacional de Amã',25000,1932,_country.jordan,63.5,[]];
    map[_name.alRamtha] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(32.540733, 36.0193454),
      'Prince Hashim Stadium',5000,1966,_country.jordan,64.8,[]];
    map[_name.alsalt] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(32.0579113, 35.7019326),
      'Al-Salt Stadium',1000,1965,_country.jordan,61.6,[]];
    map[_name.alWehdat] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(31.92822, 35.95329),
      'King Abdullah II Stadium',13265,1956,_country.jordan,65.1,[]];
    map[_name.shababAlOrdon] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(31.9277385, 35.9525510),
      'King Abdullah II Stadium',13000,2002,_country.jordan,63.7,[]];
    //KUWAIT
    map[_name.alArabiKUW] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(29.35759875, 47.9999575),
      'Sabah Al Salem Stadium',22000,1960,_country.kuwait,63.1,[]];
    map[_name.alQadsia] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(29.34052466, 48.0307858),
      'Mohammed Al-Hamad Stadium',26000,1960,_country.kuwait,63.4,[]];
    map[_name.alsalmiya] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Thamir Stadium',20000,1964,_country.kuwait,65.8,[]];
    map[_name.alKuwait] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(29.34280293, 47.95224442),
      'Al Kuwait Sports Club',12350,1960,_country.kuwait,65.8,[]];
    map[_name.kazma] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(29.328998, 47.9877632),
      'Al-Sadaqua Walsalam Stadium',21500,1964,_country.kuwait,62.8,[]];
    //LEBANON
    map[_name.alahed] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(33.840550954, 35.4898395),
      'Al Ahed',2000,1964,_country.lebanon,64.6,[]];
    map[_name.alAnsar] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(33.8384684, 35.495880),
      'Al Ansar',5000,1951,_country.lebanon,65.1,[]];
    map[_name.alsafa] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(33.87476897, 35.492256455),
      'Safa Stadium',4000,1939,_country.lebanon,61.2,[]];
    map[_name.homenetmen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1921,_country.lebanon,47.2,[]];
    map[_name.racingbeirut] = [ClubColors(Colors.white,blue),pattern.solid,Coordinates(0,0),
      'Fouad Chehab Stadium',5000,1934,_country.lebanon,59.2,[]];
    map[_name.nejmeh] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(33.894420, 35.4695427),
      'Prince Mohammed bin Abdul Aziz',5000,1945,_country.lebanon,66.2,[]];
    //OMAN
    map[_name.alorouba] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(22.527735, 59.47351),
      'Sur Sports Complex',10000,1970,_country.oman,62.6,[]];
    map[_name.alseeb] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(23.6192524, 58.216613),
      'Al-Seeb Stadium',14000,1972,_country.oman,61.5,[]];
    map[_name.alsuwaiq] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.6183616, 58.2166664),
      'Al-Seeb Stadium',14000,1972,_country.oman,62.0,[]];
    map[_name.dhofar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(17.0827617, 54.143738),
      'Al-Saada Stadium',14000,1968,_country.oman,64.2,[]];
    map[_name.fanja] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(23.573023, 58.39957523),
      'Sultan Qaboos Sports Complex',34000,1970,_country.oman,63.6,[]];
    //PALESTINE
    map[_name.shababAlKhalil] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(31.50767914, 35.0321318),
      'Dura International Stadium',18000,1943,_country.palestine,60.6,[]];
    map[_name.hilalAlQuds] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(31.8476340, 35.23024420),
      'Faisal Al-Husseini International',12500,1972,_country.palestine,61.2,[]];
    //SYRIA
    map[_name.alfutowa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Deir ez-Zor Municipal Stadium',13000,1930,_country.syria,57.7,[]];
    map[_name.alhurriya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Al-Hamadaniah Stadium',15000,1952,_country.syria,54.7,[]];
    map[_name.alJaish] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(33.5227937, 36.3200108),
      'Abbasiyyin Stadium Damascus',30000,1945,_country.syria,63.5,[]];
    map[_name.alkaramah] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(34.729750, 36.69807434),
      'Khalid ibn al-Walid',32000,1928,_country.syria,67.3,[]];
    map[_name.alittihadSYR] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.1855477, 37.120093),
      'Al-Hamadaniah Stadium',15000,1949,_country.syria,65.4,[]];
    map[_name.alShortaDamascus] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(33.5048124, 36.288935),
      'Tishreen Stadium',12000,1947,_country.syria,65.1,[]];
    map[_name.alwahdaSYR] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(0, 0),
      'Al-Jalaa Stadium',10000,1928,_country.syria,62.3,[]];
    map[_name.alWathba] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0, 0),
      'Khaled bin Walid Stadium',32000,1937,_country.syria,60.7,[]];
    map[_name.jableh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.364225, 35.926686),
      'Al-Baath Stadium',10000,1958,_country.syria,63.4,[]];
    map[_name.tishreen] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(33.5053761, 36.2892507),
      'Tishreen',28000,1947,_country.syria,66.4,[]];


    //ASIA CENTRAL
    //KYRGYSTAN
    map[_name.algaBishkek] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(42.8387036, 74.59046472),
      'Dynamo Stadion',10000,1947,_country.kyrgyzstan,60.3,[]];
    map[_name.abdyshAtaKant] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.sleeves,Coordinates(42.8804125, 74.5978947),
      'Sportkompleks Abdysh-Ata',3000,1992,_country.kyrgyzstan,62.0,[]];
    map[_name.alay] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.5210113, 72.8044473),
      'Suyumbayev Stadion',11200,1967,_country.kyrgyzstan,63.2,[]];
    map[_name.dordoiBishkek] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(42.8891419, 74.6099425),
      'Stadion Dordoi',3000,1997,_country.kyrgyzstan,65.1,[]];
    //TAJIKISTAN
    map[_name.istiklol] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(38.58518545, 68.7687534),
      'Central Republican Stadium',20000,2007,_country.tajikistan,67.3,[]];
    map[_name.khujand] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(40.2920138, 69.6141332),
      'Bistsolagii Istiqloliyati Stadium',25000,1976,_country.tajikistan,65.0,[]];
    map[_name.pamirDushanbe] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(38.58589341, 68.7694599),
      'Markazii Tojikiston',20000,1950,_country.tajikistan,65.4,[]];
    map[_name.ravshan] = [ClubColors(Colors.purple,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Kulob Central Stadium',20000,1965,_country.tajikistan,50.0,[]];
    map[_name.regartadaz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.5175302, 68.216069866),
      'TALCO Arena',10000,1976,_country.tajikistan,61.4,[]];
    map[_name.varzob] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      '',0,1996,_country.tajikistan,50.0,[]];
    //TURKMENISTAN
    map[_name.ahalAnew] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(37.92816482, 58.350370),
      'Ashgabat Stadium',20000,1989,_country.turkmenistan,62.8,[]];
    map[_name.altynAsyr] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(38.0461412, 58.19675041),
      'Büzmeýin Sport Topulmy',10000,2008,_country.turkmenistan,64.6,[]];
    map[_name.kopetdag] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(37.94950226, 58.3703196),
      'Köpetdag Stadium',26000,1947,_country.turkmenistan,63.1,[]];
    map[_name.nebitci] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(41.826113637, 59.9346186),
      'Sport Toplumy Stadium',10000,1960,_country.turkmenistan,62.5,[]];
    map[_name.nisaAshgabat] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Nisa-Çandybil Stadium',1500,1994,_country.turkmenistan,63.7,[]];
    map[_name.sagadam] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.0144962, 52.987931256),
      'Şagadam Stadium',5000,1949,_country.turkmenistan,62.1,[]];
    map[_name.yedigen] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(37.9571185, 58.33029616),
      'HTTU Stadium',1000,2003,_country.turkmenistan,61.7,[]];
    //UZBEQUISTÃO
    map[_name.agmk] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.845856398, 69.61275686),
      'OKMK Sport Majmuasi',12000,2004,_country.uzbekistan,63.5,[]];
    map[_name.bunyodkor] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(41.2796393, 69.212486),
      'Milliy Stadioni',34000,2005,_country.uzbekistan,69.0,[]];
    map[_name.dustlik] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1963,_country.uzbekistan,67.6,[]]; //EXTINTO 2003
    map[_name.navbahor] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1963,_country.uzbekistan,67.6,[]]; //EXTINTO 2003
    map[_name.nasafQarshi] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.24051632, 71.546443),
      'Markaziy Stadium',21000,1986,_country.uzbekistan,65.4,[]];
    map[_name.navbahor] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Markaziy Stadium',22000,1978,_country.uzbekistan,67.6,[]];
    map[_name.pakhtakor] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(41.3156628, 69.26059),
      'Pakhtakor Markaziy Stadium',35000,1956,_country.uzbekistan,69.5,[]];
    map[_name.loktashkent] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.36116543, 69.394842616),
      'Lokomotiv Stadium',8000,2002,_country.uzbekistan,66.8,[]];
    map[_name.sogdiyona] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(40.115161, 67.82866878),
      'Sogdiyona Sport Majmuasi',11850,1970,_country.uzbekistan,64.3,[]];

    //////////////////////////////////////////////////////////////////////////
    //OCEANIA
    //NEW ZEALAND
    map[_name.auckland] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(-36.89779, 174.736646117),
      'Kiwitea Street',3500,2004,_country.newZealand,69.3,[]];
    map[_name.easternsuburbs] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Bill McKinlay Park',5000,1934,_country.newZealand,62.4,[]];
    map[_name.teamwellington] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'David Farrington Park',2250,2004,_country.newZealand,50.0,[]]; //EXTINTO 2021
    map[_name.waitakere] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Fred Taylor Park',4000,2003,_country.newZealand,63.1,[]];
    map[_name.wellingtonphoenix] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-41.273115, 174.78582),
      'Westpac Stadium',35000,2007,_country.newZealand,66.4,[]];
    //AUSTRALIA
    map[_name.adelaide] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-34.9074787, 138.56896413),
      'Coopers Stadium',16500,2003,_country.australia,65.1,[]];
    map[_name.brisbane] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-27.464607, 153.0096921280),
      'Suncorp Stadium',53223,2005,_country.australia,63.7,[]];
    map[_name.centralcoast] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-33.42820, 151.3379147192544),
      'Bluetongue Stadium',20119,2004,_country.australia,64.2,[]];
    map[_name.macarthur] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.05025627, 150.8336304),
      'Campbelltown Stadium',20000,2017,_country.australia,63.5,[]];
    map[_name.marconiStallions] = [ClubColors(Colors.green,Colors.white,Colors.red),pattern.solid,Coordinates(-33.863507, 150.880201),
      'Marconi Stadium',9000,1958,_country.australia,54.7,[]];
    map[_name.melbournecity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-37.8251, 144.9840),
      'AAMI Park',30050,2009,_country.australia,64.3,[]];
    map[_name.melbournevictory] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-37.825063012, 144.983956),
      'AAMI Park',30050,2004,_country.australia,68.3,[]];
    map[_name.newcastlejets] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-32.918943, 151.726707182),
      'Hunter Stadium',34000,2000,_country.australia,65.2,[]];
    map[_name.perth] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-31.945730, 115.86990),
      'HBF Park Stadium',20500,1995,_country.australia,66.1,[]];
    map[_name.sydneyFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.888853, 151.22556784),
      'Sydney Football Stadium',45500,2004,_country.australia,68.3,[]];
    map[_name.sydneywanderers] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-33.8079, 150.99936),
      'Parramatta Stadium',20741,2012,_country.australia,65.3,[]];
    map[_name.westernunited] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-38.157997, 144.355),
      'GMHBA Stadium',26000,2018,_country.australia,64.7,[]];

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    //NORTE AFRICA
    //EGITO
    map[_name.alahly] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.069291, 31.31241),
      'Estádio Internacional do Cairo',71400,1907,_country.egypt,75.1,[_name.zamalek]];
    map[_name.almasry] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(31.271395, 32.291329),
      'Porto Said Stadium',18000,1920,_country.egypt,70.2,[]];
    map[_name.almokawloon] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(0, 0),
      'Osman Ahmed Osman Stadium',35000,1973,_country.egypt,59.8,[]];
    map[_name.cleopatra] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(29.957375, 32.542372),
      'Suez Stadium',27000,2007,_country.egypt,65.6,[]];
    map[_name.elgeish] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Gehaz El Reyada Stadium',20000,1997,_country.egypt,62.8,[]];
    map[_name.elolympi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0, 0),
      'Izz al-Din Yacoub Stadium',15000,1905,_country.egypt,54.8,[]];
    map[_name.enppi] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(30.1113215, 31.36746089),
      'Cairo Military Academy Stadium',22000,1985,_country.egypt,67.1,[]];
    map[_name.future] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(30.174269, 31.435062),
      'Al Salam Stadium',30000,2011,_country.egypt,66.7,[]];
    map[_name.ghazl] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(30.96108104, 31.1728547),
      'Estádio Ghazl El Mahalla',14564,1936,_country.egypt,57.9,[]];
    map[_name.ismaily] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(30.6010391, 32.27382),
      'Ismaília Stadium',35000,1924,_country.egypt,70.6,[]];
    map[_name.makkasa] = [ClubColors(Colors.green,Colors.blue),pattern.oneVertStripe,Coordinates(0, 0),
      'Faiyum Stadium',20000,1937,_country.egypt,57.8,[]];
    map[_name.pyramids] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.02028, 31.3737282),
      'Estádio 30 de junho',30000,2008,_country.egypt,70.8,[]];
    map[_name.smouha] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(31.1970242, 29.91324509),
      'Alexandria Stadium',22000,1949,_country.egypt,65.6,[]];
    map[_name.tersana] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.04525754, 31.22334535),
      'Mit Okba Stadium',15000,1921,_country.egypt,60.6,[]];
    map[_name.zamalek] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(30.0693, 31.312),
      'Estádio Internacional do Cairo',71400,1911,_country.egypt,73.4,[_name.alahly]];
    //MOROCCO
    map[_name.rajacasablanca] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(33.582906, -7.6464496),
      'Stade Mohamed V',67000,1949,_country.morocco,72.4,[_name.wydad]];
    map[_name.wydad] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(33.582, -7.64647),
      'Stade Mohamed V',67000,1937,_country.morocco,73.5,[_name.rajacasablanca]];
    map[_name.beniMellal] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade d\'honneur de Beni Mellal',15000,1956,_country.morocco,59.5,[]];
    map[_name.farRabat] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(33.959915, -6.8890915),
      'Estádio Príncipe Moulay Abdellah',53000,1958,_country.morocco,69.4,[]];
    map[_name.fusRabat] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(34.0100016, -6.84037124),
      'Stade Belvédère',15000,1946,_country.morocco,66.2,[]];
    map[_name.hassaniaAgadir] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(30.4281448, -9.5405740),
      'Stade Adrar',45480,1946,_country.morocco,64.5,[]];
    map[_name.irTanger] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(35.74091688, -5.85791870),
      'Estádio Ibn Batouta',45000,1983,_country.morocco,64.8,[]];
    map[_name.kawkab] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.7071404, -7.9804646),
      'Stade de Marrakech',45240,1947,_country.morocco,65.1,[]];
    map[_name.kenitra] = [ClubColors(Colors.green,Colors.white),pattern.horStripes4,Coordinates(34.2527053, -6.5714618),
      'Municipal de Kenitra',15000,1938,_country.morocco,56.2,];
    map[_name.khouribga] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(32.8781274, -6.907258),
      'Complexe OCP',10000,1923,_country.morocco,61.2,[]];
    map[_name.maghreb] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(34.0028129, -4.96905145),
      'Complexe Sportif de Fès',45000,1946,_country.morocco,68.4,[]];
    map[_name.moghrebTetouan] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.solid,Coordinates(35.5728560, -5.3487861),
      'Stade Saniat Rmel',10000,1922,_country.morocco,63.6,[]];
    map[_name.moulodiaOujda] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(34.6596594, -1.93453730),
      'Estádio Honneur',19000,1946,_country.morocco,61.5,[]];
    //ALGERIA
    map[_name.annaba] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0, 0),
      '19 May Stadium',56000,1983,_country.algeria,54.8,[]];
    map[_name.asoChlef] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Boumezrag Mohamed',30000,1947,_country.algeria,58.6,[]];
    map[_name.asmoran] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Habib Bouakeul Stadium',20000,1935,_country.algeria,53.6,[]];
    map[_name.bejaia] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(0, 0),
      'Stade de l\'Unité maghrébine',17500,1936,_country.algeria,59.5,[]];
    map[_name.belouizdad] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.7456313, 3.0786813),
      'Stade du 20-Août-1955',10000,1955,_country.algeria,66.5,[]];
    map[_name.blida] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Brakni Brothers Stadium',10000,1932,_country.algeria,50.9,[]];
    map[_name.chaouia] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Hassouna Zerdani Stadium',5000,1936,_country.algeria,50.8,[]];
    map[_name.constantine] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Chahid Hamlaoui',45000,1898,_country.algeria,63.8,[]];
    map[_name.elharrach] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '1 November 1954 Stadium',5000,1935,_country.algeria,62.6,[]];
    map[_name.essetif] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(36.18707773, 5.3937329179),
      'Estádio 8 de Maio',25000,1958,_country.algeria,70.4,[]];
    map[_name.hussein] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0, 0),
      'Stade du 20 Août 1955',10000,1955,_country.algeria,57.8,[]];
    map[_name.kabylie] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(36.706899, 4.0560295),
      'Stade 1er Novembre',22000,1946,_country.algeria,66.2,[]];
    map[_name.kouba] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Mohamed Benhaddad Stadium',10000,1945,_country.algeria,51.8,[]];
    map[_name.mascara] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'The African Unity Stadium',22000,1925,_country.algeria,49.6,[]];
    map[_name.mcalger] = [ClubColors(Colors.green,Colors.red),pattern.horStripes2,Coordinates(36.75986425, 2.99499536),
      'Estádio 5 de Julho de 1962',76000,1921,_country.algeria,69.2,[]];
    map[_name.mcOran] = [ClubColors(Colors.white,Colors.red),pattern.horStripes2,Coordinates(35.683435418, -0.63621669),
      'Estádio Ahmed Zabana',40000,1917,_country.algeria,65.7,[]];
    map[_name.paradou] = [ClubColors(Colors.yellow,blue),pattern.solid,Coordinates(0,0),
      'Omar Benrabah Stadium',11000,1994,_country.algeria,56.6,[]];
    map[_name.saoura] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0, 0),
      '20 August Stadium',20000,2008,_country.algeria,62.5,[]];
    map[_name.usmAlger] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.80114535, 3.04854982),
      'Omar Hamadi Stadium',15000,1937,_country.algeria,69.5,[]];
    //LIBYA
    map[_name.tripoliLIB] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(32.8599, 13.1358),
      'Tripoli Stadium',65000,1950,_country.libya,66.2,[]];
    map[_name.almahala] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0, 0),
      'GMR Stadium',3000,1977,_country.libya,59.5,[]];
    map[_name.alIttihadLIB] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.85989333, 13.1358680),
      'Tripoli Stadium',65000,1944,_country.libya,64.8,[]];
    map[_name.altahaddi] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(32.101443438, 20.0722980),
      '28 de Março',55000,1954,_country.libya,62.8,[]];
    map[_name.benghazi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.1022578, 20.072776),
      '28 de Março',65000,1950,_country.libya,65.3,[]];
    //TUNISIA
    map[_name.bizertin] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(37.27906354, 9.8657169),
      'Stade 15 Octobre',20000,1928,_country.tunisia,63.4,[]];
    map[_name.clubAfricain] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.839919, 10.185206),
      'Olympique d\'El Menzah',45000,1920,_country.tunisia,69.6,[]];
    map[_name.esperance] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(36.7477777,10.2727777),
      'Estadio Olímpico de Radès',60500,1919,_country.tunisia,72.2,[]];
    map[_name.etoilesahel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.82355464, 10.6134521),
      'Estádio Olímpico de Sousse',28000,1925,_country.tunisia,70.8,[]];
    map[_name.jskairouan] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0, 0),
      'Stade Hamda Laouani',5000,1942,_country.libya,58.5,[]];
    map[_name.monastir] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade Mustapha Ben Jannet',22000,1923,_country.libya,60.5,[]];
    map[_name.stadeTunisien] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.stripes2,Coordinates(36.81442945, 10.12487585),
      'Hedi Ennaifer',11000,1948,_country.tunisia,62.9,[]];
    map[_name.sfaxien] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(34.73365186, 10.74661154),
      'Estádio Taïeb Mehiri',11000,1928,_country.tunisia,68.9,[]];

    //AFRICA NEGRA
    //AFRICA DO SUL
    map[_name.amazulu] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-29.828736, 31.030474),
      'Moses Mabhida Stadium',52000,1932,_country.southAfrica,65.6,[]];
    map[_name.bidvestWits] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Bidvest Stadium',5000,1921,_country.southAfrica,63.0,[]]; //EXTINTO 2020
    map[_name.capetown] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.9034463, 18.411186156),
      'Cape Town Stadium',55000,1962,_country.southAfrica,67.4,[]];
    map[_name.capetownAjax] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Athlone Stadium',34000,1970,_country.southAfrica,56.0,[]];
    map[_name.freestate] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Goble Park',20000,1977,_country.southAfrica,58.3,[]];
    map[_name.goldenarrows] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-29.824950, 31.029732),
      'Kings Park Stadium',52000,1996,_country.southAfrica,69.1,[]];
    map[_name.jomocosmos] = [ClubColors(Colors.red,blue),pattern.solid,Coordinates(0,0),
      'Johannesburg Stadium',37500,1983,_country.southAfrica,56.0,[]];
    map[_name.kaizer] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-26.23449118, 27.98311136),
      'Soccer City',78000,1970,_country.southAfrica,69.5,[_name.orlandopirates]];
    map[_name.maritzburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-29.6175844, 30.3856279),
      'Harry Gwala Stadium',12000,1979,_country.southAfrica,64.8,[]];
    map[_name.mamelodi] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-25.75319343, 28.22302862),
      'Loftus Versfeld',51762,1960,_country.southAfrica,71.8,[]];
    map[_name.manningRangers] = [ClubColors(Colors.yellow,blue),pattern.solid,Coordinates(0,0),
      'Chatsworth Stadium',35000,1928,_country.southAfrica,50.0,[]];
    map[_name.morokaSwallows] = [ClubColors(grena,Colors.blue),pattern.sleeves,Coordinates(-26.226719, 27.8639952),
      'Volkswagen Dobsonville',24000,1947,_country.southAfrica,71.8,[]];
    map[_name.orlandopirates] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-26.23098107, 27.9229158),
      'Orlando Stadium',40000,1937,_country.southAfrica,69.8,[_name.kaizer]];
    map[_name.platinumAFS] = [ClubColors(Colors.lightGreenAccent,Colors.black),pattern.solid,Coordinates(0,0),
      'Royal Bafokeng Stadium',44530,1998,_country.southAfrica,50.0,[]]; //EXTINTO 2018
    map[_name.royalAM] = [ClubColors(Colors.black,Colors.yellow),pattern.oneVertStripe,Coordinates(-29.910352, 30.8774252),
      'Chatsworth Stadium',22000,2020,_country.southAfrica,65.3,[]];
    map[_name.santosAfrica] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Athlone Stadium',30000,1982,_country.southAfrica,56.0,[]];
    map[_name.stellenbosch] = [ClubColors(grena,Colors.yellow),pattern.solid,Coordinates(-33.940025, 18.8734315),
      'Danie Craven Stadium',16000,2016,_country.southAfrica,63.5,[]];
    map[_name.supersport] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-25.7757792, 28.0729553),
      'Super Stadium',28900,1994,_country.southAfrica,66.5,[]];
    //ANGOLA
    map[_name.agosto] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-8.96985911, 13.2837),
      'Estádio Nacional 11 de Novembro',48500,1977,_country.angola,67.6,[]];
    map[_name.aviacao] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(-8.82740657, 13.255665),
      'Estádio da Cidadela',60000,1953,_country.angola,62.1,[]];
    map[_name.interclube] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(-8.8690929, 13.2090373),
      'Estádio 22 de Junho',10000,1976,_country.angola,63.2,[]];
    map[_name.kabuscorp] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(-8.8142235, 13.2258846),
      'Estádio dos Coqueiros',12000,1994,_country.angola,63.7,[]];
    map[_name.libolo] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(-10.0065429, 14.9053024),
      'Estádio Municipal de Calulo',10000,1942,_country.angola,62.5,[]];
    map[_name.lobito] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-12.39278911, 13.5537560),
      'Estádio do Buraco',3000,1970,_country.angola,59.2,[]];
    map[_name.maio] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-12.5937217, 13.39020088),
      'Edelfride Palhares da Costa',6000,1981,_country.angola,60.4,[]];
    map[_name.petroluanda] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-8.9699, 13.28365),
      'Estádio Nacional 11 de Novembro',48500,1980,_country.angola,68.4,[]];
    map[_name.sagradaesperanca] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-7.3883419, 20.8334375),
      'Estádio Sagrada Esperança',8200,1976,_country.angola,63.8,[]];
    map[_name.sptCabinda] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-5.5079227, 12.240064),
      'Estádio Nacional do Chiazi',20000,1975,_country.angola,64.2,[]];
    //BOTSWANA
    map[_name.gaborone] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-24.6567388, 25.9327138),
      'Botswana National Stadium',22000,1967,_country.botswana,50.0,[]];
    map[_name.jwaneng] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Galaxy Stadium',2000,2014,_country.botswana,50.0,[]];
    map[_name.mochudi] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-24.6567, 25.9323),
      'Botswana National Stadium',22000,1972,_country.botswana,50.0,[]];
    map[_name.mogoditshane] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Molepolole Stadium',6600,1925,_country.botswana,50.0,[]];
    map[_name.township] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-24.6565, 25.9327),
      'Botswana National Stadium',22000,1961,_country.botswana,50.0,[]];
    //CAMEROON
    map[_name.bafoussam] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stade Municipal de Bamendzi',5000,1950,_country.cameroon,58.6,[]];
    map[_name.cotonsport] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.32640861, 13.3998728),
      'Roumdé Adjia',35000,1986,_country.cameroon,67.3,[]];
    map[_name.canonYaounde] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.8855102, 11.54057732),
      'Ahmadou Ahidjo',42500,1930,_country.cameroon,65.2,[]];
    map[_name.douala] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(4.0560857, 9.7187861),
      'Stade de la Réunification',30000,1958,_country.cameroon,64.2,[]];
    map[_name.oryx] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(4.0557386, 9.7189017),
      'Stade de la Réunification',30000,1927,_country.cameroon,62.2,[]];
    map[_name.tonnerre] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Omnisports Ahmadou-Ahidjo',42500,1934,_country.cameroon,62.6,[]];
    map[_name.loum] = [ClubColors(blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Stade de Njombé',1000,2011,_country.cameroon,62.6,[]];
    //CAPE VERDE
    map[_name.boavistapraia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(14.9162, -23.512),
      'Estádio da Várzea',8000,1936,_country.capeVerde,58.6,[]];
    map[_name.derbyfc] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(16.8824126, -24.98574223),
      'Estádio Municipal Adérito Sena',5000,1929,_country.capeVerde,54.6,[]];
    map[_name.acadmindelo] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Municipal Adérito Sena',5000,1940,_country.capeVerde,55.6,[]];
    map[_name.acadpraia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio da Várzea',8000,1962,_country.capeVerde,56.6,[]];
    map[_name.mindelense] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(16.882555, -24.985470),
      'Estádio Municipal Aderito Sena',5000,1919,_country.capeVerde,63.2,[]];
    map[_name.sptClubePraia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.916149, -23.511936),
      'Estádio da Várzea',8000,1923,_country.capeVerde,62.6,[]];
    map[_name.travadores] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio da Várzea',8000,1930,_country.capeVerde,54.9,[]];
    //CENTRAL AFRICAN REPUBLIC
    map[_name.bangui] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(4.374442797, 18.5642879),
      'Barthelemy Boganda Stadium',50000,1945,_country.centralAfrica,61.5,[]];
    map[_name.dfc8] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,58.3,[]];
    map[_name.fatima] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1952,_country.centralAfrica,55.3,[]];
    map[_name.dfc8] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,58.3,[]];
    map[_name.tempeteMocaf] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(4.3738335, 18.56408385),
      'Barthelemy Boganda Stadium',50000,1940,_country.centralAfrica,60.8,[]];
    map[_name.tocages] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(4.3738, 18.564083),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,59.3,[]];
    //CONGO
    map[_name.caraBrazaville] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(-4.27381489, 15.24904533),
      'Stade Alphonse Massemba-Débat',33037,1935,_country.congo,57.7,[]];
    map[_name.diablesNoirs] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-4.27254194, 15.24862744),
      'Stade Alphonse Massemba-Débat',33037,1950,_country.congo,64.2,[]];
    map[_name.etoilecongo] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-4.272841, 15.24845),
      'Stade Alphonse Massemba-Débat',33037,0,_country.congo,60.7,[]];
    map[_name.leopardsCON] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-4.207234, 12.6858943),
      'Stade Denis Sassou Nguesso',5000,1953,_country.congo,62.1,[]];
    map[_name.otoho] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-4.15460467, 15.3242211),
      'Kintélé Sports Complex',60055,2014,_country.congo,64.0,[]];
    map[_name.talangai] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-4.27341746, 15.2487253),
      'Stade Alphonse Massemba-Débat',33037,1935,_country.congo,62.7,[]];
    //RD CONGO
    map[_name.dragons] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-4.32253435, 15.312970),
      'Stade 24 Novembre',24000,1938,_country.congoRD,64.3,[]];
    map[_name.lupopo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-11.704666, 27.48393538),
      'Stade Kibassa Maliba',35000,1939,_country.congoRD,60.6,[]];
    map[_name.maniema] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33021337, 15.310353),
      'Joseph Kabila Kabange',22000,2005,_country.congoRD,65.6,[]];
    map[_name.mazembe] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-11.67807733, 27.4899193),
      'Stade TP Mazembe',35000,1939,_country.congoRD,68.5,[]];
    map[_name.motema] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(-4.33067, 15.31035),
      'Stade des Martyrs',80000,1936,_country.congoRD,62.7,[]];
    map[_name.sangabalende] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-6.144978, 23.60518483),
      'Stade Kashala Bonzola',15000,1962,_country.congoRD,64.3,[]];
    map[_name.vita] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33065248, 15.31034443),
      'Stade des Martyrs',80000,1935,_country.congoRD,67.3,[]];
    //ETHIOPIA
    map[_name.cotton] = [ClubColors(Colors.white,Colors.black),pattern.stripesThin,Coordinates(0,0),
      'Dire Dawa Stadium',18000,1936,_country.ethiopia,50.0,[]]; //EXTINTO 2000
    map[_name.eepco] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Mebrat Hail Stadium',8000,1960,_country.ethiopia,50.0,[]];
    map[_name.fasil] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(12.618048, 37.45961),
      'Fasiledes Stadium',20000,1968,_country.ethiopia,56.9,[]];
    map[_name.mechal] = [ClubColors(Colors.green,Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Addis Ababa Stadium',35000,1938,_country.ethiopia,61.6,[]];
    map[_name.stGeorge] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(9.0132947, 38.7565828),
      'Addis Ababa Stadium',24000,1935,_country.ethiopia,64.6,[]];
    //GABON
    map[_name.cercleMberi] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0.392741994, 9.452454156),
      'Stade Omar-Bongo',41000,1962,_country.gabon,63.2,[]];
    map[_name.mangasport] = [ClubColors(Colors.greenAccent,Colors.yellow),pattern.solid,Coordinates(-1.55915389, 13.2272941),
      'Stade Henri Sylvoz',4000,1962,_country.gabon,63.2,[]];
    map[_name.mounana] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(0.3917496, 9.45228079),
      'Stade Omar-Bongo',41000,2006,_country.gabon,62.0,[]];
    //GHANA
    map[_name.asantekotoko] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(6.68225260, -1.6050228),
      'Baba Yara Stadium',43000,1935,_country.ghana,67.3,[]];
    map[_name.heartsoak] = [ClubColors(Colors.red,Colors.purple),pattern.solid,Coordinates(5.55150373, -0.19180352),
      'Ohene Djan Stadium',40000,1911,_country.ghana,67.0,[]];
    //GUINEA
    map[_name.hafia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.54617954, -13.672815),
      'Stade 28 Septembre',25000,1951,_country.guinea,66.8,[]];
    map[_name.horoya] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(9.5462, -13.6728),
      'Stade 28 Septembre',25000,1975,_country.guinea,66.0,[]];
    map[_name.fello] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Saïfoulaye Diallo',5000,1988,_country.guinea,57.7,[]];
    map[_name.kaloum] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(9.51237526, -13.7038060),
      'Stade de la Mission',1000,1958,_country.guinea,61.3,[]];
    //KHENYA
    map[_name.kakamega] = [ClubColors(Colors.yellow,Colors.green,Colors.green),pattern.stripeCrest,Coordinates(0.28970512, 34.7605814),
      'Bukhungu Stadium',10000,2010,_country.kenya,65.1,[]];
    map[_name.gorMahia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-1.294090, 36.842290),
      'City Stadium',15000,1968,_country.kenya,63.6,[]];
    map[_name.leopardsQUE] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(-1.30396442, 36.8244987),
      'Nyayo National Stadium Nairobi',15000,1964,_country.kenya,62.6,[]];
    map[_name.mathare] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2300765, 36.8924818),
      'Moi International Sports Centre',60000,1994,_country.kenya,63.0,[]];
    map[_name.oserian] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.kenya,54.2,[]];
    map[_name.reunion] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.kenya,47.2,[]];
    map[_name.tusker] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2345079, 36.8804135),
      'Ruaraka Stadium',1000,1969,_country.kenya,64.1,[]];
    map[_name.ulinzi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.2955202, 36.07390),
      'Afraha Stadium',8200,1995,_country.kenya,63.5,[]];
    //IVORY COAST
    map[_name.africaSports] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(5.328283842, -4.01839865),
      'Estádio Houphouet-Boigny',35000,1947,_country.ivorycoast,65.5,[]];
    map[_name.asecmimosas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(5.3049676, -3.99280839),
      'Stade Robert Champroux',10000,1947,_country.ivorycoast,67.3,[]];
    map[_name.gagnoa] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(6.1192630, -5.9613877),
      'Stade Victor Biaka Boda',15000,1960,_country.ivorycoast,60.1,[]];
    map[_name.omnisport] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(6.8279876, -5.246351),
      'Stade de Yamoussoukro',6000,1932,_country.ivorycoast,62.6,[]];
    map[_name.sanPedro] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(4.7607713, -6.638301),
      'Stade Auguste Denise',8000,2004,_country.ivorycoast,58.6,[]];
    map[_name.seweSport] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(5.3054157, -3.99233047),
      'Stade Robert Champroux',10000,1977,_country.ivorycoast,62.4,[]];
    map[_name.stadeDAbidjan] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(5.30523287, -3.992462281),
      'Stade Robert Champroux',10000,1936,_country.ivorycoast,63.3,[]];
    map[_name.stella] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Robert Champroux',10000,1953,_country.ivorycoast,57.6,[]];
    map[_name.tanda] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stade Henri Konan Bédié',3000,0,_country.ivorycoast,56.3,[]];
    //MADAGASCAR
    map[_name.adema] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-18.15230, 49.4160806),
      'Stade Municipal de Toamasina',2500,1955,_country.madagascar,62.1,[]];
    map[_name.cnapsSport] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-18.919411, 47.5259711),
      'Mahamasina Stadium',23000,1990,_country.madagascar,61.5,[]];
    //MALI
    map[_name.djoliba] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(12.6038545, -7.9215315),
      'Stade 26 Mars',50000,1960,_country.mali,63.6,[]];
    map[_name.realBamako] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(12.6598898, -7.993129994),
      'Stade Modibo Keïta',25000,1960,_country.mali,65.6,[]];
    map[_name.stadeMalien] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(12.60506870, -7.9218513),
      'Stade 26 Mars',50000,1960,_country.mali,65.0,[]];
    //MAURITANIA
    map[_name.nouadhibou] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(20.9131555, -17.0466032),
      'Stade Municipal de Nouadhibou',10300,1999,_country.mauritania,59.5,[]];
    map[_name.tevraghZeina] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(18.104679673, -15.9854073389),
      'Stade Olympique Nouakchott',20000,2005,_country.mauritania,57.1,[]];
    //MOZAMBIQUE
    map[_name.costasol] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-25.9413178, 32.61610373),
      'Estádio do Costa do Sol',10000,1955,_country.mozambique,65.7,[]];
    map[_name.desportivomap] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-25.93553262, 32.58640965),
      'Estádio 1º de Maio',8000,1921,_country.mozambique,60.8,[]];
    map[_name.ferroviariomaputo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-25.9173539, 32.52639366),
      'Estádio da Machava',45000,1924,_country.mozambique,63.0,[]];
    map[_name.ldMaputo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-25.9567109, 32.44568156),
      'Estádio da Liga',5000,1990,_country.mozambique,61.7,[]];
    map[_name.maxaquene] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-25.974593945, 32.57804403),
      'Estádio do Maxaquene',15000,1920,_country.mozambique,64.2,[]];
    map[_name.songo] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Estadio da HCB',2000,1982,_country.mozambique,63.2,[]];
    //NAMIBIA
    map[_name.blackAfrica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-22.5159386, 17.060735),
      'Sam Nujoma Stadium',10300,1986,_country.namibia,64.4,[]];
    map[_name.africanStars] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.5162, 17.060),
      'Sam Nujoma Stadium',10300,1962,_country.namibia,64.0,[]];
    map[_name.bluewaters] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-22.93193059, 14.5286355),
      'Kuisebmund Stadium',4000,1936,_country.namibia,57.4,[]];
    map[_name.civics] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-22.5164, 17.062),
      'Sam Nujoma Stadium',10300,1983,_country.namibia,61.3,[]];
    //NIGERIA
    map[_name.akwa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(5.0062256, 7.88568411),
      'Godswill Akpabio Stadium',30000,1996,_country.nigeria,63.5,[]];
    map[_name.dolphin] = [ClubColors(blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Liberation Stadium',25000,1988,_country.nigeria,50.0,[]]; //EXTINTO 2016
    map[_name.enyimba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.125570, 7.379054),
      'Enyimba International',25000,1976,_country.nigeria,68.1,[]];
    map[_name.heartland] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(5.48386575, 7.04376783),
      'Dan Anyiam Stadium',10000,1976,_country.nigeria,67.5,[]];
    map[_name.kano] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(11.999726271, 8.52926678),
      'Sani Abacha',25000,1990,_country.nigeria,65.5,[]];
    map[_name.kwaraUtd] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(8.4755402, 4.542177479),
      'Kwara State Stadium',18000,1997,_country.nigeria,60.4,[]];
    map[_name.lobiStars] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(7.73139777, 8.5211409866),
      'Aper Aku Stadium',20000,1981,_country.nigeria,62.0,[]];
    map[_name.plateau] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(5.0063769, 7.88565836),
      'New Jos Stadium',60000,1975,_country.nigeria,62.4,[]];
    map[_name.rangersInt] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(6.444346813, 7.496462056),
      'Nnamdi Azikiwe Stadium',22000,1970,_country.nigeria,63.8,[]];
    map[_name.riversUtd] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(4.96715013, 6.971510),
      'Adokiye Amiesimaka Stadium',38000,2016,_country.nigeria,64.0,[]];
    map[_name.shootingstars] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(7.39632598, 3.885855),
      'Lekan Salami Stadium',10000,1950,_country.nigeria,64.7,[]];
    map[_name.sunshinestars] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(7.25847070, 5.1896354),
      'Akure Township Stadium',5000,1995,_country.nigeria,65.2,[]];
    //RWANDA
    map[_name.apr] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-1.9780671, 30.04428081),
      'Stade Régional Nyamirambo',22000,1993,_country.rwanda,64.2,[]];
    map[_name.rayonSports] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-1.97863430, 30.0442474),
      'Stade Régional Nyamirambo',22000,1965,_country.rwanda,61.3,[]];
    //SENEGAL
    map[_name.douanes] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(14.711, -17.458),
      'Demba Diop',20000,1980,_country.senegal,65.7,[]];
    map[_name.genefoot] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Stade Déni Birame Ndao',1001,2000,_country.senegal,64.6,[]];
    map[_name.jaraaf] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(14.7108854, -17.458191),
      'Demba Diop',20000,1933,_country.senegal,66.2,[]];
    map[_name.jeannedarc] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.746812323, -17.45177448),
      'Léopold Sédar Senghor',60000,1923,_country.senegal,67.3,[]];
    //SUDÃO
    map[_name.omdurman] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(15.6473138, 32.4749635),
      'Al Hilal Stadium',25000,1930,_country.sudan,66.0,[]];
    map[_name.almerrikh] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(15.64140, 32.471581),
      'Al Merriekh Stadium',43645,1908,_country.sudan,66.4,[]];
    //TANZANIA
    map[_name.azam] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-6.97053633, 39.22352095),
      'Chamazi Stadium',10000,2004,_country.tanzania,62.3,[]];
    map[_name.maji] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Maji Maji Stadium',30000,1978,_country.tanzania,59.4,[]];
    map[_name.malindi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Amaan Stadium',15000,1942,_country.tanzania,57.4,[]];
    map[_name.simba] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.85248, 39.273848),
      'Mkapa Stadium',60000,1936,_country.tanzania,69.5,[]];
    map[_name.yanga] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-6.854515, 39.274032),
      'Mkapa Stadium',60000,1935,_country.tanzania,67.4,[]];
    //TOGO
    map[_name.askoKara] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(9.5726839, 1.179215596),
      'Stade Municipal Kara',10000,1974,_country.togo,62.0,[]];
    map[_name.etoilefilante] = [ClubColors(Colors.blue,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stade Oscar Anthony',2000,1932,_country.togo,58.3,[]];
    map[_name.koroki] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Stade Maman N\'Danida',5000,1961,_country.togo,57.3,[]];
    map[_name.modelelome] = [ClubColors(Colors.white,Colors.yellow),pattern.diagonalInv,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1935,_country.togo,48.3,[]];
    map[_name.togolais] = [ClubColors(Colors.white,Colors.red),pattern.sleeves,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1961,_country.togo,56.3,[]];
    map[_name.togoport] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1961,_country.togo,57.3,[]];
    map[_name.semassi] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(8.981679877, 1.147266657),
      'Stade Municipal Sokodé',10000,1974,_country.togo,60.4,[]];
    //UGANDA
    map[_name.express] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(0.284026157, 32.5483295),
      'Muteesa II Stadium',20202,1957,_country.uganda,62.5,[]];
    map[_name.kampala] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0.3278116, 32.6069444),
      'MTN Omondi Stadium',10000,1963,_country.uganda,64.6,[]];
    map[_name.uganda] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Arena of Vision',40000,1997,_country.uganda,59.4,[]];
    map[_name.villa] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(0.34748797, 32.65875396),
      'Mandela National Stadium',50000,1975,_country.uganda,65.0,[]];
    map[_name.vipers] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0.19786167, 32.532340),
      'St Mary\'s Stadium-Kitende',25000,1969,_country.uganda,64.4,[]];
    //ZAMBIA
    map[_name.greenEagles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-16.813924, 26.987975),
      'Choma Independence Stadium',1000,2002,_country.zambia,61.8,[]];
    map[_name.greenbuffaloes] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Independence Stadium',10000,1965,_country.zambia,59.4,[]];
    map[_name.kabwe] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Godfrey \'Ucar\' Chitalu',10000,1966,_country.zambia,60.1,[]];
    map[_name.mufulira] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Shinde Mufulira',5000,1953,_country.zambia,64.7,[]];
    map[_name.nkana] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-12.847060, 28.2112330),
      'Nkana Stadium',10000,1935,_country.zambia,65.1,[]];
    map[_name.powerdynamos] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Arthur Davies Stadium',10000,1971,_country.zambia,60.7,[]];
    map[_name.redArrows] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Nkoloma Stadium',5000,2017,_country.zambia,62.1,[]];
    map[_name.zanaco] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Sunset Stadium',20000,1985,_country.zambia,62.4,[]];
    map[_name.zesco] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-12.9751432, 28.611562),
      'Levy Mwanawasa',49800,1974,_country.zambia,66.3,[]];
    //ZIMBABWE
    map[_name.caps] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(-17.821754729, 30.99484456),
      'National Sports Stadium',80000,1973,_country.zimbabwe,66.5,[]];
    map[_name.chickenInn] = [ClubColors(Colors.yellow,Colors.black),pattern.stripesThin,Coordinates(-20.10438525, 28.50619545),
      'Luveve Stadium',8000,1997,_country.zimbabwe,64.4,[]];
    map[_name.dynamos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-17.853630, 31.0376418),
      'Rufaro',45500,1963,_country.zimbabwe,66.5,[]];
    map[_name.harare] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Rufaro Stadium',60000,1989,_country.zambia,58.4,[]];
    map[_name.highlanders] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(-20.13111048, 28.569573348),
      'Barbourfields Stadium',40000,1926,_country.zimbabwe,65.7,[]];
    map[_name.manicaDiamonds] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-18.996833, 32.6409931),
      'Sakubva',35000,2017,_country.zimbabwe,64.1,[]];
    map[_name.monomotapa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Rufaro Stadium',35000,2003,_country.zambia,56.4,[]];
    map[_name.platinum] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.306090, 30.0568275),
      'Mandava',15000,1995,_country.zimbabwe,65.2,[]];
  }


}