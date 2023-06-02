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
    try {
      return map[clubName][0];
    }catch (e) {
      return ClubColors(Colors.grey,Colors.cyanAccent);
    }
  }
  String getPattern(String clubName){
    return map[clubName][1] ?? ClubPattern().solid;
  }
  Coordinates getCoordinate(String clubName){
    return map[clubName][2] ?? Coordinates(0, 0);
  }
  String getStadium(String clubName){
    return map[clubName][3] ?? "";
  }
  int getStadiumCapacity(String clubName){
    return map[clubName][4] ?? 0;
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
  String getExtinto(String clubName){
    try {
      Map mapa = map[clubName][9];
      String str = "";
      if (mapa["extinto"] == true){
        str = "Extinto";
      }else{
        str = mapa["extinto"].toString();
      }
      return str;
    }catch (e) {
      //print('ERROR EXTINTO: $clubName');
      return '';
    }
  }
  String getState(String clubName){
    try {
      return map[clubName][10];
    }catch (e) {
      //print('ERROR GETSTATE: $clubName');
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

    ClubName n = ClubName();

    //https://query.wikidata.org/#SELECT%20%3Fclub%20%3FclubLabel%20%3Fvenue%20%3FvenueLabel%20%3Fcoordinates%0AWHERE%0A%7B%0A%09%3Fclub%20wdt%3AP31%20wd%3AQ476028%20.%0A%09%3Fclub%20wdt%3AP115%20%3Fvenue%20.%0A%09%3Fvenue%20wdt%3AP625%20%3Fcoordinates%20.%0A%09SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22pt%22%20%7D%0A%7D
    map[n.arsenal] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(51.555,-0.108611),
      'Estádio Emirates',60704,1886,_country.england,80.2,[n.tottenham,n.chelsea],{}];
    map[n.astonvilla] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(52.509166666,-1.884722222),
      'Villa Park',42660,1874,_country.england,78.3,[n.birmigham],{}];
    map[n.bournemouth] = [ClubColors(Colors.black,Colors.red),pattern.stripes3,Coordinates(50.735278,-1.838333),
      'Dean Court',11464,1890,_country.england,73.9,[n.southampton],{}];
    map[n.brentford] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.488167,-0.302639),
      'Griffin Park',17250,1889,_country.england,74.9,[],{}];
    map[n.brighton] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(50.861822222,-0.083277777),
      'Falmer Stadium',30750,1901,_country.england,77.5,[n.crystalpalace],{}];
    map[n.crystalpalace] = [ClubColors(Colors.red,Colors.blueAccent),pattern.stripes2,Coordinates(51.398333333,-0.085555555),
      'Selhurst Park',26047,1905,_country.england,76.7,[],{}];
    map[n.chelsea] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(51.481666666,-0.191111111),
      'Stamford Brigde',41837,1905,_country.england,84.3,[n.tottenham,n.arsenal],{}];
    map[n.everton] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(53.438888888,-2.966388888),
      '	Goodison Park',39571,1878,_country.england,79.2,[n.liverpool],{}];
    map[n.fulham] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(51.475,-0.221666666),
      'Craven Cottage',19000,1879,_country.england,74.5,[n.chelsea,n.qpr],{}];
    map[n.leicester] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.620277777,-1.142222222),
      'King Power Stadium',39571,1884,_country.england,81.0,[],{}];
    map[n.leeds] = [ClubColors(Colors.white,Colors.yellow,Colors.blue),pattern.solid,Coordinates(53.777777777,-1.572222222),
      'Elland Road',37890,1919,_country.england,77.0,[],{}];
    map[n.liverpool] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.430833333,-2.960833333),
      'Anfield',54167,1892,_country.england,86.5,[n.manutd,n.everton],{}];
    map[n.mancity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(53.483310, -2.20047039),
      'Etihad Stadium',53400,1880,_country.england,86.4,[n.manutd],{}];
    map[n.manutd] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.463055555,-2.291388888),
      'Old Trafford',76212,1878,_country.england,83.8,[n.mancity],{}];
    map[n.newcastle] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(54.975555555,-1.621666666),
      'St. James Park',52409,1892,_country.england,78.3,[n.sunderland],{}];
    map[n.nottinghamforest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.94,-1.132778),
      'City Ground',30446,1865,_country.england,70.4,[n.leicester],{}];
    map[n.southampton] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.90583333,-1.39111111),
      'St. Mary\'s',32690,1885,_country.england,76.8,[n.portsmouth],{}];
    map[n.tottenham] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(51.604444444,-0.066388888),
      'Tottenham Hotspur Stadium',62850,1882,_country.england,80.9,[n.arsenal,n.chelsea],{}];
    map[n.westham] = [ClubColors(grena,Colors.blue),pattern.sleeves,Coordinates(51.538611111,-0.016388888),
      'Olímpico de Londres',60000,1895,_country.england,80.0,[n.millwall,n.tottenham],{}];
    map[n.wolves] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.590277777,-2.130277777),
      'Molineux Stadium',32050,1877,_country.england,78.64,[n.westbromwich],{}];

    map[n.accrington] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.7654, -2.371048),
      'Crown Ground',6000,1968,_country.england,64.6,[],{}];
    map[n.barnsley] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.552222,-1.4675),
      'Oakwell Stadium',23000,1887,_country.england,66.3,[],{}];
    map[n.birmigham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.475702777,-1.868188888),
      'St Andrew\'s Stadium',30016,1875,_country.england,70.1,[n.astonvilla],{}];
    map[n.blackburn] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(53.728611111,-2.489166666),
      'Ewood Park',30016,1875,_country.england,72.1,[n.burnley],{}];
    map[n.blackpool] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(53.804722,-3.048056),
      'Bloomfield Road',12555,1887,_country.england,68.5,[],{}];
    map[n.bolton] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.580555555,-2.535555555),
      'Reebok Stadium',28723,1874,_country.england,67.9,[],{}];
    map[n.burton] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.821944, -1.626888),
      'Pirelli Stadium',6912,1950,_country.england,66.4,[],{}];
    map[n.bradford] = [ClubColors(Colors.orangeAccent,grena),pattern.divided,Coordinates(53.804222222,-1.7590222),
      'Valley Parade',25136,1903,_country.england,67.2,[],{}];
    map[n.bristol] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.44,-2.620278),
      'Ashton Gate Stadium',21497,1897,_country.england,69.8,[],{}];
    map[n.bristolrovers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.4862678, -2.583142),
      'Memorial Stadium',12300,1883,_country.england,64.4,[],{}];
    map[n.burnley] = [ClubColors(Colors.purple,Colors.lightBlueAccent),pattern.sleeves,Coordinates(53.789064,-2.230225),
      'Turf Moor',22546,1882,_country.england,77.2,[n.blackburn],{}];
    map[n.bury] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.58054789779759, -2.2947994440370856),
      'Gigg Lane',11840,1885,_country.england,56.3,[],{}];
    map[n.cambridge] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.212175, 0.15415834),
      'Abbey Stadium',8127,1912,_country.england,63.6,[],{}];
    map[n.cardiffcity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.472778,-3.203056),
      'Cardiff City Stadium',33000,1899,_country.wales,69.2,[],{}];
    map[n.carlisle] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(54.89551666, -2.91384803),
      'Brunton Park Stadium',18202,1904,_country.england,69.2,[],{}];
    map[n.charlton] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(51.487489,0.035632),
      'The Valley',27116,1905,_country.england,67.0,[],{}];
    map[n.cheltenham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Whaddon Road',7066,1887,_country.england,61.7,[],{}];
    map[n.chesterfield] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.25369327270783, -1.4258188167721617),
      'Proact Stadium',10400,1866,_country.england,62.3,[],{}];
    map[n.colchester] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.923568978046326, 0.897914100076637),
      'Colchester Community Stadium',10105,1937,_country.england,61.3,[],{}];
    map[n.coventry] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.44849844, -1.49621626),
      'Coventry Building Society Arena',32609,1883,_country.england,70.5,[],{}];
    map[n.crewe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.087486, -2.4357888),
      'The Alexandra Stadium',10153,1877,_country.england,62.1,[],{}];
    map[n.doncaster] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.5098730, -1.11355670),
      'Keepmoat Rovers Park',15231,1879,_country.england,63.1,[],{}];
    map[n.derbycount] = [ClubColors(Colors.white,Colors.white10),pattern.solid,Coordinates(52.915,-1.447222222),
      'Pride Park',33597,1884,_country.england,69.0,[n.nottinghamforest],{}];
    map[n.exeter] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.7308274, -3.52109076),
      'Saint James Park',8541,1914,_country.england,62.8,[],{}];
    map[n.fleetwood] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.91654334, -3.024740453),
      'Highbury Stadium',5327,1908,_country.england,61.5,[],{}];
    map[n.forestgreen] = [ClubColors(Colors.lightGreenAccent,Colors.black),pattern.horStripes2,Coordinates(51.698995, -2.2377947),
      'The New Lawn',5140,1889,_country.england,63.5,[],{}];
    map[n.gillingham] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.3843096, 0.5607898),
      'KRBS Priestfield Stadium',11582,1893,_country.england,65.4,[],{}];
    map[n.grimsby] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(53.570176, -0.04632012),
      'Blundell Park',9052,1893,_country.england,62.7,[],{}];
    map[n.huddersfield] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.65416666,-1.76833333),
      'Kirklees Stadium',24500,1908,_country.england,70.7,[],{}];
    map[n.hullcity] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(53.746111,-0.367777),
      'KCOM Stadium',25400,1904,_country.england,68.4,[],{}];
    map[n.ipswich] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.05506755, 1.1451992),
      'Portman Road',30311,1878,_country.england,66.5,[],{}];
    map[n.leyton] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(51.56015075942861, -0.012627871101708722),
      'Brisbane Road',9271,1881,_country.england,54.2,[],{}];
    map[n.lincoln] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.218429, -0.54082758),
      'Sincil Bank',10127,1884,_country.england,65.2,[],{}];
    map[n.luton] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.883688, -0.4305913),
      'Kenilworth Road',10356,1885,_country.england,70.4,[],{}];
    map[n.mansfield] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(53.13816215185544, -1.2008621609931667),
      'Field Mill',9186,1897,_country.england,57.3,[],{}];
    map[n.middlesbrough] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(54.578333,-1.2169444),
      'Riverside Stadium',34988,1876,_country.england,70.8,[n.newcastle],{}];
    map[n.millwall] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(51.485833,-0.050833),
      'The New Den',20146,1885,_country.england,70.6,[],{}];
    map[n.mkdons] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(52.0096280, -0.7335208),
      'Stadium MK',30500,2004,_country.england,67.9,[n.wimbledon],{}];
    map[n.morecambe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.061514, -2.867237627),
      'Mazuma Stadium',6476,1920,_country.england,62.4,[],{}];
    map[n.northampton] = [ClubColors(grena,Colors.white),pattern.sleeves,Coordinates(52.235125650372716, -0.933656147797423),
      'Sixfields Stadium',7798,1897,_country.england,57.2,[],{}];
    map[n.norwich] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.622128,1.308653),
      'Carrow Road',27033,1902,_country.england,73.9,[n.ipswich],{}];
    map[n.notts] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(52.9425,-1.137222),
      'Meadow Lane',19841,1862,_country.england,66.5,[],{}];
    map[n.oldham] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.555147, -2.1284515),
      'Boundary Park',10638,1895,_country.england,61.3,[],{}];
    map[n.oxford] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.716419,-1.208067),
      'Oxford Stadium',30582,1893,_country.england,62.4,[],{}];
    map[n.peterborough] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(52.56483332, -0.240204256),
      'Weston Homes Stadium',15314,1934,_country.england,67.8,[],{}];
    map[n.portsmouth] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(50.79638888,-1.0638888),
      'Fratton Park',20688,1898,_country.england,66.5,[],{}];
    map[n.portvale] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.0501, -2.19261630),
      'Vale Park',19052,1876,_country.england,60.7,[],{}];
    map[n.plymouth] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(50.388055555,-4.150833333),
      'Home Park',19500,1886,_country.england,66.4,[],{}];
    map[n.prestonnorthend] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(53.772222222,-2.6880555),
      'Deepdale',23408,1880,_country.england,71.0,[],{}];
    map[n.qpr] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(51.50916666,-0.232222222),
      'Loftus Road',18439,1882,_country.england,71.5,[n.chelsea,n.fulham],{}];
    map[n.reading] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(51.4222,-0.98277),
      'Madejski Stadium',24250,1871,_country.england,70.9,[],{}];
    map[n.rotherham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.4279,-1.362),
      'New York Stadium',12021,1925,_country.england,67.6,[],{}];
    map[n.scunthorpe] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(53.58674886790222, -0.6952278083100043),
      'Glanford Park',9088,1889,_country.england,56.2,[],{}];
    map[n.stockport] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Edgeley Park',13000,1883,_country.england,53.7,[],{}];
    map[n.sheffieldwednesday] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.411388888,-1.50055),
      'Estádio Hillsborough',39732,1867,_country.england,67.6,[n.sheffieldunited],{}];
    map[n.sheffieldunited] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes2,Coordinates(53.3705550, -1.4709732046),
      'Bramall Lane',39859,1889,_country.england,73.2,[n.sheffieldwednesday],{}];
    map[n.shrewsbury] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(52.6887706, -2.749098116),
      'New Meadow',9875,1886,_country.england,65.4,[],{}];
    map[n.southend] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Roots Hall',12392,1906,_country.england,60.6,[],{}];
    map[n.stoke] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(52.988333333,-2.175555555),
      'Bet365 Stadium',30089,1863,_country.england,69.9,[],{}];
    map[n.sunderland] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(54.9144,-1.3882),
      'Stadium of Light',49000,1879,_country.england,66.9,[n.newcastle],{}];
    map[n.swansea] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(51.6422,-3.9351),
      'Liberty Stadium',21088,1912,_country.wales,69.3,[n.cardiffcity],{}];
    map[n.tranmere] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(53.37379415, -3.03251662),
      'Prenton Park',16789,1884,_country.england,59.7,[],{}];
    map[n.walsall] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.565472133229086, -1.990329513826888),
      'Bescot Stadium',11300,1888,_country.england,61.2,[],{}];
    map[n.watford] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(51.649928,-0.401606),
      'Vicarage Road',21577,1881,_country.england,75.2,[n.luton],{}];
    map[n.westbromwich] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(52.509166666,-1.963888888),
      'The Hawthorns',26850,1878,_country.england,72.2,[n.wolves],{}];
    map[n.wigan] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(53.547778,-2.653889),
      'DW Stadium',25135,1932,_country.england,68.0,[],{}];
    map[n.wimbledon] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.431363888,-0.186669444),
      'Plough Lane',9215,2002,_country.england,63.2,[n.mkdons],{}];
    map[n.wrexham] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.051972367983176, -3.0038125459115266),
      'Racecourse Ground',15550,1872,_country.england,57.2,[],{}];
    map[n.wycombe] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.divided,Coordinates(51.6305577, -0.8001325),
      'Adams Park',10137,1887,_country.england,65.7,[],{}];
    map[n.yeovil] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(50.950289893317795, -2.6739840594871893),
      'Huish Park',9665,1895,_country.england,61.3,[],{}];
    map[n.york] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(53.98449, -1.052972250),
      'York Community Stadium',8500,1922,_country.england,60.4,[],{}];

    //ITALIA
    map[n.atalanta] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.708889,9.680833),
      'Atleti Azzurri d\'Italia',21300,1907,_country.italy,80.3,[],{}];
    map[n.bologna] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.49362,11.309719),
      'Renato Dall\'Ara',39444,1909,_country.italy,74.8,[],{}];
    map[n.cagliari] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(39.199888888,9.137583333),
      'Unipol Domus',16416,1920,_country.italy,74.1,[],{}];
    map[n.cremonese] = [ClubColors(Colors.red,Colors.grey),pattern.stripes3,Coordinates(45.140424475662854, 10.034943289585),
      'Estádio Giovanni Zini',16003,1913,_country.italy,72.0,[],{}];
    map[n.empoli] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.726389,10.955),
      'Carlo Castellanni',19847,1920,_country.italy,73.4,[],{}];
    map[n.fiorentina] = [ClubColors(Colors.purple,Colors.white),pattern.oneHorStripe,Coordinates(43.780822,11.282258),
      'Artemio Franchi',47282,1926,_country.italy,76.8,[],{}];
    map[n.hellasverona] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(45.435356,10.968647),
      'Marcantonio Bentegodi',39371,1903,_country.italy,75.5,[],{}];
    map[n.inter] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(45.478055,9.123947),
      'Giuseppe Meazza',80018,1908,_country.italy,83.2,[n.milan,n.juventus],{}];
    map[n.juventus] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(45.109594,7.641247),
      'Allianz Stadium',41507,1897,_country.italy,83.4,[n.milan,n.inter],{}];
    map[n.milan] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(45.4786,9.1244),
      'Giuseppe Meazza',80018,1899,_country.italy,82.5,[n.juventus,n.inter],{}];
    map[n.monza] = [ClubColors(Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(45.582778,9.308056),
      'Stadio Brianteo',18568,1912,_country.italy,70.7,[],{}];
    map[n.lazio] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(41.933872,12.454714),
      'Stadio Olimpico',73261,1900,_country.italy,79.6,[n.roma],{}];
    map[n.lecce] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(40.3654579445129, 18.20937082941416),
      'Via del Mare',36285,1908,_country.italy,71.3,[],{}];
    map[n.napoli] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(40.827967,14.193008),
      'Diego Armando Maradona',54726,1926,_country.italy,81.55,[n.juventus],{}];
    map[n.roma] = [ClubColors(grena,Colors.orange),pattern.solid,Coordinates(41.9339,12.454),
      'Stadio Olimpico',73261,1900,_country.italy,80.0,[n.lazio],{}];
    map[n.salernitana] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(40.64574181157901, 14.82401436498),
      'Arechi',38000,1919,_country.italy,73.8,[],{}];
    map[n.sampdoria] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(44.4164,8.9524),
      'Luigi Ferraris',36600,1946,_country.italy,75.0,[n.genoa],{}];
    map[n.sassuolo] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(44.714722,10.649722),
      'MAPEI Stadium',23717,1920,_country.italy,75.7,[],{}];
    map[n.spezia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.102222,9.808611),
      'Alberto Picco',11466,1906,_country.italy,72.2,[],{}];
    map[n.torino] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(45.041667,7.65),
      'Olímpico Grande Torino',27994,1906,_country.italy,75.0,[],{}];
    map[n.udinese] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(46.081603,13.200136),
      'Friuli',25000,1896,_country.italy,74.5,[],{}];

    map[n.albinoleffe] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.sleeves,Coordinates(45.709155327387286, 9.68050207523022),
      'Atleti Azzurri d\'Italia',26562,1998,_country.italy,62.5,[],{}];
    map[n.alessandria] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(44.920306512244046, 8.616712809317104),
      'Estádio Giuseppe Moccagatta',6000,1912,_country.italy,63.4,[],{}];
    map[n.ancona] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.56434884281206, 13.52628772859907),
      'Estádio del Conero',26000,1905,_country.italy,62.7,[],{}];
    map[n.arezzo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.451020692772346, 11.894020722361574),
      'Stadio Città di Arezzo',13128,1923,_country.italy,57.7,[],{}];
    map[n.ascoli] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(42.861111,13.594167),
      'Stadio Cino e Lillo Del Duca',20000,1898,_country.italy,73.7,[],{}];
    map[n.avellino] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.92713726, 14.792281517),
      'Stadio Partenio',26308,1912,_country.italy,68.6,[],{}];
    map[n.bari] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(41.084736,16.840072),
      'San Nicola',58270,1908,_country.italy,73.1,[],{}];
    map[n.benevento] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(41.116691, 14.78177738),
      'Municipal Stadium Ciro Vigorito',17554,1929,_country.italy,70.7,[],{}];
    map[n.brescia] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(45.570556,10.236944),
      'Estádio Mario Rigamonti',27592,1911,_country.italy,74.3,[],{}];
    map[n.campobasso] = [ClubColors(darkblue,Colors.red),pattern.stripes3,Coordinates(41.57010278613092, 14.630775938316368),
      'Stadio Nuovo Romagnoli',25000,1919,_country.italy,56.7,[],{}];
    map[n.carpi] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(44.77559827909882, 10.882038830494857),
      'Stadio Sandro Cabassi',15500,1909,_country.italy,59.2,[],{}];
    map[n.catania] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(37.515833,15.071389),
      'Angelo Massimino',26000,1946,_country.italy,70.4,[],{}];
    map[n.cavese] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.cesena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.140556,12.261944),
      'Dino Manuzzi',23860,1940,_country.italy,68.2,[],{}];
    map[n.cittadella] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(45.642930, 11.7809924),
      'Pier Cesare Tombolato',7623,1973,_country.italy,66.7,[],{}];
    map[n.chievo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.435356,10.968647),
      'Estádio Marcantonio Bentegodi',39371,1929,_country.italy,65.8,[],{}];
    map[n.como] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8142475, 9.07235),
      'Giuseppe Sinigaglia',13602,1907,_country.italy,70.0,[],{}];
    map[n.cosenza] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(39.31004544, 16.23091),
      'Stadio San Vito-Gigi Marulla',24209,1929,_country.italy,69.8,[],{}];
    map[n.crotone] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(39.079167,17.116667),
      'Ezio Scida',16547,1923,_country.italy,67.7,[],{}];
    map[n.fanfulla] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.foggia] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(41.45503127, 15.542573),
      'Pino Zaccheria',25085,1920,_country.italy,71.2,[],{}];
    map[n.frosinone] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(41.6349811, 13.32167292),
      'Benito Stirpe',16227,1906,_country.italy,72.2,[],{}];
    map[n.genoa] = [ClubColors(Colors.red,darkblue),pattern.divided,Coordinates(44.416431,8.952428),
      'Luigi Ferraris',36600,1893,_country.italy,73.3,[n.sampdoria],{}];
    map[n.grosseto] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Carlo Zecchini',10200,1912,_country.italy,55.8,[],{}];
    map[n.juvestabia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.latina] = [ClubColors(Colors.black,darkblue),pattern.stripes3,Coordinates(0,0),
      'Domenico Francioni',8000,1945,_country.italy,58.9,[],{}];
    map[n.lecco] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.solid,Coordinates(45.85779980031857, 9.398680434738694),
      'Estádio Rigamonti-Ceppi',5000,1912,_country.italy,60.3,[],{}];
    map[n.legnano] = [ClubColors(Colors.purpleAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Giovanni Mari',5000,1913,_country.italy,51.7,[],{}];
    map[n.livorno] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.52680444, 10.3144784728),
      'Stadio Armando Picchi',20000,1915,_country.italy,66.3,[],{}];
    map[n.lucchese] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(43.84783205328745, 10.517264782575404),
      'Porta Elisa',7400,1905,_country.italy,59.2,[],{}];
    map[n.mantova] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(45.14639428457202, 10.794154597966143),
      'Estádio Danilo Martelli',7100,1911,_country.italy,56.2,[],{}];
    map[n.marzotto] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.messina] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(44.65350542, 10.9231108),
      'Stadio San Filippo',38722,1947,_country.italy,64.5,[],{}];
    map[n.modena] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Alberto Braglia',20500,1912,_country.italy,62.7,[],{}];
    map[n.nocerina] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.novara] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(45.43590602112539, 8.595937053795904),
      'Estádio Silvio Piola',17875,1908,_country.italy,62.0,[],{}];
    map[n.padova] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.43245775, 11.858382067),
      'Estádio Euganeo',32336,1910,_country.italy,63.1,[],{}];
    map[n.palermo] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(38.152767,13.342275),
      'Renzo Barbera',36871,1900,_country.italy,69.8,[],{}];
    map[n.parma] = [ClubColors(Colors.yellow,darkblue),pattern.dividedHor,Coordinates(44.794916666,10.338444444),
      'Ennio Tardini',22359,1913,_country.italy,72.8,[],{}];
    map[n.perugia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.1064162086, 12.3574171183),
      'Estádio Renato Curi',23625,1905,_country.italy,73.1,[],{}];
    map[n.pescara] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.4552707276, 14.229580317),
      'Adriático',24500,1936,_country.italy,69.9,[],{}];
    map[n.piacenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.02977717, 9.690407817),
      'Leonardo Garilli',21608,1919,_country.italy,69.5,[],{}];
    map[n.pisa] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(43.725629, 10.400910245),
      'Stadio Romeo Anconetani',17000,1909,_country.italy,74.6,[],{}];
    map[n.pistoiese] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Marcello Melani',13000,1921,_country.italy,60.7,[],{}];
    map[n.pordenone] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(45.957921, 12.648520),
      'Stadio Ottavio Bottecchia',3000,1928,_country.italy,72.7,[],{}];
    map[n.potenza] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Stadio Alfredo Viviani',5500,1919,_country.italy,56.6,[],{}];
    map[n.prato] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.italy,50.0,[],{}];
    map[n.propatria] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Carlo Speroni',4627,1919,_country.italy,59.4,[],{}];
    map[n.provercelli] = [ClubColors(Colors.white,Colors.black,Colors.red),pattern.solid,Coordinates(0,0),
      'Silvio Piola',8000,1903,_country.italy,60.1,[],{}];
    map[n.ravenna] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.40637142820898, 12.194541345928178),
      'Stadio Bruno Benelli',4000,1913,_country.italy,55.5,[],{}];
    map[n.reggina] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(38.0928237, 15.6357327),
      'Stadio Oreste',27763,1914,_country.italy,67.5,[],{}];
    map[n.rimini] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stadio Romeo Neri',9768,1912,_country.italy,53.4,[],{}];
    map[n.sambe] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Riviera delle Palme',15000,1923,_country.italy,60.2,[],{}];
    map[n.siena] = [ClubColors(grena,Colors.white),pattern.stripes2,Coordinates(43.3218490, 11.32611057),
      'Artemio Franchi',15373,1901,_country.italy,68.6,[],{}];
    map[n.siracusa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Nicola De Simone',5946,1924,_country.italy,52.4,[],{}];
    map[n.spal] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(44.839722,11.6075),
      'Estádio Paolo Mazza',16751,1907,_country.italy,72.7,[],{}];
    map[n.sudtirol] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Druso',5500,1974,_country.italy,68.7,[],{}];
    map[n.taranto] = [ClubColors(darkblue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Erasmo Iacovone',27584,1927,_country.italy,57.8,[],{}];
    map[n.ternana] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(42.5621775, 12.635254),
      'Libero Liberati',22000,1925,_country.italy,66.5,[],{}];
    map[n.trapani] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadio Polisportivo Provinciale',7750,1905,_country.italy,52.8,[],{}];
    map[n.treviso] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(45.66991992102001, 12.256278986346386),
      'Estádio Omobono Tenni',10000,1896,_country.italy,55.3,[],{}];
    map[n.triestina] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.62262820394401, 13.792834396130361),
      'Estádio Nereo Rocco',32454,1918,_country.italy,63.1,[],{}];
    map[n.varese] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.8345872, 8.8007546),
      'Franco Ossola',10000,1910,_country.italy,65.3,[],{}];
    map[n.venezia] = [ClubColors(Colors.black,Colors.orange,Colors.green),pattern.solid,Coordinates(45.427761,12.363731),
      'Pierluigi Penzo',9977,1907,_country.italy,73.2,[],{}];
    map[n.vicenza] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.544167,11.555556),
      'Estádio Romeo Menti',17163,1902,_country.italy,67.2,[],{}];
    map[n.virtusentella] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Estádio Comunalle',4154,1914,_country.italy,62.4,[],{}];
    map[n.virtuslanciano] = [ClubColors(Colors.black,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Guido Biondi',4678,1919,_country.italy,54.6,[],{}];

    //ESPANHA
    map[n.almeria] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.84,-2.435278),
      'Estadio de los Juegos Mediterráneos',22000,1989,_country.spain,73.6,[],{}];
    map[n.athleticbilbao] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(43.264205,-2.949369),
      'San Mamés',53289,1898,_country.spain,80.3,[n.realsociedad],{}];
    map[n.atleticomadrid] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(40.436111,-3.599444),
      'Wanda Metropolitano',67829,1903,_country.spain,83.5,[n.realmadrid],{}];
    map[n.barcelona] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(41.380833,2.1225),
      'Camp Nou',99354,1899,_country.spain,84.3,[n.realmadrid],{}];
    map[n.cadiz] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(36.50274029685163, -6.272703671625995),
      'Estadio Ramón de Carranza',20724,1910,_country.spain,75.6,[],{}];
    map[n.celtavigo] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(42.211861,-8.740328),
      'Balaídos',29000,1923,_country.spain,77.3,[],{}];
    map[n.elche] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(38.266944,-0.663333),
      'Martínez Valero',31388,1922,_country.spain,75.0,[],{}];
    map[n.espanyol] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(41.347861,2.075667),
      'Cornellà-El Prat',40500,1900,_country.spain,78.0,[],{}];
    map[n.getafe] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(40.325556,-3.714722),
      'Coliseum Alfonso Pérez',17700,1983,_country.spain,76.2,[],{}];
    map[n.girona] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(41.961560623544194, 2.8289012665501416),
      'Estádio Montilivi',13500,1930,_country.spain,72.55,[],{}];
    map[n.levante] = [ClubColors(grena,Colors.blue),pattern.stripes2,Coordinates(39.494722,-0.364167),
      '	Ciutat de Valencia',25534,1909,_country.spain,76.5,[n.valencia],{}];
    map[n.mallorca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(39.59,2.63),
      'Iberostar Estádio',23142,1916,_country.spain,74.1,[],{}];
    map[n.osasuna] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(42.796667,-1.636944),
      'Reyno de Navarra',19800,1920,_country.spain,76.3,[],{}];
    map[n.rayovallecano] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(40.391944,-3.658961),
      'Vallecas Campo de Futebol',15105,1924,_country.spain,75.0,[],{}];
    map[n.realbetis] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.356403,-5.981611),
      'Benito Villamarín',60720,1907,_country.spain,79.6,[n.sevilla],{}];
    map[n.realmadrid] = [ClubColors(Colors.white,Colors.grey),pattern.solid,Coordinates(40.45306,-3.68835),
      'Santiago Bernabeu',81044,1902,_country.spain,86.0,[n.barcelona,n.atleticomadrid],{}];
    map[n.realsociedad] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.301378,-1.973617),
      'Anoeta',39500,1909,_country.spain,80.5,[n.athleticbilbao],{}];
    map[n.sevilla] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.383878,-5.970467),
      'Ramón Sánchez Pizjuán',43883,1890,_country.spain,82.0,[n.realbetis],{}];
    map[n.valladolid] = [ClubColors(Colors.purple,Colors.white),pattern.stripes2,Coordinates(41.644444,-4.761111),
      'José Zorrilla',26512,1928,_country.spain,74.2,[],{}];
    map[n.valencia] = [ClubColors(Colors.white,Colors.orange),pattern.solid2,Coordinates(39.474722,-0.358333),
      'Mestalla',48600,1919,_country.spain,78.7,[],{}];
    map[n.villareal] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(39.944167,-0.103611),
      'La Cerámica',23500,1923,_country.spain,81.2,[],{}];

    map[n.alaves] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(42.837224, -2.68794204),
      'Mendizorroza',19840,1921,_country.spain,75.9,[],{}];
    map[n.albacete] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(38.9812011, -1.851626737),
      'Carlos Belmonte',17300,1940,_country.spain,67.6,[],{}];
    map[n.alcorcon] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(40.33883725, -3.84051384),
      'Municipal de Santo Domingo',6000,1971,_country.spain,65.1,[],{}];
    map[n.alcoyano] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(38.69098455376875, -0.4903594329416853),
      'El Collao',8000,1928,_country.spain,55.6,[],{}];
    map[n.amorebieta] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.barcelonaB] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(41.37443652, 2.050680580),
      'Estadi Johan Cruyff',6000,1970,_country.spain,67.8,[],{}];
    map[n.badajoz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.8590980, -7.005712641),
      'Nuevo Vivero',14898,1905,_country.spain,60.7,[],{}];
    map[n.barakaldo] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes4,Coordinates(0,0),
      'Lasesarre',7960,1917,_country.spain,55.6,[],{}];
    map[n.athleticbilbaoB] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Instalaciones de Lezama',1500,1964,_country.spain,62.6,[],{}];
    map[n.burgos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.344459, -3.680311585),
      'Estádio Municipal de El Plantío',12200,1994,_country.spain,68.6,[],{}];
    map[n.cartagena] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.609976073, -0.996185027),
      'Estádio Cartagonova',15105,1995,_country.spain,61.0,[],{}];
    map[n.castellon] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(39.9962101, -0.038633183),
      'El Nou Estadi Castalia',12500,1922,_country.spain,62.9,[],{}];
    map[n.ciudadmurcia] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(37.99450994472481, -1.13560337291738),
      'José Barnés',2500,2010,_country.spain,56.4,[],{}];
    map[n.compostela] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.88266376, -8.51672248),
      'Vero Boquete',13000,1962,_country.spain,61.7,[],{}];
    map[n.cordoba] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(37.872294,-4.764642),
      'Estadio Nuevo Arcángel',25100,1954,_country.spain,68.5,[],{}];
    map[n.culturalleonesa] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.587371307664355, -5.576956484405359),
      'Estádio Reino de León',48600,1923,_country.spain,65.3,[],{}];
    map[n.eibar] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(43.181937, -2.475632),
      'Municipal de Ipurua',8164,1940,_country.spain,73.8,[],{}];
    map[n.extremadura] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(38.68439295429973, -6.414614459925131),
      'Francisco de la Hera',11580,1924,_country.spain,65.4,[],{}];
    map[n.ferrol] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal de A Malata',12042,1919,_country.spain,60.6,[],{}];
    map[n.figueres] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Vilatenim',9472,1919,_country.spain,57.1,[],{}];
    map[n.fuenlabrada] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Fernando Torres',7500,1975,_country.spain,63.5,[],{}];
    map[n.tarragona] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.19020153, 2.4763709658),
      'Nou Estadi',14500,1886,_country.spain,66.1,[],{}];
    map[n.granada] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(37.152967,-3.595736),
      'Nuevo Los Cármenes',22524,1931,_country.spain,78.4,[],{}];
    map[n.hercules] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(38.3580625, -0.4914326032),
      'José Rico Pérez',29500,1922,_country.spain,70.4,[],{}];
    map[n.huelva] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(37.24660814, -6.9540283),
      'Estadio Nuevo Colombino',21670,1889,_country.spain,68.8,[],{}];
    map[n.huesca] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(42.131944,-0.424444),
      'Estádio El Alcoraz',8000,1960,_country.spain,69.4,[],{}];
    map[n.ibiza] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(38.913791833, 1.415050),
      'Estádio Municipal de Can Misses',4500,2015,_country.spain,68.5,[],{}];
    map[n.jaen] = [ClubColors(Colors.white,Colors.purple),pattern.oneHorStripe,Coordinates(0,0),
      'Nuevo La Victoria',12569,1929,_country.spain,57.3,[],{}];
    map[n.lacoruna] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.368667,-8.417372),
      'Municipal de Riazor',35600,1906,_country.spain,69.8,[],{}];
    map[n.laspalmas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(28.1,-15.456667),
      'Estádio Gran Canaria',31250,1949,_country.spain,71.1,[],{}];
    map[n.leganes] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(40.3406935, -3.7602580),
      'Municipal de Butarque',10958,1928,_country.spain,70.2,[],{}];
    map[n.llagostera] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.lleida] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(41.62148448, 0.61420973),
      'Camp d´Esports',13500,1939,_country.spain,62.8,[],{}];
    map[n.logrones] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(42.45328234, -2.453517217),
      'Estadio Las Gaunas',16000,1940,_country.spain,63.2,[],{}];
    map[n.lorca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.lugo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(43.003350, -7.57097154),
      'Anxo Carro',7070,1953,_country.spain,66.1,[],{}];
    map[n.malaga] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(36.734092,-4.426422),
      'La Rosaleda',30044,1948,_country.spain,70.0,[],{}];
    map[n.merida] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(38.9144846, -6.33649039),
      'Estadio Romano',14600,1912,_country.spain,63.6,[],{}];
    map[n.mirandes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.6809190, -2.93530024),
      'Municipal de Anduva',6000,1927,_country.spain,62.5,[],{}];
    map[n.murcia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.0424994, -1.14406194),
      'Nueva Condomina',33900,1908,_country.spain,65.3,[],{}];
    map[n.numancia] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.754444,-2.467778),
      'Nuevo Estadio Los Pajaritos',9025,1945,_country.spain,66.7,[],{}];
    map[n.orihuela] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.palencia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.ponferradina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.5574263, -6.599923),
      'El Toralín',8200,1922,_country.spain,68.7,[],{}];
    map[n.pontevedra] = [ClubColors(vinho,Colors.yellow),pattern.solid,Coordinates(42.4386188020473, -8.641562137464813),
      'Estádio Municipal de Pasarón',12000,1941,_country.spain,62.4,[],{}];
    map[n.puertollano] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.realmadridB] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(40.477060, -3.61423761),
      'Estádio Alfredo Di Stéfano',12000,1930,_country.spain,68.0,[],{}];
    map[n.reus] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(41.15634542345179, 1.0863617261427487),
      'Reus Municipal Stadium',4300,1909,_country.spain,60.2,[],{}];
    map[n.salamanca] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.995500, -5.664743645),
      'El Helmántico',17341,2013,_country.spain,60.2,[],{}];
    map[n.sanandres] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1988,_country.spain,50.3,[],{}];
    map[n.sportinggijon] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.536111,-5.637222),
      'El Molinón',30000,1905,_country.spain,71.0,[],{}];
    map[n.tarrassa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.spain,50.0,[],{}];
    map[n.tenerife] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(28.463192602, -16.2608979),
      'Heliodoro López',24000,1912,_country.spain,71.0,[],{}];
    map[n.toledo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(39.86914546, -4.0182605),
      'Salto del Caballo',5500,1928,_country.spain,58.6,[],{}];
    map[n.racingSantander] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(43.476370, -3.7933152),
      'Estádio El Sardinero',22400,1913,_country.spain,67.5,[],{}];
    map[n.realOviedo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.3608751, -5.86979084),
      'Novo Estádio Carlos Tartiere',30500,1926,_country.spain,68.2,[],{}];
    map[n.sabadell] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(41.5546512, 2.09199163),
      'Nova Creu Alta',11908,1903,_country.spain,61.7,[],{}];
    map[n.sestao] = [ClubColors(Colors.black,Colors.green),pattern.stripes3,Coordinates(0,0),
      'Las Llanas',8905,1916,_country.spain,56.3,[],{}];
    map[n.xerez] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(36.6896000, -6.1198111),
      'Estadio de Chapín',20523,1947,_country.spain,64.7,[],{}];
    map[n.zaragoza] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.636592,-0.901822),
      'La Romareda',34596,1932,_country.spain,70.6,[],{}];

    //ALEMANHA
    map[n.augsburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.32333464205292, 10.886761848412458),
      'SGL Arena',30660,1907,_country.germany,73.6,[],{}];
    map[n.leverkusen] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(51.038255555,7.002205555),
      'BayArena',30210,1904,_country.germany,80.4,[],{}];
    map[n.bayernmunique] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.218775,11.624752777),
      'Allianz Arena',75024,1900,_country.germany,85.2,[],{}];
    map[n.bochum] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.489944,7.236489),
      'Vonovia Ruhrstadion',27599,1848,_country.germany,72.9,[],{}];
    map[n.dortmund] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.4925,7.451667),
      'Signal Iduna Park',81359,1909,_country.germany,82.5,[n.schalke04],{}];
    map[n.moenchengladbach] = [ClubColors(Colors.white,Colors.green,Colors.black),pattern.solid,Coordinates(51.174583333,6.385463888),
      'Borussia-Park',54022,1900,_country.germany,79.6,[],{}];
    map[n.koln] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.933611,6.875),
      'RheinEnergieStadion',50000,1948,_country.germany,75.4,[],{}];
    map[n.eintrachtfrankfurt] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.068611,8.645278),
      'Deutsche Bank Park',51500,1899,_country.germany,78.5,[],{}];
    map[n.freiburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.988889,7.893056),
      'Europa-Park Stadion',34700,1904,_country.germany,76.5,[],{}];
    map[n.herthaberlim] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(52.514722222,13.239444444),
      'Olímpico de Berlim',74649,1892,_country.germany,75.5,[],{}];
    map[n.hoffenheim] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.239,8.888278),
      'Rhein-Neckar-Arena',30150,1899,_country.germany,78.1,[],{}];
    map[n.mainz05] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.984167,8.224167),
      'Opel Arena',34034,1905,_country.germany,75.55,[],{}];
    map[n.rbleipzig] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.345833,12.348056),
      'Red Bull Arena',42146,2009,_country.germany,81.8,[],{}];
    map[n.schalke04] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.554502777,7.067588888),
      'Veltins-Arena',62271,1904,_country.germany,74.6,[n.dortmund],{}];
    map[n.stuttgart] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(48.792222,9.231944),
      'Mercedes-Benz Arena',60441,1893,_country.germany,75.6,[],{}];
    map[n.unionberlin] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.457222,13.568056),
      'An der Alten Försterei',22012,1966,_country.germany,74.2,[],{}]; 
    map[n.werderbremen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.066389,8.8375),
      'Wohninvest Weserstadion',42100,1899,_country.germany,73.1,[],{}];
    map[n.wolfsburg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.431944,10.803889),
      'Volkswagen Arena',30000,1945,_country.germany,78.5,[],{}];

    map[n.alemanniaaachen] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(50.7933333,6.09722222),
      'New Tivoli',32960,1900,_country.germany,65.8,[],{}];
    map[n.arminiabiefeld] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(52.031389,8.516944),
      'Bielefelder Alm',27300,1905,_country.germany,73.3,[],{}];
    map[n.blauweiss90berlin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.berliner] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.54062157, 13.4768246),
      'Dynamo-Sportforum',10000,1953,_country.germany,61.6,[],{}];
    map[n.brieske] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Elsterkampfbahn',6000,1919,_country.germany,48.0,[],{}];
    map[n.carlzeissjena] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(50.9160646, 11.582811),
      'Ernst-Abbe-Sportfeld',13000,1903,_country.germany,63.4,[],{}];
    map[n.chemnitzer] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(50.842245, 12.945568),
      'Stadion an der Gellertstraße',15200,1966,_country.germany,61.2,[],{}];
    map[n.darmstadt] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.85781666, 8.672877134887),
      'Merck-Stadion am Böllenfalltor',17000,1898,_country.germany,70.1,[],{}];
    map[n.duisburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.409028,6.778639),
      'MSV-Arena',31500,1902,_country.germany,66.8,[],{}];
    map[n.dynamodresden] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.040278,13.747778),
      'DDV-Stadion',32066,1953,_country.germany,68.2,[],{}];
    map[n.braunschweiger] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(52.29,10.521389),
      'Eintracht-Stadion',23325,1895,_country.germany,69.3,[],{}];
    map[n.energiecottbus] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.751389,14.345556),
      'Stadion der Freundschaft',25450,1966,_country.germany,66.5,[],{}];
    map[n.erzgebirgeaue] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(50.5975,12.711111),
      'Erzgebirgsstadion',15711,1946,_country.germany,64.3,[],{}];
    map[n.fsvfrankfurt] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.fortunadusseldorf] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.261539,6.733083),
      'Merkur Spielarena',54600,1895,_country.germany,70.8,[],{}];
    map[n.fortunakoln] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.frankfurt1] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(51.75182257, 14.34562709),
      'Stadion der Freundschaft',12000,1951,_country.germany,58.7,[],{}];
    map[n.greutherfurth] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(49.4870762463, 11.0000170),
      'Stadion am Laubenweg',15500,1903,_country.germany,69.6,[],{}];
    map[n.hallescher] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Leuna Chemie Stadion',15057,1966,_country.germany,61.2,[],{}];
    map[n.hamburgo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(53.5872273, 9.89854),
      'Volksparkstadion',57000,1887,_country.germany,71.9,[],{}];
    map[n.hannover96] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(52.3601348913, 9.73151458536),
      'HDI-Arena',49000,1896,_country.germany,69.6,[],{}];
    map[n.hansarostock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.08495,12.095188888),
      'Ostseestadion',29000,1965,_country.germany,67.1,[],{}];
    map[n.heidenheim] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(48.66851956, 10.13918217),
      'Voith-Arena',15000,1911,_country.germany,62.0,[],{}];
    map[n.hessenkassel] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.holsteinkiel] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.349072, 10.12361715),
      'Holstein-Stadion',15034,1900,_country.germany,60.6,[],{}];
    map[n.homburg] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.ingolstadt] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.745434, 11.485777),
      'Audi-Sportpark',15445,2004,_country.germany,64.3,[],{}];
    map[n.jahnregensburg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.99090071, 12.1074654),
      'Jahnstadion Regensburg',15210,1907,_country.germany,64.1,[],{}];
    map[n.kaiserslautern] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.43448525, 7.77761161),
      'Fritz Walter',49850,1900,_country.germany,66.9,[],{}];
    map[n.karlsruher] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.02,8.41305555),
      'Wildparkstadion',32306,1894,_country.germany,63.5,[],{}];
    map[n.kickersoffenbach] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.09474412675479, 8.798728135731345),
      'Sparda Bank Hessen Stadium',20500,1901,_country.germany,59.6,[],{}];
    map[n.lokleipzig] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.3029417, 12.4192716),
      'Bruno-Plache-Stadion',15600,1893,_country.germany,62.9,[],{}];
    map[n.magdeburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.1254076, 11.6705710),
      'MDCC-Arena',30098,1965,_country.germany,64.8,[],{}];
    map[n.meppen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.munich1860] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(48.110833,11.574444),
      'Grünwalder Stadion',15000,1860,_country.germany,70.6,[],{}];
    map[n.neunkirchen] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(49.336698292783524, 7.179786267954172),
      'Ellenfeldstadion',23000,1905,_country.germany,55.6,[],{}];
    map[n.nurnberg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.42632233, 11.126222),
      'Max-Morlock-Stadion',49923,1900,_country.germany,70.4,[],{}];
    map[n.oberhausen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.paderborn] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.731389,8.710833),
      'Benteler-Arena',15000,1907,_country.germany,69.6,[],{}];
    map[n.pirmasens] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Sportpark Husterhöhe',10000,1903,_country.germany,58.0,[],{}];
    map[n.preubenmunster] = [ClubColors(darkgreen,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Preussenstadion',15050,1906,_country.germany,56.2,[],{}];
    map[n.rotweissahlen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.rotweissessen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(51.4867758, 6.9768),
      'Georg-Melches-Stadion',22500,1907,_country.germany,61.7,[],{}];
    map[n.erfurt] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(50.96034067135866, 11.037017834954431),
      'Steigerwaldstadion',18611,1966,_country.germany,61.5,[],{}];
    map[n.sachsenleipzig] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.sandhausen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.3322165, 8.647684677),
      'BWT-Stadion am Hardtwald',16003,1916,_country.germany,60.8,[],{}];
    map[n.saarbrucken] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(49.2475,6.984167),
      'Ludwigsparkstadion',15414,1903,_country.germany,63.6,[],{}];
    map[n.stuttgarterkickers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Gazi-Stadion auf der Waldau',11436,1899,_country.germany,60.3,[],{}];
    map[n.stpauli] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(53.554444,9.967778),
      'Millerntor-Stadion',29546,1910,_country.germany,70.4,[],{}];
    map[n.tasmania] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Sportpark Neukölln',0,1900,_country.germany,56.5,[],{}];
    map[n.uerdigen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(51.339167,6.603611),
      'Grotenburg-Stadion',34500,1905,_country.germany,62.0,[],{}];
    map[n.sgunionsolingen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.spvggunterhaching] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.tennisborussiaberlin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.ulm] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.vfbleipzig] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.vflosnabruck] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.vorwarts] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.germany,50.0,[],{}];
    map[n.waldhofmannheim] = [ClubColors(Colors.blue,Colors.black,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Carl-Benz-Stadium',27500,1907,_country.germany,50.0,[],{}];
    map[n.sgwattenscheid09] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.germany,50.0,[],{}];
    map[n.zwickau] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Westsachsenstadion',14200,1966,_country.germany,58.6,[],{}];


    map[n.brandenburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion Am Quenz',15500,1950,_country.germany,53.4,[],{}];
    map[n.dresdner] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Heinz-Steyer-Stadion',5000,1898,_country.germany,56.4,[],{}];
    map[n.stahlriesa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Nudelarena',4000,1903,_country.germany,51.4,[],{}];

    //FRANÇA
    map[n.ajaccio] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.931255913, 8.777428344),
      'François Coty',12000,1910,_country.france,68.6,[],{}];
    map[n.angers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(47.4606232855, -0.5314198073),
      'Stade Jean-Bouin',18752,1919,_country.france,74.1,[],{}];
    map[n.auxerre] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid2,Coordinates(47.78717964, 3.5894887694),
      'Stade l\'Abbé-Deschamps',23467,1905,_country.france,69.5,[],{}];
    map[n.bordeaux] = [ClubColors(darkblue,Colors.white),pattern.oneHorStripe,Coordinates(44.8974722523, -0.561285887),
      'Matmut Atlantique',42052,1881,_country.france,73.2,[],{}];
    map[n.brest] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.402932,-4.461694),
      'Stade Francis-Le Blé',15000,1950,_country.france,74.2,[],{}];
    map[n.clermont] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(45.81592183512457, 3.1208739),
      'Stade Gabriel-Montpied',10607,1990,_country.france,72.4,[],{}];
    map[n.lens] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonal,Coordinates(50.43300186, 2.81536255633),
      'Félix Bollaert',41229,1906,_country.france,75.6,[],{}];
    map[n.lille] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(50.611944,3.130556),
      'Pierre-Mauroy',50186,1944,_country.france,77.6,[],{}];
    map[n.lorient] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(47.74833585, -3.36818605),
      'Stade du Moustoir',18500,1926,_country.france,50.0,[],{}];
    map[n.lyon] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.stripeCrest,Coordinates(45.765224,4.982131),
      'Parc Olympique Lyonnais',59186,1950,_country.france,78.9,[],{}];
    map[n.monaco] = [ClubColors(Colors.red,Colors.white),pattern.monaco,Coordinates(43.727615426, 7.415587736),
      'Louis II',18523,1924,_country.france,78.2,[],{}];
    map[n.montpellier] = [ClubColors(darkblue,Colors.orange),pattern.horStripesThin,Coordinates(43.269722222,5.395833333),
      'Stade de la Mosson',32939,1919,_country.france,75.8,[n.nimes],{}];
    map[n.nantes] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(47.25625627, -1.524267292),
      'Stade de la Beaujoire',37463,1943,_country.france,75.6,[],{}];
    map[n.nice] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(43.705138888,7.192583333),
      'Allianz Riviera',35624,1904,_country.france,77.5,[],{}];
    map[n.om] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(43.26998307, 5.3962199073),
      'Vélodrome',67395,1899,_country.france,78.4,[n.psg],{}];
    map[n.psg] = [ClubColors(darkblue,Colors.red),pattern.oneVertStripe,Coordinates(48.8413888,2.2530555),
      'Parc des Princes',48583,1970,_country.france,86.5,[n.om],{}];
    map[n.reims] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.246667,4.025),
      'Auguste Delaune',21668,1931,_country.france,74.3,[],{}];
    map[n.rennes] = [ClubColors(Colors.red,Colors.black),pattern.solid2,Coordinates(48.107472222,-1.712861111),
      'Roazhon Park',29778,1901,_country.france,78.1,[],{}];
    map[n.strasbourg] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.560064,7.754969),
      'Stade de la Meinau',26109,1906,_country.france,76.0,[],{}];
    map[n.toulouse] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(43.583296,1.434055),
      'Stade de Toulouse',35500,1937,_country.france,70.0,[],{}];
    map[n.troyes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(48.30766856, 4.0987888),
      'Stade de l\'Aube',20400,1900,_country.france,72.5,[],{}];

    map[n.amiens] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(49.89432771, 2.26331715),
      'Stade de la Licorne',12097,1901,_country.france,67.4,[],{}];
    map[n.angouleme] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Lebon',6500,1920,_country.france,57.6,[],{}];
    map[n.annecy] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(45.9165575, 6.1180684),
      'Parc des Sports',15714,1927,_country.france,65.1,[],{}];
    map[n.bastia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6514,9.442619),
      'Stade Armand Cesari',16500,1905,_country.france,68.6,[],{}];
    map[n.beziers] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.boulogne] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.caen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.17955728, -0.3960764),
      'Michel d\'Ornano',21500,1913,_country.france,68.7,[],{}];
    map[n.cannes] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(43.55317462, 6.964876416),
      'Pierre de Coubertin',17500,1909,_country.france,63.6,[],{}];
    map[n.chamois] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.3170594, -0.48961761),
      'Stade René-Gaillard',10898,1919,_country.france,66.4,[],{}];
    map[n.chateauroux] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.dijon] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.3249340, 5.06840377),
      'Stade Gaston-Gérard',16000,1998,_country.france,69.3,[],{}];
    map[n.evian] = [ClubColors(Colors.purpleAccent,Colors.white),pattern.dividedHor,Coordinates(45.9160, 6.11834259),
      'Parc des Sports',15660,2007,_country.france,62.6,[],{}];
    map[n.grenoble] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.1875313, 5.740180234),
      'Stade des Alpes',20062,1892,_country.france,62.4,[],{}];
    map[n.gueugnon] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.guingamp] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.56549284, -3.1643878),
      'Stade du Roudourou',18256,1912,_country.france,65.6,[],{}];
    map[n.lavallois] = [ClubColors(Colors.orange,Colors.orange),pattern.solid,Coordinates(48.082332, -0.754686),
      'Stade Francis-Le-Basser',18739,1902,_country.france,58.6,[],{}];
    map[n.lehavre] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.4988613, 0.1698838),
      'Stade Océane',25178,1872,_country.france,63.1,[],{}];
    map[n.lemans] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(47.95919009, 0.223153075),
      'MMArena',17500,1985,_country.france,64.6,[],{}];
    map[n.martigues] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.metz] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(49.11020796, 6.1603276020),
      'Stade Saint-Symphorien',26700,1919,_country.france,73.5,[],{}];
    map[n.nancy] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.6955,6.210687),
      'Stade Marcel Picot',20085,1967,_country.france,66.6,[],{}];
    map[n.nimes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.8161358, 4.359880),
      'Stade des Costières',18482,1937,_country.france,70.5,[n.montpellier],{}];
    map[n.oac] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.france,50.0,[],{}];
    map[n.orleans] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.8406476, 1.9414294),
      'Stade de la Source',8000,1902,_country.france,66.9,[],{}];
    map[n.parisfc] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.818611,2.346667),
      'Stade Sébastien Charléty',20000,1969,_country.france,68.5,[],{}];
    map[n.pau] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(43.309443, -0.3169603),
      'Stade du Hameau',13966,1920,_country.france,60.0,[],{}];
    map[n.quevilly] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(49.427630, 1.0512107),
      'Amable Lozai',2500,1902,_country.france,60.4,[],{}];
    map[n.racingParis] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes2,Coordinates(0,0),
      'Stade Yves-du-Manoir',7000,1882,_country.france,56.4,[],{}];
    map[n.redstar] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(48.90659978, 2.34197952),
      'Stade Bauer',10000,1897,_country.france,64.6,[],{}];
    map[n.rodez] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(44.351570, 2.5637119),
      'Stade Paul-Lignon',5955,1929,_country.france,62.7,[],{}];
    map[n.rouen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(49.41143361, 1.07069394),
      'Stade Robert Diochon',12018,1899,_country.france,60.6,[],{}];
    map[n.saintetienne] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(45.460833,4.39),
      'Geoffroy-Guichard',42000,1919,_country.france,73.5,[],{}];
    map[n.sedan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(49.69404732, 4.93880095),
      'Stade Louis Dugauguez',23189,1919,_country.france,63.2,[],{}];
    map[n.sochaux] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.512403,6.811094),
      'Auguste Bonal',20005,1928,_country.france,66.3,[],{}];
    map[n.toulon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.126298, 5.9023646),
      'Stade de Bon Rencontre',8000,1944,_country.france,60.4,[],{}];
    map[n.tours] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Stade de la Vallée du Cher',16247,1951,_country.france,54.3,[],{}];
    map[n.valenciennes] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(50.3490100, 3.5325451),
      'Stade du Hainaut',25172,1913,_country.france,61.3,[],{}];
    map[n.vendee] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Stade Massabielle',5000,1919,_country.france,52.3,[],{}];
    map[n.villefranche] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(46.00, 4.7073536),
      'Stade Armand Chouffet',5000,1927,_country.france,58.6,[],{}];
    map[n.limoges] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Saint-Lazare',3000,1947,_country.france,50.0,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.roubaix] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Parc Jean Dubrule',0,1895,_country.france,50.0,[],{"extinto": 1964}]; //EXTINTO 1964
    map[n.stadeFrancais] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Centre sportif du Haras Lupin',0,1900,_country.france,50.0,[],{"extinto": 1990}]; //ESTINTO 1990

    //PORTUGAL
    map[n.benfica] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.75301495, -9.1844710),
      'Estádio da Luz',64642,1904,_country.portugal,79.5,[n.porto,n.sporting],{}];
    map[n.porto] = [ClubColors(Colors.blueAccent,Colors.white),pattern.stripes2,Coordinates(41.161758,-8.583933),
      'Estádio do Dragão',50035,1893,_country.portugal,78.9,[n.benfica,n.sporting],{}];
    map[n.sporting] = [ClubColors(darkgreen,Colors.white),pattern.horStripes4,Coordinates(38.76119444,-9.16078333),
      'José Alvalade',50095,1906,_country.portugal,78.6,[n.porto,n.benfica],{}];
    map[n.alverca] = [ClubColors(grena,darkblue),pattern.stripes2,Coordinates(38.897982, -9.0350067),
      'Alverca do Ribatejo',7705,1939,_country.portugal,60.6,[],{}];
    map[n.amora] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.portugal,50.0,[],{}];
    map[n.arouca] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(40.933557625, -8.249067289),
      'Estádio Municipal de Arouca',5000,1952,_country.portugal,65.6,[],{}];
    map[n.aves] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.36690511095616, -8.411664933375393),
      'Estádio do Clube Desportivo das Aves',8560,1930,_country.portugal,61.6,[],{}];
    map[n.atleticoPT] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(0,0),
      'Estádio da Tapadinha',4000,1942,_country.portugal,57.7,[],{}];
    map[n.barreirense] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(38.65107109130614, -9.065094640875733),
      'Campo da Verderena',1500,1911,_country.portugal,57.8,[],{}];
    map[n.beiramar] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.6478986, -8.593620),
      'Municipal de Aveiro',32830,1923,_country.portugal,62.8,[],{}];
    map[n.braga] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(41.56272876, -8.429015524),
      'Municipal de Braga',30286,1921,_country.portugal,75.3,[n.vitoriaguimaraes],{}];
    map[n.boavista] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(41.162222,-8.64277777),
      'Estádio do Bessa Século XXI',28263,1903,_country.portugal,71.4,[],{}];
    map[n.belenenses] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.702778,-9.207778),
      'Estádio do Restelo',32000,1919,_country.portugal,68.3,[],{}];
    map[n.caldas] = [ClubColors(Colors.black,Colors.white),pattern.sleeves,Coordinates(39.4031818075768, -9.12647802790337),
      'Campo da Mata',6000,1916,_country.portugal,57.6,[],{}];
    map[n.campomaiorense] = [ClubColors(Colors.green,Colors.brown),pattern.solid,Coordinates(0,0),
      'Estádio Capitão César Correia',7500,1926,_country.portugal,52.6,[],{}];
    map[n.casapia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(38.73764642, -9.20340044),
      'Estádio Pina Manique',5000,1920,_country.portugal,67.7,[],{}];
    map[n.chaves] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(41.75094886, -7.464533445),
      'Estádio Municipal de Chaves',9000,1949,_country.portugal,67.5,[],{}];
    map[n.coimbra] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.2035513, -8.406711275),
      'Estádio Cidade de Coimbra',29622,1887,_country.portugal,68.1,[],{}];
    map[n.covilha] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.2828334, -7.5122373),
      'Municipal José Santos Pinto',3500,1923,_country.portugal,66.4,[],{}];
    map[n.cuf] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Alfredo da Silva',21498,1937,_country.portugal,54.2,[],{}];
    map[n.espinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0021047, -8.64512619),
      'Estádio Comendador Manuel',7500,1914,_country.portugal,62.6,[],{}];
    map[n.estoril] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(38.7153065, -9.40573817),
      'António Coimbra da Mota',8000,1939,_country.portugal,66.8,[],{}];
    map[n.estrelaamadora] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(38.75216476, -9.22726611),
      'Estádio José Gomes',9288,1932,_country.portugal,64.5,[],{}];
    map[n.evora] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(38.56246066614667, -7.917770383727322),
      'Campo Estrela',10000,1911,_country.portugal,56.7,[],{}];
    map[n.famalicao] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(41.4016829, -8.52243319),
      'Estádio Municipal de Famalicão',5307,1931,_country.portugal,71.2,[],{}];
    map[n.farense] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(37.02232811, -7.928202),
      'Estádio de São Luís',7000,1910,_country.portugal,61.6,[],{}];
    map[n.feirense] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.926660, -8.545820),
      'Marcolino de Castro',5600,1918,_country.portugal,63.5,[],{}];
    map[n.gilvicente] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.533888888,-8.611111111),
      'Estádio Cidade de Barcelos',12046,1924,_country.portugal,71.0,[],{}];
    map[n.leca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.portugal,50.0,[],{}];
    map[n.leixoes] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(41.1842451364265, -8.666396418),
      'Estádio do Mar',9821,1907,_country.portugal,66.5,[],{}];
    map[n.mafra] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-26.1286357, -49.80125986),
      'Municipal de Mafra',1257,1965,_country.portugal,63.5,[],{}];
    map[n.maritimo] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(32.645561,-16.928331),
      'Estádio dos Barreiros',10932,1910,_country.portugal,71.1,[],{}];
    map[n.moreirense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3782047, -8.3542469),
      'Comendador Joaquim de Almeida Freitas',6153,1938,_country.portugal,69.8,[],{}];
    map[n.nacionalMadeira] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.670625,-16.883525),
      'Estádio da Madeira',5500,1910,_country.portugal,66.7,[],{}];
    map[n.naval] = [ClubColors(Colors.green,Colors.white),pattern.horStripes2,Coordinates(40.162827, -8.85902270),
      'José Bento Pessoa',9000,1893,_country.portugal,59.3,[],{}];
    map[n.pacosferreira] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(41.27144668, -8.38488781),
      'Capital do Móvel',9077,1950,_country.portugal,68.2,[],{}];
    map[n.penafiel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.211768, -8.27777600),
      'Estádio Municipal 25 de Abril',5300,1951,_country.portugal,65.1,[],{}];
    map[n.portimonense] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.13588, -8.540001),
      'Estádio Municipal de Portimão',6000,1914,_country.portugal,70.9,[],{}];
    map[n.olhanense] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(37.029370, -7.84837313),
      'Estádio José Arcanjo',10080,1912,_country.portugal,60.4,[],{}];
    map[n.oriental] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Engº Carlos Salema',5000,1946,_country.portugal,53.1,[],{}];
    map[n.rioave] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.3628257, -8.73965321),
      'Estádio dos Arcos',5000,1939,_country.portugal,67.8,[],{}];
    map[n.salgueiros] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.15904746, -8.572435608),
      'Complexo Desportivo de Campanhã',1500,1911,_country.portugal,58.7,[],{}];
    map[n.santaclara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(37.76392847, -25.622288584),
      'Estádio de São Miguel',10000,1927,_country.portugal,67.5,[],{}];
    map[n.leiria] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(39.74945449, -8.81260997427),
      'Estádio Dr. Magalhães Pessoa',25000,1966,_country.portugal,63.0,[],{}];
    map[n.seixal] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.portugal,50.0,[],{}];
    map[n.tirsense] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Estádio Abel Alves de Figueiredo',15000,1938,_country.portugal,53.7,[],{}];
    map[n.trofense] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.portugal,50.0,[],{}];
    map[n.tondela] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(40.51203795, -8.082878165),
      'Estádio João Cardoso',5000,1933,_country.portugal,64.6,[],{}];
    map[n.torreense] = [ClubColors(vinho,darkblue),pattern.oneHorStripe,Coordinates(39.09483859277662, -9.256606444567478),
      'Estádio Manuel Marques',12000,1917,_country.portugal,54.8,[],{}];
    map[n.tomar] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripes2,Coordinates(40.659553216, -7.9003969788),
      'Estádio Municipal de Tomar',500,1914,_country.portugal,49.4,[],{}];
    map[n.varzim] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.3879700136, -8.771977516024036),
      'Estádio do Varzim Sport Club',7280,1915,_country.portugal,61.5,[],{}];
    map[n.vilafranquense] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(38.94535, -8.99430208),
      'Campo do Cevadeiro',2500,1957,_country.portugal,57.4,[],{}];
    map[n.viseu] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.659553216, -7.9003969788),
      'Estádio do Fontelo',6912,1914,_country.portugal,67.8,[],{}];
    map[n.vizela] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.38882478, -8.306887911),
      'Estádio do Futebol Clube de Vizela',6000,1939,_country.portugal,66.1,[],{}];
    map[n.vitoriaguimaraes] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(41.446135622, -8.300460355),
      'D. Afonso Henriques',30146,1922,_country.portugal,72.7,[n.braga],{}];
    map[n.setubal] = [ClubColors(Colors.white,Colors.green),pattern.stripes2,Coordinates(38.53138889,-8.891111),
      'Estádio do Bonfim',21530,1910,_country.portugal,69.6,[],{}];
    map[n.uniaomadeira] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(0,0),
      'Centro Desportivo da Madeira',2500,1913,_country.portugal,50.0,[],{"extinto": 2021}]; //EXTINTO 2021

    //HOLANDA
    map[n.ajax] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(52.3141666,4.9419444),
      'Johan Cruijff Arena',54990,1900,_country.netherlands,81.1,[n.psv,n.feyenoord],{}];
    map[n.feyenoord] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(51.89389444,4.52325277),
      'De Kuip',51577,1908,_country.netherlands,77.2,[n.psv,n.ajax],{}];
    map[n.psv] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(51.4418878, 5.46784477),
      'Philips Stadion',35000,1912,_country.netherlands,78.2,[n.ajax,n.feyenoord],{}];
    map[n.az] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.6130966, 4.742401887),
      'AFAS Stadium',17023,1967,_country.netherlands,74.2,[],{}];
    map[n.cambuur] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(53.2055474, 5.8145969),
      'Cambuur Stadion',10000,1964,_country.netherlands,64.6,[],{}];
    map[n.denhaag] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(52.0628811, 4.383067425),
      'Estádio Cars Jeans',15000,1905,_country.netherlands,68.6,[],{}];
    map[n.denbosch] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(51.701659562275715, 5.329922678122375),
      'de Vliert',8500,1965,_country.netherlands,61.2,[],{}];
    map[n.degraafschap] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.dordrecht] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.dos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.elinkwijk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.emmen] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(52.77479885, 6.9456866),
      'Univé Stadion',8700,1925,_country.netherlands,65.5,[],{}];
    map[n.excelsior] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(51.9170728, 4.520500),
      'Stadion Woudestein',3531,1902,_country.netherlands,64.4,[],{}];
    map[n.eindhoven] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.fortuna54] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.fortunasittard] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(50.9919321, 5.8437577),
      'Wagner & Partners Stadion',12500,1968,_country.netherlands,68.0,[],{}];
    map[n.goaheadeagles] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(52.2604448, 6.1726971),
      'De Adelaarshorst',10500,1902,_country.netherlands,67.6,[],{}];
    map[n.groningen] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(53.2062203, 6.59170906),
      'Euroborg',22329,1915,_country.netherlands,70.6,[],{}];
    map[n.heerenveen] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(52.9588595, 5.93625977),
      'Abe Lenstra',12080,1920,_country.netherlands,69.1,[],{}];
    map[n.heracles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.3389281, 6.650802339),
      'Polman Stadion',26100,1903,_country.netherlands,62.7,[],{}];
    map[n.hermes] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.holland] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.limburgia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.mvv] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.85747083, 5.717886173),
      'De Geusselt',10000,1902,_country.netherlands,61.0,[],{}];
    map[n.nacbreda] = [ClubColors(Colors.yellow,Colors.black),pattern.diagonal,Coordinates(51.59486073, 4.750421595),
      'Rat Verlegh',17064,1912,_country.netherlands,64.5,[],{}];
    map[n.necnijmegen] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.822486, 5.837214),
      'Stadion de Goffert',12500,1900,_country.netherlands,63.7,[],{}];
    map[n.roda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(50.8572678, 6.0058343),
      'Parkstad Limburg Stadion',9790,1962,_country.netherlands,65.1,[],{}];
    map[n.rapidjc] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Gemeentelijk Sportpark Kaalheide',25000,1954,_country.netherlands,50.0,[],{"extinto": 1962}];  //EXTINTO vira roda jc
    map[n.spartarotterdam] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(51.9200241, 4.4337761),
      'Sparta Stadion Het Kasteel',11026,1888,_country.netherlands,50.0,[],{}];
    map[n.telstar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.netherlands,50.0,[],{}];
    map[n.twente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.2366666,6.8375),
      'De Grolsch Veste',30205,1965,_country.netherlands,70.7,[],{}];
    map[n.utrecht] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(52.0785286, 5.14622137),
      'Galgenwaard',24426,1970,_country.netherlands,71.3,[],{}];
    map[n.vitesse] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(51.96292454, 5.8930736),
      'GelreDome',21248,1892,_country.netherlands,71.1,[],{}];
    map[n.volendam] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(52.4945818, 5.06643744),
      'Kras Stadion',6260,1920,_country.netherlands,62.4,[],{}];
    map[n.vvv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.3521076, 6.179960356),
      'De Koel',8000,1903,_country.netherlands,60.6,[],{}];
    map[n.waalwijk] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(51.686679, 5.089090),
      'Mandemakers Stadion',7500,1940,_country.netherlands,63.6,[],{}];
    map[n.willem] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(51.5430195, 5.067781659),
      'Willen II Stadion',45500,1896,_country.netherlands,65.3,[],{}];
    map[n.zwolle] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5171852, 6.120810235),
      'IJsseldeltastadion',12500,1910,_country.netherlands,64.4,[],{}];
    map[n.dws] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.netherlands,50.0,[],{}];
    map[n.amsterdam] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(0,0),
      'Amsterdam Olympic Stadium',22288,1972,_country.netherlands,50.0,[],{"extinto": 1982}]; //EXTINTO 1982
    map[n.blauwwit] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Sportpark Sloten',2000,1902,_country.netherlands,50.0,[],{"extinto": 2015}]; //EXTINTO 2015
    map[n.enschede] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Sportpark het Diekman',5000,1910,_country.netherlands,50.0,[],{"extinto": 1965}]; //EXTINTO 1965 -> VIROU TWENTE
    map[n.haarlem] = [ClubColors(Colors.blue,Colors.red),pattern.sleeves,Coordinates(0,0),
      'Haarlem Stadion',3442,1889,_country.netherlands,50.0,[],{"extinto": 2010}]; //EXTINTO 2010

    //BELGICA
    map[n.anderlecht] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(50.8344335, 4.2979681),
      'Constant Vanden Stock',28063,1908,_country.belgium,73.9,[n.brugge],{}];
    map[n.berchem] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.18781330606514, 4.440418528362485),
      'Ludo Coeckstadion',13607,1906,_country.belgium,48.7,[],{}];
    map[n.beringen] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      '',0,1924,_country.belgium,50.0,[],{}]; // Extinto 2002
    map[n.beerschot] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(51.18521358, 4.38191755),
      'Olympisch Stadion',12771,1921,_country.belgium,63.6,[],{}];
    map[n.beveren] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.2143650, 4.2442212),
      'Freethiel Stadion',13290,1936,_country.belgium,61.6,[],{}];
    map[n.brugge] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(51.1933339, 3.180370),
      'Jan Breydel',30000,1891,_country.belgium,76.9,[n.anderlecht],{}];
    map[n.cerclebrugge] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(51.1934139, 3.1807351),
      'Jan Breydel',29062,1899,_country.belgium,68.1,[],{}];
    map[n.charleroi] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(50.4148749, 4.45318367),
      'Stade du Pays de Charleroi',25000,1904,_country.belgium,69.5,[],{}];
    map[n.genk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.0050548, 5.5335494),
      'Cristal Arena',24604,1988,_country.belgium,74.2,[],{}];
    map[n.gent] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.01671567, 3.73471876),
      'Ghelamco Arena',20000,1900,_country.belgium,72.4,[],{}];
    map[n.kaseupen] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.6263931, 6.04539),
      'Kehrwegstadion',8366,1945,_country.belgium,65.8,[],{}];
    map[n.kortrijk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.83036, 3.2491287),
      'Guldensporenstadion',9500,1901,_country.belgium,65.5,[],{}];
    map[n.leuven] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(0,0),
      'Den Dreef',9493,2002,_country.belgium,64.0,[],{}];
    map[n.mechelenkrc] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Oscar Vankesbeeckstadion',6123,1904,_country.belgium,50.0,[],{}];
    map[n.lierse] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(51.1443335, 4.57393474),
      'Herman Vanderpoorten Stadion',15500,1906,_country.belgium,63.7,[],{}];
    map[n.lokeren] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(51.1165361, 3.98735088),
      'Daknamstadion',9271,1923,_country.belgium,62.6,[],{}];
    map[n.mechelen] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes2,Coordinates(51.036870, 4.487291538),
      'AFAS Stadion',10000,1904,_country.belgium,67.3,[],{}];
    map[n.mouscron] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.73375522690348, 3.210951139983231),
      'Estádio Le Canonnier',10571,2010,_country.belgium,64.6,[],{}];
    map[n.oostende] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(51.2169176, 2.886586),
      'Albertparkstadion',10000,1904,_country.belgium,62.4,[],{}];
    map[n.royalAntwerp] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.23260, 4.47252263),
      'Stadium “BOSUIL“',10000,1880,_country.belgium,67.8,[],{}];
    map[n.liegeois] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.6006919, 5.50389739),
      'Stade du Pairay',14236,1892,_country.belgium,63.2,[],{}];
    map[n.seraing] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Stade du Pairay',0,1922,_country.belgium,62.3,[],{}];
    map[n.standardliege] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.609929, 5.544381876),
      'Maurice Dufrasne',30030,1898,_country.belgium,70.6,[],{}];
    map[n.sttruidense] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.8134616, 5.166361),
      'Estádio Stayen',11250,1933,_country.belgium,65.5,[],{}];
    map[n.saintgilloise] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(50.8178096, 4.329303),
      'Stade Joseph Marien',6000,1897,_country.belgium,71.2,[],{}];
    map[n.westerlo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.0947729, 4.928768),
      'Het Kuipje',7982,1933,_country.belgium,67.6,[],{}];
    map[n.zultewaregem] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(50.88311, 3.42904),
      'Regenboogstadion',8500,1950,_country.belgium,63.8,[],{}];
    map[n.molenbeek] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Edmond Machtens Stadium',12266,1909,_country.belgium,65.0,[],{"extinto": 2012}]; //EXTINTO 2012
    map[n.waterschei] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,1919,_country.belgium,50.0,[],{"extinto": 1988}];//EXTINTO 1988
    map[n.waregemKSV] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Regenboogstadion',8500,1925,_country.belgium,50.0,[],{"extinto": 2001}]; //EXTINTO 2001

    //ESCOCIA
    map[n.aberdeen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.15986178, -2.0880853),
      'Pittodrie Stadium',22199,1903,_country.scotland,71.6,[],{}];
    map[n.airdrieonians] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(55.860188511209294, -3.9599360881233254),
      'Excelsior Stadium',10101,1878,_country.scotland,56.0,[],{}];
    map[n.ayr] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Somerset Park',12000,1910,_country.scotland,56.0,[],{}];
    map[n.celtic] = [ClubColors(Colors.green,Colors.white),pattern.horStripes4,Coordinates(55.84971111,-4.20558889),
      'Celtic Park',60355,1888,_country.scotland,74.2,[n.rangers],{}];
    map[n.clyde] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Broadwood Stadium',8000,1877,_country.scotland,58.8,[],{}];
    map[n.dundee] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.4748207, -2.9686031),
      'Tannadice Park',14209,1909,_country.scotland,70.4,[],{}];
    map[n.dundeefc] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(56.4747776, -2.9689532),
      'Dens Park',11506,1899,_country.scotland,65.8,[],{}];
    map[n.dunfermline] = [ClubColors(Colors.white,Colors.black),pattern.stripesThin,Coordinates(56.07565467587391, -3.442114847118456),
      'East End Park',12509,1885,_country.scotland,61.6,[],{}];
    map[n.eastfife] = [ClubColors(Colors.brown,Colors.black),pattern.solid,Coordinates(56.1889736475015, -2.999202897895232),
      'Bayview Stadium',1980,1903,_country.scotland,56.4,[],{}];
    map[n.falkirk] = [ClubColors(Colors.black,Colors.white),pattern.stripesThin,Coordinates(56.005469, -3.7525251),
      'Falkirk Stadium',8000,1876,_country.scotland,63.5,[],{}];
    map[n.hamilton] = [ClubColors(Colors.red,Colors.white),pattern.horStripes3,Coordinates(55.78213347828976, -4.057906044467007),
      'New Douglas Park',5396,1874,_country.scotland,62.3,[],{}];
    map[n.hibernian] = [ClubColors(darkgreen,Colors.white),pattern.sleeves,Coordinates(55.96189876, -3.1650656),
      'Easter Road',20421,1875,_country.scotland,69.5,[],{}];
    map[n.hearts] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(55.9389923, -3.232460),
      'Tynecastle Stadium',20099,1874,_country.scotland,66.6,[],{}];
    map[n.inverness] = [ClubColors(Colors.blue,Colors.red),pattern.oneVertStripe,Coordinates(57.4950677, -4.2173463),
      'Caledonian Stadium',7711,1994,_country.scotland,63.2,[],{}];
    map[n.kilmarnock] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(55.604225,-4.508122),
      'Rugby Park',18128,1869,_country.scotland,66.7,[],{}];
    map[n.livingston] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.88594835, -3.522035),
      'Almondvale Stadium',9521,1943,_country.scotland,65.2,[],{}];
    map[n.morton] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Cappielow Park',11589,1874,_country.scotland,59.5,[],{}];
    map[n.motherwell] = [ClubColors(Colors.yellow,Colors.redAccent),pattern.solid,Coordinates(55.7804536, -3.9800776),
      'Fir Park',13742,1886,_country.scotland,63.6,[],{}];
    map[n.partick] = [ClubColors(Colors.red,Colors.yellow,Colors.black),pattern.stripes3,Coordinates(55.88159606988517, -4.269440742088834),
      'Firhill Stadium',10102,1876,_country.scotland,60.5,[],{}];
    map[n.raithrovers] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stark\'s Park',8867,1883,_country.scotland,58.9,[],{}];
    map[n.rangers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.8530555,-4.309166666),
      'Ibrox Stadium',50817,1872,_country.scotland,75.2,[n.celtic],{}];
    map[n.rosscounty] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(57.59589451, -4.4187127),
      'Victoria Park',6310,1929,_country.scotland,64.5,[],{}];
    map[n.stmirren] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(55.8506123, -4.4442139),
      'St Mirren Park',7937,1877,_country.scotland,63.1,[],{}];
    map[n.stjohnstone] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.409916, -3.4767773),
      'McDiarmid Park',10696,1884,_country.scotland,65.0,[],{}];
    //IRLANDA DO NORTE
    map[n.ards] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(54.65151833254359, -5.68449113666115),
      'Clandeboye Park',2000,1900,_country.northernIreland,56.4,[],{}];
    map[n.ballymenaunited] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Ballymena Showgrounds',8000,1934,_country.northernIreland,57.4,[],{}];
    map[n.bangor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northernIreland,50.0,[],{}];
    map[n.carrickrangers] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Loughview Leisure Arena',6000,1939,_country.northernIreland,58.0,[],{}];
    map[n.cliftonville] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(54.61942914, -5.947241266),
      'Solitude Stadium',6224,1879,_country.northernIreland,62.7,[],{}];
    map[n.coleraine] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.1329222, -6.65989578),
      'The Showgrounds',2496,1927,_country.northernIreland,59.6,[],{}];
    map[n.crusaders] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(54.624341808, -5.92197737),
      'Seaview',3054,1898,_country.northernIreland,63.3,[],{}];
    map[n.distillery] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northernIreland,50.0,[],{}];
    map[n.dungannonswifts] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Stangmore Park',3000,1949,_country.northernIreland,54.9,[],{}];
    map[n.glenavon] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Mourneview Park',5000,1889,_country.northernIreland,59.4,[],{}];
    map[n.glentoran] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(54.6030087, -5.8911762),
      'The Oval',26556,1882,_country.northernIreland,61.5,[],{}];
    map[n.larne] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Inver Park',3000,1889,_country.northernIreland,62.0,[],{}];
    map[n.linfield] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(54.582700, -5.95480680),
      'Windsor Park',21000,1886,_country.northernIreland,64.0,[],{}];
    map[n.newrycity] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'The Showgrounds',6500,2013,_country.northernIreland,55.5,[],{}];
    map[n.portadown] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Shamrock Park',3942,1889,_country.northernIreland,61.0,[],{}];
    // GALES
    map[n.aberystwyth] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'Park Avenue',1500,1884,_country.wales,55.2,[],{}];
    map[n.afanlido] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northernIreland,50.0,[],{}];
    map[n.airbusuk] = [ClubColors(Colors.blue,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Hollingsworth Group Stadium',1600,1946,_country.wales,54.6,[],{}];
    map[n.bangorcity] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(53.2251826, -4.1483997),
      'Nantporth',3000,1876,_country.wales,61.9,[],{}];
    map[n.barrytown] = [ClubColors(Colors.yellow,Colors.blue),pattern.diagonal,Coordinates(51.4113524, -3.26553879),
      'Jenner Park Stadium',2000,1912,_country.wales,58.5,[],{}];
    map[n.balatown] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(52.9124643, -3.601483437),
      'Maes Tegid',3004,1880,_country.wales,61.6,[],{}];
    map[n.caernarfon] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'The Oval',3000,1937,_country.wales,56.4,[],{}];
    map[n.cardiffuni] = [ClubColors(vinho,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Cyncoed Campus Stadium',1620,2000,_country.wales,50.0,[],{}];
    map[n.carmarthen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northernIreland,50.0,[],{}];
    map[n.connahs] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.2254096, -3.07649671),
      'Deeside Stadium',500,1946,_country.wales,62.5,[],{}];
    map[n.cwmbran] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Cwmbran Stadium',10500,1951,_country.wales,55.7,[],{}];
    map[n.flinttown] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Essity Stadium',1000,1886,_country.wales,56.5,[],{}];
    map[n.haverfordwest] = [ClubColors(Colors.blue,Colors.black),pattern.oneHorStripe,Coordinates(0,0),
      'Bridge Meadow Stadium',2100,1899,_country.wales,56.2,[],{}];
    map[n.llanelli] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.6839597, -4.1478377),
      'Stebonheath Park',3700,1884,_country.wales,60.3,[],{}];
    map[n.newsaints] = [ClubColors(Colors.white,Colors.green),pattern.dividedHor,Coordinates(52.8759,-3.02631),
      'Park Hall',2034,1896,_country.wales,65.4,[],{}];
    map[n.newtown] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(52.5115521, -3.3228284),
      'Latham Park',5000,1875,_country.wales,63.0,[],{}];
    map[n.penybont] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0,0),
      'The SDM Glass Stadium',0,1920,_country.wales,58.6,[],{}];
    map[n.pontypridd] = [ClubColors(Colors.red,Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'USW Sports Park',1000,1992,_country.wales,54.1,[],{}];
    map[n.neath] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0, 0),
      'The Gnoll',6000,2005,_country.wales,50.0,[],{"extinto": 2012}]; //EXTINTO 2012
    map[n.rhyl] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0, 0),
      'The Corbett Sports Stadium',3000,1879,_country.wales,50.0,[],{"extinto": 2020}]; //EXTINTO 2020
    //IRLANDA
    map[n.athlonetown] = [ClubColors(darkblue,Colors.black),pattern.stripes4,Coordinates(0,0),
      'St. Mel\'s Park',7500,1887,_country.ireland,59.9,[],{}];
    map[n.bohemian] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.3615383, -6.274242753),
      'Dalymount Park',8030,1890,_country.ireland,66.6,[],{}];
    map[n.braywanderers] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.corkathletic] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.corkcity] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(51.8855177012, -8.468353748),
      'Turner Cross',7000,1984,_country.ireland,62.6,[],{}];
    map[n.corkhibernians] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.derrycity] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.99085262, -7.336110758),
      'Brandywell',7700,1928,_country.ireland,64.0,[],{}];
    map[n.drogheda] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(53.723381096647266, -6.357346374199316),
      'United Park',6400,1919,_country.ireland,60.9,[],{}];
    map[n.dundalk] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(53.999213461, -6.41599349),
      'Oriel Park',13600,1919,_country.ireland,67.1,[],{}];
    map[n.evergreenunited] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.finnharps] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.galwayunited] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.limerick] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.67408504993051, -8.642284494911133),
      'Hogan Park',10000,1937,_country.ireland,56.9,[],{}];
    map[n.longfordtown] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.shamrockrovers] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(53.28363777, -6.373458012),
      'Estádio de Tallaght',6000,1899,_country.ireland,67.4,[],{}];
    map[n.shelbourne] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(53.3674709, -6.2518031),
      'Tolka Park',9681,1895,_country.ireland,58.7,[],{}];
    map[n.sligorovers] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(54.27006, -8.487299),
      'Showgrounds',5500,1926,_country.ireland,60.4,[],{}];
    map[n.stpatricks] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(53.341094, -6.3167397),
      'Richmond Park',5340,1929,_country.ireland,60.8,[],{}];
    map[n.transport] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ireland,50.0,[],{}];
    map[n.ucd] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(0,0),
      'UCD Bowl',3000,1895,_country.ireland,56.4,[],{}];
    map[n.waterford] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.2459668, -7.12492168),
      'Waterford Regional Sports Central',8000,1930,_country.ireland,58.9,[],{}];
    map[n.corkceltic] = [ClubColors(darkgreen,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Turner Cross',15000,1935,_country.ireland,62.6,[],{"extinto": 1972}];//EXTINTO 1979
    map[n.drumcondra] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(0,0),
      '',0,1924,_country.ireland,52.9,[],{"extinto": 1972}];//EXTINTO 1972

    //NORDICOS
    //NORUEGA
    map[n.aalesund] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(62.46965856, 6.1872397),
      'Color Line Stadion',10778,1914,_country.norway,66.8,[],{}];
    map[n.brann] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(60.3670435, 5.3577909),
      'Brann Stadion',18500,1908,_country.norway,62.9,[],{}];
    map[n.bryne] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.norway,50.0,[],{}];
    map[n.fredrikstad] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(59.2116267, 10.9374700),
      'Nye Fredrikstad Stadion',13300,1903,_country.norway,65.4,[],{}];
    map[n.glimt] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(67.27666691, 14.38474245),
      'Aspmyra Stadion',7354,1916,_country.norway,67.9,[],{}];
    map[n.haugesund] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(59.413128478967714, 5.279157306889031),
      'Haugesund Stadion',8754,1993,_country.norway,63.8,[],{}];
    map[n.hamkam] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Briskeby Stadion',7600,1918,_country.norway,63.0,[],{}];
    map[n.kongsvinger] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(60.19506471821105, 11.987160008357305),
      'Gjemselund Stadion',6700,1892,_country.norway,54.7,[],{}];
    map[n.kristiansund] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(63.124852083959716, 7.718145699044887),
      'Kristiansund Stadion',4444,2003,_country.norway,64.5,[],{}];
    map[n.larvik] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Lovisenlund',0,1865,_country.norway,54.6,[],{}];
    map[n.lillestrom] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(59.962752,11.063458),
      'Åråsen Stadion',12000,1917,_country.norway,67.1,[],{}];
    map[n.lyn] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.9491344, 10.734334),
      'Ullevaal Stadion',25572,1896,_country.norway,67.4,[],{}];
    map[n.molde] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.73348179, 7.1483130),
      'Aker Stadion',11167,1911,_country.norway,69.6,[n.rosenborg],{}];
    map[n.moss] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.norway,50.0,[],{}];
    map[n.odd] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(59.2114814, 9.5900116),
      'Skagerak Arena',13500,1894,_country.norway,64.4,[],{}];
    map[n.rosenborg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(63.41251977, 10.405168),
      'Lerkendal Stadion',21405,1917,_country.norway,69.1,[n.molde],{}];
    map[n.sanderfjord] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Release Arena',6582,1998,_country.norway,61.3,[],{}];
    map[n.sarpsborg] = [ClubColors(Colors.blue,Colors.white),pattern.oneVertStripe,Coordinates(59.2863530, 11.0975386),
      'Sarpsborg Stadion',4700,2008,_country.norway,58.6,[],{}];
    map[n.skeid] = [ClubColors(Colors.red,Colors.blue,Colors.black),pattern.solid,Coordinates(59.925121, 10.73346175),
      'Bislett Stadion',1100,1915,_country.norway,61.6,[],{}];
    map[n.stabaek] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(59.90305236, 10.62399937),
      'Telenor Arena',15000,1912,_country.norway,66.3,[],{}];
    map[n.start] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(58.15372466, 8.02913169),
      'Sør Arena',14300,1905,_country.norway,58.3,[],{}];
    map[n.stromsgodset] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(59.734386744, 10.20155324),
      'Marienlyst Stadion',8500,1907,_country.norway,65.8,[],{}];
    map[n.tromso] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(69.6488819, 18.9343386),
      'Alfheim Stadium',7500,1920,_country.norway,65.0,[],{}];
    map[n.valerenga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(59.9492525, 10.7344950),
      'Ullevaal Stadion',25000,1913,_country.norway,65.3,[],{}];
    map[n.viking] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(58.9146757, 5.73094724),
      'Viking Stadion',16000,1899,_country.norway,66.1,[],{}];
    //SUECIA
    map[n.aik] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(57.705889, 11.98060),
      'Estádio Gamla Ullevi',18416,1904,_country.sweden,70.6,[],{}];
    map[n.brage] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Domnarvsvallen',6500,1925,_country.sweden,59.9,[],{}];
    map[n.brommapojkarna] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Grimsta IP',6820,1942,_country.sweden,64.5,[],{}];
    map[n.degerfors] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(59.23828899202374, 14.4431304825454),
      'Stora Valla',7500,1907,_country.sweden,63.9,[],{}];
    map[n.djurgardens] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(59.291191, 18.084667),
      'Stockholmsarenan',33000,1899,_country.sweden,67.6,[],{}];
    map[n.elfsborg] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(57.734357, 12.9347772),
      'Arena de Borås',17000,1904,_country.sweden,68.4,[],{}];
    map[n.gais] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(57.70654837936176, 11.980444134711313),
      'Estádio Gamla Ullevi',18800,1894,_country.sweden,63.3,[],{}];
    map[n.gefle] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.sweden,50.0,[],{}];
    map[n.hacken] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(57.71921, 11.93074),
      'Bravida Arena',8480,1940,_country.sweden,65.1,[],{}];
    map[n.halmstads] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(56.684534, 12.86680328),
      'Örjans vall',15500,1914,_country.sweden,66.8,[],{}];
    map[n.hammarby] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(59.290854, 18.085401),
      'Tele2 Arena',33000,1915,_country.sweden,70.6,[],{}];
    map[n.helsingborg] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(59.345391, 18.0790722),
      'Stockholm Olympic Stadium',17100,1907,_country.sweden,66.2,[],{}];
    map[n.kalmar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.6693123, 16.3598183),
      'Stade Fredriksskans',10000,1910,_country.sweden,66.6,[],{}];
    map[n.ifkgoteborg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(57.706313, 11.980112),
      'Gamla Ullevi',18416,1904,_country.sweden,70.4,[],{}];
    map[n.landskrona] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.sweden,50.0,[],{}];
    map[n.malmo] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.583611,12.987777),
      'Eleda Stadion',24000,1910,_country.sweden,71.6,[],{}];
    map[n.mjallby] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(56.0120291, 14.71628237),
      'Strandvallen',6750,1939,_country.sweden,64.6,[],{}];
    map[n.norrkoping] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(58.584254, 16.1730),
      'Nya Parken',17234,1897,_country.sweden,65.1,[],{}];
    map[n.orebro] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(59.26634706950292, 15.222921007937911),
      'Behrn Arena',14500,1937,_country.sweden,61.9,[],{}];
    map[n.orgryte] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(57.70642510045292, 11.97983805978297),
      'Gamla Ullevi',0,1887,_country.sweden,63.5,[],{}];
    map[n.osters] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(56.8800057, 14.7770021),
      'Myresjöhus Arena',12000,1930,_country.sweden,65.1,[],{}];
    map[n.ostersunds] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.sweden,50.0,[],{}];
    map[n.sirius] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(59.849614, 17.6454),
      'Studenternas IP',7600,1907,_country.sweden,64.2,[],{}];
    map[n.sundsvall] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.sweden,50.0,[],{}];
    map[n.trelleborgs] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.sweden,50.0,[],{}];
    map[n.varbergs] = [ClubColors(darkgreen,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Påskbergsvallen',4500,1925,_country.sweden,65.6,[],{}];
    map[n.varnamo] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Finnvedsvallen',5000,1912,_country.sweden,64.1,[],{}];
    map[n.atvidabergs] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(58.1947123, 15.99574039),
      'Kopparvallen',8600,1907,_country.sweden,60.6,[],{}];
    //DINAMARCA
    map[n.aalborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(57.052210, 9.899045278),
      'Estádio Aalborg',13800,1885,_country.denmark,69.3,[],{}];
    map[n.aarhus] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(56.1319897, 10.19663695),
      'NRGi Park',20032,1880,_country.denmark,64.6,[],{}];
    map[n.ab] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(55.73300, 12.49662372),
      'Gladsaxe Stadion',13507,1889,_country.denmark,63.1,[],{}];
    map[n.b93] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.denmark,50.0,[],{}];
    map[n.b1901] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.denmark,50.0,[],{}];
    map[n.b1913] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Campus Road',0,1913,_country.denmark,60.1,[],{}];
    map[n.brondby] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(55.648923276, 12.41797939),
      'Brøndby Stadion',29000,1964,_country.denmark,69.1,[],{}];
    map[n.copenhague] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.70280149, 12.57258422),
      'Parken Stadium',42358,1992,_country.denmark,72.7,[],{}];
    map[n.esbjerg] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(55.48228994, 8.43983205),
      'Blue Water Arena',18000,1924,_country.denmark,67.8,[],{}];
    map[n.frem] = [ClubColors(Colors.red,Colors.blue),pattern.horStripes4,Coordinates(55.64714395423391, 12.512072186678807),
      'Valby Idrætspark',12000,1886,_country.denmark,64.4,[],{}];
    map[n.herfolge] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(55.4136397, 12.1339835),
      'Estadio Herfolge',8000,1921,_country.denmark,66.7,[],{}];
    map[n.horsens] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(55.871661, 9.8576635128),
      'CASA Arena Horsens',10400,1994,_country.denmark,66.7,[],{}];
    map[n.kb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Frederiksberg I P Opvisning',16000,1876,_country.denmark,61.7,[],{}];
    map[n.ikast] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.denmark,50.0,[],{}];
    map[n.lyngby] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(55.780791023, 12.5061700),
      'Lyngby Stadion',12000,1921,_country.denmark,67.8,[],{}];
    map[n.midtjylland] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(56.117084943, 8.952439451),
      'MCH Arena',11800,1999,_country.denmark,72.2,[],{}];
    map[n.naestved] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(55.22292013609369, 11.766194634181094),
      'TintShop Park',10000,1939,_country.denmark,62.7,[],{}];
    map[n.nordsjaelland] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(55.81610534, 12.35249887),
      'Farum Park',10000,1991,_country.denmark,69.5,[],{}];
    map[n.obodense] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.39794088, 10.35053547),
      'TRE-FOR Park',15761,1887,_country.denmark,68.4,[],{}];
    map[n.randers] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(56.46572077, 10.00950067),
      'AutoC Park Randers',10300,2003,_country.denmark,70.6,[],{}];
    map[n.silkeborg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.157916, 9.5540119),
      'MASCOT Park',10000,1917,_country.denmark,65.1,[],{}];
    map[n.sonderjyske] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(55.26142977, 9.48772190),
      'Sydbank Park',10000,2004,_country.denmark,64.9,[],{}];
    map[n.vejle] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.71376447, 9.55639463),
      'Vejle Stadion',10491,1891,_country.denmark,65.4,[],{}];
    map[n.viborg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(56.455972956, 9.4020026),
      'Viborg Stadium',9566,1896,_country.denmark,64.0,[],{}];
    map[n.b1903] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[],{}];
    map[n.b1909] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[],{}];
    map[n.hvidovre] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[],{}];
    map[n.kb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[],{}];
    map[n.koge] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.denmark,50.0,[],{}];
    //FINLANDIA
    map[n.haka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(61.2680806, 24.02085023),
      'Tehtaan kenttä',6400,1934,_country.finland,64.6,[],{}];
    map[n.helsinki] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(60.1876315, 24.9233446),
      'Bolt Arena',10770,1907,_country.finland,66.1,[],{}];
    map[n.helsingfors] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(60.18775434615345, 24.923172874251847),
      'Bolt Arena',10770,1897,_country.finland,62.4,[],{}];
    map[n.hifk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.finland,50.0,[],{}];
    map[n.honka] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(60.17784289843155, 24.781422768053968),
      'Tapiolan Urheilupuisto',6000,1957,_country.finland,58.2,[],{}];
    map[n.ilves] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(61.5003270, 23.7854713),
      'Tammela Stadion',5040,1931,_country.finland,63.1,[],{}];
    map[n.jazz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(61.4768415826514, 21.77448728624817),
      'Porin stadion',12000,1992,_country.finland,61.4,[],{}];
    map[n.koparit] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.finland,50.0,[],{}];
    map[n.kups] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(62.884580, 27.6718364),
      'Väre Areena',4700,1923,_country.finland,64.1,[],{}];
    map[n.lahti] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(60.98651281, 25.65060111),
      'Lahden Stadion',14465,1996,_country.finland,63.8,[],{}];
    map[n.ktp] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Arto Tolsa Areena',4780,1927,_country.finland,57.5,[],{}];
    map[n.kpv] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Kokkolan Keskuskenttä',3000,1930,_country.finland,53.6,[],{}];
    map[n.kuusysi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(60.98656926147769, 25.650255041194878),
      'Kisapuisto',4400,1934,_country.finland,57.0,[],{}];
    map[n.mariehamn] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Wiklöf Holding Arena',4000,1912,_country.finland,60.4,[],{}];
    map[n.mp] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.finland,50.0,[],{}];
    map[n.mypa] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(60.772763893344475, 26.79022105071055),
      'Kymenlaakson Sähkö Stadion',4167,1947,_country.finland,55.6,[],{}];
    map[n.ops] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Raati Stadion',5000,1925,_country.finland,54.6,[],{}];
    map[n.oulu] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Raatti Stadium',5000,2002,_country.finland,64.3,[],{}];
    map[n.rops] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(66.49992138067363, 25.721593675059044),
      'Rovaniemis',4000,1950,_country.finland,61.6,[],{}];
    map[n.sjk] = [ClubColors(Colors.black,gold),pattern.solid,Coordinates(0,0),
      'OmaSP Stadion',5817,2007,_country.finland,61.6,[],{}];
    map[n.tampere] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Tammelan Stadion',5500,1998,_country.finland,58.6,[],{}];
    map[n.tps] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Paavo Nurmi Stadium',13000,1922,_country.finland,56.6,[],{}];
    map[n.turku] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(60.44283325, 22.292024),
      'Veritas Stadion',9372,1990,_country.finland,62.8,[],{}];
    map[n.vps] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(63.08514428518943, 21.628294129115584),
      'Hietalahti',6005,1924,_country.finland,59.6,[],{}];
    map[n.jokerit] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Sonera Stadium',10770,1999,_country.finland,50.0,[],{"extinto": 2004}]; //EXTINTO 2004
    //ISLANDIA
    map[n.akraness] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(64.3181903, -22.05713664),
      'Akranesvöllur',6000,1946,_country.iceland,63.8,[],{}];
    map[n.breidablik] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(64.10421594, -21.8969209),
      'Kópavogsvöllur',5501,1950,_country.iceland,62.6,[],{}];
    map[n.fh] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(64.07608583, -21.935295742),
      'Kaplakriki',6450,1928,_country.iceland,61.7,[],{}];
    map[n.framIslandia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(64.14358486, -21.87923343),
      'Laugardalsvöllur',9800,1908,_country.iceland,56.3,[],{}];
    map[n.fylkir] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Würth völlurinn',5000,1967,_country.iceland,58.6,[],{}];
    map[n.hk] = [ClubColors(Colors.red,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Kórinn',5500,1970,_country.iceland,56.5,[],{}];
    map[n.ibv] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(63.4394649, -20.2880367),
      'Hásteinsvöllur',2300,1903,_country.iceland,58.7,[],{}];
    map[n.ka] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Greifavöllurinn',2000,1928,_country.iceland,59.7,[],{}];
    map[n.keflavik] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(63.9979812, -22.559169),
      'Keflavíkurvöllur',4957,1929,_country.iceland,54.3,[],{}];
    map[n.kr] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(64.14640062, -21.96675625),
      'KR-völlur',6000,1899,_country.iceland,64.8,[],{}];
    map[n.stjarnan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Samsung völlurinn',1298,1960,_country.iceland,61.7,[],{}];
    map[n.valur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(64.13294129158774, -21.9229681),
      'Vodafonevöllurinn',3000,1911,_country.iceland,64.2,[],{}];
    map[n.vikingurreykjavik] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(64.11637343, -21.85500321),
      'Víkingsvöllur',1450,1908,_country.iceland,62.3,[],{}];
    //ILHAS FAROE
    map[n.abFaroe] = [ClubColors(grena,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Skansi Arena',2000,1973,_country.faroe,57.4,[],{}];
    map[n.b36] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.019293, -6.7805902),
      'Gundadalur',5000,1936,_country.faroe,60.7,[],{}];
    map[n.b68] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Svangaskard',6000,1962,_country.faroe,60.5,[],{}];
    map[n.ebstreymur] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Við Margáir',2000,1993,_country.faroe,56.2,[],{}];
    map[n.b71sandoy] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.havnarboltfelag] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(62.0192123, -6.7779013),
      'Gundadalur',5000,1904,_country.faroe,62.5,[],{}];
    map[n.gigota] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.iffuglafjordur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Í Fløtugerði',3000,1946,_country.faroe,55.8,[],{}];
    map[n.kiklaksvik] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(62.224696, -6.580514426),
      'Djúpumýra Klaksvík',1500,1904,_country.faroe,61.8,[],{}];
    map[n.nsirunavik] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.skala] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.tb] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Við Stórá',4000,1892,_country.faroe,57.6,[],{}];
    map[n.tbtvoroyri] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.vestur] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'á Dungasandi',2000,2007,_country.faroe,58.5,[],{}];
    map[n.vbvagur] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.faroe,50.0,[],{}];
    map[n.vikingurgota] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(62.199574, -6.7458078),
      'Serpugerdi Stadium',16000,2008,_country.faroe,62.6,[],{}];

    //AUSTRIA
    map[n.admira] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(48.097542, 16.3113277),
      'Bundesstadion Südstadt',10000,1905,_country.austria,67.5,[],{}];
    map[n.altach] = [ClubColors(Colors.yellow,Colors.black),pattern.diagonal,Coordinates(47.3541995, 9.63664412),
      'Cashpoint Arena',8900,1929,_country.austria,65.6,[],{}];
    map[n.austria] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(46.609157, 14.278102),
      'Franz Horr',17656,1911,_country.austria,69.4,[],{}];
    map[n.austrialustenau] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Reichshofstadion',8800,1914,_country.austria,50.0,[],{}];
    map[n.austriasalzburg] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.austria,50.0,[],{}];
    map[n.austriaklagenfurt] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(47.2811738, 15.9776617),
      'Wörthersee Stadion',32000,2007,_country.austria,64.3,[],{}];
    map[n.vorarlberg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Casino Stadium',12000,1919,_country.austria,54.1,[],{}];
    map[n.firstvienna] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Hohe-Warte-Stadion',5000,1894,_country.austria,58.0,[],{}];
    map[n.grazer] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.0463164, 15.45477457),
      'UPC-Arena',15450,1902,_country.austria,62.6,[],{}];
    map[n.grodig] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(0,0),
      'Untersberg-Arena',4128,1948,_country.austria,54.2,[],{}];
    map[n.hartberg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.2811738, 15.9776617),
      'Arena Hartberg',4500,1946,_country.austria,63.2,[],{}];
    map[n.lasklinz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(48.2938258, 14.2766143),
      'Linzer Stadion',30138,1908,_country.austria,69.6,[],{}];
    map[n.pasching] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(46.77307336, 15.6994585),
      'Waldstadion',7152,1946,_country.austria,69.6,[],{}];
    map[n.rapidwien] = [ClubColors(Colors.green,Colors.white),pattern.dividedHor,Coordinates(48.19810877, 16.2660961),
      'Allianz Stadion',28000,1899,_country.austria,70.5,[],{}];
    map[n.rbsalzburg] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.8163615, 12.9986015),
      'Red Bull Arena',31895,2005,_country.austria,74.4,[],{}];
    map[n.ried] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(48.207823, 13.478552),
      'Keine Sorgen Arena',7680,1912,_country.austria,66.4,[],{}];
    map[n.sturmgraz] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.0466456, 15.4552685),
      'Merkur Arena',16400,1909,_country.austria,67.2,[],{}];
    map[n.tirolinnsbruck] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.255992, 11.4113934),
      'Tivoli Stadium',16008,1930,_country.austria,65.8,[],{}];
    map[n.voestlinz] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.austria,50.0,[],{}];
    map[n.wolfsberger] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(46.8263069, 14.852003),
      'Lavanttal-Arena',7300,1930,_country.austria,66.9,[],{}];
    map[n.innsbruck] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,50.0,[],{}];
    map[n.stpolten] = [ClubColors(Colors.greenAccent,darkblue),pattern.sleeves,Coordinates(48.220719, 15.6535139),
      'NV Arena',8000,2000,_country.austria,63.6,[],{}];
    map[n.wsgtirol] = [ClubColors(Colors.white,Colors.green),pattern.horStripes3,Coordinates(0,0),
      'Tivoli-Neu',16008,1930,_country.austria,50.0,[],{}];
    map[n.wackerinnsbruck] = [ClubColors(Colors.green,Colors.black),pattern.stripes3,Coordinates(47.2560956, 11.41106589),
      'Tivoli-Neu',16008,2002,_country.austria,62.1,[],{}];
    map[n.wiener] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.austria,50.0,[],{}];
    map[n.mattersburg] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Pappelstadion',17100,1922,_country.austria,65.1,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.stahlLinz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'ASKÖ Neue Heimat',0,1947,_country.austria,50.0,[],{"extinto": 1997}]; //extinto 1997
    //SUIÇA
    map[n.aarau] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(47.3834198, 8.05997331),
      'Brügglifeld',8000,1902,_country.switzerland,66.4,[],{}];
    map[n.basel] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(47.54169074, 7.62067642),
      'St. Jakob-Park',42500,1893,_country.switzerland,72.2,[],{}];
    map[n.bellinzona] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(46.19800256, 9.022140574),
      'Stadio Comunale Bellinzona',5000,1904,_country.switzerland,56.5,[],{}];
    map[n.bielBienne] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1896,_country.switzerland,52.1,[],{}];
    map[n.chiasso] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(45.8341383, 9.01664266),
      'Stadio Comunale',11160,1905,_country.switzerland,58.5,[],{}];
    map[n.grasshoppers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38286, 8.5036),
      'Letzigrund',26500,1886,_country.switzerland,70.4,[],{}];
    map[n.grenchen] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stadium Brühl',15100,1906,_country.switzerland,53.4,[],{}];
    map[n.lausanne] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(46.5329620, 6.62447646),
      'Stade Olympique',15850,1896,_country.switzerland,65.3,[],{}];
    map[n.lugano] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(46.023828, 8.96135788),
      'Stadio de Cornaredo',10500,1908,_country.switzerland,68.2,[],{}];
    map[n.luzern] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.03307, 8.3051154),
      'Swissporarena',13000,1901,_country.switzerland,66.5,[],{}];
    map[n.sion] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(46.23353628, 7.37640473),
      'Estádio Tourbillon',14500,1909,_country.switzerland,67.3,[],{}];
    map[n.servette] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(46.177778,6.1275),
      'Stade de Genève',30084,1890,_country.switzerland,66.1,[],{}];
    map[n.stgallen] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.408398945, 9.3057807),
      'Kybunpark',19694,1879,_country.switzerland,68.3,[],{}];
    map[n.thun] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.7439056, 7.60663322),
      'Stockhorn Arena',10300,1898,_country.switzerland,65.3,[],{}];
    map[n.youngboys] = [ClubColors(Colors.yellow,Colors.black),pattern.divided,Coordinates(46.9633758, 7.4653358),
      'Estádio da Suíça',32000,1898,_country.switzerland,73.3,[],{}];
    map[n.winterthur] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.5008475, 8.717600),
      'Schützenwiese',8550,1896,_country.switzerland,65.0,[],{}];
    map[n.zurich] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.38279,8.503801),
      'Letzigrund',26500,1896,_country.switzerland,69.8,[],{}];
    map[n.chauxdefonds] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      'Centre Sportif de la Charrière',12700,1894,_country.switzerland,64.2,[],{}];
    map[n.neuchatel] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(46.9950997, 6.944111255),
      'Stade de la Maladière',12000,1912,_country.switzerland,50.0,[],{}];
    //POLONIA
    map[n.amicawronki] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.poland,50.0,[],{}];
    map[n.cracovia] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(50.05799319, 19.9205966),
      'Estádio Józef Piłsudski',15016,1906,_country.poland,66.1,[],{}];
    map[n.gornikzabrze] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.296646268, 18.7696376),
      'Estádio Ernest Pohl',24563,1948,_country.poland,68.8,[],{}];
    map[n.gornikradlin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.poland,50.0,[],{}];
    map[n.gwardiawarsaw] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(52.19919178, 20.99196),
      'Stadion WKS Gwardia',9000,1948,_country.poland,61.6,[],{}];
    map[n.jagiellonia] = [ClubColors(Colors.red,Colors.yellow),pattern.horStripes3,Coordinates(53.106088, 23.149288),
      'Estádio Municipal Białystok',22386,1920,_country.poland,67.5,[],{}];
    map[n.gkskatowice] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(50.2797120, 19.001128977),
      'Estádio GKS Katowice',9511,1964,_country.poland,61.4,[],{}];
    map[n.koronakielce] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(50.8616560, 20.625024),
      'Municipal de Kielce',15550,1973,_country.poland,67.2,[],{}];
    map[n.legiawarszawa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.220579264, 21.0408855),
      'Pepsi Arena',31000,1916,_country.poland,70.4,[],{}];
    map[n.lechiagdansk] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(54.3900689, 18.6404273),
      'PGE Arena Gdańsk',43165,1945,_country.poland,66.4,[],{}];
    map[n.lechpoznan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.39775183, 16.8587159),
      'Estádio Municipal de Poznań',41609,1922,_country.poland,69.8,[],{}];
    map[n.lkslodz] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(51.7589447, 19.42655367),
      'Estádio Municipal em Łódź',18029,1908,_country.poland,62.3,[],{}];
    map[n.miedzlegnica] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Stadion im. Orła Białego',6244,1971,_country.poland,58.5,[],{}];
    map[n.odraopole] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.poland,50.0,[],{}];
    map[n.piastgliwice] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(50.3066789, 18.695438),
      'Stadion Miejski im. Piotra Wieczorka',9913,1945,_country.poland,64.5,[],{}];
    map[n.poloniawarsaw] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(52.255523, 21.0011222),
      'Polonii Warszawa',6860,1911,_country.poland,64.2,[],{}];
    map[n.pogonszczecin] = [ClubColors(grena,Colors.blue),pattern.solid,Coordinates(53.43655020, 14.51868017),
      'Estádio Florian Krygier',8990,1948,_country.poland,65.1,[],{}];
    map[n.rakowczestochowa] = [ClubColors(Colors.red,Colors.blue),pattern.stripes3,Coordinates(50.7767924, 19.159192),
      'Miejski Stadion Piłkarski',5500,1921,_country.poland,64.6,[],{}];
    map[n.radomiakradom] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(51.396545, 21.1462516),
      'Stadion im. Braci Czachorów',8840,1910,_country.poland,63.5,[],{}];
    map[n.ruchchorzow] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.28228733, 18.94527638),
      'Stadion Ruchu Chorzów',9300,1920,_country.poland,66.8,[],{}];
    map[n.slaskwroclaw] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(51.14125077, 16.94370316),
      'Municipal de Wroclaw',44416,1947,_country.poland,65.2,[],{}];
    map[n.stalmielec] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(50.2987453, 21.4359145),
      'Estádio MOSiR',6864,1939,_country.poland,71.6,[],{}];
    map[n.wislaplock] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(52.5620205, 19.68411),
      'Estádio Kazimierz Górski',12800,1947,_country.poland,67.8,[],{}];
    map[n.wislakrakow] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.0638402, 19.91199072),
      'Estádio Henryk Reyman',33326,1906,_country.poland,67.3,[],{}];
    map[n.wartapoznan] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(52.3935359, 16.9312640),
      'Stadion przy Drodze Dębińskiej',2500,1912,_country.poland,62.5,[],{}];
    map[n.widzewlodz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(51.764935, 19.51160286),
      'MOSiR Widzew Łódź',18008,1922,_country.poland,63.7,[],{}];
    map[n.zaglebielubin] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(51.4140686, 16.1983108),
      'Lubin City Stadium',16100,1945,_country.poland,65.4,[],{}];
    map[n.poloniabytom] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.poland,50.0,[],{}];
    map[n.szombierkibytom] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(50.3306972, 18.89811724),
      'Stadion Szombierek',20000,1919,_country.poland,52.6,[],{}];
    map[n.zaglebiesosnowiec] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.poland,50.0,[],{}];

    //TURQUIA
    map[n.adanaspor] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(37.06372554, 35.37545482),
      'Novo Estádio de Adana',33543,1954,_country.turkey,67.6,[],{}];
    map[n.adanademirspor] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Novo Estádio de Adana',33543,1940,_country.turkey,65.2,[],{}];
    map[n.akhisarbelediyespor] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Municipal de Akhisar',12139,1970,_country.turkey,65.5,[],{}];
    map[n.alanyaspor] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(36.5626171, 32.0791125),
      'Estádio do Colégio Bahçeşehir',10842,1948,_country.turkey,71.5,[],{}];
    map[n.altay] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(38.43717939, 27.150778738),
      'Mustafa Denizli de Alsancak',14000,1914,_country.turkey,66.8,[],{}];
    map[n.ankarademirspor] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(39.94182728, 32.77232843),
      'TCDD Ankara Demirspor Stadium',3000,1930,_country.turkey,65.6,[],{}];
    map[n.ankaragucu] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(39.98048096, 32.614368196),
      'Estádio de Eryaman',33543,1910,_country.turkey,66.7,[],{}];
    map[n.ankaraspor] = [ClubColors(Colors.blue,Colors.white,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Yenikent Stadium',18029,1978,_country.turkey,58.5,[],{}];
    map[n.antalyaspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.8884456, 30.66902964),
      'Estádio de Antália',32539,1966,_country.turkey,72.6,[],{}];
    map[n.besiktas] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(41.0394909, 28.99474848),
      'Vodafone Park',41903,1903,_country.turkey,77.2,[n.fenerbahce,n.galatasaray],{}];
    map[n.boluspor] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(40.7362020, 31.60693457),
      'Bolu Atatürk Stadyumu',8456,1965,_country.turkey,56.2,[],{}];
    map[n.bucaspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    map[n.bursaspor] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(40.210638, 29.009436),
      'Municipal Metropolitano de Bursa',42331,1963,_country.turkey,73.1,[],{}];
    map[n.denizlispor] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(37.76621147, 29.08265607),
      'Denizli Atatürk Stadyumu',18745,1966,_country.turkey,68.4,[],{}];
    map[n.elazigspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
    '',0,0,_country.turkey,50.0,[],{}];
    map[n.eskisehirspor] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(39.7626458, 30.467788155),
      'Estádio Atatürk de Esquiceir',34930,1965,_country.turkey,65.3,[],{}];
    map[n.fenerbahce] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(40.9877951, 29.036899),
      'Şükrü Saraçoğlu',50509,1907,_country.turkey,76.5,[n.galatasaray,n.besiktas],{}];
    map[n.galatasaray] = [ClubColors(Colors.orange,Colors.red),pattern.divided,Coordinates(41.103388888,28.991),
      'NEF Stadyumu',52280,1905,_country.turkey,77.4,[n.fenerbahce,n.besiktas],{}];
    map[n.gaziantep] = [ClubColors(Colors.red,Colors.black),pattern.stripes4,Coordinates(0,0),
      'Gaziantep Stadium',35574,1988,_country.turkey,64.5,[],{}];
    map[n.genclerbirligi] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(39.9799511, 32.61372983),
      'Estádio de Eryaman',20560,1923,_country.turkey,70.4,[],{}];
    map[n.giresunspor] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio das Aveleiras de Giresun',22028,1967,_country.turkey,50.0,[],{}];
    map[n.karagumruk] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(41.07463764, 28.765735),
      'Estádio Olímpico Atatürk',75145,1926,_country.turkey,67.1,[],{}];
    map[n.kasimpasa] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(41.0327862, 28.9723363),
      'Estádio Recep Tayyip Erdoğan',14234,1921,_country.turkey,68.6,[],{}];
    map[n.kayserispor] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(38.7373165, 35.42329044),
      'Estádio Kadir Has',32864,1966,_country.turkey,66.5,[],{}];
    map[n.goztepe] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(38.3955952, 27.0760464),
      'Estádio Gürsel Aksel',20035,1925,_country.turkey,69.5,[],{}];
    map[n.hacettepe] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
    '',0,0,_country.turkey,50.0,[],{}];
    map[n.hatayspor] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(36.258447, 36.2078878),
      'New Hatay Stadium',26600,1967,_country.turkey,65.6,[],{}];
    map[n.istanbulbasaksehir] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.12323595, 28.808461462),
      'Fatih Terim de Başakşehir',17319,1990,_country.turkey,73.5,[],{}];
    map[n.istanbulspor] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(41.02455327, 28.6977618),
      'Necmi Kadıoğlu Stadyumu',4488,1926,_country.turkey,67.1,[],{}];
    map[n.kardemirkarabukspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    map[n.kayserierciyesspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    map[n.kocaelispor] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(40.774943, 30.017681438),
      'Estádio de Cocaeli',34712,1966,_country.turkey,63.4,[],{}];
    map[n.konyaspor] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(37.9463311, 32.48842835),
      'Estádio Municipal Metropolitano de Cônia',41981,1922,_country.turkey,70.8,[],{}];
    map[n.gaziantepspor] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(37.1230653, 37.3837841),
      'Estádio de Gaziantepe',35574,1988,_country.turkey,70.4,[],{}];
    map[n.malatyaspor] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(38.337827, 38.4464651),
      'Novo Estádio de Malatya',27044,1986,_country.turkey,69.4,[],{}];
    map[n.manisaspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
    '',0,0,_country.turkey,50.0,[],{}];
    map[n.mersinidmanyurdu] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    map[n.orduspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    map[n.rizespor] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(41.0420904, 40.5733391),
      'Novo Estádio Municipal de Rize',15568,1953,_country.turkey];
    map[n.samsunspor] = [ClubColors(Colors.red,Colors.white,Colors.black),pattern.stripes3,Coordinates(41.228053, 36.4579017),
      'Estádio 19 de Maio de Samsun',33919,1965,_country.turkey,70.6,[],{}];
    map[n.sariyer] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Yusuf Ziya Öniş Stadium',4100,1940,_country.turkey,53.5,[],{}];
    map[n.sivasspor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.7286940, 36.9840344),
      'Yeni Sivas 4 Eylül Stadı',27532,1967,_country.turkey,72.8,[],{}];
    map[n.trabzonspor] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(39.6463,40.9987),
      'Şenol Güneş Stadium',41461,1967,_country.turkey,75.9,[],{}];
    map[n.umraniyespor] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Estádio Municipal de Ümraniye',3513,1938,_country.turkey,64.1,[],{}];
    map[n.zonguldakspor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkey,50.0,[],{}];
    //GRECIA
    map[n.apollonAthens] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(38.02826459, 23.7410119365),
      'Estádio Georgios Kamaras',14200,1908,_country.greece,60.2,[],{}];
    map[n.larissa] = [ClubColors(Colors.brown,Colors.white),pattern.solid,Coordinates(39.64869675, 22.4121200),
      'Estádio Alkazar',13108,1964,_country.greece,65.8,[],{}];
    map[n.aek] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(38.036111111,23.7875),
      'Olímpico de Atenas',71030,1924,_country.greece,74.3,[],{}];
    map[n.aris] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(40.600069,22.9695),
      'Kleanthis Vikelidis',22800,1914,_country.greece,71.5,[n.paok],{}];
    map[n.asteras] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(37.50264465, 22.388388),
      'Asteras Tripolis Stadium',6430,1931,_country.greece,68.6,[],{}];
    map[n.atromitos] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(38.0051223, 23.68987660),
      'Peristeri Stadium',10050,1923,_country.greece,67.5,[],{}];
    map[n.doxadrama] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.greece,50.0,[],{}];
    map[n.egaleo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes4,Coordinates(37.98724401, 23.67627500),
      'Stavros Mavrothalassitis Stadium',8217,1931,_country.greece,63.5,[],{}];
    map[n.ergotelis] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes2,Coordinates(35.336756962489446, 25.10597387859446),
      'Pankritio Stadium',26240,1929,_country.greece,58.2,[],{}];
    map[n.pasGiannina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(39.6676117, 20.84881764),
      'Zosimades Stadium',7500,1966,_country.greece,66.6,[],{}];
    map[n.ionikos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(37.9772289, 23.634989),
      'Neapolis Nikaia',5000,1965,_country.greece,68.2,[],{}];
    map[n.iraklis] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(40.62568776782426, 22.966798236431885),
      'Kaftanzoglio Stadium',28028,1908,_country.greece,62.6,[],{}];
    map[n.kavala] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.greece,50.0,[],{}];
    map[n.levadiakos] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Levadia Municipal Stadium',5915,1961,_country.greece,54.2,[],{}];
    map[n.ofi] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(35.3368787, 25.106282),
      'Pankritio',26400,1925,_country.greece,66.7,[],{}];
    map[n.olympiacos] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(37.946169,23.664536),
      'Karaiskákis',32130,1925,_country.greece,77.8,[n.panathinaikos],{}];
    map[n.panathinaikos] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(37.987606, 23.753651),
      'Apostolos Nikolaidis',16003,1908,_country.greece,72.6,[n.olympiacos],{}];
    map[n.panionios] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(37.9432934, 23.7092861),
      'Panionios Stadium',11700,1890,_country.greece,62.6,[],{}];
    map[n.paok] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(40.613839,22.972422),
      'Toumba Stadium',29000,1926,_country.greece,74.2,[n.aris],{}];
    map[n.panetolikos] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(38.6300163, 21.4118706),
      'Panetolikos Stadium',7500,1926,_country.greece,58.6,[],{}];
    map[n.ethnikospiraeus] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Perama Municipal Stadium',0,1923,_country.greece,56.2,[],{}];
    map[n.lamia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(38.9099234, 22.4304807),
      'Lamia Municipal Stadium',5500,1964,_country.greece,60.6,[],{}];
    map[n.panachaiki] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.greece,50.0,[],{}];
    map[n.pierikos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.greece,50.0,[],{}];
    map[n.platanias] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(35.48734503669703, 24.000511911140922),
      'Dimotiko Gipedo Perivolia',4000,1931,_country.greece,58.6,[],{}];
    map[n.veria] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.greece,50.0,[],{}];
    map[n.volos] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripes3,Coordinates(35.3368787, 25.106282),
      'Panthessaliko Stadium',22700,2017,_country.greece,66.0,[],{}];
    map[n.xanthi] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(41.1214320, 24.9493135),
      'Xanthi FC Arena',7361,1967,_country.greece,63.6,[],{}];
    //CHIPRE
    map[n.aeklarnaca] = [ClubColors(Colors.yellow,Colors.green),pattern.oneHorStripe,Coordinates(34.9264739, 33.5976785),
      'AEK arena',13032,1994,_country.cyprus,70.9,[],{}];
    map[n.aellimassol] = [ClubColors(darkblue,Colors.yellow),pattern.stripes2,Coordinates(34.70083625709543, 33.02274391111798),
      'Tsirion Stadium',13152,1930,_country.cyprus,64.4,[],{}];
    map[n.aeppaphos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.akritaschlorakas] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Chloraka Municipal Stadium',0,1971,_country.cyprus,60.2,[],{}];
    map[n.alkilarnaca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.apoel] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(35.1145399, 33.3630869672),
      'GSP Stadium',22859,1926,_country.cyprus,71.7,[],{}];
    map[n.apollonlimassol] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(34.700914,33.022975),
      'Tsirion Stadium',13331,1954,_country.cyprus,69.4,[],{}];
    map[n.apoppaphos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.arislimassol] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(34.693606171813606, 32.939166858054435),
      'Alphamega Stadium',10700,1930,_country.cyprus,67.2,[],{}];
    map[n.anorthosis] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(34.93734087, 33.620755),
      'Antonis Papadopoulos Stadium',10230,1911,_country.cyprus,66.0,[],{}];
    map[n.cetinkayaturks] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.digenisakritasmorphou] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.doxakatokopias] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Katokopia Stadium',3500,1954,_country.cyprus,60.9,[],{}];
    map[n.enosisneonparalimni] = [ClubColors(vinho,Colors.lightBlueAccent),pattern.sleeves,Coordinates(0,0),
      'Paralimni Municipal Stadium',5800,1936,_country.cyprus,62.8,[],{}];
    map[n.epalarnaca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.ermisaradippou] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.ethnikosachna] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.evagoraspaphos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.karmiotissa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Tsirio Stadium',13331,1979,_country.cyprus,64.1,[],{}];
    map[n.omonianicosia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.1145, 33.3631),
      'GSP Stadium',22859,1948,_country.cyprus,71.2,[],{}];
    map[n.neasalamis] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(34.92995704178164, 33.61315248651312),
      'Ammochostos Stadium',5500,1948,_country.cyprus,65.4,[],{}];
    map[n.pafos] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(34.769152407980975, 32.440214774351),
      'Stelios Kyriakides Stadium',8500,2014,_country.cyprus,64.7,[],{}];
    map[n.pezoporikos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cyprus,50.0,[],{}];
    map[n.olympiakosnicosia] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(35.14591545448246, 33.3142590131455),
      'Makareio Stadium',16000,1931,_country.cyprus,62.2,[],{}];
    //ISRAEL
    map[n.ashdod] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(31.8104802, 34.648333),
      'Estádio HaYud-Alef',8200,1999,_country.israel,65.4,[],{}];
    map[n.beitartelaviv] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.bneiyehudatelaviv] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(32.0511055, 34.7619853),
      'Bloomfield Stadium',29400,1936,_country.israel,61.4,[],{}];
    map[n.bneisakhnin] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Doha Stadium',5000,1996,_country.israel,62.5,[],{}];
    map[n.beitarjerusalem] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(31.7513445, 35.190685),
      'Teddy Stadium',34000,1936,_country.israel,65.3,[],{}];
    map[n.hakoahramatgan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoelacre] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoelbeersheva] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.2734850, 34.779789),
      'Terner Stadium',16000,1949,_country.israel,69.7,[],{}];
    map[n.hapoelhadera] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Netanya Stadium',14000,0,_country.israel,63.7,[],{}];
    map[n.hapoeljerusalem] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Teddy Stadium',31733,1926,_country.israel,64.6,[],{}];
    map[n.hapoelhaifa] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(32.783110, 34.9651566),
      'Sammy Ofer',14002,1924,_country.israel,66.9,[],{}];
    map[n.hapoelkfarsaba] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoellod] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoelnofhagalil] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoelpetahtikva] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(32.10420617, 34.86521629),
      'HaMoshava Stadium',11500,1934,_country.israel,64.3,[],{}];
    map[n.hapoelraanana] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.hapoelramatgan] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      '',0,0,_country.israel,62.3,[],{}];
    map[n.hapoeltelaviv] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.0518, 34.7618),
      'Bloomfield Stadium',29400,1927,_country.israel,66.6,[],{}];
    map[n.ironikiryatshmona] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(33.207899, 35.575889),
      'Irony Stadium',5300,2000,_country.israel,62.3,[],{}];
    map[n.maccabihaifa] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(32.7830479, 34.9658581),
      'Sammy Ofer',10000,1913,_country.israel,71.5,[],{}];
    map[n.maccabijaffa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];
    map[n.maccabinetanya] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(32.29447084, 34.86460658),
      'Netanya Stadium',13610,1934,_country.israel,67.5,[],{}];
    map[n.maccabipetahtikva] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(32.10424539, 34.8652313),
      'HaMoshava Stadium',11500,1912,_country.israel,64.6,[],{}];
    map[n.maccabitelaviv] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(32.0517917, 34.761783),
      'Bloomfield Stadium',29400,1906,_country.israel,72.4,[],{}];
    map[n.sektzianessziona] = [ClubColors(Colors.orange,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'HaMoshava Stadium',11500,1955,_country.israel,57.5,[],{}];
    map[n.maccabibneireineh] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Municipal Stadium',2500,2005,_country.israel,59.6,[],{}];
    map[n.shimshontelaviv] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.israel,50.0,[],{}];

    //RUSSIA
    map[n.amkar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(57.990748180, 56.244622619),
      'Zvezda Stadium',19500,1993,_country.russia,69.5,[],{}];
    map[n.akhmatGrozny] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(43.3244449, 45.6900699),
      'Sultan Bilimkhanov',10200,1958,_country.russia,71.3,[],{}];
    map[n.anzhi] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(42.9079000, 47.618420),
      'Arena Anji',10000,1991,_country.russia,67.3,[],{}];
    map[n.tula] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(54.17481890, 37.6025909),
      'Arsenal Stadium',20048,1946,_country.russia,72.4,[],{}];
    map[n.baltika] = [ClubColors(Colors.white,Colors.blue),pattern.divided,Coordinates(54.69820303955614, 20.53416109138269),
      'Estádio de Kaliningrado',35212,1954,_country.russia,67.3,[],{}];
    map[n.cska] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(55.7921064, 37.5159460),
      'VEB Arena',30000,1911,_country.russia,76.6,[],{}];
    map[n.dinamoMoscou] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(55.79095156, 37.5610590),
      'Dinamo Lev Yashin Stadium',36000,1923,_country.russia,76.7,[],{}];
    map[n.fakel] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Tsentralny Profsoyuz Stadion',31793,1947,_country.russia,68.8,[],{}];
    map[n.kamaz] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(55.7322693, 52.4179218),
      'KAMAZ Stadium',6504,1981,_country.russia,61.5,[],{}];
    map[n.khimki] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(55.8854723, 37.454475),
      'Arena Khimki',18636,1997,_country.russia,70.1,[],{}];
    map[n.krasnodar] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(45.0450492, 39.0294265),
      'Estádio Krasnodar',35074,2008,_country.russia,74.9,[],{}];
    map[n.krylyaSovetov] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.277987, 50.2374051),
      'Solidarnost Arena',44918,1942,_country.russia,70.6,[],{}];
    map[n.kubanKrasnodar] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(45.02525498280613, 38.99953266878158),
      'Kuban Stadium',31654,1928,_country.russia,61.8,[],{}];
    map[n.lokomotivMoscou] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.80355,37.741169),
      'Estádio Lokomotiv de Moscou',28800,1922,_country.russia,73.6,[],{}];
    map[n.nizhnyNovgorod] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(56.3374867, 43.963353),
      'Nizhny Novgorod Stadium',44900,2015,_country.russia,71.0,[],{}];
    map[n.orenburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.7851665, 55.2210744),
      'Estádio Gazovik',4950,1976,_country.russia,68.9,[],{}];
    map[n.rostov] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.20833333,39.74166667),
      'Rostov Arena',45000,1930,_country.russia,71.2,[],{}];
    map[n.rotor] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(48.73463702, 44.54914292288772),
      'Volgograd Arena',45568,1929,_country.russia,70.4,[],{}];
    map[n.rubinKazan] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(55.82109839, 49.161094869),
      'Arena Kazan',45379,1958,_country.russia,75.2,[],{}];
    map[n.saturn] = [ClubColors(darkblue,Colors.black),pattern.stripes2,Coordinates(55.57756461, 38.2263080),
      'Saturn Stadium',14685,1946,_country.russia,67.8,[],{}];
    map[n.shinnikYaroslavl] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(57.62856073, 39.8670769),
      'Shinnik Stadium',22990,1957,_country.russia,66.4,[],{}];
    map[n.skaRostov] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(47.27175657349289, 39.728125052960856),
      'SKA SKVO Stadium',27300,1937,_country.russia,56.8,[],{}];
    map[n.sochi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.401925, 39.9562793781204),
      'Fisht',47659,2018,_country.russia,75.2,[],{}];
    map[n.spartakmoscou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(55.8178315, 37.4406002),
      'Otkrytie Arena',44929,1922,_country.russia,77.2,[],{}];
    map[n.spartakNalchik] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.46994792, 43.59084541),
      'Spartak Stadium de Nalchik',14400,1935,_country.russia,60.8,[],{}];
    map[n.tomtomsk] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(56.4743242, 84.956598),
      'Estádio Trud',15000,1921,_country.russia,66.4,[],{}];
    map[n.torpedo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(55.7164327, 37.6563151),
      'Eduard Streltsov',13400,1930,_country.russia,69.4,[],{}];
    map[n.ufa] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(54.82587214, 56.0614233),
      'Neftyanik',16500,2009,_country.russia,69.8,[],{}];
    map[n.ural] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(56.8325198, 60.573520),
      'Arena Ekaterinburg',35163,1930,_country.russia,71.2,[],{}];
    map[n.alania] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(43.0233065, 44.69528968),
      'Republican Spartak Stadium',32464,1921,_country.russia,68.5,[],{}];
    map[n.zenit] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(59.97280838, 30.2220053),
      'Gazprom Arena',69000,1925,_country.russia,78.2,[],{}];
    map[n.moskva] = [ClubColors(grena,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Eduard Streltsov',14274,1997,_country.russia,66.6,[],{"extinto": 2010}]; //EXTINTO 2010

    //UKRAINE
    map[n.arsenalkyiv] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.chornomoretsodesa] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(46.48055848, 30.7556973),
      'Chornomorets Stadium',40003,1925,_country.ukraine,69.4,[],{}];
    map[n.desnachernihiv] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(51.50177025, 31.327121),
      'Yurii Haharin Stadium',12060,1960,_country.ukraine,68.6,[],{}];
    map[n.dinamokiev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.4334322, 30.52202498),
      'Olímpico de Kiev',70050,1927,_country.ukraine,77.3,[n.shakhtardonetsk],{}];
    map[n.dnipro1] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(48.46047234, 35.03251905),
      'Dnipro Arena',31003,2017,_country.ukraine,73.3,[],{}];
    map[n.karpatylviv] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(49.8191412, 24.0478958),
      'Ukraina Stadium',28051,1963,_country.ukraine,62.9,[],{}];
    map[n.koloskovalivka] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.35419316, 30.95251878),
      'Kolos Stadium',5000,2012,_country.ukraine,67.3,[],{}];
    map[n.kryvbaskryvyirih] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Hirnyk Stadium',2500,1959,_country.ukraine,68.2,[],{}];
    map[n.inhuletspetrove] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Inhulets Stadium',1720,2013,_country.ukraine,66.4,[],{}];
    map[n.lviv] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7749650, 24.02770639),
      'Arena Lviv',34915,1992,_country.ukraine,71.6,[],{}];
    map[n.mariupol] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.metalist1925kharkiv] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(49.9810, 36.2617732),
      'OSC Metalist',34164,2016,_country.ukraine,73.8,[],{}];
    map[n.metalistkharkiv] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(49.9810, 36.2617732),
      'OSC Metalist',34164,1925,_country.ukraine,66.1,[],{}];
    map[n.metalurhdonetsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.metalurhzaporizhya] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.mynai] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Avanhard Stadium',12000,2015,_country.ukraine,63.5,[],{}];
    map[n.olimpikdonetsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.oleksandriya] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(48.674966326, 33.1038229),
      'CSC Nika',7000,1948,_country.ukraine,67.8,[],{}];
    map[n.rukhlviv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.7742804, 24.02852715),
      'Arena Lviv',34915,2003,_country.ukraine,67.0,[],{}];
    map[n.shakhtardonetsk] = [ClubColors(Colors.orange,Colors.black),pattern.stripes2,Coordinates(50.433542433, 30.522135),
      'Donbass Arena',52187,1936,_country.ukraine,78.0,[n.dinamokiev],{}];
    map[n.tavriyasimferopol] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.veresrivne] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(48.6236054, 22.2762846),
      'Avanhard Stadium',12080,1957,_country.ukraine,66.4,[],{}];
    map[n.volynlutsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ukraine,50.0,[],{}];
    map[n.vorsklapoltava] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(49.5948672, 34.5490243),
      'Butovsky Memorial Vorskla',25000,1955,_country.ukraine,69.6,[],{}];
    map[n.zoryaluhansk] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(47.859599, 35.097371331),
      'Slavutych Arena',22888,1923,_country.ukraine,72.5,[],{}];
    map[n.dnipro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Dnipro Arena',31003,1918,_country.ukraine,73.3,[],{"extinto": 2019}]; //FALIU 2019
    //EX-URSS
    //MOLDOVA
    map[n.balti] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.76607036315402, 27.933023679674804),
      'Stadionul Orășenesc',5953,1984,_country.moldova,64.1,[],{}];
    map[n.daciabuiucani] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(47.0476686442429, 28.782387892716777),
      'Joma Arena',2000,1997,_country.moldova,60.1,[],{}];
    map[n.dinamoautotiraspol] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(46.82361131920762, 29.547323681626253),
      'Dinamo-Auto Stadium',1300,2009,_country.moldova,61.2,[],{}];
    map[n.floresti] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.milsamiorhei] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(47.37443160, 28.819647943),
      'Complexul Sportiv Raional Orhei',3023,2005,_country.moldova,66.9,[],{}];
    map[n.nistruotaci] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.olimpiabalti] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.petrocubhincesti] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(46.82548374405467, 28.5867284924555),
      'Stadionul Orășenesc',1200,1999,_country.moldova,63.1,[],{}];
    map[n.sherifftiraspol] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(46.8383774, 29.558222),
      'Sheriff Stadium',12746,1997,_country.moldova,70.7,[],{}];
    map[n.sfintulgheorghe] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Zimbru-2 Stadium',1500,2003,_country.moldova,62.5,[],{}];
    map[n.sperantanisporeni] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.tiligultirastiraspol] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.tiraspol] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.zimbruchisinau] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(46.9803721, 28.86797756),
      'Zimbru Stadium',10400,1947,_country.moldova,68.6,[],{}];
    map[n.zariabalti] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.moldova,50.0,[],{}];
    map[n.daciachisinau] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Stadionul Dacia',8550,1999,_country.moldova,50.0,[],{"extinto": 2018}]; //EXTINTO 2018
    //BELARUS
    map[n.arsenaldzerzhinsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.bate] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(54.1927777,28.475694444),
      'Borisov Arena',12900,1973,_country.belarus,72.1,[],{}];
    map[n.belshinabobruisk] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Spartak Stadium',3700,1976,_country.belarus,61.7,[],{}];
    map[n.bobruisk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.dinamobrest] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(52.089810, 23.6836123),
      'Sport Complex Brestskiy',10060,1960,_country.belarus,63.2,[],{}];
    map[n.dinamominsk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.881454, 27.6175440),
      'Traktar Stadium',16500,1927,_country.belarus,70.8,[],{}];
    map[n.dinamo93minsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.dneprmogilev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.9054588, 30.34092),
      'Spartak Stadion',11200,1960,_country.belarus,61.2,[],{}];
    map[n.energetikbguminsk] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(53.859588, 27.5017443),
      'RCOP-BGU Stadium',15000,1996,_country.belarus,65.1,[],{}];
    map[n.gomel] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(52.436713874, 31.0121813),
      'Central Stadium',14307,1959,_country.belarus,62.5,[],{}];
    map[n.gorodeya] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.islochminskraion] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'FC Minsk Stadium',3000,2007,_country.belarus,62.0,[],{}];
    map[n.minsk] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(0,0),
      'FC Minsk Stadium',3000,2006,_country.belarus,62.6,[],{}];
    map[n.molodechno] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.naftannovopolotsk] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Atlant Stadium',5300,1963,_country.belarus,61.0,[],{}];
    map[n.nemangrodno] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Neman Stadium',8479,1964,_country.belarus,64.8,[],{}];
    map[n.partizanminsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.smorgon] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Yunost Stadium',3200,1987,_country.belarus,60.4,[],{}];
    map[n.slaviamozyr] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(53.09769, 25.3062183),
      'Yunost Stadium',5353,1987,_country.belarus,58.6,[],{}];
    map[n.shakhtyorsoligorsk] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(52.79859758, 27.5382051),
      'Estádio Stroitel',4200,1961,_country.belarus,67.3,[],{}];
    map[n.slutsk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'City Stadium',1896,1998,_country.belarus,59.3,[],{}];
    map[n.torpedominsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    map[n.torpedozhodino] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Torpedo Stadium',6524,1961,_country.belarus,66.4,[],{}];
    map[n.vitebsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.belarus,50.0,[],{}];
    //AZERBAIJÃO
    map[n.baku] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Tofiq Bahramov Stadium',31200,1997,_country.azerbaijan,60.4,[],{}];
    map[n.shamakhi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.41097398, 49.89786188),
      'Shafa Stadium',2200,1997,_country.azerbaijan,63.8,[],{}];
    map[n.neftci] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(40.4001566, 49.9438641),
      'Bakcell Arena',11000,1906,_country.azerbaijan,68.6,[],{}];
    map[n.kapaz] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(40.70590163, 46.36198384),
      'Ganja City Stadium',25000,1959,_country.azerbaijan,62.4,[],{}];
    map[n.karvan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.azerbaijan,50.0,[],{}];
    map[n.khazarsumgayait] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.azerbaijan,50.0,[],{}];
    map[n.qabala] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(40.9845888, 47.834242336),
      'Gabala City Stadium',4500,1995,_country.azerbaijan,69.5,[],{}];
    map[n.qarabag] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(40.3974049, 49.852724642),
      'Estádio Tofig Bahramov',31200,1951,_country.azerbaijan,71.5,[],{}];
    map[n.sabahFK] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(60.20558128, 24.929022),
      'Alinjaa Arena',13000,2017,_country.azerbaijan,65.5,[],{}];
    map[n.sebail] = [ClubColors(Colors.black,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'ASCO Arena',3200,2016,_country.azerbaijan,62.6,[],{}];
    map[n.simurq] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.azerbaijan,50.0,[],{}];
    map[n.shuvalan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.azerbaijan,50.0,[],{}];
    map[n.sumgayit] = [ClubColors(Colors.white,Colors.purple),pattern.solid,Coordinates(0,0),
      'Kapital Bank Arena',3000,1961,_country.azerbaijan,50.0,[],{}];
    map[n.stdsumgayit] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.azerbaijan,50.0,[],{}];
    map[n.turantovuz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Tovuz City Stadium',6800,1992,_country.azerbaijan,59.4,[],{}];
    map[n.zira] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(40.358953392, 50.29314366),
      'Zira Olympic Sport Complex',1200,2014,_country.azerbaijan,63.4,[],{}];
    map[n.khazar] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(0,0),
      'Lankaran City Stadium',2000,2004,_country.azerbaijan,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    map[n.shamkir] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Shamkir Olympic Sport Complex Stadium',2000,1954,_country.azerbaijan,50.0,[],{"extinto": 2017}]; // EXTINTO 2017
    //CAZAQUISTÃO
    map[n.aktobe] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(50.29155, 57.15927),
      'Aktobe Central Stadium',13200,1967,_country.kazakhstan,68.2,[],{}];
    map[n.akzhayik] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kazakhstan,50.0,[],{}];
    map[n.aksu] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Central Stadium',11828,2018,_country.kazakhstan,61.4,[],{}];
    map[n.atyrau] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.0939371, 51.90870177),
      'Munayshy Stadium',9000,1980,_country.kazakhstan,63.1,[],{}];
    map[n.astana] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(51.1083829, 71.4031747),
      'Astana Arena',30000,2009,_country.kazakhstan,71.7,[],{}];
    map[n.caspiy] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Zhastar Stadium',3500,1962,_country.kazakhstan,60.1,[],{}];
    map[n.ekibastuzets] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Shakhter',6300,2003,_country.kazakhstan,57.8,[],{}];
    map[n.esilBogatyr] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kazakhstan,50.0,[],{}];
    map[n.gornyak] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kazakhstan,50.0,[],{}];
    map[n.kairat] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(43.238482, 76.924193),
      'Central Stadium',23804,1954,_country.kazakhstan,68.6,[],{}];
    map[n.kaisar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.82594841870582, 65.50329260959327),
      'Estádio Gany Muratbayev',7000,1968,_country.kazakhstan,63.5,[],{}];
    map[n.kyzylzhar] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Karasai Stadium',11000,1968,_country.kazakhstan,68.4,[],{}];
    map[n.maktaaral] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(0,0),
      '',4229,2012,_country.kazakhstan,60.2,[],{}];
    map[n.okzhetpes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(53.285220, 69.3924265),
      'Okzhetpes Stadium',10000,1957,_country.kazakhstan,64.2,[],{}];
    map[n.ordabasy] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(42.335537, 69.59348),
      'Kazhimukan Munaitpasov Stadium',20000,1958,_country.kazakhstan,67.3,[],{}];
    map[n.shakhter] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(49.8186566, 73.0752474),
      'Shakhter Stadium',19000,1958,_country.kazakhstan,64.5,[],{}];
    map[n.semey] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(50.4148987, 80.241398),
      'Spartak Stadium',8000,1964,_country.kazakhstan,60.5,[],{}];
    map[n.taraz] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.902019, 71.382288),
      'Taraz Central Stadium',12525,1967,_country.kazakhstan,62.0,[],{}];
    map[n.tobol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(53.2263205, 63.636574),
      'Tsentralny Kostanay',8323,1967,_country.kazakhstan,67.4,[],{}];
    map[n.vostok] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kazakhstan,50.0,[],{}];
    map[n.zhenis] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(51.162695, 71.4133405),
      'K.Munaitpasov Stadium',12343,1964,_country.kazakhstan,63.5,[],{}];
    map[n.zhetysu] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.019810, 78.3668398),
      'Stadion Zhetysu',5500,1981,_country.kazakhstan,63.1,[],{}];
    map[n.almaata] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Almaty Central Stadium',23804,2000,_country.kazakhstan,50.0,[],{"extinto": 2008}]; //EXTINTO 2008
    map[n.irtysh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Central Stadium',20000,1965,_country.kazakhstan,50.0,[],{"extinto": 2020}]; //EXTINTO 2020

    //GEORGIA
    map[n.chikhurasachkhere] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.dinamotbilisi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.722937, 44.78977),
      'Boris Paichadze Dinamo Arena',54549,1925,_country.georgia,70.6,[],{}];
    map[n.dinamobatumi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(41.8126276, 41.77440),
      'Chele Arena',6000,1923,_country.georgia,68.6,[],{}];
    map[n.dilagori] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(41.983075, 44.1038858),
      'Tengiz Burjanadze',8230,1949,_country.georgia,66.4,[],{}];
    map[n.gagra] = [ClubColors(Colors.blue,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'David Petriashvili Arena',2130,2004,_country.georgia,55.2,[],{}];
    map[n.kolkheti1913poti] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.locomotivetbilisi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.margvetizestafoni] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.tskhumisukhumi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.witgeorgia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(41.8471646338472, 44.72134786716185),
      'Mtskheta Park',10000,1968,_country.georgia,64.1,[],{}];
    map[n.torpedokutaisi] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(42.25514748, 42.683279),
      'Estádio Givi Kiladze',14700,1946,_country.georgia,67.5,[],{}];
    map[n.saburtalotbilisi] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(41.7096506, 44.7464957),
      'Estádio Mikheil Meskhi',25453,1999,_country.georgia,68.1,[],{}];
    map[n.samtredia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.16093130024033, 42.330804469344294),
      'Erosi Manjgaladze Stadium',3000,1936,_country.georgia,62.6,[],{}];
    map[n.samguralitsqaltubo] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(0,0),
      '26 May Stadium',12000,1945,_country.georgia,57.5,[],{}];
    map[n.sionibolnisi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.shevardeni1906tbilisi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.shukurakobuleti] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Chele Arena',7000,1968,_country.georgia,57.2,[],{}];
    map[n.telavi] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(0,0),
      'Givi Chokheli Stadium',12000,2016,_country.georgia,58.6,[],{}];
    map[n.tskhumisukhumi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.georgia,50.0,[],{}];
    map[n.zestafoni] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(42.11186564189282, 43.02559374812045),
      'David Abashidze Stadium',4558,2004,_country.georgia,61.6,[],{}];
    map[n.metalurgirustavi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Poladi Stadium',3000,1948,_country.georgia,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    map[n.olimpirustavi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Poladi Stadium',3000,1948,_country.georgia,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    //ARMENIA
    map[n.araratarmenia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(40.1713237, 44.5255822),
      'Vazgen Sargsyan Republican',14530,2017,_country.armenia,69.1,[],{}];
    map[n.araratyerevan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.18052, 44.4948721),
      'Hrazdan Stadium',53849,1935,_country.armenia,70.5,[],{}];
    map[n.alashkert] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.15448480, 44.47532),
      'Alashkert Stadium',22570,1921,_country.armenia,68.2,[],{}];
    map[n.bkmayerevan] = [ClubColors(Colors.red,Colors.orange),pattern.solid,Coordinates(40.220362025799, 44.55726208715088),
      'Yerevan Football Academy Stadium',1428,1947,_country.armenia,59.8,[],{}];
    map[n.gandzasarkapan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.erebunihomenmen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.mika] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.kotayk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.lernayinartsakh] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(39.82122077, 46.75341665),
      'Stepanakert Republican Stadium',12000,1927,_country.armenia,58.6,[],{}];
    map[n.mika] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.noah] = [ClubColors(Colors.black,Colors.pink),pattern.stripes3,Coordinates(40.149504877769125, 44.47639210015546),
      'Mika Stadium',7200,2017,_country.armenia,60.8,[],{}];
    map[n.noravank] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.pyunik] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(40.17168518, 44.5257160),
      'Hanrapetakan Stadium',15000,1992,_country.armenia,67.7,[],{}];
    map[n.sevan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.armenia,50.0,[],{}];
    map[n.shirak] = [ClubColors(Colors.orange,Colors.white),pattern.oneHorStripe,Coordinates(40.7854547, 43.8336913),
      'Gyumri City Stadium',3000,1958,_country.armenia,63.1,[],{}];
    map[n.urartu] = [ClubColors(Colors.purple,Colors.orange),pattern.solid,Coordinates(40.17135801538475, 44.45031446136097),
      'Banants Stadium',6000,1992,_country.armenia,62.6,[],{}];
    map[n.van] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(40.408717931362, 44.64582760226294),
      'Charentsavan City Stadium',5000,2019,_country.armenia,57.8,[],{}];
    map[n.mika] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Mika Stadium',8000,1985,_country.armenia,50.0,[],{"extinto": 2016}];//EXTINTO 2016
    map[n.ulisses] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Hanrapetakan Stadium',15000,2000,_country.armenia,50.0,[],{"extinto": 2016}];//EXTINTO 2016
    //BALTICOS
    //ESTONIA
    map[n.eestipolevkivijohvi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.estonia,50.0,[],{}];
    map[n.floratallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.421331, 24.73216),
      'A. Le Coq Arena',10340,1990,_country.estonia,66.5,[],{}];
    map[n.kuressaare] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Kuressaare linnastaadion',2000,1997,_country.estonia,57.7,[],{}];
    map[n.harju] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(59.35038472821901, 24.61619322541802),
      'Laagri kunstmurustaadion',1000,2009,_country.estonia,56.0,[],{}];
    map[n.nommekalju] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(59.3857124, 24.6593233),
      'Hiiu staadion',500,1923,_country.estonia,57.5,[],{}];
    map[n.legion] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.estonia,50.0,[],{}];
    map[n.levadiatallinn] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(59.434562537, 24.7830739),
      'Kadrioru Stadium',4700,1998,_country.estonia,66.2,[],{}];
    map[n.narvatrans] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(59.3638292, 28.18413),
      'Kreenholmi Staadion',3000,1979,_country.estonia,61.2,[],{}];
    map[n.paidelinnameeskond] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(58.8783763, 25.54076747),
      'ÜG Stadium',250,1990,_country.estonia,65.4,[],{}];
    map[n.sillamaekalev] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.estonia,50.0,[],{}];
    map[n.tallinnakalev] = [ClubColors(Colors.blue,Colors.white,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Kadriorg Stadium',5000,1911,_country.estonia,63.4,[],{}];
    map[n.tartutammeka] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(58.366463773042355, 26.714035367270952),
      'Tartu Tamme Stadium',1750,1989,_country.estonia,59.0,[],{}];
    map[n.vaprus] = [ClubColors(Colors.yellow,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Pärnu Rannastaadion',1500,1922,_country.estonia,58.7,[],{}];
    map[n.lantana] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Viimsi Stadium',2000,1994,_country.estonia,50.0,[],{"extinto": 1999}]; //EXTINTO 1999
    map[n.norma] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Norma Staadion',1000,1959,_country.estonia,50.0,[],{"extinto": 1997}]; //EXTINTO 1997
    map[n.tvmk] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Kadrioru Staadion',4750,1951,_country.estonia,50.0,[],{"extinto": 2008}]; //EXTINTO 2008
    //LATVIA
    map[n.bfcdaugavpils] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Celtnieks Stadium',3980,2009,_country.latvia,64.6,[],{}];
    map[n.blazmarezekne] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.latvia,50.0,[],{}];
    map[n.dinaburg] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.latvia,50.0,[],{}];
    map[n.fkauda] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Audas stadions',520,1969,_country.latvia,63.1,[],{}];
    map[n.jelgava] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'Zemgale Olympic Center',1560,0,_country.latvia,57.1,[],{}];
    map[n.jurmala] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(56.9495508, 23.6100709),
      'Slokas Stadium',2500,2007,_country.latvia,58.6,[],{}];
    map[n.liepaja] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(56.954951357, 24.1588003),
      'Daugava Stadium',5083,2014,_country.latvia,61.3,[],{}];
    map[n.mettalu] = [ClubColors(Colors.green,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Daugava Stadium',10461,2006,_country.latvia,64.2,[],{}];
    map[n.rigafc] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(56.961413, 24.116308),
      'Skonto',9100,2014,_country.latvia,68.4,[],{}];
    map[n.rigasfs] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(56.90891835, 24.15514115),
      'LNK Sporta Parks',1000,2011,_country.latvia,68.0,[],{}];
    map[n.supernova] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Olaines Stadions',2500,2000,_country.latvia,56.8,[],{}];
    map[n.torpedoriga] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.latvia,50.0,[],{}];
    map[n.tukums] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Tukuma Pilsētas Stadions',0,2000,_country.latvia,59.1,[],{}];
    map[n.valmiera] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(57.5410309, 25.4417177),
      'Jānis Daliņš',2000,1996,_country.latvia,67.2,[],{}];
    map[n.ventspils] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(57.38822925, 21.571723),
      'Ventspils Olimpiskais Stadions',3200,1997,_country.latvia,50.0,[],{}];
    map[n.daugavariga] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Daugava Stadium',5000,2003,_country.latvia,50.0,[],{"extinto": 2005}]; //EXTINTO 2005
    map[n.skonto] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Skonto Stadions',10000,1991,_country.latvia,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    //LITHUANIA
    map[n.bangakaunas] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(0,0),
      'Gargždai Stadium',2300,1966,_country.lithuania,61.3,[],{}];
    map[n.dainava] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(54.392155155250656, 24.05533163313293),
      'Alytus Stadium',3790,2016,_country.lithuania,61.8,[],{}];
    map[n.dziugas] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(55.98486537276643, 22.242936144643537),
      'Telšiai Central Stadium',2400,1923,_country.lithuania,63.5,[],{}];
    map[n.ekranas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(55.730649, 24.371222),
      'Draugystes Stadium',4000,1964,_country.lithuania,64.8,[],{}];
    map[n.hegelmann] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'LFF Kaunas Training Centre',500,2009,_country.lithuania,57.5,[],{}];
    map[n.inkaraskaunas] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.lithuania,50.0,[],{}];
    map[n.karedasiauliai] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.lithuania,50.0,[],{}];
    map[n.panevezys] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Aukštaitija Stadium',6600,2015,_country.lithuania,67.4,[],{}];
    map[n.riteriai] = [ClubColors(Colors.lightGreenAccent,darkblue),pattern.solid,Coordinates(0,0),
      'LFF Stadium',5067,2005,_country.lithuania,61.5,[],{}];
    map[n.suduva] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(54.5747184, 23.365261),
      'Marijampolės futbolo arena',6250,1968,_country.lithuania,65.7,[],{}];
    map[n.kaunozalgiris] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(54.89744355, 23.937322),
      'Dariaus ir Girėno stadionas',15315,2004,_country.lithuania,67.1,[],{}];
    map[n.siauliai] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(55.93678936851523, 23.295390020038322),
      'Savivaldybė Stadium',4000,2007,_country.lithuania,65.5,[],{}];
    map[n.trakai] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.lithuania,50.0,[],{}];
    map[n.vetra] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.lithuania,50.0,[],{}];
    map[n.zalgiris] = [ClubColors(Colors.green,Colors.greenAccent),pattern.stripes2,Coordinates(54.669264, 25.2951),
      'LFF Stadium',5400,1947,_country.lithuania,70.5,[],{}];
    map[n.atlantas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Central Stadium of Klaipėda',4428,0,_country.lithuania,50.0,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.fbkkaunas] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'S. Darius and S. Girėnas Stadium',9180,1960,_country.lithuania,50.0,[],{"extinto": 2012}]; //EXTINTO 2012
    map[n.romar] = [ClubColors(Colors.red,Colors.yellow),pattern.sleeves,Coordinates(0,0),
      'Mažeikiai Stadium',5000,1992,_country.lithuania,50.0,[],{"extinto": 1995}]; //EXTINTO 1995

    //SERVIA
    map[n.estrelavermelha] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(44.783172, 20.465097),
      'Rajko Mitić',55538,1945,_country.serbia,75.3,[n.partizan],{}];
    map[n.partizan] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(44.7886175, 20.45902),
      'Stadion Partizana',32710,1945,_country.serbia,74.6,[n.estrelavermelha],{}];
    map[n.backatopola] = [ClubColors(darkblue,Colors.black),pattern.stripes4,Coordinates(45.8157165, 19.6273806),
      'TSC Arena',4500,1913,_country.serbia,62.7,[],{}];
    map[n.cukaricki] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(44.7603344, 20.4245656),
      'Čukarički Stadion',7000,1926,_country.serbia,67.6,[],{}];
    map[n.javor] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Javor Stadium',3000,1912,_country.serbia,61.7,[],{}];
    map[n.kolubara] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(0,0),
      'Kolubara Stadium',2500,1919,_country.serbia,62.8,[],{}];
    map[n.mladostlucani] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion FK Mladost',8000,1952,_country.serbia,64.0,[],{}];
    map[n.mladostnovisad] = [ClubColors(Colors.red,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Karađorđe Stadium',14458,1972,_country.serbia,61.5,[],{}];
    map[n.napredakkrusevac] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Mladost Stadium',10330,1946,_country.serbia,63.1,[],{}];
    map[n.novipazar] = [ClubColors(Colors.blue,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Novi Pazar City Stadium',12000,1928,_country.serbia,65.1,[],{}];
    map[n.obilic] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(44.79161557, 20.49474531),
      'FK Obilić Stadium',4600,1924,_country.serbia,66.7,[],{}];
    map[n.ofkbelgrade] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(44.815326, 20.4938369),
      'Omladinski Stadion',20000,1911,_country.serbia,68.6,[],{}];
    map[n.radnik] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.6924068, 22.1655271),
      'Surdulica City Stadium',3312,1926,_country.serbia,63.3,[],{}];
    map[n.radnicki1923] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Čika Dača Stadium',15100,1923,_country.serbia,66.2,[],{}];
    map[n.radnickinis] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(43.31552, 21.9088012),
      'Čair Stadium',18151,1923,_country.serbia,67.5,[],{}];
    map[n.subotica] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(46.0818169, 19.6768421),
      'Gradski Stadium',13000,1945,_country.serbia,63.5,[],{}];
    map[n.velezMostar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.3784511, 17.85448365),
      'Stadion Rođeni',7000,1922,_country.serbia,68.1,[],{}];
    map[n.vojvodina] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(45.24694, 19.8417566),
      'Stadium of Vojvodina',15754,1914,_country.serbia,71.4,[],{}];
    map[n.vozdovac] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.7748805, 20.4901423),
      'Voždovac Stadium',5200,1912,_country.serbia,65.1,[],{}];
    //BULGARIA
    map[n.akademiksofia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.arda] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.641265326041996, 25.37809794583833),
      'Arena Arda',11114,1924,_country.bulgaria,62.2,[],{}];
    map[n.beroe] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(42.4326854, 25.61541325),
      'Estádio Beroe',12128,1916,_country.bulgaria,67.5,[],{}];
    map[n.botevplovdiv] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(42.86054836, 25.3195),
      'Hristo Botev Stadium',18777,1912,_country.bulgaria,64.8,[],{}];
    map[n.botevvratsa] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(0,0),
      'Stadion Hristo Botev',25000,1921,_country.bulgaria,62.4,[],{}];
    map[n.chernomorevarna] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(43.215765, 27.9311821),
      'Ticha',12500,1913,_country.bulgaria,64.2,[],{}];
    map[n.cskasofia] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.6842594, 23.339714),
      'Balgarska Armiya Stadium',22015,1948,_country.bulgaria,72.7,[],{}];
    map[n.dunavruse] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.etarvelikotarnovo] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.hebarpazardzhik] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(42.210906304070996, 24.322564069458004),
      'Stadion Georgi Benkovski',13128,1918,_country.bulgaria,58.3,[],{}];
    map[n.levskisofia] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.7054198, 23.3632712),
      'Georgi Aspraruhov',29980,1914,_country.bulgaria,70.6,[],{}];
    map[n.litexlovech] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(43.1429592, 24.72480435),
      'Lovech Stadium',8000,1921,_country.bulgaria,68.6,[],{}];
    map[n.lokplovdiv] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.1338578, 24.77161877),
      'Lokomotiv',11800,1926,_country.bulgaria,69.3,[],{}];
    map[n.loksofia] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(42.737672, 23.314724),
      'Lokomotiv Stadium',22000,1929,_country.bulgaria,66.5,[],{}];
    map[n.ludogorets] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(43.5344062, 26.5281217),
      'Ludogorets Arena',12500,1940,_country.bulgaria,75.6,[],{}];
    map[n.minyorpernik] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.pirinblagoevgrad] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(42.13986306666101, 24.76452971093658),
      'Stadion Hristo Botev',7500,1922,_country.bulgaria,59.2,[],{}];
    map[n.septemvrisofia] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(42.63735251739005, 23.30921475413996),
      'Stadion Dragalevtsi',1800,1944,_country.bulgaria,59.2,[],{}];
    map[n.slaviasofia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(42.675321, 23.27190),
      'Slavia Stadium',15992,1913,_country.bulgaria,69.6,[],{}];
    map[n.cska1948] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.5910188, 23.3634639),
      'Stadion Bistritsa',2500,1948,_country.bulgaria,68.7,[],{}];
    map[n.sliven] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.spartakpleven] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.spartakplovdiv] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(42.1315663, 24.74390948),
      'Todor Diev Stadium',3500,1947,_country.bulgaria,63.4,[],{}];
    map[n.spartaksofia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.spartakvarna] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(43.218576166935, 27.9124511966362),
      'Stadion Spartak',6000,1918,_country.bulgaria,62.6,[],{}];
    map[n.trakiaplovdiv] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    map[n.tsarskoselo] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bulgaria,50.0,[],{}];
    //CROATIA
    map[n.cibalia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.croatia,50.0,[],{}];
    map[n.dinamozagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.818673, 16.018165),
      'Maksimir',38923,1911,_country.croatia,77.5,[n.hajduksplit],{}];
    map[n.gorica] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.7239381, 16.0730582),
      'Gradski stadion Velika Gorica',5200,2009,_country.croatia,67.4,[],{}];
    map[n.hajduksplit] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(43.5198462, 16.432361),
      'Polijud',35000,1911,_country.croatia,73.2,[n.dinamozagreb],{}];
    map[n.istra] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(44.86177027, 13.8514561),
      'Stadion Aldo Drosina',9800,1961,_country.croatia,63.2,[],{}];
    map[n.lokzagreb] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.8045, 15.96078837),
      'Stadion Kranjčevićeva',8850,1914,_country.croatia,67.5,[],{}];
    map[n.nkzagreb] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(45.8040032, 15.96063943),
      'Stadion Kranjčevićeva',8850,1903,_country.croatia,64.1,[],{}];
    map[n.osijek] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(45.5449856, 18.6955684),
      'Stadion Gradski vrt',18856,1947,_country.croatia,69.8,[],{}];
    map[n.rijeka] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(45.347946972, 14.4026226413),
      'Kantrida',12600,1906,_country.croatia,72.2,[],{}];
    map[n.sibenik] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(43.74371601035874, 15.896461331841413),
      'Stadion Šubićevac',8000,1932,_country.croatia,62.6,[],{}];
    map[n.slavenbelupo] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(46.166263653877316, 16.83466956352167),
      'Gradski Stadion',3134,1912,_country.croatia,63.4,[],{}];
    map[n.varazdin] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(46.293376637902895, 16.344248226073383),
      'Stadion Andelko Herjavec',10500,2012,_country.croatia,64.2,[],{}];
    map[n.varteks] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.croatia,50.0,[],{}];
    map[n.zadar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.croatia,50.0,[],{}];
    map[n.interzapresic] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.croatia,50.0,[],{}];
    //REP. TCHECA
    map[n.banikostrava] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.845337, 18.2991878),
      'Bazaly',17400,1922,_country.czechRepublic,71.8,[],{}];
    map[n.bohemians] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.067005, 14.454192422766054),
      'Ďolíček',5000,1905,_country.czechRepublic,69.8,[],{}];
    map[n.budejovice] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Stadion Střelecký ostrov',6681,1905,_country.czechRepublic,64.8,[],{}];
    map[n.brno] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(49.22719586, 16.586590),
      'Městský fotbalový Stadion Srbská',12550,1913,_country.czechRepublic,67.5,[],{}];
    map[n.jablonec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(50.715097, 15.16240467),
      'Stadion Střelnice',6280,1945,_country.czechRepublic,68.5,[],{}];
    map[n.mladaboleslav] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Lokotrans Aréna',5000,1902,_country.czechRepublic,64.5,[],{}];
    map[n.pardubice] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'CFIG Arena',4600,2008,_country.czechRepublic,58.9,[],{}];
    map[n.sigmaolomouc] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.6001989, 17.24822126),
      'Andrův stadion',12566,1919,_country.czechRepublic,64.0,[],{}];
    map[n.slaviapraha] = [ClubColors(Colors.red,Colors.white),pattern.divided,Coordinates(50.06761576, 14.4717161),
      'Stadion Eden',21000,1892,_country.czechRepublic,76.1,[n.spartapraga],{}];
    map[n.slovacko] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.914364, 14.619126),
      'Městský fotbalový Miroslava Valenty',8121,1927,_country.czechRepublic,68.8,[],{}];
    map[n.slovanliberec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(50.77632357, 15.0500971),
      'Stadion u Nisy',10000,1921,_country.czechRepublic,70.6,[],{}];
    map[n.spartapraga] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(50.0999540, 14.41632580),
      'Generali Arena',20111,1893,_country.czechRepublic,75.2,[n.slaviapraha],{}];
    map[n.teplice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(50.6400542, 13.81769347),
      'Na Stínadlech',18221,1945,_country.czechRepublic,69.6,[],{}];
    map[n.trinityzlin] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Letná Stadion',5898,1919,_country.czechRepublic,63.4,[],{}];
    map[n.viktoriaplzen] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(49.7500716, 13.385528253),
      'Doosan Arena',12500,1911,_country.czechRepublic,73.8,[],{}];
    map[n.dukla] = [ClubColors(vinho,Colors.yellow),pattern.sleeves,Coordinates(0, 0),
      'Stadion Juliska',18000,1946,_country.czechRepublic,50.0,[],{}];
    map[n.kladno] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(50.137826713759566, 14.091822484140616),
      'František Kloz Stadium',4000,1903,_country.czechRepublic,47.5,[],{}];
    map[n.hradec] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(50.20638984566382, 15.845242150269344),
      'Všesportovní stadion',7220,1905,_country.czechRepublic,60.2,[],{}];
    map[n.vitkovice] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(49.80446182549293, 18.255642918817998),
      'Městský stadion',15160,1919,_country.czechRepublic,63.1,[],{}];
    //HUNGRIA
    map[n.bekescsaba] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0,0),
      'Kórház utcai Stadion',4963,1912,_country.hungary,59.5,[],{}];
    map[n.csepel] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(47.41935584894101, 19.072826326885604),
      'Béke téri Stadion',10000,1912,_country.hungary,62.3,[],{}];
    map[n.debreceni] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.55435955, 21.63374620),
      'Nagyerdei Stadion',20020,1902,_country.hungary,68.7,[],{}];
    map[n.diosgyor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.099625491844364, 20.71733630661811),
      'Diósgyőri Stadion',15325,1910,_country.hungary,61.5,[],{}];
    map[n.fehervar] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(47.17372825, 18.41546374),
      'MOL Aréna Sóstó',14201,1941,_country.hungary,67.8,[],{}];
    map[n.ferencvaros] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(47.475396323, 19.0958288),
      'Gouprama Arena',22000,1899,_country.hungary,73.2,[],{}];
    map[n.gyori] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.69580, 17.663847462),
      'ETO Park',16000,1904,_country.hungary,69.0,[],{}];
    map[n.haladas] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(47.2348707, 16.606894),
      'Haladás Sportkomplexum',9859,1919,_country.hungary,63.5,[],{}];
    map[n.honved] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(47.442567, 19.1553822),
      'József Bozsik',15000,1909,_country.hungary,66.4,[],{}];
    map[n.kecskemet] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Széktói',6300,1911,_country.hungary,71.4,[],{}];
    map[n.kisvarda] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(48.23324767, 22.0744867),
      'Várkert Sportpálya',2750,1911,_country.hungary,65.7,[],{}];
    map[n.mezokovesd] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Városi',5000,1975,_country.hungary,60.5,[],{}];
    map[n.mtk] = [ClubColors(Colors.blue,Colors.white),pattern.diagonal,Coordinates(47.490919444,19.106725),
      'Hidegkuti Nándor Stadion',12700,1888,_country.hungary,68.1,[],{}];
    map[n.paks] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(46.63377451917269, 18.852161297499197),
      'Fehérvári úti Stadion',6150,1952,_country.hungary,69.6,[],{}];
    map[n.pecsi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(46.068974316, 18.19581976),
      'Stadium of Újmecsekalja',7000,1950,_country.hungary,64.6,[],{}];
    map[n.puskas] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(47.4640167, 18.586763),
      'Pancho Aréna',3816,2005,_country.hungary,67.5,[],{}];
    map[n.salgotarjani] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Tó-strandi Sporttelep',5000,1920,_country.hungary,56.5,[],{}];
    map[n.tatabanya] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(47.72165907, 18.7381678),
      'Stadion Gyula Grosics',5021,1910,_country.hungary,61.5,[],{}];
    map[n.ujpest] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(47.5750, 19.085368),
      'Ferenc Szusza',13600,1885,_country.hungary,68.6,[],{}];
    map[n.vac] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(47.767658, 19.13800025),
      'Stadion Városi Vác',9000,1899,_country.hungary,62.5,[],{}];
    map[n.vasas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(47.537036, 19.080578381),
      'Rudolf Illovszky',18000,1911,_country.hungary,65.3,[],{}];
    map[n.vasutas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(47.5235393, 19.0915621),
      'Szőnyi úti Stadion',12000,1911,_country.hungary,56.2,[],{}];
    map[n.zalaegerszeg] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(46.84870487, 16.84871709),
      'ZTE Arena',14000,1920,_country.hungary,66.3,[],{}];
    map[n.dunaujvaros] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.9556349, 18.9473997),
      'Dunaferr Arena',12000,1952,_country.hungary,62.5,[],{"extinto": 2009}]; //EXTINTO 2009
    //ROMENIA
    map[n.aerostarBacau] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(46.5297339, 26.91247324),
      'Aerostar',1500,1977,_country.romania,63.0,[],{}];
    map[n.argespitesti] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(44.8466756, 24.866616),
      'Stadionul Nicolae Dobrin',15000,1953,_country.romania,68.9,[],{}];
    map[n.astragiurgiu] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(43.89618939, 25.98156285),
      'Marin Anastasovici',8500,1921,_country.romania,56.8,[],{}];
    map[n.brasov] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(45.664853, 25.5857),
      'Estádio Silviu Ploeşteanu',8850,1936,_country.romania,55.7,[],{}];
    map[n.botosani] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Municipal',7782,2001,_country.romania,62.5,[],{}];
    map[n.chindiatargoviste] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Eugen Popescu',6500,2010,_country.romania,58.9,[],{}];
    map[n.cluj] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(46.779678,23.577247),
      'Stadionul Dr. Constantin Rădulescu',21000,1907,_country.romania,70.8,[],{}];
    map[n.dinamobucuresti] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(44.455083,26.102444),
      'Stadionul Dinamo',15300,1948,_country.romania,63.5,[],{}];
    map[n.farul] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Viitorul',4554,1920,_country.romania,68.7,[],{}];
    map[n.hermannstadt] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Municipal',12363,2015,_country.romania,61.8,[],{}];
    map[n.mioveni] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Orășenesc',10000,2000,_country.romania,57.8,[],{}];
    map[n.nationalbuc] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(44.42769962, 26.0747849),
      'Stadionul Cotroceni',14542,1944,_country.romania,64.3,[],{}];
    map[n.rapidbucuresti] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(44.45708788, 26.05564517),
      'Estádio Giulești-Valentin Stănescu',19100,1929,_country.romania,67.2,[],{}];
    map[n.steauabucuresti] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(44.43741937, 26.15314218),
      'Arena Națională',55634,1947,_country.romania,71.2,[],{}];
    map[n.arad] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(46.15233222, 21.319844858),
      'Stadionul Motorul',2000,1945,_country.romania,64.8,[],{}];
    map[n.craiova] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(44.3140987, 23.7841649),
      'Stadionul Ion Oblemenco',30983,1948,_country.romania,66.4,[],{}];
    map[n.otelul] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.solid,Coordinates(45.430125, 28.0224765),
      'Stadionul Oțelul',13500,1964,_country.romania,65.7,[],{}];
    map[n.petrolul] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(44.9406576, 26.03463332),
      'Stadionul Ilie Oană',15500,1952,_country.romania,62.1,[],{}];
    map[n.sepsi] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(45.8813477, 25.80823296),
      'Sepsi Arena',8400,2011,_country.romania,63.8,[],{}];
    map[n.targuMures] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio Trans-Sil',8200,2004,_country.romania,60.6,[],{}];
    map[n.unicluj] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Cluj Arena',30201,1919,_country.romania,63.6,[],{}];
    map[n.vitorul] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(44.236319, 28.56572443),
      'Stadionul Viitorul',4500,2009,_country.romania,64.7,[],{}];
    map[n.voluntari] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Anghel Iordănescu',4600,2010,_country.romania,63.7,[],{}];
    map[n.bacau] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      '',0,1950,_country.romania,50.0,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.sportul] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0, 0),
      'Regie',10020,1916,_country.romania,50.0,[],{"extinto": 2017}]; //EXTINTO 2017
    map[n.timisoara] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0, 0),
      '',0,2012,_country.romania,50.0,[],{"extinto": 2021}]; //EXTINTO 2021
    map[n.unirea] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      'Tineretului',7000,1954,_country.romania,50.0,[],{"extinto": 2015}]; //EXTINTO 2015
    map[n.victoriabuc] = [ClubColors(Colors.lightBlue,Colors.white),pattern.stripes3,Coordinates(0, 0),
      '',0,1949,_country.romania,50.0,[],{"extinto": 1990}]; //EXTINTO 1990
    //ESLOVAQUIA
    map[n.dac1904] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(50.91490, 14.6191298),
      'Mestský Stadion',16410,1904,_country.slovakia,64.5,[],{}];
    map[n.dubnica] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovakia,50.0,[],{}];
    map[n.duklaBanska] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Národný Atletický Štadión',7381,1965,_country.slovakia,63.8,[],{}];
    map[n.interbratislava] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(48.1760430, 17.05031259),
      'Stadium ŠKP Inter Dúbravka',10200,1940,_country.slovakia,68.3,[],{}];
    map[n.kosice] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(48.69671807, 21.2451513),
      'Košická futbalová aréna',5836,2018,_country.slovakia,62.8,[],{}];
    map[n.matadorpuchov] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovakia,50.0,[],{}];
    map[n.myjava] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(48.76101504816084, 17.56550412983127),
      'Stadium Myjava',2709,1920,_country.slovakia,59.4,[],{}];
    map[n.nitra] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovakia,50.0,[],{}];
    map[n.petrzalka] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(48.1197164581759, 17.133449395925975),
      'Stadium FC Petržalka 1898',1600,1898,_country.slovakia,64.4,[],{}];
    map[n.podbrezova] = [ClubColors(Colors.white,vinho),pattern.solid,Coordinates(0,0),
      'ZELPO Aréna',4061,1920,_country.slovakia,66.5,[],{}];
    map[n.ruzomberok] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(49.08229843882948, 19.28360220271273),
      'Štadión pod Čebraťom',4876,1906,_country.slovakia,62.4,[],{}];
    map[n.senica] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovakia,50.0,[],{}];
    map[n.sered] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Štadión Sereď',2800,1914,_country.slovakia,53.1,[],{}];
    map[n.slovanbratislava] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(48.1659626, 17.14220898),
      'Pasienky',30085,1919,_country.slovakia,72.7,[],{}];
    map[n.tatranpresov] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(49.006846252628, 21.234699696777707),
      'Tatran Stadium',2000,1898,_country.slovakia,55.4,[],{}];
    map[n.lipstovsky] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadium Liptovský Mikuláš',1934,1934,_country.slovakia,55.2,[],{}];
    map[n.trencin] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(48.89864951050542, 18.04440168409644),
      'Štadión na Sihoti',3500,1992,_country.slovakia,60.4,[],{}];
    map[n.trnava] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(48.3736672, 17.5916824),
      'Štadión Antona Malatinského',18448,1923,_country.slovakia,68.1,[],{}];
    map[n.skalica] = [ClubColors(Colors.white,Colors.green),pattern.horStripes3,Coordinates(0,0),
      'Mestský štadión Skalica',3000,1920,_country.slovakia,58.4,[],{}];
    map[n.zemplin] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Mestský futbalový štadión',4440,1912,_country.slovakia,61.3,[],{}];
    map[n.zlate] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'ViOn Aréna',4000,1995,_country.slovakia,59.7,[],{}];
    map[n.zilina] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(49.229209, 18.7446925),
      'Štadión pod Dubňom',11258,1908,_country.slovakia,67.3,[],{}];

    //OUTROS
    //ALBANIA
    map[n.besa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.albania,50.0,[],{}];
    map[n.bylis] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Adush Muça Stadium',5200,1972,_country.albania,60.8,[],{}];
    map[n.dinamotirana] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.318298, 19.8241820),
      'Arena Kombëtare',21690,1950,_country.albania,62.0,[],{}];
    map[n.egnatia] = [ClubColors(darkgreen,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Arena Egnatia',4000,1934,_country.albania,64.3,[],{}];
    map[n.elbasani] = [ClubColors(Colors.yellow,Colors.blue),pattern.horStripes3,Coordinates(41.6424706, 19.711743),
      'Stadiumi “Elbasan Arena”',12800,1913,_country.albania,57.3,[],{}];
    map[n.erzeni] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Tefik Jashari Stadium',4000,1931,_country.albania,64.8,[],{}];
    map[n.flamurtari] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(40.4558467, 19.48874438),
      'Flamurtari Stadium',8500,1923,_country.albania,60.6,[],{}];
    map[n.kastrioti] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Kastrioti Stadium',10000,1926,_country.albania,61.6,[],{}];
    map[n.tirana] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(41.319399, 19.81133),
      'Selman Stermasi Stadium',7000,1920,_country.albania,68.1,[],{}];
    map[n.kukesi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.079203526, 20.42031655),
      'Zeqir Ymeri Stadium',6000,1930,_country.albania,63.2,[],{}];
    map[n.luftetari] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.albania,50.0,[],{}];
    map[n.laci] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(41.6424706, 19.711743),
      'Laçi Stadium',4500,1960,_country.albania,64.3,[],{}];
    map[n.partizanitirane] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.3191655, 19.8114063),
      'Selman Stërmasi Stadium',20600,1946,_country.albania,69.5,[],{}];
    map[n.skenderbeu] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(40.626209, 20.7830302),
      'Skënderbeu Stadium',12000,1909,_country.albania,61.8,[],{}];
    map[n.teuta] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.3262515, 19.4497168),
      'Stadioni Niko Dovana',13000,1920,_country.albania,63.0,[],{}];
    map[n.tomori] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.albania,50.0,[],{}];
    map[n.vllaznia] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(42.07005, 19.5066547),
      'Loro-Boriçi Stadium',20300,1919,_country.albania,63.5,[],{}];
    //ESLOVENIA
    map[n.beltinci] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovenia,50.0,[],{}];
    map[n.bravo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Šiška Sports Park',2300,2006,_country.slovenia,62.7,[],{}];
    map[n.celje] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(46.2465780, 15.2699934),
      'Arena Petrol',13006,1919,_country.slovenia,65.6,[],{}];
    map[n.domzale] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(46.136925, 14.60178),
      'Športni Park',3212,1921,_country.slovenia,66.2,[],{}];
    map[n.goricaSLO] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Nova Gorica Sports Park',3100,1947,_country.slovenia,61.8,[],{}];
    map[n.koper] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(45.54241704, 13.730497),
      'Bonifika',4047,1920,_country.slovenia,62.2,[],{}];
    map[n.oljublijana] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(46.0804351, 14.524180),
      'Športni park Stožice',16038,2005,_country.slovenia,69.5,[],{}];
    map[n.maribor] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(46.5625,15.640556),
      'Ljudski vrt',12702,1960,_country.slovenia,70.8,[],{}];
    map[n.mura] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(46.6685624, 16.1575858),
      'Fazanerija',3782,2012,_country.slovenia,65.7,[],{}];
    map[n.primorje] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovenia,50.0,[],{}];
    map[n.radomlje] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Domžale Sports Park',3100,1972,_country.slovenia,60.7,[],{}];
    map[n.rudarvelenje] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.slovenia,50.0,[],{}];
    map[n.taborsezana] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Rajko Štolfa Stadium',1310,1923,_country.slovenia,58.2,[],{}];
    //MACEDONIA
    map[n.akademijapandev] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(41.437822, 22.768785),
      'Stadion Kukuš',1500,2010,_country.macedonia,62.3,[],{}];
    map[n.belasica] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.bregalnica] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.makedonija] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(42.002417, 21.359890),
      'Gjorče Petrov Stadium',5000,1932,_country.macedonia,65.8,[],{}];
    map[n.metalurgMAC] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.milano] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.pelister] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.pobeda] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.3436145, 21.562009),
      'Stadion Goce Delčev',15000,1941,_country.macedonia,65.6,[],{}];
    map[n.rabotnicki] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.0057251, 21.4255607),
      'Philip II Arena',24000,1937,_country.macedonia,63.2,[],{}];
    map[n.renova] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.sileks] = [ClubColors(Colors.blue,Colors.red),pattern.stripes4,Coordinates(42.0808824, 22.1640989),
      'Gradski stadion Kratovo',1800,1965,_country.macedonia,67.5,[],{}];
    map[n.shkendija] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(42.0186995, 20.97822),
      'Čair Stadium',15000,1979,_country.macedonia,64.4,[],{}];
    map[n.shkupi] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.015522, 21.4446538),
      'Čair Stadium',6000,1927,_country.macedonia,64.1,[],{}];
    map[n.skopje] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.struga] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.tikvesh] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.macedonia,50.0,[],{}];
    map[n.vardar] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(42.0060954, 21.425804),
      'Nacional Arena Philip II Macedônia',24000,1947,_country.macedonia,68.2,[],{}];
    map[n.slogajugomagnat] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Čair Stadium',6000,1927,_country.macedonia,50.0,[],{"extinto": 2009}]; //EXTINTO 2009
    //BOSNIA
    map[n.borac] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(44.77602781224624, 17.19941990741966),
      'Banja Luka City Stadium',10030,1926,_country.bosnia,62.7,[],{}];
    map[n.igmankonjic] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion Igmana',5000,1920,_country.bosnia,57.3,[],{}];
    map[n.leotar] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Police Stadium',8550,1925,_country.bosnia,58.5,[],{}];
    map[n.modrica] = [ClubColors(Colors.blue,Colors.yellow),pattern.divided,Coordinates(44.95510428356683, 18.307860185535727),
      'Dr. Milan Jelić',6000,1922,_country.bosnia,56.7,[],{}];
    map[n.posusje] = [ClubColors(Colors.white,Colors.blue),pattern.stripes2,Coordinates(43.4693346, 17.32777),
      'Stadion Mokri Dolac',8000,1950,_country.bosnia,63.6,[],{}];
    map[n.sarajevo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.87391863, 18.409078),
      'Asim Ferhatović Hase',35630,1946,_country.bosnia,65.9,[],{}];
    map[n.siroki] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(43.378697, 17.5979072),
      'Pecara Stadium',8000,1948,_country.bosnia,61.5,[],{}];
    map[n.slobodatuzla] = [ClubColors(Colors.red,Colors.black),pattern.oneVertStripe,Coordinates(0,0),
      'Stadion Tušanj',7200,1919,_country.bosnia,61.4,[],{}];
    map[n.slogameridian] = [ClubColors(Colors.red,Colors.blue),pattern.sleeves,Coordinates(0,0),
      'Luke Stadium',3000,1945,_country.bosnia,55.5,[],{}];
    map[n.tuzla] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Tušanj City Stadium',7200,1955,_country.bosnia,56.7,[],{}];
    map[n.zeljeznicar] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(43.8465035, 18.3874076),
      'Stadion Grbavica',20841,1921,_country.bosnia,66.1,[],{}];
    map[n.zrinjski] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(43.3456540, 17.795418),
      'Bijeli Brijeg Stadium',25000,1905,_country.bosnia,68.0,[],{}];
    //KOSOVO
    map[n.ballkani] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(42.38421140, 20.434450),
      'Suva Reka City Stadium',1500,1947,_country.kosovo,64.8,[],{}];
    map[n.besapeje] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.drenica] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Bajram Aliu Stadium',9000,1958,_country.kosovo,54.3,[],{}];
    map[n.drita] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(42.46440065, 21.476240),
      'Gjilan City Stadium',15000,1947,_country.kosovo,63.0,[],{}];
    map[n.dukagjini] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      '18 June Stadium',1000,1958,_country.kosovo,56.0,[],{}];
    map[n.ferizaj] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      '	Ismet Shabani Stadium',2000,1923,_country.kosovo,56.8,[],{}];
    map[n.feronikeli] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Rexhep Rexhepi Stadium',6000,1974,_country.kosovo,61.6,[],{}];
    map[n.gjilani] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Gjilan City Stadium',15000,1945,_country.kosovo,58.3,[],{}];
    map[n.hajvalia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.hysi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.kosovavushtrri] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.liria] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.llapi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.90515045, 21.19488228),
      'Zahir Pajaziti Stadium',5000,1932,_country.kosovo,63.5,[],{}];
    map[n.malisheva] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Liman Gegaj Stadium',1800,2016,_country.kosovo,55.3,[],{}];
    map[n.prishtina] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.6628634, 21.15705135),
      'Estádio Pristina City',16200,1922,_country.kosovo,64.6,[],{}];
    map[n.trepca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    map[n.trepca89] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Riza Lushta Stadium',5000,1992,_country.kosovo,61.3,[],{}];
    map[n.vellaznimi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kosovo,50.0,[],{}];
    //MONTENEGRO
    map[n.arsenaltivat] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion u parku',2000,1914,_country.montenegro,62.5,[],{}];
    map[n.decic] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.360000, 19.32624168),
      'Stadion Tuško Polje',2000,1926,_country.montenegro,62.1,[],{}];
    map[n.iskra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.7849487, 18.9537585),
      'Braća Velašević Stadium',2500,1919,_country.montenegro,60.7,[],{}];
    map[n.buducnost] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(42.44493750, 19.26417934),
      'Stadion pod Goricom',12000,1925,_country.montenegro,66.1,[],{}];
    map[n.grbalj] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.montenegro,50.0,[],{}];
    map[n.jedinstvo] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Gradski stadion',4000,1922,_country.montenegro,58.5,[],{}];
    map[n.jezero] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stadion Pod Racinom',3000,1934,_country.montenegro,60.4,[],{}];
    map[n.iskra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Braća Velašević Stadium',2500,1919,_country.montenegro,62.5,[],{}];
    map[n.kom] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.montenegro,50.0,[],{}];
    map[n.mornar] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion Topolica',2500,1923,_country.montenegro,58.1,[],{}];
    map[n.petrovac] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Stadion Mitar Mićo Goliš',1630,1969,_country.montenegro,58.4,[],{}];
    map[n.podgorica] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.montenegro,50.0,[],{}];
    map[n.rudar] = [ClubColors(darkblue,Colors.red),pattern.horStripes3,Coordinates(45.72432, 16.0732426),
      'Gradski stadion',5140,1920,_country.montenegro,61.5,[],{}];
    map[n.sutjeska] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(45.72432, 16.0734067),
      'Gradski stadion',5214,1927,_country.montenegro,63.8,[],{}];
    map[n.ofktitograd] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(42.429458, 19.282983),
      'Mladost Stadium',1250,1951,_country.montenegro,57.8,[],{}];
    map[n.zeta] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.32850749, 19.2405928),
      'Stadion Trešnjica',4000,1927,_country.montenegro,56.3,[],{}];
    map[n.mogren] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stadion Lugovi',1500,1920,_country.montenegro,50.0,[],{"extinto": 2017}]; //EXTINTO 2017
    //LUXEMBURGO
    map[n.avenir] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.6464919, 6.135636),
      'Stade rue Henri Dunant',4830,1915,_country.luxembourg,62.7,[],{}];
    map[n.differdange03] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Stadium vun der Stad Déifferdeng',3800,2003,_country.luxembourg,56.3,[],{}];
    map[n.dudelange] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(49.473037, 6.08512806),
      'Jos Nosbaum',2558,1921,_country.luxembourg,64.4,[],{}];
    map[n.etzella] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stade Am Deich',2020,1917,_country.luxembourg,52.0,[],{}];
    map[n.folaesch] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(49.492051311, 5.989538023),
      'Stade Émile Mayrisch',7826,1906,_country.luxembourg,58.4,[],{}];
    map[n.grevenmacher] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(49.68692217522475, 6.448390101581063),
      'Op Flohr Stadion',4062,1909,_country.luxembourg,52.1,[],{}];
    map[n.hostert] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Stade Jos Becker',1500,1946,_country.luxembourg,54.3,[],{}];
    map[n.jeunesseesch] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(49.48596292, 5.97704983),
      'Stade de la Frontière',8200,1907,_country.luxembourg,63.1,[],{}];
    map[n.kaerjeng] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(0,0),
      'Stade um Bëchel',1000,1997,_country.luxembourg,53.5,[],{}];
    map[n.mondercange] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Stade Communal',1933,1933,_country.luxembourg,50.0,[],{}];
    map[n.mondorf] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'Stade John Grün',3600,1915,_country.luxembourg,51.7,[],{}];
    map[n.niederkorn] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Stade Jos Haupert',4830,1919,_country.luxembourg,58.4,[],{}];
    map[n.rumelange] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(49.456698243655175, 6.032589413992412),
      'Stade Municipal Rumelange',2950,1908,_country.luxembourg,52.1,[],{}];
    map[n.swifthesperange] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stade Alphonse Theis',3058,1916,_country.luxembourg,62.1,[],{}];
    map[n.unionlux] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(49.60474, 6.1402570),
      'Stade Achille Hammerel',7611,1925,_country.luxembourg,58.3,[],{}];
    map[n.unionpetange] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stade Municipal',2400,2015,_country.luxembourg,57.9,[],{}];
    map[n.unastrassen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Complexe Sportif Jean Wirtz',0,1922,_country.luxembourg,54.2,[],{}];
    map[n.victoriarosport] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'VictoriArena',2500,1928,_country.luxembourg,54.2,[],{}];
    map[n.wiltz71] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Am Pëtz',3000,1971,_country.luxembourg,55.1,[],{}];
    map[n.arisbennevoie] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Stade Josy Barthel',8054,1922,_country.luxembourg,50.0,[],{"extinto": 2001}]; //EXTINTO 2001
    map[n.differdange] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade du Thillenberg',7150,1907,_country.luxembourg,50.0,[],{"extinto": 2003}]; //EXTINTO 2003
    map[n.sporalux] = [ClubColors(darkblue,Colors.yellow),pattern.oneHorStripe,Coordinates(0, 0),
      'Stade Josy Barthel,',8054,1923,_country.luxembourg,50.0,[],{"extinto": 2005}]; //EXTINTO 2005 VIROU RACING LUXEMBURG
    map[n.stadedud] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Stade Aloyse Meyer',3000,1913,_country.luxembourg,50.0,[],{"extinto": 1991}]; //EXTINTO 1991 VIROU F91 DUDELANGE
    //Liechtenstein
    map[n.balzers] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.073456, 9.494012),
      'Sportplatz Rheinau',2000,1932,_country.liechtenstein,62.8,[],{}];
    map[n.eschenMauren] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(47.20567226, 9.53788747),
      'Sportpark Eschen-Mauren',6000,1963,_country.liechtenstein,64.7,[],{}];
    map[n.rugell] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(47.246507411, 9.52702523),
      'Freizeitpark Widau',500,1958,_country.liechtenstein,61.6,[],{}];
    map[n.schaan] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(47.16575044, 9.49254718),
      'Sportanlage Rheinwiese',1500,1949,_country.liechtenstein,59.5,[],{}];
    map[n.triesen] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.110492, 9.519495),
      'Sportanlage Blumenau',2100,1932,_country.liechtenstein,55.4,[],{}];
    map[n.vaduz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(47.1404698, 9.51056035),
      'Rheinpark Stadion',7838,1932,_country.liechtenstein,68.3,[],{}];
    //MALTA
    map[n.balzan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.89530579826647, 14.459023692752922),
      'St Aloysius College',0,1937,_country.malta,60.5,[],{}];
    map[n.birkirkara] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(35.895129, 14.45902679),
      'Infetti Ground',1500,1950,_country.malta,61.8,[],{}];
    map[n.floriana] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(35.8951638, 14.5057624),
      'Independence Ground',3000,1894,_country.malta,63.4,[],{}];
    map[n.gudjaunited] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1945,_country.malta,58.7,[],{}];
    map[n.gziraunited] = [ClubColors(grena,Colors.lightBlueAccent),pattern.solid,Coordinates(0,0),
      '',0,1947,_country.malta,62.3,[],{}];
    map[n.hamrunspartans] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(35.8874298, 14.49243820),
      'Victor Tedesco Stadium',2000,1907,_country.malta,66.4,[],{}];
    map[n.hiberniansMALTA] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(35.8826548, 14.5131219),
      'Hibernians Stadium',2968,1922,_country.malta,66.1,[],{}];
    map[n.marsaxlokk] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.83648264, 14.543407218),
      'Marsaxlokk Ground',1000,1949,_country.malta,56.5,[],{}];
    map[n.marsaMAL] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.melita] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.mosta] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Charles Abela Memorial Stadium',700,1935,_country.malta,57.1,[],{}];
    map[n.mqabba] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.msidasaintjoseph] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.naxxarlions] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.pietahotspurs] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1968,_country.malta,53.1,[],{}];
    map[n.qormi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.rabatajax] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(35.89291065, 14.401519269),
      'Rabat Ajax Football Ground',700,1930,_country.malta,52.5,[],{}];
    map[n.sirens] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Sirens Stadium',1300,1968,_country.malta,57.1,[],{}];
    map[n.sliemawanderers] = [ClubColors(Colors.blueAccent,Colors.blue),pattern.solid,Coordinates(35.89488, 14.415361),
      'Estádio Ta\' Qali',18000,1909,_country.malta,63.6,[],{}];
    map[n.standrews] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.stgeorges] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.stlucia] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(0,0),
      '',0,1974,_country.malta,53.5,[],{}];
    map[n.stpatrick] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.tarxienrainbows] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    map[n.valletta] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(35.8950, 14.414893),
      'Estádio Ta\' Qali',18000,1943,_country.malta,65.1,[],{}];
    map[n.zebbugrangers] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Żebbuġ Ground',1000,1943,_country.malta,54.0,[],{}];
    map[n.zurrieq] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malta,50.0,[],{}];
    //SAN MARINO
    map[n.cailungo] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(44.41178756, 11.91494792),
      'Stadio Domagnano e Piccolo Maracana',1000,1974,_country.sanMarino,54.3,[],{}];
    map[n.cosmos] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(43.97129379, 12.476970436),
      'San Marino Stadium',7000,1979,_country.sanMarino,52.5,[],{}];
    map[n.dogana] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico de San Marino',6664,2000,_country.sanMarino,51.3,[],{}];
    map[n.domagnano] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(43.945397197, 12.46627922),
      'Campo Sportivo di Domagnano',1000,1966,_country.sanMarino,55.8,[],{}];
    map[n.faetano] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes2,Coordinates(43.9714, 12.476),
      'San Marino Stadium',7000,1962,_country.sanMarino,58.6,[],{}];
    map[n.fiorentino] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(43.9086611, 12.44787658),
      'Estádio de Fiorentino',700,1974,_country.sanMarino,51.5,[],{}];
    map[n.folgore] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(43.97135136, 12.4772219),
      'San Marino Stadium',7000,1972,_country.sanMarino,58.6,[],{}];
    map[n.lafiorita] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(43.91492856, 12.48212),
      'Estádio Igor Crescentini',4000,1967,_country.sanMarino,62.5,[],{}];
    map[n.libertas] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(43.935015, 12.4518146),
      'Campo sportivo di Borgo Maggiore',1000,1928,_country.sanMarino,57.4,[],{}];
    map[n.murata] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(43.9454066, 12.4661100),
      'Campo Sportivo di Montegiardino',1000,1966,_country.sanMarino,53.6,[],{}];
    map[n.pennarossa] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(43.9036489, 12.42405876),
      'Campo Sportivo di Chiesanuova',1000,1968,_country.sanMarino,57.4,[],{}];
    map[n.sangiovanni] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Stadio Borgo Maggiore',1000,1948,_country.sanMarino,52.3,[],{}];
    map[n.trefiori] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(43.9086749, 12.4480538),
      'Campo Sportivo di Fiorentino',1000,1949,_country.sanMarino,59.5,[],{}];
    map[n.trepenne] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.oneHorStripe,Coordinates(43.92955, 12.4428307),
      'Stadio Fonte dell\'Ovo',500,1956,_country.sanMarino,60.1,[],{}];
    map[n.virtus] = [ClubColors(darkgreen,Colors.black),pattern.stripes3,Coordinates(43.946989, 12.4100658),
      'Stadio di Acquaviva',2000,1964,_country.sanMarino,55.1,[],{}];
    //GIBRALTAR
    map[n.brunosmagpies] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Victoria Stadium',2000,2013,_country.gibraltar,50.0,[],{}];
    map[n.europa] = [ClubColors(Colors.black,Colors.green),pattern.stripes2,Coordinates(36.1491889, -5.3500741),
      'Victoria Stadium',2000,1925,_country.gibraltar,62.6,[],{}];
    map[n.gibraltar] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.1492, -5.351),
      'Victoria Stadium',2000,1943,_country.gibraltar,55.3,[],{}];
    map[n.glacis] = [ClubColors(grena,Colors.lightBlueAccent),pattern.sleeves,Coordinates(36.1491, -5.350),
      'Victoria Stadium',2000,1965,_country.gibraltar,52.6,[],{}];
    map[n.manchester62] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.1490, -5.349),
      'Victoria Stadium',2000,1962,_country.gibraltar,56.7,[],{}];
    map[n.gibraltar] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(36.1492, -5.351),
      'Victoria Stadium',2000,1943,_country.gibraltar,55.3,[],{}];
    map[n.lynx] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '	Victoria Stadium',2000,2007,_country.gibraltar,53.0,[],{}];
    map[n.stJosephs] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(36.1497253, -5.350840),
      'Victoria Stadium',2000,1912,_country.gibraltar,56.5,[],{}];
    map[n.stTheresas] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.gibraltar,50.0,[],{}];
    map[n.britannia] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.stripes3,Coordinates(0,0),
      'Victoria Stadium',2000,1907,_country.gibraltar,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    //ANDORRA
    map[n.andorra] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(42.50127, 1.514),
      'Estádio Comunal de Aixovall',1800,1942,_country.andorra,65.6,[],{}];
    map[n.atleticescaldes] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Andorra Football Federation stadiums',1800,2002,_country.andorra,61.4,[],{}];
    map[n.constellacio] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.andorra,50.0,[],{}];
    map[n.encamp] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(42.53030662258441, 1.5712522769708217),
      'Camp de Futbol \'Encamp',550,1950,_country.andorra,52.1,[],{}];
    map[n.engordany] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.andorra,50.0,[],{}];
    map[n.escaldes] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(42.50082, 1.51367674),
      'Estádio Comunal de Aixovall',1800,1993,_country.andorra,63.4,[],{}];
    map[n.fcrangers] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(42.50434786080549, 1.5174264328185088),
      'Andorra Football Federation stadiums',1800,1981,_country.andorra,47.1,[],{}];
    map[n.ordino] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Andorra Football Federation stadiums',1800,2010,_country.andorra,54.2,[],{}];
    map[n.penyaencarnada] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Andorra Football Federation stadiums',1800,2009,_country.andorra,56.1,[],{}];
    map[n.santacolomafc] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(42.50147, 1.514271),
      'Estádio Comunal de Aixovall',1800,1986,_country.andorra,62.1,[],{}];
    map[n.santacolomaue] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Andorra Football Federation stadiums',1800,1986,_country.andorra,59.4,[],{}];
    map[n.santjulia] = [ClubColors(Colors.orange,Colors.white),pattern.sleeves,Coordinates(42.50118, 1.51387),
      'Estádio Comunal de Aixovall',1800,1982,_country.andorra,60.2,[],{}];
    map[n.lusitanos] = [ClubColors(Colors.white,darkgreen),pattern.solid,Coordinates(0, 0),
      'Andorra Football Federation stadiums',1800,1999,_country.andorra,50.0,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.principat] = [ClubColors(Colors.purple,Colors.black),pattern.oneHorStripe,Coordinates(0, 0),
      'Andorra Football Federation stadiums',1800,1989,_country.andorra,50.0,[],{"extinto": 2015}]; //EXTINTO 2015


    ///////////////////////////////////////////////////////////////////////////
    map[n.atleticomg] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-19.86583,-43.97080),
      'Mineirão',61927,1900,_country.brazil,78.6,[n.cruzeiro],{},_country.mg];
    map[n.atleticopr] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(-25.448333,-49.276944),
      'Arena da Baixada',42372,1924,_country.brazil,74.5,[n.coritiba],{},_country.pr];
    map[n.botafogo] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-22.893172,-43.292269),
      'Nilton Santos',46831,1904,_country.brazil,75.7,[n.flamengo,n.vasco,n.fluminense],{},_country.rj];
    map[n.cruzeiro] = [ClubColors(Colors.blueAccent,Colors.white),pattern.solid,Coordinates(-19.865833,-43.970833),
      'Mineirão',61927,1921,_country.brazil,74.3,[n.atleticomg],{},_country.mg];
    map[n.corinthians] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.545555,-46.474),
      'Neo Química Arena',47605,1910,_country.brazil,77.2,[n.palmeiras,n.saopaulo,n.santos],{},_country.sp];
    map[n.coritiba] = [ClubColors(Colors.white,Colors.green,Colors.green),pattern.sp,Coordinates(-25.421111,-49.2595),
      'Couto Pereira',40502,1909,_country.brazil,73.8,[n.atleticopr],{},_country.pr];
    map[n.flamengo] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-22.911357, -43.230113),
      'Maracanã',78838,1895,_country.brazil,80.2,[n.botafogo,n.vasco,n.fluminense],{},_country.rj];
    map[n.fluminense] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(-22.913116, -43.2303602),
      'Maracanã',78838,1902,_country.brazil,76.1,[n.flamengo,n.vasco,n.botafogo],{},_country.rj];
    map[n.fortaleza] = [ClubColors(Colors.red,Colors.blue),pattern.horStripes2,Coordinates(-3.807,-38.522),
      'Castelão',63904,1918,_country.brazil,74.0,[n.ceara],{},_country.ce];
    map[n.gremio] = [ClubColors(Colors.lightBlueAccent,Colors.black,Colors.white),pattern.stripesTricolor,Coordinates(-29.972884, -51.1949268),
      'Arena do Grêmio',55662,1903,_country.brazil,74.6,[n.internacional],{},_country.rs];
    map[n.internacional] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-30.06485477, -51.23599),
      'Beira-Rio',50128,1909,_country.brazil,76.8,[n.gremio],{},_country.rs];
    map[n.palmeiras] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-23.52744641540078, -46.6784),
      'Allianz Parque',43713,1914,_country.brazil,79.3,[n.saopaulo,n.corinthians,n.santos],{},_country.sp];
    map[n.santos] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.9510286, -46.338936366),
      'Vila Belmiro',17923,1912,_country.brazil,74.8,[n.palmeiras,n.corinthians,n.saopaulo],{},_country.sp];
    map[n.saopaulo] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-23.600125,-46.720155555),
      'Morumbi',66795,1930,_country.brazil,76.4,[n.palmeiras,n.corinthians,n.santos],{},_country.sp];
    map[n.vasco] = [ClubColors(Colors.black,Colors.white),pattern.diagonal,Coordinates(-22.890916666,-43.228252777),
      'São Januário',21880,1898,_country.brazil,73.3,[n.flamengo,n.fluminense,n.botafogo],{},_country.rj];

//AC
    map[n.adesg] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0, 0),
      'Naborzão',2000,1982,_country.brazil,50.0,[],{},_country.ac];
    map[n.andira] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arena da Floresta',20000,1964,_country.brazil,50.0,[],{},_country.ac];
    map[n.atleticoAC] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-10.0021, -67.8041498),
      'Arena da Floresta',13700,1952,_country.brazil,50.0,[],{},_country.ac];
    map[n.galvez] = [ClubColors(Colors.yellow,darkgreen),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ac];
    map[n.humaita] = [ClubColors(Colors.white,Colors.red,Colors.green),pattern.solid2,Coordinates(-10.002439, -67.80401096),
      'Arena da Floresta',20000,2003,_country.brazil,50.0,[],{},_country.ac];
    map[n.independencia] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Marinho Monte',1000,1946,_country.brazil,50.0,[],{},_country.ac];
    map[n.juventusAC] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ac];
    map[n.riobrancoAC] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-9.97037785, -67.8079834),
      'José de Melo',6000,1919,_country.brazil,50.0,[],{},_country.ac];
    map[n.vascoAC] = [ClubColors(Colors.black,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Florestão',10000,1952,_country.brazil,50.0,[],{},_country.ac];
//AL
    map[n.asa] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-9.7474835, -36.66681596),
      'Fumeirão',15000,1952,_country.brazil,50.0,[],{},_country.al];
    map[n.capelense] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Manoel Moreira',8000,1946,_country.brazil,50.0,[],{},_country.al];
    map[n.confianca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-10.8944975, -37.0538261),
      'Sabino Ribeiro',3000,1936,_country.brazil,50.0,[],{},_country.al];
    map[n.corinthiansAL] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,1991,_country.brazil,50.0,[],{"extinto": 2013},_country.al]; //EXTINTO 2013
    map[n.coruripe] = [ClubColors(Colors.white,Colors.green,Colors.orange,),pattern.solid,Coordinates(0,0),
      'Gerson Amaral',7000,2003,_country.brazil,50.0,[],{},_country.al];
    map[n.crb] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(-9.67054432, -35.75930852),
      'Rei Pelé',17126,1912,_country.brazil,70.9,[n.csa],{},_country.al];
    map[n.csa] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-9.6705, -35.7593),
      'Rei Pelé',17126,1913,_country.brazil,71.2,[n.crb],{},_country.al];
    map[n.cse] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Juca Sampaio',8000,1947,_country.brazil,50.0,[],{},_country.al];
    map[n.ferroviarioAL] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Cleto Marques Luz',4000,1937,_country.brazil,50.0,[],{},_country.al];
    map[n.miguelense] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.al];
    map[n.murici] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'José Gomes da Costa',3500,1974,_country.brazil,50.0,[],{},_country.al];
    map[n.penedense] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Alfredo Leahy',6000,1932,_country.brazil,50.0,[],{},_country.al];
//AM
    map[n.amazonas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-3.0844007, -59.9838851),
      'Estádio Municipal Carlos Zamith',5000,2019,_country.brazil,50.0,[],{},_country.am];
    map[n.americaAM] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Arena da Amazônia',44000,1939,_country.brazil,50.0,[],{},_country.am];
    map[n.gremiocoariense] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio José Rosquildes',7000,1977,_country.brazil,50.0,[],{},_country.am];
    map[n.autoesporteAM] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes4,Coordinates(0,0),
      '',0,1950,_country.brazil,50.0,[],{},_country.am]; //EXTINTO
    map[n.fast] = [ClubColors(Colors.white,Colors.red,Colors.blue),pattern.sp,Coordinates(-3.12155505, -60.03779047),
      'Colina',10000,1930,_country.brazil,50.0,[],{},_country.am];
    map[n.holanda] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Carlos Zamith',5000,2007,_country.brazil,50.0,[],{},_country.am];
    map[n.nacionalAM] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-3.084092564, -60.02796159),
      'Arena da Amazônia',44000,2013,_country.brazil,50.0,[],{},_country.am];
    map[n.manaus] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-3.082731444, -60.02706630),
      'Arena da Amazônia',44000,2013,_country.brazil,50.0,[],{},_country.am];
    map[n.penarolAM] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.am];
    map[n.princesasolimoes] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-3.283451615, -60.6316817),
      'Gilbertão',15000,1971,_country.brazil,50.0,[],{},_country.am];
    map[n.rionegro] = [ClubColors(Colors.black,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio Carlos Zamith',5500,1913,_country.brazil,50.0,[],{},_country.am];
    map[n.saoraimundo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-3.1215126, -60.037779),
      'Ismael Benigno',10000,1918,_country.brazil,50.0,[],{},_country.am];
    map[n.sulamerica] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Colina',10000,1932,_country.brazil,50.0,[],{},_country.am];
//AP
    map[n.amapa] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Zerão',10000,1944,_country.brazil,50.0,[],{},_country.ap];
    map[n.cristalAP] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Municipal Glicério Marques',3500,1969,_country.brazil,50.0,[],{},_country.ap];
    map[n.juventusAP] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Glicério Marques',5630,1959,_country.brazil,50.0,[],{},_country.ap]; //EXTINTO
    map[n.independenteAP] = [ClubColors(darkgreen,Colors.white),pattern.oneVertStripe,Coordinates(0,0),
      'Augusto Antunes',5000,1962,_country.brazil,50.0,[],{},_country.ap];
    map[n.macapa] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Zerão',13000,1941,_country.brazil,50.0,[],{},_country.ap];
    map[n.santanaAP] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Augusto Antunes',5000,1955,_country.brazil,50.0,[],{},_country.ap];
    map[n.santosAP] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Zerão',13000,1973,_country.brazil,50.0,[n.saopauloAP],{},_country.ap];
    map[n.saojoseAP] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-30.006611, -51.173485531),
      'Estádio Milton Corrêa',13000,1946,_country.brazil,50.0,[],{},_country.ap];
    map[n.saopauloAP] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Glicério Marques',3000,1988,_country.brazil,50.0,[n.santosAP],{},_country.ap];
    map[n.trem] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(0.0006848359, -51.0808365),
      'Zerão',13680,1947,_country.brazil,50.0,[],{},_country.ap];
    map[n.ypirangaAP] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0.000243024, -51.08084246),
      'Zerão',13680,1963,_country.brazil,50.0,[],{},_country.ap];
//BA
    map[n.alagoinhas] = [ClubColors(Colors.red,Colors.black,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Antônio Carneiro',16000,1970,_country.brazil,50.0,[],{},_country.ba];
    map[n.bahia] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-12.978819444,-38.504252777),
      'Arena Fonte Nova',50025,1931,_country.brazil,72.4,[n.vitoria,n.sport],{},_country.ba];
    map[n.bahiafeira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-12.27632, -38.93577856),
      'Arena Cajueiro',7000,1937,_country.brazil,50.0,[],{},_country.ba];
    map[n.botafogoBA] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Estádio Pedro Amorim Duarte',6120,1914,_country.brazil,50.0,[],{},_country.ba];
    map[n.catuense] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Antônio Pena',8000,1974,_country.brazil,50.0,[],{},_country.ba];
    map[n.fluminensefeira] = [ClubColors(vinho,darkgreen,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Joia da Princesa',16274,1941,_country.brazil,50.0,[],{},_country.ba];
    map[n.galicia] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Parque Santiago',2000,1933,_country.brazil,50.0,[],{},_country.ba];
    map[n.ilheus] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(0,0),
      'Mário Pessoa',10000,1948,_country.brazil,50.0,[],{},_country.ba];
    map[n.itabuna] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ba];
    map[n.jacuipense] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-11.8078703, -39.37936807),
      'Estádio Eliel Martins',5000,1965,_country.brazil,50.0,[],{},_country.ba];
    map[n.juazeirense] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ba];
    map[n.juazeiro] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Adauto Moraes',8000,1995,_country.brazil,50.0,[],{},_country.ba];
    map[n.leonico] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Edgard Santos',30000,1940,_country.brazil,50.0,[],{},_country.ba];
    map[n.vitoria] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-12.91850220, -38.42813070),
      'Barradão',30618,1899,_country.brazil,67.3,[n.bahia],{},_country.ba];
    map[n.ypirangaBA] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Vila Canária',4000,1906,_country.brazil,50.0,[],{},_country.ba];
//CE
    map[n.americaCE] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Antony Costa',3000,1920,_country.brazil,50.0,[],{},_country.ce];
    map[n.atleticoCE] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(-3.745500, -38.5373544),
      'Presidente Vargas',20268,1997,_country.brazil,50.0,[],{},_country.ce];
    map[n.caucaia] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Raimundão',4000,2004,_country.brazil,50.0,[],{},_country.ce];
    map[n.ceara] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-3.8075,-38.5225),
      'Castelão',63904,1900,_country.brazil,74.2,[n.fortaleza],{},_country.ce];
    map[n.ferroviario] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.diagonal,Coordinates(-3.70871165, -38.588464),
      'Elzir Cabral',4200,1933,_country.brazil,50.0,[],{},_country.ce];
    map[n.gentilandia] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      '',0,1934,_country.brazil,50.0,[],{},_country.ce];
    map[n.guarany] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Junco',10000,1938,_country.brazil,50.0,[],{},_country.ce];
    map[n.floresta] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-3.74584449, -38.5369219),
      'Presidente Vargas',20000,1954,_country.brazil,50.0,[],{},_country.ce];
    map[n.icasa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.22376, -39.317673),
      'Arena Romeirão',17000,2002,_country.brazil,50.0,[],{},_country.ce];
//DF
    map[n.brasilia] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-15.78318347, -47.8993050727),
      'Mané Garrincha',69349,1975,_country.brazil,50.0,[],{},_country.df];
    map[n.brasiliense] = [ClubColors(Colors.yellow,Colors.white),pattern.oneVertStripe,Coordinates(-15.835889, -48.0801529),
      'Boca do Jacaré',27000,2000,_country.brazil,50.0,[n.gama],{},_country.df];
    map[n.gama] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.01127196, -48.06133544),
      'Bezerrão',20310,1975,_country.brazil,50.0,[n.brasiliense],{},_country.df];
    map[n.guara] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'CAVE',16500,1957,_country.brazil,50.0,[],{"extinto": 2019},_country.df]; //EXTINTO 2019
    map[n.ceilandia] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-15.828076, -48.1103452),
      'Abadião',4000,1979,_country.brazil,50.0,[],{},_country.df];
    map[n.cfz] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.df];
    map[n.luziania] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Zequinha Roriz',21564,1926,_country.brazil,50.0,[],{},_country.df];
    map[n.realbrasilia] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Defelê',6875,1996,_country.brazil,50.0,[],{},_country.df];
    map[n.sobradinho] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-15.6526257, -47.7852544),
      'Augustinho Lima',10000,1975,_country.brazil,50.0,[],{},_country.df];
    map[n.taguatinga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Serejão',20000,1974,_country.brazil,50.0,[],{},_country.df];
//ES
    map[n.aracruz] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Eugênio Antônio Bitti',5058,1954,_country.brazil,50.0,[],{},_country.es];
    map[n.colatina] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Justiniano de Mello e Silva',2600,1998,_country.brazil,50.0,[],{},_country.es];
    map[n.alegrense] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'Benedito Teixeira Leão',0,1971,_country.brazil,50.0,[],{},_country.es];
    map[n.desportiva] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-20.33414206, -40.3561058),
      'Engenheiro Araripe',7700,1963,_country.brazil,50.0,[],{},_country.es];
    map[n.estrelanorte] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(-20.85331473, -41.11303147),
      'Estádio do Sumaré ',6000,1916,_country.brazil,50.0,[],{},_country.es];
    map[n.guarapari] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Davino Mattos',3000,1930,_country.brazil,50.0,[],{},_country.es];
    map[n.linhares] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estádio Guilherme Augusto de Carvalho',5000,1991,_country.brazil,50.0,[],{},_country.es];
    map[n.placidocastro] = [ClubColors(blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Ferreirão',1200,1979,_country.brazil,50.0,[],{},_country.es];
    map[n.realNoroeste] = [ClubColors(Colors.red,Colors.green,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Ninho da Águia',5281,2008,_country.brazil,50.0,[],{},_country.es];
    map[n.riobrancoES] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-20.33280029, -40.38518316),
      'Kleber Andrade',21000,1913,_country.brazil,50.0,[],{},_country.es];
    map[n.santoantonio] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Rubens Gomes',0,1919,_country.brazil,50.0,[],{},_country.es];
    map[n.saomateus] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Sernamby',4500,1963,_country.brazil,50.0,[],{},_country.es];
    map[n.serra] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-20.12764236, -40.304361721),
      'Roberto Siqueira Costa',2000,1930,_country.brazil,50.0,[],{},_country.es];
    map[n.vitoriaES] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-20.3163616, -40.3081515),
      'Salvador Venâncio',3000,1912,_country.brazil,50.0,[],{},_country.es];
//GO
    map[n.anapolina] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-16.345930, -48.95587463),
      'Jonas Duarte',20000,1948,_country.brazil,50.0,[],{},_country.go];
    map[n.aparecidense] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-16.81970, -49.245532),
      'Anníbal Batista de Toledo',5000,1985,_country.brazil,50.0,[],{},_country.go];
    map[n.atleticogo] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(-16.653152, -49.284273482),
      'Antônio Accioly',12500,1937,_country.brazil,72.9,[n.goias,n.vilanova],{},_country.go];
    map[n.crac] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.go];
    map[n.goiania] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico',13500,1938,_country.brazil,50.0,[],{},_country.go];
    map[n.goiatuba] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Divinão',15000,1970,_country.brazil,50.0,[],{},_country.go];
    map[n.gremioanapolis] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Jonas Duarte',20000,1999,_country.brazil,50.0,[],{},_country.go];
    map[n.goianesia] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Valedir José de Oliveira',6000,1955,_country.brazil,50.0,[],{},_country.go];
    map[n.goias] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-16.698889,-49.233889),
      'Serrinha',16500,1943,_country.brazil,72.9,[n.atleticogo,n.vilanova],{},_country.go];
    map[n.ipora] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(0,0),
      'Estádio Ferreirão',6520,2000,_country.brazil,50.0,[],{},_country.go];
    map[n.itumbiara] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'JK',14455,1970,_country.brazil,50.0,[],{},_country.go];
    map[n.jataiense] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Arapucão',30000,1952,_country.brazil,50.0,[],{},_country.go];
    map[n.novohorizonte] = [ClubColors(Colors.black,Colors.yellow),pattern.diagonalInv,Coordinates(0,0),
      'Durval Ferreira Franco',3100,1968,_country.brazil,50.0,[],{},_country.go];
    map[n.santahelena] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Pedro Romualdo Cabral',10000,1965,_country.brazil,50.0,[],{},_country.go];
    map[n.vilanova] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-16.673543, -49.236922),
      'Onésio Brasileiro Alvarenga',11788,1943,_country.brazil,67.4,[],{},_country.go];
//MA
    map[n.cordino] = [ClubColors(Colors.yellow,darkgreen),pattern.stripes2,Coordinates(0,0),
      'Leandro Cláudio da Silva',600,2010,_country.brazil,50.0,[],{},_country.ma];
    map[n.ferroviarioMA] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Nhozinho Santos',21000,1941,_country.brazil,50.0,[],{},_country.ma];
    map[n.imperatriz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-5.5253426, -47.488588),
      'Frei Epifânio',10100,1962,_country.brazil,50.0,[],{},_country.ma];
    map[n.maranhao] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ma];
    map[n.motoclub] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5483, -44.2600),
      'Castelão',40149,1937,_country.brazil,50.0,[],{},_country.ma];
    map[n.samas] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ma];
    map[n.sampaio] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes2,Coordinates(-2.54823, -44.2599829),
      'Castelão',40149,1923,_country.brazil,50.0,[],{},_country.ma];
    map[n.santaines] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ma];
    map[n.saojoseMA] = [ClubColors(Colors.lightGreen,Colors.blue),pattern.solid,Coordinates(0,0),
      'Dário Santos',500,2007,_country.brazil,50.0,[],{},_country.ma];
    map[n.vitoriamar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ma];
//MG
    map[n.americamg] = [ClubColors(Colors.green,Colors.black),pattern.stripes2,Coordinates(-19.9074787, -43.91821561),
      'Independência',23018,1912,_country.brazil,73.2,[n.atleticomg,n.cruzeiro],{},_country.mg];
    map[n.athleticMG] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio Joaquim Portugal',3500,1909,_country.brazil,50.0,[],{},_country.mg];
    map[n.boaesporte] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Melão',15471,1947,_country.brazil,50.0,[],{},_country.mg];
    map[n.caldense] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-21.7778067, -46.60602626),
      'Estádio Dr. Ronaldo Junqueira',7600,1925,_country.brazil,50.0,[],{},_country.mg];
    map[n.democrataGV] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Mamudão',8675,1932,_country.brazil,50.0,[],{},_country.mg];
    map[n.formiga] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Juca Pedro',2500,1929,_country.brazil,50.0,[],{},_country.mg];
    map[n.ipatinga] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-19.470869944, -42.541159),
      'Ipatingão',22000,1998,_country.brazil,50.0,[],{},_country.mg];
    map[n.pousoalegre] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-22.2514043, -45.92152478),
      'Manduzão',26000,1913,_country.brazil,50.0,[],{},_country.mg];
    map[n.siderurgica] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Praia do Ó',5000,1930,_country.brazil,50.0,[],{},_country.mg];
    map[n.tombense] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-20.90766468, -42.030541527),
      'Antônio Guimarães de Almeida',3050,1914,_country.brazil,69.3,[],{},_country.mg];
    map[n.tupi] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-21.787432790, -43.37794),
      'Mário Helênio',31863,1912,_country.brazil,50.0,[],{},_country.mg];
    map[n.uberaba] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Uberabão',25000,1917,_country.brazil,50.0,[],{},_country.mg];
    map[n.uberlandia] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(-18.91340764, -48.2329414),
      'Parque do Sabiá',53350,1922,_country.brazil,50.0,[],{},_country.mg];
    map[n.urt] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-18.596822, -46.52139941),
      'Zamão',4858,1939,_country.brazil,50.0,[],{},_country.mg];
    map[n.villanova] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Castor Cifuentes',5000,1908,_country.brazil,50.0,[],{},_country.mg];
//MS
    map[n.aguianegra] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ms];
    map[n.aquidauanense] = [ClubColors(blue,Colors.white),pattern.horStripes3,Coordinates(0,0),
      '',0,2001,_country.brazil,50.0,[],{},_country.ms];
    map[n.cene] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1999,_country.brazil,50.0,[],{"extinto": 2018},_country.ms]; //EXTINTO 2018
    map[n.chapadao] = [ClubColors(Colors.white,Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      '',0,1981,_country.brazil,50.0,[],{},_country.ms];
    map[n.comercialms] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      '',0,1943,_country.brazil,50.0,[],{},_country.ms];
    map[n.corumbaense] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arthur Marinho',0,1914,_country.brazil,50.0,[],{},_country.ms];
    map[n.coxim] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes2,Coordinates(0,0),
      '',0,2002,_country.brazil,50.0,[],{},_country.ms];
    map[n.douradense] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Douradão',30000,1974,_country.brazil,50.0,[],{},_country.ms];
    map[n.ivinhema] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneVertStripe,Coordinates(0,0),
      'Luiz Saraiva Vieira',0,2006,_country.brazil,50.0,[],{},_country.ms];
    map[n.novaandradina] = [ClubColors(Colors.red,Colors.green),pattern.horStripes3,Coordinates(0,0),
      '',0,2008,_country.brazil,50.0,[],{},_country.ms];
    map[n.naviraiense] = [ClubColors(Colors.orange,Colors.green),pattern.stripes2,Coordinates(0,0),
      'Virotão',6000,2005,_country.brazil,50.0,[],{},_country.ms];
    map[n.operarioms] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-20.50119164, -54.610060),
      'Morenão',16000,1938,_country.brazil,50.0,[],{},_country.ms];
    map[n.setembro7] = [ClubColors(Colors.white,Colors.yellow,Colors.red),pattern.oneHorStripe,Coordinates(0,0),
      'Fredis Saldivar',30000,1994,_country.brazil,50.0,[],{},_country.ms];
    map[n.ubiratan] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.ms];
//MT
    map[n.atleticoMT] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Arena Pantanal',44097,1948,_country.brazil,50.0,[],{},_country.mt];
    map[n.cuiaba] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(-15.60186930, -56.121367),
      'Arena Pantanal',44097,2001,_country.brazil,73.5,[],{},_country.mt];
    map[n.dombosco] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Arena Pantanal',44097,1925,_country.brazil,50.0,[],{},_country.mt];
    map[n.luverdense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-13.07439827, -55.923762246),
      'Passo das Emas',10000,2004,_country.brazil,50.0,[n.cuiaba],{},_country.mt];
    map[n.mixto] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-15.60386, -56.1210),
      'Arena Pantanal',44097,1934,_country.brazil,50.0,[n.luverdense,n.cuiaba],{},_country.mt];
    map[n.novamutum] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Municipal Valdir Doilho Wons',1200,1988,_country.brazil,50.0,[],{},_country.mt];
    map[n.operarioMT] = [ClubColors(Colors.red,Colors.green,Colors.white),pattern.stripesTricolor,Coordinates(-15.6453985, -56.1070940),
      'Estádio Dito Souza',2600,1949,_country.brazil,50.0,[],{},_country.mt];
    map[n.serjuventude] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Asa Delta',12000,1982,_country.brazil,50.0,[],{},_country.mt];
    map[n.sinop] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.mt];
    map[n.sorriso] = [ClubColors(Colors.green,Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      '',0,1991,_country.brazil,50.0,[],{},_country.mt];
//PA
    map[n.aguiamaraba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-5.3520618, -49.138324615),
      'Zinho de Oliveira',4500,1982,_country.brazil,50.0,[],{},_country.pa];
    map[n.cameta] = [ClubColors(Colors.red,Colors.green),pattern.horStripes3,Coordinates(0,0),
      'Parque do Bacurau',8000,2007,_country.brazil,50.0,[],{},_country.pa];
    map[n.castanhal] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-1.286085617, -47.9271335),
      'Modelão',5000,1924,_country.brazil,50.0,[],{},_country.pa];
    map[n.indtucurui] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Navegantão',8200,1972,_country.brazil,50.0,[],{},_country.pa];
    map[n.paysandu] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-1.381095, -48.44458),
      'Mangueirão',35000,1914,_country.brazil,50.0,[n.remo],{},_country.pa];
    map[n.remo] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-1.3811, -48.4447),
      'Mangueirão',35000,1905,_country.brazil,50.0,[n.paysandu],{},_country.pa];
    map[n.tunaluso] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(-1.381, -48.445),
      'Mangueirão',35000,1903,_country.brazil,50.0,[],{},_country.pa];
//PB
    map[n.autoesportePB] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.pb];
    map[n.botafogoPB] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-7.1668181, -34.873362768),
      'Almeidão',19000,1931,_country.brazil,50.0,[],{},_country.pb];
    map[n.cajazeirense] = [ClubColors(blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Perpetão',12000,1948,_country.brazil,50.0,[],{},_country.pb];
    map[n.campinense] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-7.25366757188, -35.88033665),
      'O Amigão',25770,1915,_country.brazil,50.0,[],{},_country.pb];
    map[n.estreladomar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1953,_country.brazil,50.0,[],{},_country.pb];
    map[n.nacionalPB] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'José Cavalcanti',11000,1961,_country.brazil,50.0,[],{},_country.pb];
    map[n.treze] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-7.25430, -35.88053),
      'O Amigão',25770,1925,_country.brazil,50.0,[],{},_country.pb];
    map[n.santosPB] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Almeidão',45000,1949,_country.brazil,50.0,[n.saopauloAP],{},_country.pb];
    map[n.santacruzPB] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Teixeirão',5000,1939,_country.brazil,50.0,[],{},_country.pb];
    map[n.sousa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.7559593, -38.2232163),
      'Marizão',12400,1991,_country.brazil,50.0,[],{},_country.pb];
//PE
    map[n.afogados] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Vianão',1735,2013,_country.brazil,50.0,[],{},_country.pe];
    map[n.americaPE] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal Ademir Cunha',12500,1914,_country.brazil,50.0,[],{},_country.pe];
    map[n.central] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-8.2785053, -35.972948033),
      'Lacerdão',20000,1919,_country.brazil,50.0,[],{},_country.pe];
    map[n.ibis] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-7.963256319, -34.840713),
      'Ademir Cunha',10000,1938,_country.brazil,50.0,[],{},_country.pe];
    map[n.nautico] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-8.040533, -34.89678093),
      'Aflitos',22856,1901,_country.brazil,69.8,[n.sport,n.santacruz],{},_country.pe];
    map[n.retro] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-8.040662488, -35.00816974),
      'Arena de Pernambuco',44300,2016,_country.brazil,50.0,[],{},_country.pe];
    map[n.salgueiro] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(-8.0758843, -39.1194243),
      'Cornélio de Barros',12070,1972,_country.brazil,50.0,[],{},_country.pe];
    map[n.santacruz] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-8.026711,-34.891175),
      'Arruda',60044,1914,_country.brazil,50.0,[],{},_country.pe];
    map[n.sport] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-8.062888888,-34.902888888),
      'Ilha do Retiro',26418,1905,_country.brazil,72.3,[n.nautico,n.santacruz,n.bahia],{},_country.pe];
//PI
    map[n.altos] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(-5.038122163, -42.44551040),
      'Felipão',4000,2013,_country.brazil,50.0,[],{},_country.pi];
    map[n.autoesportePI] = [ClubColors(Colors.green,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Lindolfo Monteiro',8000,1951,_country.brazil,50.0,[],{},_country.pi];
    map[n.barras] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Juca Fortes',4870,2004,_country.brazil,50.0,[],{},_country.pi];
    map[n.botafogoPI] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-7.1668181, -34.873362768),
      '',0,1932,_country.brazil,50.0,[],{"extinto": 1977},_country.pi]; //EXTINTO 1977
    map[n.caicara] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Deusdeth Melo',4000,1954,_country.brazil,50.0,[n.comercialPI],{},_country.pi];
    map[n.comercialPI] = [ClubColors(blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Deusdeth Melo',4000,1945,_country.brazil,50.0,[n.caicara],{},_country.pi];
    map[n.corisabba] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Tibério Barbosa Nunes',4200,1973,_country.brazil,50.0,[],{},_country.pi];
    map[n.flamengoPI] = [ClubColors(Colors.red,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Albertão',44200,1937,_country.brazil,50.0,[],{},_country.pi];
    map[n.fluminensePI] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Albertão',52300,1938,_country.brazil,50.0,[],{},_country.pi];
    map[n.julho4] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-4.27619893, -41.78598826),
      'Arena Ytacoatiara',8500,1987,_country.brazil,50.0,[],{},_country.pi];
    map[n.oeiras] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Ninho do Carcará',2000,1997,_country.brazil,50.0,[],{},_country.pi];
    map[n.parnahyba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Pedro Alelaf',5000,1913,_country.brazil,50.0,[],{},_country.pi];
    map[n.riverPI] = [ClubColors(Colors.red,Colors.black,Colors.black),pattern.sp,Coordinates(-5.116047825, -42.792511),
      'Albertão',52216,1946,_country.brazil,50.0,[],{},_country.pi];
    map[n.tiradentes] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Presidente Vargas',20268,1961,_country.brazil,50.0,[],{},_country.pi];
    map[n.piaui] = [ClubColors(darkblue,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Estádio Lindolfo Monteiro',9760,1948,_country.brazil,50.0,[],{},_country.pi];
    map[n.picos] = [ClubColors(Colors.yellow,Colors.green),pattern.oneHorStripe,Coordinates(0,0),
      'Gigantão da Malva',7200,1976,_country.brazil,50.0,[],{},_country.pi];
    //PR
    map[n.aguaverde] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.pr];
    map[n.azuriz] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-26.2110895, -52.679588977),
      'Os Pioneiros',8000,2018,_country.brazil,50.0,[],{},_country.pr];
    map[n.cascavel] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-24.9750456, -53.502418),
      'Olímpico Regional',28125,2008,_country.brazil,50.0,[],{},_country.pr];
    map[n.cianorte] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-23.66138978, -52.5938666),
      'Albino Turbay',4000,1993,_country.brazil,50.0,[],{},_country.pr];
    map[n.colorado] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Vila Capanema',20083,1971,_country.brazil,50.0,[],{"extinto": 1989},_country.pr]; //EXTINTO 1989
    map[n.ferroviarioPR] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-3.12155505, -60.03779047),
      'Vila Capanema',20083,1930,_country.brazil,50.0,[],{},_country.pr]; //VIROU COLORADO EM 1971
    map[n.iraty] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Coronel Emílio Gomes',8000,1914,_country.brazil,50.0,[],{},_country.pr];
    map[n.jmalucelli] = [ClubColors(Colors.grey,Colors.black),pattern.solid,Coordinates(0,0),
      'Janguito Malucelli',4200,1994,_country.brazil,50.0,[],{"extinto": 2017},_country.pr]; //EXTINTO 2017
    map[n.londrina] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-23.282222,-51.165),
      'Estádio do Café',36000,1956,_country.brazil,67.1,[],{},_country.pr];
    map[n.maringaFC] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(-23.414, -51.938378),
      'Willie Davids',20600,2010,_country.brazil,50.0,[],{},_country.pr];
    map[n.montealegre] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Dr. Horácio Klabin',5000,1946,_country.brazil,50.0,[],{"extinto": 1957},_country.pr]; //EXTINTO 1957
    map[n.operarioPR] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-25.115991, -50.156180),
      'Germano Krüger',10632,1912,_country.brazil,70.5,[],{},_country.pr];
    map[n.parana] = [ClubColors(Colors.blue,Colors.red),pattern.divided,Coordinates(-25.436122, -49.25595888),
      'Durival Britto',17140,1989,_country.brazil,50.0,[n.coritiba,n.atleticopr],{},_country.pr];
    map[n.paranavai] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Waldemiro Wagner',25000,1946,_country.brazil,50.0,[],{},_country.pr];
    map[n.pinheirosPR] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Vila Olímpica',10000,1971,_country.brazil,50.0,[],{"extinto": 1989},_country.pr]; //EXTINTO 1989
    map[n.riobrancoPR] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.pr];
    map[n.toledoPR] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      '14 de Dezembro',15280,2004,_country.brazil,50.0,[],{},_country.pr];
    map[n.uniaobandeirante] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Comendador Luís Meneghel',8000,1964,_country.brazil,50.0,[],{"extinto": 2006},_country.pr]; //EXTINTO 2006
//RJ
    map[n.americaRJ] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.7953107, -43.41957718),
      'Giulite Coutinho',13544,1904,_country.brazil,50.0,[],{},_country.rj];
    map[n.americanoRJ] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-21.7597338, -41.340689),
      'Estádio Godofredo Cruz',13700,1914,_country.brazil,50.0,[],{},_country.rj];
    map[n.bangu] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.8719064, -43.456439277),
      'Moça Bonita',9500,1904,_country.brazil,50.0,[],{},_country.rj];
    map[n.boavistaRJ] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.8954655, -42.4771417),
      'Elcyr Resende de Mendonça',8000,1961,_country.brazil,50.0,[],{},_country.rj];
    map[n.bonsucesso] = [ClubColors(Colors.red,darkblue),pattern.stripes2,Coordinates(0,0),
      'Leônidas da Silva',2390,1913,_country.brazil,50.0,[],{},_country.rj];
    map[n.cabofriense] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Correão',4200,1997,_country.brazil,50.0,[],{},_country.rj];
    map[n.cantorio] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes2,Coordinates(0,0),
      'Alzirão',900,1913,_country.brazil,50.0,[],{},_country.rj];
    map[n.duque] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(-22.5854488,-43.305297),
      'Marrentão',3334,2005,_country.brazil,50.0,[],{},_country.rj];
    map[n.friburguense] = [ClubColors(Colors.white,Colors.purple),pattern.solid,Coordinates(0,0),
      'Eduardo Guinle',6550,1980,_country.brazil,50.0,[],{},_country.rj];
    map[n.goytacaz] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-21.76202402, -41.31634627),
      'Ary de Oliveira e Souza',15000,1912,_country.brazil,50.0,[],{},_country.rj];
    map[n.macae] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-22.3563513, -41.77086),
      'Moacyrzão',15000,1990,_country.brazil,50.0,[],{},_country.rj];
    map[n.madureira] = [ClubColors(Colors.purple,Colors.yellow),pattern.stripes3,Coordinates(-22.869530143, -43.337035425),
      'Conselheiro Galvão',5014,1914,_country.brazil,50.0,[],{},_country.rj];
    map[n.novaiguacu] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-22.74785706, -43.460851929),
      'Jânio Moraes',4700,1990,_country.brazil,50.0,[],{},_country.rj];
    map[n.olaria] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Rua Bariri',8300,1915,_country.brazil,50.0,[],{},_country.rj];
    map[n.portuguesaRJ] = [ClubColors(Colors.white,Colors.green,Colors.red),pattern.sp,Coordinates(-22.8016378, -43.2078454),
      'Luso-Brasileiro',6437,1924,_country.brazil,50.0,[],{},_country.rj];
    map[n.resende] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-22.4638346, -44.456106),
      'Estádio do Trabalhador',7500,1909,_country.brazil,50.0,[],{},_country.rj];
    map[n.saocristovao] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Ronaldo Nazário',1000,1898,_country.brazil,50.0,[],{},_country.rj];
    map[n.voltaredonda] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-22.5082739, -44.096673),
      'Raulino de Oliveira',20255,1976,_country.brazil,50.0,[],{},_country.rj];
//RN
    map[n.abc] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.888405361, -35.17937587),
      'Frasqueirão',18000,1915,_country.brazil,50.0,[],{},_country.rn];
    map[n.alecrim] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Frasqueirão',18000,1915,_country.brazil,50.0,[],{},_country.rn];
    map[n.americaRN] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-5.93371016, -35.28271557),
      'Arena América',5000,1915,_country.brazil,50.0,[],{},_country.rn];
    map[n.assu] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Edgar Borges Montenegro',4000,2002,_country.brazil,50.0,[],{},_country.rn];
    map[n.baraunas] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Nogueirão',5000,1960,_country.brazil,50.0,[],{},_country.rn];
    map[n.corinthiansRN] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.rn];
    map[n.globo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-5.6489411, -35.46004640),
      'Barretão',10000,2012,_country.brazil,50.0,[],{},_country.rn];
    map[n.potiguar] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Nogueirão',5000,1945,_country.brazil,50.0,[],{},_country.rn];
    map[n.santacruzRN] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.rn];
    //RO
    map[n.barcelonaRO] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(0,0),
      'Portal da Amazônia',7000,2016,_country.brazil,50.0,[],{},_country.ro];
    map[n.cfa] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Aluízio Ferreira',7000,2001,_country.brazil,50.0,[],{},_country.ro];
    map[n.espigao] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Luizinho Turatti',2000,2008,_country.brazil,50.0,[],{},_country.ro];
    map[n.genus] = [ClubColors(Colors.yellow,grena),pattern.solid,Coordinates(0,0),
      'Aluízio Ferreira',7000,1991,_country.brazil,50.0,[],{},_country.ro];
    map[n.guajara] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'João Saldanha',3000,1952,_country.brazil,50.0,[],{},_country.ro];
    map[n.portovelho] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-8.75714855, -63.9105997),
      'Aluízio Ferreira',7000,2018,_country.brazil,50.0,[],{},_country.ro];
    map[n.rondoniense] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Aluízio Ferreira',7000,2007,_country.brazil,50.0,[],{},_country.ro];
    map[n.ulbra] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Biancão',5000,2005,_country.brazil,50.0,[],{"extinto": 2008},_country.ro]; //EXTINTO 2008
    map[n.vilhenense] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Portal da Amazônia',7000,2017,_country.brazil,50.0,[],{},_country.ro];
    //RR
    map[n.ariquemes] = [ClubColors(Colors.red,Colors.green,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Valerião',5000,1996,_country.brazil,50.0,[],{},_country.rr];
    map[n.atleticoRR] = [ClubColors(vinho,Colors.green,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      'Estádio Canarinho',4556,1944,_country.brazil,50.0,[],{},_country.rr];
    map[n.bare] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Flamarion Vasconcelos',4556,1946,_country.brazil,50.0,[],{},_country.rr];
    map[n.gas] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(0,0),
      'Ribeirão',3000,1965,_country.brazil,50.0,[],{},_country.rr];
    map[n.jiparana] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Biancão',5000,1991,_country.brazil,50.0,[],{},_country.rr];
    map[n.nauticoRR] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Canarinho',4556,1962,_country.brazil,50.0,[],{},_country.rr];
    map[n.progressoRR] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Municipal de Mucajaí',1000,0,_country.brazil,50.0,[],{},_country.rr];
    map[n.realArquimedes] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Gentil Valério',2500,2011,_country.brazil,50.0,[],{},_country.rr];
    map[n.saoraimundoRR] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(2.818876055, -60.7208497),
      'Ribeirão',3000,1963,_country.brazil,50.0,[],{},_country.rr];
    map[n.ucacoalense] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Aglair Tonelli',8000,1982,_country.brazil,50.0,[],{},_country.rr];
    map[n.riobrancoRR] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0, 0),
      '',0,1920,_country.brazil,50.0,[],{},_country.rr];
    map[n.rionegroRR] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(0, 0),
      'Flamarion Vasconcelos',4556,1971,_country.brazil,50.0,[],{},_country.rr];
    map[n.riverRR] = [ClubColors(Colors.green,Colors.yellow),pattern.diagonal,Coordinates(0,0),
      'Flamarion Vasconcelos',4556,1973,_country.brazil,50.0,[],{},_country.rr];
    map[n.vilhena] = [ClubColors(Colors.red,Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Portal da Amazônia',7000,1991,_country.brazil,50.0,[],{},_country.rr];
//RS
    map[n.aimore] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-29.782430, -51.1554674),
      'Estádio João Corrêa da Silveira',10000,1936,_country.brazil,50.0,[],{},_country.rs];
    map[n.juventude] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-29.162,-51.176),
      'Alfredo Jaconi',19924,1913,_country.brazil,72.3,[],{},_country.rs];
    map[n.avenida] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Eucaliptos',3600,1944,_country.brazil,50.0,[],{},_country.rs];
    map[n.bage] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.rs];
    map[n.brasilPelotas] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-31.7712377, -52.332841550),
      'Bento Freitas',10200,1911,_country.brazil,50.0,[],{},_country.rs];
    map[n.canoas] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Francisco Novelleto Neto',5000,1957,_country.brazil,50.0,[],{},_country.rs];
    map[n.caxias] = [ClubColors(grena,darkblue),pattern.stripes3,Coordinates(-29.1649520, -51.1964163918332),
      'Centenário',30000,1935,_country.brazil,50.0,[],{},_country.rs];
    map[n.cruzeiroRS] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Arena Cruzeiro',16000,1913,_country.brazil,50.0,[],{},_country.rs];
    map[n.esportivo] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Montanha dos Vinhedos',12859,1919,_country.brazil,50.0,[],{},_country.rs];
    map[n.farroupilha] = [ClubColors(Colors.green,Colors.red,Colors.yellow),pattern.stripesTricolor,Coordinates(0, 0),
      'Nicolau Fico',5441,1926,_country.brazil,50.0,[],{},_country.rs];
    map[n.gloriaRS] = [ClubColors(Colors.white,Colors.lightBlue),pattern.solid,Coordinates(0,0),
      'Altos da Glória',8000,1956,_country.brazil,50.0,[],{},_country.rs];
    map[n.guaranybage] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estrela D\'Alva',10000,1907,_country.brazil,50.0,[],{},_country.rs];
    map[n.lajeadense] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Alviazul',7000,1911,_country.brazil,50.0,[],{},_country.rs];
    map[n.novembro15] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Sady Arnildo Schmidt',3500,1911,_country.brazil,50.0,[],{},_country.rs];
    map[n.novohamburgo] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-29.7262180, -51.143800),
      'Estádio do Vale',5196,1911,_country.brazil,50.0,[],{},_country.rs];
    map[n.pelotas] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Boca do Lobo',23336,1908,_country.brazil,50.0,[],{},_country.rs];
    map[n.renner] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Tiradentes',6000,1931,_country.brazil,50.0,[],{"extinto": 1957},_country.rs]; //EXTINTO 1957
    map[n.riograndense] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.rs];
    map[n.santacruzRS] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.rs];
    map[n.santamaria] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Presidente Vargas',12000,1928,_country.brazil,50.0,[],{},_country.rs];
    map[n.saojoseRS] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-30.006611, -51.173485531),
      'Passo D\'Areia',13000,1913,_country.brazil,50.0,[],{},_country.rs];
    map[n.saoluizRS] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      '19 de Outubro',8000,1938,_country.brazil,50.0,[],{},_country.rs];
    map[n.veranopolis] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Antônio David Farina',4720,1992,_country.brazil,50.0,[],{},_country.rs];
    map[n.uruguaiana] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Felisberto Fagundes Filho',1500,1912,_country.brazil,50.0,[],{},_country.rs];
//SC
    map[n.altovale] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Alfredo João Krieck',8000,1960,_country.brazil,50.0,[],{},_country.sc];
    map[n.americaSC] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Olímpico',2500,1914,_country.brazil,50.0,[],{},_country.sc];
    map[n.avai] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-27.66578267, -48.53165186),
      'Ressacada',17800,1923,_country.brazil,50.0,[],{},_country.sc];
    map[n.blumenau] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Aderbal Ramos da Silva',1000,1919,_country.brazil,50.0,[],{"extinto": 2004},_country.sc]; //EXTINTO 2004
    map[n.brusque] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-27.10126696, -48.916319),
      'Augusto Bauer',5000,1987,_country.brazil,69.4,[],{},_country.sc];
    map[n.camboriu] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-27.0214440, -48.64794059),
      'Robertão',3500,2003,_country.brazil,50.0,[],{},_country.sc];
    map[n.carlosrenaux] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Augusto Bauer',5000,1913,_country.brazil,50.0,[],{},_country.sc];
    map[n.caxiasSC] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Ernestão',5000,1920,_country.brazil,50.0,[],{},_country.sc];
    map[n.chapecoense] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-27.10339550, -52.6068313),
      'Arena Condá',22600,1973,_country.brazil,70.1,[],{},_country.sc];
    map[n.criciuma] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-28.684329, -49.36763),
      'Heriberto Hülse',19300,1947,_country.brazil,68.55,[],{},_country.sc];
    map[n.figueirense] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-27.585556,-48.586667),
      'Orlando Scarpelli',19584,1921,_country.brazil,67.6,[],{},_country.sc];
    map[n.hercilioluz] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0, 0),
      'Estádio Aníbal Torres Costa',8000,1918,_country.brazil,50.0,[],{},_country.sc];
    map[n.jaragua] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.sc];
    map[n.joinville] = [ClubColors(Colors.red,Colors.black),pattern.oneHorStripe,Coordinates(-26.31645224, -48.83343633),
      'Arena Joinville',22100,1976,_country.brazil,50.0,[],{},_country.sc];
    map[n.interlages] = [ClubColors(Colors.red,Colors.white),pattern.monaco,Coordinates(0,0),
      'Vidal Ramos Júnior',9600,1949,_country.brazil,50.0,[],{},_country.sc];
    map[n.marciliodias] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-26.90812438, -48.65977444),
      'Hercílio Luz',6000,1919,_country.brazil,50.0,[],{},_country.sc];
    map[n.metropol] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'João Estevão de Souza',5000,1945,_country.brazil,50.0,[],{},_country.sc];
    map[n.paularamos] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.stripesTricolor,Coordinates(0,0),
      '',0,1937,_country.brazil,50.0,[],{},_country.sc];
    map[n.perdigao] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Luis Leoni',1500,1964,_country.brazil,50.0,[],{},_country.sc];
    map[n.prospera] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.sc];
//SE
    map[n.americaSE] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
    map[n.estanciano] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
    map[n.falcon] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
    map[n.freipaulistano] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
    map[n.itabaiana] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-10.68849961, -37.4319),
      'Etelvino Mendonça',12000,1938,_country.brazil,50.0,[],{},_country.se];
    map[n.lagartense] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Barretão',8000,1992,_country.brazil,50.0,[],{},_country.se];
    map[n.lagarto] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-10.9215613, -37.67235613),
      'Barretão',8000,2009,_country.brazil,50.0,[],{},_country.se];
    map[n.pirambu] = [ClubColors(Colors.yellow,Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'André Moura',3000,1931,_country.brazil,50.0,[],{},_country.se];
    map[n.riverSE] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(0,0),
      'Fernando França',5000,1967,_country.brazil,50.0,[],{"extinto": 2013},_country.se]; //EXTINTO 2013
    map[n.santacruzSE] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
    map[n.sergipe] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-10.92337996, -37.07210),
      'João Hora',6000,1909,_country.brazil,50.0,[],{},_country.se];
    map[n.vascoSE] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.se];
//SP
    map[n.aguasanta] = [ClubColors(Colors.white,Colors.blue),pattern.oneVertStripe,Coordinates(-23.723344, -46.612920),
      'Arena Inamar',10000,1981,_country.brazil,50.0,[],{},_country.sp];
    map[n.americaSP] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Teixeirão',32936,1946,_country.brazil,50.0,[],{},_country.sp];
    map[n.aracatuba] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Adhemar de Barros',11284,1972,_country.brazil,50.0,[],{},_country.sp];
    map[n.audaxSP] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'José Liberatti',17430,1985,_country.brazil,50.0,[],{},_country.sp];
    map[n.botafogoSP] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(-21.201866, -47.78959753222946),
      'Estádio Santa Cruz',22292,1918,_country.brazil,50.0,[],{},_country.sp];
    map[n.bragantino] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-22.965414,-46.536936),
      'Nabi Abi Chedid',12332,1928,_country.brazil,75.0,[],{},_country.sp];
    map[n.capivariano] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Arena Capivari',19000,1918,_country.brazil,50.0,[],{},_country.sp];
    map[n.comercial] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(-21.1865312, -47.788333),
      'Estádio Palma Travassos',18277,1911,_country.brazil,50.0,[],{},_country.sp];
    map[n.ferroviaria] = [ClubColors(grena,Colors.black),pattern.solid,Coordinates(-21.7750702, -48.1701263),
      'Fonte Luminosa',20000,1950,_country.brazil,50.0,[],{},_country.sp];
    map[n.francana] = [ClubColors(darkgreen,Colors.blue),pattern.solid,Coordinates(0,0),
      'José Lancha Filho',16897,1912,_country.brazil,50.0,[],{},_country.sp];
    map[n.gremioBarueri] = [ClubColors(Colors.white,Colors.yellow,darkblue),pattern.solid,Coordinates(0,0),
      'Arena Barueri',31452,1989,_country.brazil,50.0,[],{},_country.sp];
    map[n.guarani] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-22.909782888, -47.043755),
      'Brinco de Ouro',29130,1911,_country.brazil,68.7,[n.pontepreta],{},_country.sp];
    map[n.guaratingueta] = [ClubColors(Colors.red,Colors.blue,Colors.white),pattern.sleeves,Coordinates(-22.8072350, -45.18529197),
      'Dario Rodrigues Leite',16095,1998,_country.brazil,50.0,[],{},_country.sp];
    map[n.interLimeira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.555294,-47.385042),
      'Major José Levy Sobrinho',27000,1913,_country.brazil,50.0,[],{},_country.sp];
    map[n.ituano] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-23.2803369, -47.287407674),
      'Novelli Júnior',16749,1947,_country.brazil,50.0,[],{},_country.sp];
    map[n.jabaquara] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes2,Coordinates(0,0),
      'Espanha',8031,1914,_country.brazil,50.0,[],{},_country.sp];
    map[n.juventusMooca] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-23.5531052, -46.60451048),
      'Estádio Conde Rodolfo Crespi',5000,1924,_country.brazil,50.0,[],{},_country.sp];
    map[n.oeste] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(-23.51223575, -46.89928345),
      'Arena Barueri',31452,1921,_country.brazil,50.0,[],{},_country.sp];
    map[n.linense] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(-21.666501905, -49.763218818),
      'Gilbertão',15770,1927,_country.brazil,50.0,[],{},_country.sp];
    map[n.marilia] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.stripes2,Coordinates(-22.21940335, -49.93949715),
      'Bento de Abreu',19800,1942,_country.brazil,50.0,[],{},_country.sp];
    map[n.matonense] = [ClubColors(blue,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Hudson Buck Ferreira',6000,1976,_country.brazil,50.0,[],{},_country.sp];
    map[n.mirassol] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-20.821404501, -49.5065208),
      'José Maria de Campos Maia',15000,1925,_country.brazil,50.0,[],{},_country.sp];
    map[n.mogimirim] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.439263926, -46.9617167107),
      'Estádio Vail Chaves',19900,1932,_country.brazil,50.0,[],{},_country.sp];
    map[n.nacionalSP] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-23.5180334948, -46.6851971843),
      'Nicolau Alayon',10723,1919,_country.brazil,50.0,[],{},_country.sp];
    map[n.noroeste] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-22.3242, -49.09748),
      'Alfredo de Castilho',18866,1910,_country.brazil,50.0,[],{},_country.sp];
    map[n.novorizontino] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-21.466885, -49.231995),
      'Estádio Jorge Ismael de Biasi',18000,1973,_country.brazil,69.6,[],{},_country.sp];
    map[n.paulista] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-23.1880264, -46.8597525),
      'Jayme Cintra',10210,1909,_country.brazil,50.0,[],{},_country.sp];
    map[n.penapolense] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Tenente Carriço',8769,1944,_country.brazil,50.0,[],{},_country.sp];
    map[n.pontepreta] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-22.913611,-47.051389),
      'Moisés Lucarelli',17728,1900,_country.brazil,71.4,[n.guarani],{},_country.sp];
    map[n.portuguesa] = [ClubColors(Colors.red,Colors.green),pattern.horStripes2,Coordinates(-23.520556,-46.618333),
      'Canindé',21004,1920,_country.brazil,50.0,[],{},_country.sp];
    map[n.portuguesasantista] = [ClubColors(Colors.red,Colors.green),pattern.horStripes2,Coordinates(-23.94715573, -46.3372746),
      'Ulrico Mursa',7635,1917,_country.brazil,50.0,[],{},_country.sp];
    map[n.prudentina] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Félix Ribeiro Marcondes',6000,1936,_country.brazil,50.0,[],{"extinto": 1967},_country.sp]; //EXTINTO 1967
    map[n.radium] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'São Sebastião',7800,1919,_country.brazil,50.0,[],{},_country.sp];
    map[n.riobrancoSP] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-22.734535, -47.3479962),
      'Décio Vitta',16300,1913,_country.brazil,50.0,[],{},_country.sp];
    map[n.rioclaro] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-22.4223454, -47.56188026),
      'Schmidtão',8284,1909,_country.brazil,50.0,[],{},_country.sp];
    map[n.riopreto] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.83460, -49.4012242),
      'Anísio Haddad',14126,1919,_country.brazil,50.0,[],{},_country.sp];
    map[n.saad] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Morenão',20000,1961,_country.brazil,50.0,[],{"extinto":  2013},_country.sp]; //EXTINTO 2013
    map[n.santoandre] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.669687, -46.50901102),
      'Estádio Bruno José Daniel',12000,1967,_country.brazil,50.0,[n.saocaetano],{},_country.sp];
    map[n.saobento] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.4902975, -47.44815),
      'Estádio Walter Ribeiro',13772,1913,_country.brazil,50.0,[],{},_country.sp];
    map[n.saobernardo] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(-23.699738, -46.55637),
      'Primeiro de Maio',15159,2004,_country.brazil,50.0,[],{},_country.sp];
    map[n.saocaetano] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-23.630661, -46.560448),
      'Anacleto Campanella',16744,1989,_country.brazil,50.0,[n.santoandre],{},_country.sp];
    map[n.saojose] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-23.1884290, -45.8698296),
      'Martins Pereira',15317,1933,_country.brazil,50.0,[],{},_country.sp];
    map[n.sertaozinho] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Frederico Dalmaso',7860,1944,_country.brazil,50.0,[],{},_country.sp];
    map[n.sorocaba] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Walter Ribeiro',13722,1991,_country.brazil,50.0,[],{},_country.sp];
    map[n.taquaritinga] = [ClubColors(Colors.black,Colors.green,Colors.red),pattern.solid,Coordinates(0,0),
      'Taquarão',18805,1942,_country.brazil,50.0,[],{},_country.sp];
    map[n.taubate] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-23.02785, -45.57043134),
      'Joaquinzão',10000,1914,_country.brazil,50.0,[],{},_country.sp];
    map[n.uniaobarbarense] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(0,0),
      'Antônio Lins Ribeiro Guimarães',14913,1914,_country.brazil,50.0,[],{},_country.sp];
    map[n.uniaoSaoJoao] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(-22.3591769, -47.3406513),
      'Hermínio Ometto',16096,1981,_country.brazil,50.0,[],{},_country.sp];
    map[n.ypirangaRS] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(-27.65131147, -52.26477924),
      'Colosso da Lagoa',22000,1924,_country.brazil,50.0,[],{},_country.rs];
    map[n.xvjau] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-22.296089, -48.57224110487209),
      'Zezinho Magalhães',12978,1924,_country.brazil,50.0,[],{},_country.sp];
    map[n.xvpiracicaba] = [ClubColors(Colors.black,Colors.white),pattern.horStripes2,Coordinates(-22.7294362, -47.636847),
      'Barão de Serra Negra',18000,1913,_country.brazil,50.0,[],{},_country.sp];
//TO
    map[n.alvorada] = [ClubColors(Colors.white,darkgreen),pattern.solid,Coordinates(0,0),
      'Elias Natan Coelho',1200,1993,_country.brazil,50.0,[],{},_country.to];
    map[n.araguacema] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.to];
    map[n.araguaina] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(0,0),
      'Mirandão',10000,1997,_country.brazil,50.0,[],{},_country.to];
    map[n.colinas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Concessão Municipal',2000,2001,_country.brazil,50.0,[],{},_country.to];
    map[n.gurupi] = [ClubColors(darkgreen,Colors.yellow),pattern.solid,Coordinates(-11.7385131, -49.09281345),
      'Resendão',4000,1988,_country.brazil,50.0,[],{},_country.to];
    map[n.intercap] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Pereirão',2300,1992,_country.brazil,50.0,[],{},_country.to];
    map[n.interporto] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'General Sampaio',2000,1990,_country.brazil,50.0,[],{},_country.to];
    map[n.kabure] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',2000,1985,_country.brazil,50.0,[],{},_country.to];
    map[n.miracema] = [ClubColors(Colors.white,Colors.red,Colors.black),pattern.sp,Coordinates(0,0),
      'Castanheirão',2500,1992,_country.brazil,50.0,[],{"extinto": 2010},_country.to]; //EXTINTO 2010
    map[n.miranorte] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.brazil,50.0,[],{},_country.to];
    map[n.palmas] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-10.2822114, -48.330556),
      'Nilton Santos',12000,1997,_country.brazil,50.0,[],{},_country.to];
    map[n.tocantinopolis] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-6.3429743, -47.4276875),
      'João Ribeiro',8000,1989,_country.brazil,50.0,[],{},_country.to];
    map[n.tocantinsEC] = [ClubColors(blue,Colors.red),pattern.diagonal,Coordinates(0,0),
      'Castanheirão',2500,1993,_country.brazil,50.0,[],{},_country.to];
    map[n.tocantinsFC] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      '',0,1999,_country.brazil,50.0,[],{},_country.to];
    map[n.uniaoTO] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0,0),
      'Mirandão',10000,1992,_country.brazil,50.0,[],{},_country.to];





    ///////////////////////////////////////////////
    //ARGENTINA
    map[n.aldosivi] = [ClubColors(Colors.green,Colors.yellow),pattern.stripes2,Coordinates(-38.017726, -57.5819365),
      'José María Minella',35180,1913,_country.argentina,67.6,[],{}];
    map[n.almagro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-34.6140369, -58.5347054),
      'Tres de Febrero',19000,1911,_country.argentina,66.4,[],{}];
    map[n.allboys] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.6167200, -58.497540),
      'Islas Malvinas',21500,1913,_country.argentina,64.5,[],{}];
    map[n.atlantaARG] = [ClubColors(Colors.yellow,darkblue),pattern.stripes2,Coordinates(-34.594865, -58.449197),
      'Estádio Don León Kolbowski',14000,1904,_country.argentina,61.5,[],{}];
    map[n.rafaela] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(-31.2507559, -61.4814668),
      'Estádio Rafaela',16000,1907,_country.argentina,63.2,[],{}];
    map[n.atleticotucuman] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-26.81260955, -65.1987853),
      'Monumental José Fierro',35200,1902,_country.argentina,70.6,[],{}];
    map[n.argentinojuniors] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(-34.6059205, -58.47265177),
      'Diego Armando Maradona',25500,1904,_country.argentina,70.7,[],{}];
    map[n.arsenalsarandi] = [ClubColors(Colors.blue,Colors.red),pattern.diagonal,Coordinates(-34.678230933, -58.3403085),
      'Julio Humberto Grondona',18500,1957,_country.argentina,68.4,[],{}];
    map[n.banfield] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(-34.7506503, -58.38785437),
      'Florencio Sola',34901,1896,_country.argentina,70.0,[],{}];
    map[n.barracas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.6474769, -58.39680),
      'Claudio Fabián Tapia',2700,1904,_country.argentina,67.1,[],{}];
    map[n.belgrano] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-31.40324361, -64.2064250),
      'Gigante de Alberdi',30000,1905,_country.argentina,69.8,[],{}];
    map[n.bocajuniors] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(-34.6350100, -58.3649280),
      'La Bombonera',54000,1905,_country.argentina,75.8,[n.riverplate],{}];
    map[n.centralCordoba] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-27.765766, -64.26963233),
      'Único Madre de Ciudades',30000,1919,_country.argentina,66.7,[],{}];
    map[n.chacarita] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-34.567153367, -58.52778112),
      'Chacarita Juniors',10000,1906,_country.argentina,65.1,[],{}];
    map[n.chaco] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-27.443352667167545, -59.01075095957457),
      'Sarmiento de Resistência',20000,1913,_country.argentina,62.4,[],{}];
    map[n.colon] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-31.6625043, -60.72494809),
      'Brigadier General Estanislao López',40000,1905,_country.argentina,73.3,[],{}];
    map[n.defensayjusticia] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-34.8212666, -58.28582255),
      'Norberto "Tito" Tomaghello',18000,1935,_country.argentina,72.3,[],{}];
    map[n.depArmenio] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.depEspanol] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-34.6577354, -58.46437356),
      'Estádio Nueva España',32500,1956,_country.argentina,61.6,[],{}];
    map[n.mandiyu] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.desamparados] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.estudiantes] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-34.911207200, -57.9387574),
      'Jorge Luis Hirschi',30018,1905,_country.argentina,73.9,[n.gimnasia],{}];
    map[n.ferro] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-34.6187825, -58.44715549),
      'Arquitecto Ricardo Etcheverri',29442,1904,_country.argentina,67.7,[],{}];
    map[n.gimnasia] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.91082898, -57.931958963),
      'Juan Carmelo Zerillo',33000,1887,_country.argentina,69.0,[n.estudiantes],{}];
    map[n.gimJujuy] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(-24.198602014851275, -65.29080523636442),
      '23 de Agosto',24000,1931,_country.argentina,58.6,[],{}];
    map[n.godoycruz] = [ClubColors(Colors.blue,Colors.white),pattern.stripesThin,Coordinates(-32.889438925, -68.879741553),
      'Feliciano Gambarte',18000,1921,_country.argentina,69.2,[],{}];
    map[n.huracan] = [ClubColors(Colors.red,Colors.white),pattern.solid2,Coordinates(-34.64277754540345, -58.396480366),
      'Tómas Adolfo Ducó',48314,1908,_country.argentina,69.2,[],{}];
    map[n.independiente] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.6697955165, -58.37112617),
      'Libertadores de América',52360,1905,_country.argentina,72.5,[n.racing],{}];
    map[n.instituto] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-31.3837438, -64.180317245),
      'Juan Domingo Perón',38000,1918,_country.argentina,65.4,[],{}];
    map[n.kimberley] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.lanus] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-34.71693165, -58.38395483),
      'Ciudad de Lanús',47027,1915,_country.argentina,72.2,[],{}];
    map[n.losandes] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.newells] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-32.95531568, -60.661299876),
      'Marcelo Bielsa',42000,1903,_country.argentina,71.3,[n.rosario],{}];
    map[n.nuevachicago] = [ClubColors(Colors.black,darkgreen),pattern.stripes2,Coordinates(-34.66785282, -58.49983161),
      'República de Mataderos',29000,1911,_country.argentina,62.2,[],{}];
    map[n.olimpo] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-38.72698577, -62.2758727),
      'Roberto Natalio Carminatti',18000,1910,_country.argentina,61.7,[],{}];
    map[n.patronato] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-31.742991743, -60.5087660643),
      'Presbítero Bartolomé Grella',22000,1914,_country.argentina,66.8,[],{}];
    map[n.platense] = [ClubColors(Colors.grey,Colors.black),pattern.oneHorStripe,Coordinates(-34.54007018, -58.481458314),
      'Ciudad de Vicente López',34500,1905,_country.argentina,64.6,[],{}];
    map[n.quilmes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.7408453, -58.2515933),
      'Centenário',30200,1887,_country.argentina,62.3,[],{}];
    map[n.racing] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(-34.6675,-58.368611),
      'Presidente Perón',51389,1903,_country.argentina,74.5,[n.independiente],{}];
    map[n.rivadavia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.riverplate] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-34.54518243, -58.44934575),
      'Monumental de Núñez',70074,1901,_country.argentina,76.7,[n.bocajuniors],{}];
    map[n.rosario] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(-32.9138952, -60.6744748),
      'Gigante de Arroyito',41654,1889,_country.argentina,71.4,[n.newells],{}];
    map[n.sanlorenzo] = [ClubColors(Colors.red,Colors.blue),pattern.stripes3,Coordinates(-34.652035, -58.4400335),
      'El Nuevo Gasómetro',47964,1908,_country.argentina,71.2,[],{}];
    map[n.sanmartin] = [ClubColors(Colors.green,Colors.black),pattern.stripes3,Coordinates(-31.611908, -68.527561788),
      'Estádio del Bicentenario',25286,1907,_country.argentina,66.7,[],{}];
    map[n.sanmartintucuman] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.argentina,50.0,[],{}];
    map[n.sarmiento] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.58532867, -60.92932811),
      'Estádio Eva Perón',22000,1911,_country.argentina,65.4,[],{}];
    map[n.talleres] = [ClubColors(darkblue,Colors.white),pattern.stripes3,Coordinates(-31.367984088, -64.2448256165),
      '	Mario Alberto Kempes',57000,1913,_country.argentina,72.7,[],{}];
    map[n.temperley] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.78171364, -58.40013736),
      'Alfredo Beranger',23000,1912,_country.argentina,64.4,[],{}];
    map[n.tigre] = [ClubColors(Colors.blue,Colors.red),pattern.oneHorStripe,Coordinates(-34.44930541, -58.54255425),
      'José Dellagiovanna',26282,1902,_country.argentina,67.8,[],{}];
    map[n.tirofederal] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-32.929004207796865, -60.6949336706893),
      'Fortín de Ludueña',18000,1905,_country.argentina,56.5,[],{}];
    map[n.unionsantafe] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-31.6317300, -60.715128589),
      '15 de Abril',28000,1907,_country.argentina,70.1,[],{}];
    map[n.velez] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-34.6344873, -58.52082564),
      'José Amalfitani',49590,1910,_country.argentina,73.7,[],{}];

    map[n.albion] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uruguay,50.0,[],{}];
    map[n.bostonriver] = [ClubColors(Colors.green,Colors.red),pattern.divided,Coordinates(-34.3292745, -56.7107625),
      'Luis Trócolli',25000,1939,_country.uruguay,65.6,[],{}];
    map[n.buceo] = [ClubColors(Colors.black,Colors.red,Colors.white),pattern.oneVertStripe,Coordinates(-34.878623987830665, -56.129011890063886),
      'Parque Huracán',10000,1937,_country.uruguay,61.7,[],{}];
    map[n.centralespanol] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(0, 0),
      'Parque Palermo',6500,1905,_country.uruguay,61.7,[],{}];
    map[n.cerroLargo] = [ClubColors(Colors.white,Colors.blue),pattern.stripes3,Coordinates(-32.3595878, -54.1693633),
      'Arquitecto Antonio Ubilla',9000,2002,_country.uruguay,68.3,[],{}];
    map[n.cerrito] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uruguay,50.0,[],{}];
    map[n.cerrouru] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-34.867238, -56.252016),
      'Luis Trócolli',25000,1922,_country.uruguay,65.4,[],{}];
    map[n.danubio] = [ClubColors(Colors.white,Colors.black),pattern.diagonal,Coordinates(-34.8387170, -56.13208784),
      'Jardines del Hipódromo',18000,1932,_country.uruguay,66.0,[],{}];
    map[n.defensor] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-34.91616, -56.16653),
      'Estádio Luis Franzini',16000,1913,_country.uruguay,69.1,[],{}];
    map[n.deportivomaldonado] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(-34.9144, -54.9553425),
      'Estádio Domingo Burgueño',22000,1928,_country.uruguay,64.8,[],{}];
    map[n.fenix] = [ClubColors(Colors.purple,Colors.white),pattern.divided,Coordinates(-34.87338535, -56.212268),
      'Parque Capurro',10000,1916,_country.uruguay,63.5,[],{}];
    map[n.juventud] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uruguay,50.0,[],{}];
    map[n.laluz] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Parque Liebig',5000,1929,_country.uruguay,59.8,[],{}];
    map[n.liverpoolURU] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-34.8549854, -56.225665),
      'Estádio Belvedere',10000,1915,_country.uruguay,67.1,[],{}];
    map[n.miramar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uruguay,50.0,[],{}];
    map[n.montevideocity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-34.82381, -56.32036),
      'Complejo Daniel Marsicano',14000,2007,_country.uruguay,66.5,[],{}];
    map[n.montwanderers] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.859011, -56.203837),
      'Parque Alfredo Víctor Viera',10000,1902,_country.uruguay,69.5,[],{}];
    map[n.nacional] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-34.8845,-56.159),
      'Estádio Gran Parque Central',34000,1899,_country.uruguay,73.5,[n.penarol],{}];
    map[n.paysanduuru] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-32.32276932515148, -58.072351179610116),
      'Parque Artigas',25000,2003,_country.uruguay,58.8,[],{}];
    map[n.penarol] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-34.7963, -56.06693),
      'Campeón del Siglo',40000,1891,_country.uruguay,72.4,[n.nacional],{}];
    map[n.plazacolonia] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-34.4671517, -57.8456522),
      'Prof. Alberto Suppici',12000,1917,_country.uruguay,65.8,[],{}];
    map[n.progreso] = [ClubColors(Colors.red,Colors.yellow),pattern.stripes3,Coordinates(-34.8732457, -56.234474),
      'Parque Abraham Paladino',8000,1917,_country.uruguay,62.1,[],{}];
    map[n.racinguru] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Parque Osvaldo Roberto',8500,1919,_country.uruguay,61.6,[],{}];
    map[n.rampla] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(-34.89293737986412, -56.245541803555),
      'Olímpico de Montevidéu',6000,1914,_country.uruguay,60.3,[],{}];
    map[n.rentistas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-34.776324, -56.165855),
      'Complejo Rentistas',10600,1933,_country.uruguay,66.4,[],{}];
    map[n.riverURU] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-34.861929, -56.201579),
      'Federico Omar Saroldi',6000,1932,_country.uruguay,68.2,[],{}];
    map[n.sudamerica] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(0, 0),
      'Parque Carlos Ángel Fossa',6000,1914,_country.uruguay,63.2,[],{}];
    map[n.villaespanola] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uruguay,50.0,[],{}];
    map[n.bellavista] = [ClubColors(Colors.yellow,Colors.white),pattern.divided,Coordinates(-34.8613992, -56.20906942),
      'Parque José Nasazzi',8000,1920,_country.uruguay,64.7,[],{}];
    map[n.rocha] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.divided,Coordinates(-34.48668145, -54.3246813),
      'Doctor Mario Sobrero',10000,1999,_country.uruguay,50.0,[],{}];

    map[n.olimpia] = [ClubColors(Colors.white,Colors.black),pattern.oneHorStripe,Coordinates(-25.2913934, -57.6085912),
      'Manuel Ferreira',25820,1902,_country.paraguay,74.6,[n.cerroporteno],{}];
    map[n.cerroporteno] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(-25.3,-57.6375),
      'General Pablo Rojas',45000,1912,_country.paraguay,74.4,[n.olimpia],{}];
    map[n.octubre12] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-25.36745, -57.58476),
      'Luis Alfonso Giagni',11000,1909,_country.paraguay,65.8,[],{}];
    map[n.capiata] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes3,Coordinates(-25.360567, -57.4374838),
      'Erico Galeano Segovia',15000,2008,_country.paraguay,63.0,[],{}];
    map[n.colegiales] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-25.348243, -57.592480),
      'Luciano Zacarías',4500,1977,_country.paraguay,66.5,[],{}];
    map[n.febrero3] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-25.5268770, -54.6123046),
      'Antonio Aranda',28000,1970,_country.paraguay,60.7,[],{}];
    map[n.generaldiaz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-25.2632793, -57.5186521),
      'General Adrián Jara',3300,1917,_country.paraguay,61.3,[],{}];
    map[n.generalcaballero] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-25.235591, -57.55797252),
      'Estadio Hugo Bogado Vaceque',5000,1918,_country.paraguay,63.7,[],{}];
    map[n.guairena] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes2,Coordinates(-25.76343534, -56.439635675),
      'Estadio Parque del Guairá',12000,2016,_country.paraguay,64.8,[],{}];
    map[n.guaraniPAR] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(-25.30311, -57.61587),
      'Rogelio Livieres',8000,1903,_country.paraguay,71.7,[],{}];
    map[n.nacionalPAR] = [ClubColors(Colors.red,Colors.blue),pattern.stripes2,Coordinates(-25.29862, -57.63927),
      'Arsenio Erico',8500,1904,_country.paraguay,69.5,[],{}];
    map[n.libertad] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(-25.2768477, -57.61086),
      'Dr. Nicolás Leoz',10500,1905,_country.paraguay,74.3,[],{}];
    map[n.luqueno] = [ClubColors(Colors.blue,Colors.yellow),pattern.stripes2,Coordinates(-25.2723013, -57.493120),
      'Estádio Feliciano Cáceres',27000,1921,_country.paraguay,67.2,[],{}];
    map[n.presidentehayes] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.stripes2,Coordinates(-25.2962324, -57.64767620),
      'Estádio Coronel Félix Cabrera',5000,1907,_country.paraguay,57.6,[],{}];
    map[n.resistencia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-25.279565, -57.6254939),
      'Estadio Tomás Beggan Correa',3500,1917,_country.paraguay,63.8,[],{}];
    map[n.riverPAR] = [ClubColors(Colors.red,Colors.white),pattern.diagonal,Coordinates(0,0),
      'Estadio River Plate',6500,1911,_country.paraguay,61.7,[],{}];
    map[n.rubionu] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-25.257535, -57.575178),
      'La Arboleda',4500,1913,_country.paraguay,62.5,[],{}];
    map[n.sanlorenzoPAR] = [ClubColors(Colors.red,Colors.white),pattern.stripes4,Coordinates(-25.3427159, -57.500765),
      'Estadio Gunther Vogel',5000,1930,_country.paraguay,60.5,[],{}];
    map[n.soldeamerica] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-25.36735, -57.58480),
      'Estádio Luis Alfonso Giagni',11000,1909,_country.paraguay,68.2,[],{}];
    map[n.ameliano] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Estadio José Tomás Silva',2000,1936,_country.paraguay,62.5,[],{}];
    map[n.tacuary] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-25.2831537, -57.606315),
      'Toribio Vargas',3000,1923,_country.paraguay,63.1,[],{}];
    map[n.trinidense] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(0,0),
      'Estadio Martín Torres',3000,1935,_country.peru,58.6,[],{}];

    map[n.antofagasta] = [ClubColors(Colors.blue,Colors.white),pattern.divided,Coordinates(-23.6700873, -70.4045056),
      'Bicentenario Calvo y Bascuñán',21178,1966,_country.chile,64.5,[],{}];
    map[n.audaxitaliano] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.540543, -70.577821),
      'Municipal de La Florida',12000,1910,_country.chile,66.3,[],{}];
    map[n.badminton] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.peru,50.0,[],{}];
    map[n.cobreloa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(-22.46096, -68.9204540),
      'Municipal de Calama',12000,1977,_country.chile,65.4,[],{}];
    map[n.cobresal] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(-26.2518641, -69.628662),
      'Estádio El Cobre',12000,1979,_country.chile,62.0,[],{}];
    map[n.colocolo] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-33.506611,-70.605944),
      'Monumental David Arellano',47017,1925,_country.chile,72.5,[],{}];
    map[n.copiapo] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-27.37659031055061, -70.32064738722065),
      'Luis Valenzuela Hermosilla',8000,1999,_country.chile,60.6,[],{}];
    map[n.coquimbo] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes2,Coordinates(-29.9652247, -71.338293),
      'Francisco Sánchez Rumoroso',15000,1958,_country.chile,66.8,[],{}];
    map[n.curico] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-34.9742154, -71.230767),
      'La Granja',8200,1973,_country.chile,64.7,[],{}];
    map[n.iquique] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-20.242358, -70.1331452),
      'Tierra de Campeones',10000,1978,_country.chile,64.5,[],{}];
    map[n.evertonchi] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-33.014228, -71.535373),
      'Sausalito',23000,1909,_country.chile,67.5,[],{}];
    map[n.greencross] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estadio Nacional',70000,1916,_country.chile,50.0,[],{"extinto": 1961}]; //EXTINTO 1961
    map[n.huachipato] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(-36.75502733, -73.10760524),
      'Estádio CAP',10500,1947,_country.chile,69.3,[],{}];
    map[n.lacalera] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-32.784167,-71.199444),
      'Municipal Nicolás Chahuán',9200,1954,_country.chile,67.8,[],{}];
    map[n.laserena] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-29.911299, -71.251873),
      'La Portada',14000,1955,_country.chile,63.5,[],{}];
    map[n.lau] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.464054, -70.61059),
      'Estádio Nacional',55358,1927,_country.chile,72.8,[],{}];
    map[n.magallanes] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.507484509519045, -70.74926610903779),
      'Santiago Bueras',5000,1897,_country.chile,59.2,[],{}];
    map[n.nublense] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-36.618249, -72.107945),
      'Nelson Oyarzún Arenas',7000,1916,_country.chile,64.1,[],{}];
    map[n.ohiggins] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-34.1775588, -70.737344506),
      'El Teniente',14450,1955,_country.chile,64.8,[],{}];
    map[n.palestino] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(-33.5202176734, -70.67294633),
      'Municipal de La Cisterna',12000,1920,_country.chile,68.2,[],{}];
    map[n.unionespanola] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-33.40428485, -70.658703),
      'Santa Laura',22000,1897,_country.chile,68.5,[],{}];
    map[n.univcatolica] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(-33.39498660, -70.5005379),
      'San Carlos de Apoquindo',14768,1937,_country.chile,74.7,[],{}];
    map[n.santiagomorning] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.peru,50.0,[],{}];
    map[n.santiagowanderers] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-33.0224104, -71.639742),
      'Elías Figueroa Brander',21113,1892,_country.chile,66.3,[],{}];
    map[n.concepcion] = [ClubColors(Colors.yellow,darkblue),pattern.sleeves,Coordinates(-36.8157111, -73.02371368),
      'Municipal de Concepción',35000,1994,_country.chile,62.0,[],{}];
    map[n.rangersCHI] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(-35.4202449, -71.6740666),
      'Fiscal de Talca',8230,1902,_country.chile,63.8,[],{}];
    map[n.sanfelipe] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.chile,50.0,[],{}];

    map[n.alwaysready] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-16.4994122, -68.12262946),
      'Hernando Siles',42000,1933,_country.bolivia,65.2,[],{}];
    map[n.aurora] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-17.37968516, -66.1615046),
      'Félix Capriles',32000,1935,_country.bolivia,67.5,[],{}];
    map[n.blooming] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(-17.796, -63.1832),
      'Tauhichi Aguilera',38000,1946,_country.bolivia,63.6,[],{}];
    map[n.bolivar] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-16.499412183054098, -68.12263),
      'Hernando Siles',42000,1925,_country.bolivia,70.8,[n.thestrongest],{}];
    map[n.chacopetrolero] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(-16.5,-68.12),
      'Hernando Siles',42000,1944,_country.bolivia,62.1,[],{}];
    map[n.guabira] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-17.34287, -63.261564),
      'Gilberto Parada',18000,1962,_country.bolivia,65.1,[],{}];
    map[n.granmamore] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-14.820355219270594, -64.89393857951696),
      'Estádio Gran Mamoré',12000,2004,_country.bolivia,60.4,[],{}];
    map[n.indPetrolero] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(-17.34287, -63.261564),
      'Olímpico Patria',32000,1932,_country.bolivia,63.2,[],{}];
    map[n.jorge] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-17.37959, -66.1617185),
      'Félix Capriles',32000,1949,_country.bolivia,66.4,[],{}];
    map[n.lapaz] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Hernando Siles',42000,1989,_country.bolivia,62.4,[],{"extinto": 2013}]; //EXTINTO 2013
    map[n.municipalBOL] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Luis Lastra',10000,1944,_country.bolivia,58.6,[],{}];
    map[n.nacionalpotosi] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-19.5793537, -65.7616416),
      'Víctor Agustín Ugarte',32105,1942,_country.bolivia,63.6,[],{}];
    map[n.orientepetrolero] = [ClubColors(Colors.green,Colors.white),pattern.solid2,Coordinates(-19.0332323, -65.257856),
      'Estádio Ramón Tahuichi Aguilera',38500,1955,_country.bolivia,64.2,[],{}];
    map[n.palmaflor] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-17.3920347, -66.275128),
      'Municipal de Quillacollo',5000,2008,_country.bolivia,63.7,[],{}];
    map[n.realsantacruz] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-17.8058075, -63.1661464),
      'Juan Carlos Durán',15000,1962,_country.bolivia,63.8,[],{}];
    map[n.realtomayapo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-21.5327864, -64.7248547),
      'Estadio IV Centenario',15000,1999,_country.bolivia,58.6,[],{}];
    map[n.royalpari] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(-17.795543, -63.183247),
      'Ramón Tahuichi Aguilera',38000,2002,_country.bolivia,63.1,[],{}];
    map[n.sanJoseBOL] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(-17.94613, -67.1108436),
      'Estádio Jesús Bermúdez',39000,1942,_country.bolivia,64.5,[],{}];
    map[n.realpotosi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Víctor Ugarte',32000,1986,_country.bolivia,60.8,[],{"extinto": true}]; //EXTINTO
    map[n.thestrongest] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(-16.499412, -68.12263),
      'Hernando Siles',42000,1908,_country.bolivia,71.7,[n.bolivar],{}];
    map[n.vacadiez] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-11.024790715476994, -68.75977754279106),
      'Roberto Jordán Cuéllar',25000,1952,_country.bolivia,61.7,[],{}];
    map[n.sucre] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-19.03347852, -65.2576612),
      'Olímpico Patria',32000,1961,_country.bolivia,67.5,[],{}];
    map[n.univvinto] = [ClubColors(Colors.white,Colors.red),pattern.solid2,Coordinates(-17.397434717, -66.3175044),
      'Estadio Hipólito Lazarte',2000,2005,_country.bolivia,63.6,[],{}];
    map[n.litoral] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(0,0),
      'Félix Capriles',32000,1936,_country.bolivia,50.0,[],{}];
    map[n.octubre31] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Hernando Siles',42000,1954,_country.bolivia,50.0,[],{}];

    map[n.alianzalima] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(-12.06765595, -77.0229485),
      'Alejandro Villanueva',35000,1901,_country.peru,70.9,[],{}];
    map[n.alianzasullana] = [ClubColors(Colors.white,Colors.blue),pattern.diagonal,Coordinates(-4.8969179, -80.68456517),
      'Campeones del 36',4000,1920,_country.peru,70.9,[],{}];
    map[n.atlGrau] = [ClubColors(Colors.yellow,Colors.red),pattern.stripes3,Coordinates(-12.059699, -77.119953),
      'Estadio Miguel Grau',25000,1919,_country.peru,65.2,[],{}];
    map[n.ayacucho] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(-13.1514774, -74.2200140),
      'Ciudad de Cumaná',12000,2008,_country.peru,64.5,[],{}];
    map[n.binacional] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-15.502587, -70.1233308),
      'Guillermo Briceño Rosamedina',20030,2010,_country.peru,64.6,[],{}];
    map[n.carlosstein] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-6.6972361, -79.904482),
      'César Flores Marigorda',7000,2012,_country.peru,63.1,[],{}];
    map[n.ayacucho] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(-13.1514774, -74.2200140),
      'Ciudad de Cumaná',12000,2008,_country.peru,63.5,[],{}];
    map[n.cantolao] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(-12.0601314, -77.12002745),
      'Estadio Miguel Grau',17000,1981,_country.peru,64.0,[],{}];
    map[n.carlosmanucci] = [ClubColors(Colors.blue,Colors.white),pattern.oneVertStripe,Coordinates(-8.1060255, -79.0307551),
      'Estadio Mansiche',23214,1959,_country.peru,64.1,[],{}];
    map[n.iqueno] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.peru,50.0,[],{}];
    map[n.cesarvallejo] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(-8.10611593, -79.030676),
      'Mansiche',25000,1996,_country.peru,63.8,[],{}];
    map[n.cienciano] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-13.5242097, -71.966351907),
      'Inca Garcilaso de la Vega',45056,1901,_country.peru,68.1,[],{}];
    map[n.coronel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-18.00503048, -70.253158),
      'Estádio Jorge Basadre',25000,1929,_country.peru,65.1,[],{}];
    map[n.cusco] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-13.525813, -71.966138),
      'Inca Garcilaso de la Vega',45056,2009,_country.peru,66.3,[],{}];
    map[n.depmunicipal] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(-12.067919, -77.03348),
      'Nacional José Diáz',45000,1935,_country.peru,65.8,[],{}];
    map[n.garcilaso] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Estadio Garcilaso de la Vega',45000,1957,_country.peru,62.6,[],{}];
    map[n.juanaurich] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.76763163, -79.86207526),
      'Elías Aguirre',25000,1922,_country.peru,65.1,[],{}];
    map[n.leonhuanuco] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(-9.94045133, -76.25269378),
      'Estadio Heraclio Tapia',14000,1946,_country.peru,62.7,[],{}];
    map[n.melgar] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(-16.40644668, -71.5202360),
      'Estádio Monumental da UNSA',40370,1915,_country.peru,71.4,[],{}];
    map[n.ancash] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(0, 0),
      'Estadio Rosas Pampa',18000,1967,_country.peru,62.8,[],{}];
    map[n.sportboys] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.059966, -77.1197877),
      'Miguel Grau',15000,1927,_country.peru,63.7,[],{}];
    map[n.sportingcristal] = [ClubColors(Colors.blue,Colors.white),pattern.diagonal,Coordinates(-12.0362617, -77.045132758),
      'Alberto Gallardo',11600,1955,_country.peru,72.6,[],{}];
    map[n.huancayo] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(-12.072618, -75.201664),
      'Estádio Huancayo',17000,2007,_country.peru,67.3,[],{}];
    map[n.universitario] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-12.055024119, -76.9358871764),
      'Monumental de Lima',80093,1924,_country.peru,69.8,[],{}];
    map[n.unisanmartin] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-12.06730518, -77.0336576),
      'Nacional de Lima',45000,2004,_country.peru,64.8,[],{}];
    map[n.cajamarca] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-7.1616760, -78.51101415),
      'Estádio Héroes de San Ramón',18000,1954,_country.peru,65.3,[],{}];
    map[n.tarma] = [ClubColors(Colors.blue,Colors.white),pattern.diagonal,Coordinates(-11.413890944936146, -75.68379468010919),
      'Unión Tarma',9000,1929,_country.peru,59.8,[],{}];
    map[n.unionhuaral] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(-11.49677572, -77.217294),
      'Estádio Julio Lores Colán',6000,1947,_country.peru,59.6,[],{}];
    map[n.ucomercio] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0, 0),
      'Municipal Carlos Vidaurre García',5000,1994,_country.peru,50.0,[],{}];
    map[n.chalaco] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[],{}];
    map[n.atltorino] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.peru,50.0,[],{}];
    map[n.arica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.peru,50.0,[],{"extinto": true}]; //EXTINTO
    map[n.ugarte] = [ClubColors(Colors.white,Colors.red),pattern.diagonal,Coordinates(0, 0),
      'E. Torres Belón',20000,1928,_country.peru,56.2,[],{}];
    map[n.defensorlima] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Nacional del Perú',43086,1931,_country.peru,54.7,[],{}];
    map[n.sanagustin] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estadio Nacional',45000,1970,_country.peru,55.4,[],{}]; //EXISTE, MAS FORA DO SISTEMA DE LIGAS

    map[n.aucas] = [ClubColors(Colors.red,Colors.yellow),pattern.dividedHor,Coordinates(-0.2789491, -78.546213),
      'Gonzalo Pozo Ripalda',20000,1945,_country.ecuador,69.4,[],{}];
    map[n.barcelonaequ] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(-2.18560555, -79.924764),
      'Monumental Isidro Romero Carbo',57267,1925,_country.ecuador,72.8,[],{}];
    map[n.cumbaya] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Olímpico Atahualpa',38258,1970,_country.ecuador,65.3,[],{}];
    map[n.delfin] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-0.964043321, -80.702654),
      'Estadio Jocay',17834,1989,_country.ecuador,66.6,[],{}];
    map[n.depcuenca] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.906627, -79.005685),
      'Alejandro Serrano Aguilar',16500,1971,_country.ecuador,67.5,[],{}];
    map[n.depquito] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-0.1777998, -78.47661),
      'Olímpico Atahualpa',40948,1940,_country.ecuador,70.1,[],{}];
    map[n.emelec] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-2.20565402, -79.893875),
      'George Capwell',40000,1929,_country.ecuador,73.2,[],{}];
    map[n.elnacional] = [ClubColors(Colors.red,Colors.blue),pattern.diagonalInv,Coordinates(-0.177371, -78.47598),
      'Olímpico Atahualpa',38500,1964,_country.ecuador,67.1,[],{}];
    map[n.espoli] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-0.24967195746795412, -79.14852999975763),
      'Estádio Etho Vega',0,1986,_country.ecuador,57.5,[],{}];
    map[n.gualaceo] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ecuador,50.0,[],{}];
    map[n.guayaquil] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-2.1028473, -79.903678),
      'Christian Benítez Betancourt',8000,2007,_country.ecuador,64.6,[],{}];
    map[n.idelvalle] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(-0.34883621, -78.4708232),
      'Rumiñahui',10233,1958,_country.ecuador,74.1,[],{}];
    map[n.libertadEQU] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'Reina del Cisne',14935,2017,_country.ecuador,62.1,[],{}];
    map[n.ldu] = [ClubColors(Colors.white,Colors.grey),pattern.solid,Coordinates(-0.10660691, -78.48884),
      'Rodrigo Paz Delgado',41575,1918,_country.ecuador,72.5,[],{}];
    map[n.lduloja] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-4.0008733, -79.1965533),
      'Federativo Reina del Cisne',15000,1979,_country.ecuador,64.2,[],{}];
    map[n.portoviejo] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ecuador,50.0,[],{}];
    map[n.macara] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(-1.24482626, -78.623129),
      'Estádio Bella Vista',16467,1939,_country.ecuador,66.7,[],{}];
    map[n.manta] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ecuador,50.0,[],{}];
    map[n.mushucruna] = [ClubColors(grena,Colors.green),pattern.solid,Coordinates(-1.30916165, -78.7278448),
      'Estádio Mushuc Runa COAC',6000,2003,_country.ecuador,63.2,[],{}];
    map[n.octubre9] = [ClubColors(Colors.white,Colors.blue),pattern.stripesThin,Coordinates(-2.17903931490244, -79.8944434402961),
      'Modelo Alberto Spencer',42000,1912,_country.ecuador,64.6,[],{}];
    map[n.olmedo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-1.6662906, -78.6604288),
      'Olímpico de Riobamba',20000,1919,_country.ecuador,62.6,[],{}];
    map[n.orense] = [ClubColors(darkgreen,Colors.black),pattern.solid,Coordinates(-3.25437008, -79.9627357),
      'Estadio 9 de Mayo',17800,2009,_country.ecuador,62.3,[],{}];
    map[n.tecnicoUniv] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(-1.2443898, -78.62354027),
      'Estadio Bellavista',18000,1971,_country.ecuador,63.1,[],{}];
    map[n.uniequ] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(-0.1774, -78.476),
      'Olímpico Atahualpa',38500,1963,_country.ecuador,64.2,[],{}];
    map[n.americaquito] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[],{}];
    map[n.everestguayaquil] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[],{}];
    map[n.filanbanco] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[],{}];
    map[n.valdez] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.ecuador,50.0,[],{}];

    map[n.alianzapetrolera] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(7.073057, -73.864671),
      'Daniel Villa Zapata',10400,1991,_country.colombia,66.5,[],{}];
    map[n.americadecali] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.43076413, -76.5409550),
      'Olímpico Pascual Guerrero',35405,1927,_country.colombia,73.6,[],{}];
    map[n.huila] = [ClubColors(Colors.yellow,Colors.green),pattern.stripes2,Coordinates(2.93608856, -75.280323806),
      'Guillermo Plazas Alcid',10400,1990,_country.colombia,63.1,[],{}];
    map[n.atleticonacional] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(6.2570559, -75.589883235),
      'Atanasio Girardot',52872,1947,_country.colombia,75.0,[],{}];
    map[n.bocacali] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.colombia,50.0,[],{}];
    map[n.boyaca] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.54217432, -73.3533631),
      'La Independencia',20000,2002,_country.colombia,63.4,[],{}];
    map[n.bucaramanga] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(7.136745, -73.116192),
      'Alfonso López',25000,1949,_country.colombia,64.6,[],{}];
    map[n.cortulua] = [ClubColors(Colors.red,Colors.green),pattern.oneVertStripe,Coordinates(4.07490263, -76.2016262),
      'Doce de Octubre',16000,1967,_country.colombia,67.6,[],{}];
    map[n.cucuta] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(7.8946915, -72.50194428901477),
      'General Santander',46519,1924,_country.colombia,65.3,[],{}];
    map[n.deportivocali] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(3.52269250, -76.41571171),
      'Estádio Deportivo Cali',55000,1912,_country.colombia,72.3,[],{}];
    map[n.deppasto] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(1.19825378, -77.2778826),
      'Departamental Libertad',20700,1949,_country.colombia,67.2,[],{}];
    map[n.pereira] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(4.80468765, -75.751995),
      'Hernán Villegas',30313,1944,_country.colombia,66.5,[],{}];
    map[n.envigado] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(6.16451557, -75.5989182),
      'Polideportivo Sur',12000,1989,_country.colombia,67.6,[],{}];
    map[n.jaguaresCOL] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Estadio Jaraguay',12000,2012,_country.colombia,65.3,[],{}];
    map[n.junior] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(10.927145429567, -74.8000172),
      'Metropolitano',46692,1924,_country.colombia,74.2,[],{}];
    map[n.imedellin] = [ClubColors(Colors.red,Colors.blue),pattern.divided,Coordinates(6.256939271, -75.5898773),
      'Atanasio Girardot',45953,1913,_country.colombia,71.6,[],{}];
    map[n.laequidad] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(4.62375432, -74.1354781),
      'Metropolitano de Techo',15000,1982,_country.colombia,70.5,[],{}];
    map[n.millonarios] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(4.645962128, -74.077269811),
      'El Campín',36343,1937,_country.colombia,73.4,[],{}];
    map[n.oncecaldas] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(5.057102, -75.48972667784),
      'Palogrande',42600,1961,_country.colombia,70.8,[],{}];
    map[n.patriotas] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.5421279, -73.353390),
      'La Independencia',21000,2003,_country.colombia,67.8,[],{}];
    map[n.quindio] = [ClubColors(Colors.green,Colors.yellow),pattern.oneHorStripe,Coordinates(4.515824983, -75.6986710),
      'Centenário',25000,1951,_country.colombia,59.3,[],{}];
    map[n.rionegroaguilas] = [ClubColors(Colors.amberAccent,Colors.black),pattern.solid,Coordinates(6.14667896, -75.372829),
      'Alberto Grisales',14000,1991,_country.colombia,68.1,[],{}];
    map[n.santafe] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(4.646, -74.077),
      'El Campín',36343,1941,_country.colombia,73.1,[],{}];
    map[n.tolima] = [ClubColors(Colors.yellow,Colors.orange),pattern.solid,Coordinates(4.43018613, -75.21773451564),
      'Manuel Murillo Toro',33000,1954,_country.colombia,74.2,[],{}];
    map[n.uMagdalena] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(11.2398636, -74.19507816),
      'Eduardo Santos',23000,1951,_country.colombia,66.1,[],{}];

    map[n.angostura] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(8.080102030079157, -63.51717742191261),
      'Ricardo Tulio Maya',2500,2007,_country.venezuela,58.6,[],{}];
    map[n.aragua] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(10.2589723, -67.6123306),
      'Olimpico Hermanos Ghersi Paez',18000,2002,_country.venezuela,60.1,[],{}];
    map[n.carabobo] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(10.2230961, -68.0115140),
      'Estádio Misael Delgado',14000,1964,_country.venezuela,62.7,[],{}];
    map[n.caracas] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(10.49220252, -66.885644393),
      'Estádio Olímpico de Caracas',24900,1967,_country.venezuela,68.9,[],{}];
    map[n.laguaira] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(10.492202523, -66.885644393),
      'Estádio Olímpico de Caracas',24900,2008,_country.venezuela,66.0,[],{}];
    map[n.tachira] = [ClubColors(Colors.white,Colors.black),pattern.stripes2,Coordinates(7.787385, -72.1980212),
      'Pueblo Nuevo de San Cristóbal',42000,1974,_country.venezuela,67.8,[],{}];
    map[n.estudiantesmerida] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(8.5769590, -71.16485),
      'Guillermo Soto Rosa',16500,1971,_country.venezuela,65.4,[],{}];
    map[n.deplara] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(10.0809793, -69.32927),
      'Farid Richa',12480,2009,_country.venezuela,64.0,[],{}];
    map[n.hermanoscolmenarez] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estadio Agustín Tovar',29800,2015,_country.venezuela,62.7,[],{}];
    map[n.italchacao] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.venezuela,50.0,[],{}];
    map[n.metropolitanos] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(10.482750, -66.941810),
      'Brígido Iriarte',10000,2011,_country.venezuela,65.1,[],{}];
    map[n.mineros] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(8.31272986, -62.6962946),
      'C.T.E. Cachamay',42000,1981,_country.venezuela,62.6,[],{}];
    map[n.minerven] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(7.3472689, -61.82695),
      'Héctor Thomas',5000,1985,_country.venezuela,61.3,[],{}];
    map[n.monagas] = [ClubColors(Colors.blue,grena),pattern.solid,Coordinates(9.71000338, -63.2677268),
      'Monumental de Maturín',51796,1987,_country.venezuela,64.5,[],{}];
    map[n.nactachira] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.venezuela,50.0,[],{}];
    map[n.portuguesaven] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(9.570767650, -69.21027962),
      'José Antonio Paez',18000,1972,_country.venezuela,61.7,[],{}];
    map[n.puertocabello] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(10.467987195, -68.00974328),
      'Complejo Deportivo Socialista',7500,2014,_country.venezuela,61.1,[],{}];
    map[n.rayozuliano] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(10.673866285295034, -71.64514477771036),
      'José Encarnación Romero',45800,2005,_country.venezuela,56.0,[],{}];
    map[n.trujillanos] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(9.33347489, -70.60227),
      'José Alberto Pérez',12000,1981,_country.venezuela,60.6,[],{}];
    map[n.ucv] = [ClubColors(Colors.blue,Colors.yellow),pattern.divided,Coordinates(10.491299493561534, -66.88578652189273),
      'Olímpico de la UCV',27900,1950,_country.venezuela,62.6,[],{}];
    map[n.ula] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.venezuela,50.0,[],{}];
    map[n.zamora] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(8.625075, -70.20694),
      'Estadio Agustín Tovar',28000,1977,_country.venezuela,60.8,[],{}];
    map[n.zulia] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(10.6743723, -71.644651),
      'Estádio José Encarnación Romero',45000,2005,_country.venezuela,62.7,[],{}];
    map[n.anzoategui] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.depitalia] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.depgalicia] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.laraFC] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.margarita] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.maritimoven] = [ClubColors(Colors.green,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.pepeganga] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.portugues] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.ula] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.valenciaven] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{}];
    map[n.maracaibo] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(0,0),
      'José Pachencho Romero',35000,2001,_country.venezuela,50.0,[],{"extinto": true}]; //FALENCIA
    map[n.sancristobal] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Polideportivo de Pueblo Nuevo',38755,1980,_country.venezuela,50.0,[],{"extinto": true}]; //EXTINTO
    map[n.uCanarias] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estádio',0,0,_country.venezuela,50.0,[],{"extinto": true}];//EXTINTO

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    map[n.atlas] = [ClubColors(Colors.red,Colors.black),pattern.divided,Coordinates(20.7051916, -103.3277484),
      'Jalisco',63163,1916,_country.mexico,73.6,[],{}];
    map[n.atlante] = [ClubColors(Colors.blue,grena),pattern.stripes2,Coordinates(19.382696, -99.1782815),
      'Estádio Azul',32904,1916,_country.mexico,68.4,[],{}];
    map[n.americamex] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(19.30399437, -99.15052764),
      'Estádio Azteca',87000,1916,_country.mexico,77.5,[],{}];
    map[n.atlEspanol] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(0, 0),
      'Estádio Azteca',87000,1971,_country.mexico,50.0,[],{}];//EXTINTO 1982
    map[n.celaya] = [ClubColors(Colors.white,Colors.blue),pattern.oneHorStripe,Coordinates(20.534896, -100.8181567),
      'Emilio Butragueño',26753,1954,_country.mexico,66.7,[],{}];
    map[n.chivas] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(20.6827395, -103.46255961),
      'Estadio Akron',49850,1906,_country.mexico,74.5,[],{}];
    map[n.correcaminos] = [ClubColors(Colors.orange,Colors.white),pattern.oneHorStripe,Coordinates(23.739618, -99.1523884),
      'Marte R. Gómez Segura',19500,1982,_country.mexico,67.3,[],{}];
    map[n.cruzazul] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.3837416, -99.1782640),
      'Estádio Azul',32904,1927,_country.mexico,76.8,[],{}];
    map[n.dorados] = [ClubColors(Colors.black,Colors.yellow),pattern.divided,Coordinates(24.8305076, -107.404267),
      'Estádio Banorte',20108,2003,_country.mexico,65.6,[],{}];
    map[n.irapuato] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(20.68461665, -101.3561041),
      'Sergio León Chavez',30000,1982,_country.mexico,64.5,[],{}];
    map[n.jaguares] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(16.7630, -93.0960),
      'Estádio Víctor Manuel Reyna',28000,2002,_country.mexico,67.7,[],{}];
    map[n.juarez] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(31.75317, -106.467471),
      'Estadio Olímpico Benito Juárez',19703,2015,_country.mexico,69.5,[],{}];
    map[n.leon] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.1163456, -101.65787452),
      'Nou Camp',33943,1944,_country.mexico,73.9,[],{}];
    map[n.leonesnegros] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(20.7052, -103.3277),
      'Jalisco',63163,1970,_country.mexico,68.3,[],{}];
    map[n.mazatlan] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(23.2360094, -106.432487154),
      'Estadio de Mazatlán',25000,2020,_country.mexico,71.0,[],{}];
    map[n.monterrey] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(25.6702825, -100.24467170),
      'Estádio BBVA',51348,1945,_country.mexico,78.2,[],{}];
    map[n.morelia] = [ClubColors(Colors.yellow,Colors.red),pattern.diagonalInv,Coordinates(19.7189655, -101.233201),
      'Estadio Morelos',41038,1950,_country.mexico,70.1,[],{}];
    map[n.necaxa] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(21.881199555, -102.2754420),
      'Estadio Victoria',22000,1923,_country.mexico,68.9,[],{}];
    map[n.depNeza] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Estadio Neza 86',28000,1978,_country.mexico,53.0,[],{}];
    map[n.pachuca] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(20.10591056, -98.7556673),
      'Estádio Hidalgo',32000,1892,_country.mexico,73.9,[],{}];
    map[n.puebla] = [ClubColors(Colors.blue,Colors.white),pattern.diagonalInv,Coordinates(19.07886305, -98.164410348),
      'Estadio Cuauhtemoc',42684,1944,_country.mexico,71.6,[],{}];
    map[n.pumas] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(19.333086463, -99.19217763867),
      'Olímpico Universitário',72000,1954,_country.mexico,72.5,[],{}];
    map[n.queretaro] = [ClubColors(Colors.blue,Colors.black),pattern.stripes3,Coordinates(20.57793742, -100.3662424),
      'Estádio Corregidora',40000,1950,_country.mexico,69.4,[],{}];
    map[n.oro] = [ClubColors(Colors.yellow,Colors.white),pattern.stripes3,Coordinates(0, 0),
      '',0,0,_country.mexico,50.0,[],{}];
    map[n.sanluis] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(22.1389898, -100.95071374670914),
      'Estadio Alfonso Lastras Ramírez',25709,2013,_country.mexico,68.7,[],{}];
    map[n.santoslaguna] = [ClubColors(Colors.green,Colors.white),pattern.horStripes2,Coordinates(25.62846869, -103.3796996),
      'Nuevo Estadio Corona',30000,1983,_country.mexico,72.9,[],{}];
    map[n.tampico] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0, 0),
      'Estadio Tamaulipas',19668,1945,_country.mexico,65.6,[],{}];
    map[n.tecos] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(20.6937821, -103.4162585),
      'Tres de Marzo',22988,1971,_country.mexico,66.1,[],{}];
    map[n.tigres] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(25.7232925346, -100.31197952),
      'Estádio Universitario',42000,1960,_country.mexico,78.0,[],{}];
    map[n.tijuana] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(32.5066600, -116.9931046),
      'Caliente',33333,2007,_country.mexico,71.5,[],{}];
    map[n.toluca] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(19.2873975, -99.66671939),
      'Estádio Nemesio Díez',30000,1917,_country.mexico,75.4,[],{}];
    map[n.torosneza] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(19.405891107, -98.9871339),
      'Estadio Neza 86',20000,1991,_country.mexico,68.4,[],{}];
    map[n.veracruz] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(19.16429626, -96.1252219),
      'Luis "Pirata" Fuente',30000,1943,_country.mexico,66.8,[],{}];
    map[n.zacatepec] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio',0,1948,_country.mexico,50.0,[],{"extinto": 2020}]; //EXTINTO 2020

    //USA
    map[n.atlanta] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(33.75535771, -84.40062064),
      'Mercedes-Benz Stadium',72035,2014,_country.unitedStates,71.4,[],{}];
    map[n.austin] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(30.38794963, -97.7192678),
      'Q2 Stadium',20738,2019,_country.unitedStates,68.6,[],{}];
    map[n.minnesota] = [ClubColors(Colors.blue,Colors.grey),pattern.solid,Coordinates(44.95329071, -93.16552316),
      'Allianz Field',19400,2010,_country.unitedStates,70.8,[],{}];
    map[n.cincinnati] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(39.1110140, -84.522226),
      'West End Stadium',26000,2015,_country.unitedStates,69.6,[],{}];
    map[n.columbuscrew] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.009552335, -82.9910362),
      'Mapfre Stadium',19968,1994,_country.unitedStates,72.0,[],{}];
    map[n.charlotte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.225876, -80.852819),
      'Bank of America Stadium',74867,2019,_country.unitedStates,67.4,[],{}];
    map[n.chicago] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.765063860516534, -87.80527756829989),
      'Toyota Park',20000,1997,_country.unitedStates,69.6,[],{}];
    map[n.chivasUSA] = [ClubColors(Colors.red,Colors.white,darkblue),pattern.stripes3,Coordinates(0,0),
      'StubHub Center',27000,2004,_country.unitedStates,50.0,[],{}];
    map[n.coloradorapids] = [ClubColors(grena,Colors.grey),pattern.solid,Coordinates(39.805555555,-104.891944444),
      'DSG Park',19680,1995,_country.unitedStates,70.3,[],{}];
    map[n.dcunited] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(38.8690816, -77.0125934),
      'Audi Field',20000,1995,_country.unitedStates,70.2,[],{}];
    map[n.fcdallas] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(33.15449939561873, -96.835056129),
      'Toyota Stadium',20500,1996,_country.unitedStates,70.9,[n.houston],{}];
    map[n.houston] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(29.752578440, -95.35189528),
      'BBVA Compass Stadium',22000,2005,_country.unitedStates,68.5,[n.fcdallas],{}];
    map[n.intermiami] = [ClubColors(Colors.purpleAccent,Colors.black),pattern.solid,Coordinates(26.19324744, -80.1606167),
      'Lockhart Stadium',17417,2018,_country.unitedStates,69.9,[],{}];
    map[n.lagalaxy] = [ClubColors(Colors.white,Colors.blue),pattern.diagonal,Coordinates(33.8648141474, -118.2611211),
      'Dignity Health Sports Park',27000,1994,_country.unitedStates,69.7,[n.losangelesfc],{}];
    map[n.losangelesfc] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(34.0128338, -118.283579),
      'Banc of California Stadium',22000,2014,_country.unitedStates,72.7,[n.lagalaxy],{}];
    map[n.montreal] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(45.5624524, -73.552839),
      'Saputo Stadium',19619,2010,_country.canada,66.7,[],{}];
    map[n.nashville] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(36.1301689, -86.7658585),
      'Geodis Park',30000,2016,_country.unitedStates,67.3,[],{}];
    map[n.nerevolution] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(42.091105, -71.264239),
      'Gillette Stadium',25000,1996,_country.unitedStates,71.9,[],{}];
    map[n.nycosmos] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0, 0),
      '',0,1970,_country.unitedStates,50.0,[],{"extinto": 1985}]; //EXTINTO 1985
    map[n.nycity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.82973906, -73.9261731193736),
      'Yankee Stadium',33488,2013,_country.unitedStates,71.6,[n.nyredbulls],{}];
    map[n.nyredbulls] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(40.73713616, -74.149881),
      'Red Bull Arena',25000,1995,_country.unitedStates,69.2,[n.nycity],{}];
    map[n.orlando] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(28.5412203, -81.38898748),
      'Exploria Stadium',25500,2010,_country.unitedStates,70.5,[],{}];
    map[n.portland] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(45.52168919, -122.69138305),
      'Providence Park',21144,1975,_country.unitedStates,71.1,[],{}];
    map[n.seattle] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(47.5953977, -122.3311995),
      'Lumen Field',68000,2007,_country.unitedStates,72.5,[],{}];
    map[n.philadelphia] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(39.83275356, -75.3779441855293),
      'PPL Park',18500,2008,_country.unitedStates,68.4,[],{}];
    map[n.toronto] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(43.63334099, -79.41830505),
      'BMO Field',30000,2005,_country.canada,68.1,[],{}];
    map[n.realSaltLake] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(40.5832722, -111.89327523),
      'Rio Tinto Stadium',20213,2004,_country.unitedStates,67.7,[],{}];
    map[n.sanJoseEarthquakes] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(37.3512815, -121.9244801),
      'Avaya Stadium',18000,1994,_country.unitedStates,66.5,[],{}];
    map[n.stlouiscity] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(0,0),
      'CityPark',22500,2019,_country.unitedStates,66.4,[],{}];
    map[n.tampabay] = [ClubColors(Colors.green,Colors.yellow),pattern.horStripes3,Coordinates(0,0),
      'Al Lang Stadium',7000,1996,_country.unitedStates,61.9,[],{}];
    map[n.kansas] = [ClubColors(Colors.lightBlueAccent,darkblue),pattern.solid,Coordinates(39.12169273, -94.82291920),
      'Children\'s Mercy Park',18467,1995,_country.unitedStates,68.2,[],{}];
    map[n.vancouver] = [ClubColors(darkblue,Colors.lightBlueAccent),pattern.solid,Coordinates(49.2770509, -123.1119131),
      'BC Place',54500,2009,_country.canada,69.0,[],{}];
    map[n.chicagosting] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Soldier Field',55000,1974,_country.unitedStates,50.0,[],{"extinto": 1988}]; //EXTINTO 1988
    map[n.dallastornado] = [ClubColors(Colors.white,Colors.blue),pattern.sleeves,Coordinates(0, 0),
      '',0,1967,_country.unitedStates,50.0,[],{"extinto": 1981}]; //EXTINTO 1981
    map[n.laaztecs] = [ClubColors(Colors.white,Colors.blue,Colors.orange),pattern.solid,Coordinates(0, 0),
      '',0,1973,_country.unitedStates,50.0,[],{"extinto": 1981}]; //EXTINTO 1981
    map[n.miamiFusion] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Lockhart Stadium',20450,1997,_country.unitedStates,64.9,[],{"extinto": 2001}]; //EXTINTO 2001

    //CANADA
    map[n.cavalry] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(50.8840803, -114.0987956),
      'ATCO Field',6000,2018,_country.canada,65.3,[],{}];
    map[n.forge] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(43.25220, -79.83009),
      'Tim Hortons Field',23218,2017,_country.canada,64.8,[],{}];

    //CARIBE
    //COSTA RICA
    map[n.saprissa] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(9.9656632, -84.07525166),
      'Ricardo Saprissa Aymá',23112,1935,_country.costaRica,66.8,[],{}];
    map[n.alajuelense] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(10.0218617, -84.20910),
      'Aleandro Morera Soto',17895,1919,_country.costaRica,67.2,[],{}];
    map[n.brujas] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.costaRica,50.0,[],{}];
    map[n.cartagines] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.85850690, -83.918919),
      'José Rafael Fello Meza Ivankovich',18000,1906,_country.costaRica,64.6,[],{}];
    map[n.herediano] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(9.99945, -84.12303),
      'Eladio Rosabal Cordero',17895,1921,_country.costaRica,65.3,[],{}];
    map[n.perezZeledon] = [ClubColors(Colors.blue,darkblue),pattern.solid,Coordinates(9.3687800, -83.704733),
      'Estadio Municipal Pérez Zeledón',6000,1991,_country.costaRica,61.2,[],{}];
    map[n.puntarenas] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(9.9763940, -84.838985),
      'Estadio Lito Pérez',4100,2004,_country.costaRica,62.7,[],{}];
    map[n.sanCarlos] = [ClubColors(darkblue,Colors.red),pattern.solid,Coordinates(10.32398660, -84.423708),
      'Estádio Carlos Ugalde Álvarez',6200,1965,_country.costaRica,62.4,[],{}];
    map[n.santosGuapiles] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(10.211370, -83.789813258),
      'Estadio Ebal Rodríguez',3000,1961,_country.costaRica,63.1,[],{}];
    map[n.sptSanJose] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.94251970, -84.13030),
      'Ernesto Rohrmoser Stadium',3000,2016,_country.costaRica,63.6,[],{}];
    //EL SALVADOR
    map[n.alianzaELS] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(13.6811446, -89.222373),
      'Estadio Cuscatlán',53400,1958,_country.elsalvador,66.4,[],{}];
    map[n.atleticomarte] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(13.6812, -89.2224),
      'Estadio Cuscatlán',53400,1950,_country.elsalvador,62.1,[],{}];
    map[n.aguila] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(13.482514, -88.16900),
      'Juan Francisco Barraza',15500,1926,_country.elsalvador,65.4,[],{}];
    map[n.fas] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(13.976406867, -89.56907633),
      'Estádio Óscar Quiteño',17500,1947,_country.elsalvador,64.7,[],{}];
    map[n.firpo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(13.34976510, -88.43801966),
      'Estádio Sergio Torres Rivera',10000,1923,_country.elsalvador,64.4,[],{}];
    map[n.isidro] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.332095, -89.44904),
      'Jorge "Calero" Suárez',2000,2000,_country.elsalvador,63.2,[],{}];
    map[n.santaTecla] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(13.6717297, -89.29938447),
      'Estádio Las Delicias',10000,2007,_country.elsalvador,62.0,[],{}];
    //GUATEMALA
    map[n.auroraGUA] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.guatemala,50.0,[],{}];
    map[n.antiguaGuatemala] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.5673481, -90.7381967),
      'Estadio Pensativo',9000,1958,_country.guatemala,65.0,[],{}];
    map[n.coban] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.guatemala,50.0,[],{}];
    map[n.comunicaciones] = [ClubColors(Colors.white,Colors.lightBlueAccent),pattern.solid,Coordinates(14.6258950, -90.509649),
      'Doroteo Guamuch Flores',26000,1949,_country.guatemala,66.1,[],{}];
    map[n.jalapa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.guatemala,50.0,[],{}];
    map[n.malacateco] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.guatemala,50.0,[],{}];
    map[n.municipal] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.62516724, -90.5101396),
      'Doroteo Guamuch Flores',26000,1936,_country.guatemala,66.8,[],{}];
    map[n.suchitepequez] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.guatemala,50.0,[],{}];
    map[n.xelaju] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(14.842098, -91.51714438),
      'Mario Camposeco',11000,1928,_country.guatemala,64.6,[],{}];
    map[n.depGuastatoya] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(14.860097, -90.07192),
      'Estadio David Cordón Hichos',3100,1990,_country.guatemala,62.8,[],{}];
    //HONDURAS
    map[n.marathon] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(15.47014392, -88.00675),
      'Estadio Olímpico Metropolitano',45000,1925,_country.honduras,64.3,[],{}];
    map[n.motagua] = [ClubColors(Colors.blue,darkblue),pattern.solid,Coordinates(14.098298, -87.2039269),
      'Tiburcio Carias Andino',35000,1928,_country.honduras,66.4,[],{}];
    map[n.olimpiaHON] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(14.09869, -87.203603),
      'Tiburcio Carias Andino',30000,1965,_country.honduras,68.2,[],{}];
    map[n.platense] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.honduras,50.0,[],{}];
    map[n.rcdespana] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(15.507659, -88.033096),
      'Francisco Morazán',26781,1929,_country.honduras,63.7,[],{}];
    map[n.sociedadHON] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.honduras,50.0,[],{}];
    map[n.victoriaHON] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.honduras,50.0,[],{}];
    map[n.vida] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(15.786427184160678, -86.78586767231687),
      'Estádio Nilmo Edwards',18000,1940,_country.honduras,61.2,[],{}];
    //NICARAGUA
    map[n.americamanagua] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nicaragua,50.0,[],{}];
    map[n.masaya] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nicaragua,50.0,[],{}];
    map[n.diriangen] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(11.8612898, -86.2433238),
      'Estadio Cacique Diriangén',7500,1917,_country.nicaragua,63.1,[],{}];
    map[n.juvmanagua] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nicaragua,50.0,[],{}];
    map[n.managua] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(12.131400, -86.284694),
      'Olímpico del IND Managua',9000,2006,_country.nicaragua,64.6,[],{}];
    map[n.realEsteli] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(13.097860, -86.352943),
      'Estadio Independencia',5000,1961,_country.nicaragua,65.9,[],{}];
    map[n.uca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nicaragua,50.0,[],{}];
    map[n.walterferreti] = [ClubColors(Colors.black,Colors.red),pattern.solid,Coordinates(12.1313953, -86.2846917),
      'Estádio Olímpico del IND Manágua',14000,1987,_country.nicaragua,61.4,[],{}];
    //PANAMA
    map[n.alianzaPAN] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.03394, -79.470226),
      'Luis Ernesto Cascarita Tapia',1000,1963,_country.panama,63.3,[],{}];
    map[n.arabeunido] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(9.34405, -79.89594),
      'Armando Dely Valdés',4000,1994,_country.panama,60.2,[],{}];
    map[n.chorrillo] = [ClubColors(Colors.yellow,Colors.blue),pattern.stripes3,Coordinates(0,0),
      'Estadio Universitario',1000,1974,_country.panama,62.8,[],{}];
    map[n.independienteChorrera] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(8.8873752, -79.775471),
      'Agustín Muquita Sánchez',3000,1982,_country.panama,61.4,[],{}];
    map[n.plazaAmador] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(8.945835, -79.549585),
      'Maracaná de Panamá',6000,1955,_country.panama,63.6,[],{}];
    map[n.sanfranciscoPAN] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(8.88742743, -79.77564414),
      'Estadio Agustín "Muquita" Sánchez',3000,1971,_country.panama,63.7,[],{}];
    map[n.sanMiguelito] = [ClubColors(Colors.red,Colors.black),pattern.stripes3,Coordinates(9.0482316, -79.511241),
      'Estadio Los Andes II',1450,1989,_country.panama,64.8,[],{}];
    map[n.tauro] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(9.0358766, -79.4693139),
      'Rommel Fernández',32000,1984,_country.panama,65.2,[],{}];

    //CARIBE
    //BELIZE
    map[n.bandits] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(17.2516295, -88.7635945),
      'Isidoro Beaton Stadium',2500,1978,_country.belize,63.1,[],{}];
    map[n.sanPedroPirates] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(17.90472143, -87.9790900),
      'Ambergris Stadium',1000,2017,_country.belize,61.1,[],{}];
    map[n.verdes] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(17.1601597, -89.0699064),
      'Norman Broaster Stadium',2000,1976,_country.belize,62.5,[],{}];
    //CUBA
    map[n.camaguey] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Terreno Sebastopol',1000,1912,_country.cuba,53.1,[],{}];
    map[n.ciegoavila] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0, 0),
      'Complejo Deportivo Sergio Alonso Grandal',3000,1978,_country.cuba,56.1,[],{}];
    map[n.cienfuegos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(22.135928, -80.44393),
      'Luis Pérez Lozano',4000,1978,_country.cuba,59.1,[],{}];
    map[n.lahabana] = [ClubColors(Colors.purple,darkblue),pattern.stripes2,Coordinates(0, 0),
      'Estadio La Polar',2000,1915,_country.cuba,58.1,[],{}];
    map[n.pinardelrio] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(22.421594, -83.69040778),
      'Estadio Capitán San Luis',8000,1978,_country.cuba,61.4,[],{}];
    map[n.santiagoCuba] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(20.0365537, -75.81123),
      'Pista de Atletismo de Rekortan',5000,0,_country.cuba,59.6,[],{}];
    map[n.villaclara] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(22.40494586, -79.950525),
      'Augusto César Sandino',18000,1978,_country.cuba,62.1,[],{}];
    //HAITI
    map[n.arcahaie] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(18.5585818, -72.3217),
      'Parc Saint-Yves',1000,2017,_country.haiti,64.2,[],{}];
    map[n.baltimoreHAI] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.haiti,50.0,[],{}];
    map[n.capoise] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.haiti,50.0,[],{}];
    map[n.cavaly] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(19.9298295, -72.71602628),
      'Parc Julia Vilbon',1000,1975,_country.haiti,61.2,[],{}];
    map[n.donbosco] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(18.5189640, -72.2777613),
      'Stade Pétion-Ville',5000,1963,_country.haiti,58.2,[],{}];
    map[n.fica] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(19.75364810, -72.20763375),
      'Parc Saint-Victor',7500,1972,_country.haiti,62.1,[],{}];
    map[n.mirebalais] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Parc Nelson Petit-Frère',2000,2000,_country.haiti,55.6,[],{}];
    map[n.racingHAITI] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(18.53614276, -72.34248),
      'Sylvio Cator',15000,1923,_country.haiti,57.8,[],{}];
    map[n.tempete] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Parc Levelt',10000,1970,_country.haiti,59.6,[],{}];
    map[n.violette] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(18.5361821, -72.342520),
      'Sylvio Cator',10500,1918,_country.haiti,64.3,[],{}];
    //JAMAICA
    map[n.arnettGardens] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(17.9889844, -76.79935),
      'Anthony Spaulding Sports Complex',7000,1977,_country.jamaica,59.5,[],{}];
    map[n.cavalier] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.jamaica,50.0,[],{}];
    map[n.harbourView] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.9565928, -76.717187),
      'Harbour View Stadium',10000,1974,_country.jamaica,56.2,[],{}];
    map[n.montego] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(0,0),
      'WespoW Park',7000,1972,_country.jamaica,55.6,[],{}];
    map[n.portmore] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(17.99285, -76.950748),
      'Prison Oval',2000,1985,_country.jamaica,57.6,[],{}];
    map[n.reno] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Frome Sports Club',2000,0,_country.jamaica,58.6,[],{}];
    map[n.tivoliGardens] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(17.9705540, -76.799638),
      'Edward Seaga Sports Complex',5000,1970,_country.jamaica,60.6,[],{}];
    map[n.wadadah] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.jamaica,50.0,[],{}];
    map[n.waterhouse] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(18.0013607, -76.77260),
      'Waterhouse Stadium',5000,1968,_country.jamaica,61.1,[],{}];
    //REP. DOMINICANA
    map[n.atlantico] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.dominicanRepublic,50.0,[],{}];
    map[n.cibao] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(19.44559127, -70.67974268),
      'Estadio Cibao FC',10000,2015,_country.dominicanRepublic,58.4,[],{}];
    map[n.barcelonaRDOM] = [ClubColors(darkblue,Colors.red),pattern.divided,Coordinates(18.4791854, -69.854427),
      'Estadio Parque del Este',3500,1989,_country.dominicanRepublic,58.2,[],{}];
    map[n.jarabacoa] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(19.22823197, -70.5135887),
      'Estadio Olímpico (La Vega)',10000,0,_country.dominicanRepublic,57.2,[],{}];
    map[n.omFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(18.48131234, -69.9187132),
      'Estadio Olímpico Félix Sánchez',27000,2010,_country.dominicanRepublic,59.3,[],{}];
    map[n.moca] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(19.38392934, -70.5341363),
      'Estadio Complejo Deportivo Moca 86',7000,1971,_country.dominicanRepublic,56.4,[],{}];
    map[n.pantoja] = [ClubColors(Colors.blue,Colors.yellow),pattern.oneHorStripe,Coordinates(18.480455936, -69.91863266),
      'Estadio Olímpico Félix Sánchez',27000,2000,_country.dominicanRepublic,60.1,[],{}];
    //SURINAME
    map[n.intermoengotapoe] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(5.6214317, -54.4016037),
      'Ronnie Brunswijkstadion',5000,1992,_country.suriname,61.5,[],{}];
    map[n.leovictor] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Dr. Ir. Franklin Essed Stadion',3500,1934,_country.suriname,57.2,[],{}];
    map[n.notch] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.suriname,50.0,[],{}];
    map[n.robinhood] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(5.8376520, -55.1602422),
      'André Kamperveen Stadion',6000,1945,_country.suriname,61.2,[],{}];
    map[n.snl] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.suriname,50.0,[],{}];
    map[n.transvaal] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(5.8377, -55.160),
      'André Kamperveen Stadion',6000,1921,_country.suriname,60.4,[],{}];
    map[n.voorwaarts] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Voorwaartsveld',1500,1919,_country.suriname,56.6,[],{}];
    map[n.walking] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Franklin Essed Stadion',3500,1997,_country.suriname,57.1,[],{"extinto": 2019}]; //EXTINTO 2019
    //TRINIDAD TOBAGO
    map[n.caledonia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.trinidadTobago,50.0,[],{}];
    map[n.centralFC] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(10.42489512, -61.41732595),
      'Ato Boldon Stadium',10000,2012,_country.trinidadTobago,56.6,[],{}];
    map[n.jabloteh] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.trinidadTobago,50.0,[],{}];
    map[n.joepublic] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.trinidadTobago,50.0,[],{}];
    map[n.wconnection] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(10.303194782, -61.44113680),
      'Manny Ramjohn Stadium',10000,1999,_country.trinidadTobago,58.6,[],{}];
    map[n.defenseforce] = [ClubColors(Colors.yellow,Colors.lightBlue),pattern.solid,Coordinates(10.661544, -61.533036),
      'Hasely Crawford',27000,1974,_country.trinidadTobago,61.0,[],{}];
    map[n.petrotrin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.trinidadTobago,50.0,[],{}];
    map[n.police] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(10.30349244, -61.4417926),
      'Manny Ramjohn Stadium',10000,1975,_country.trinidadTobago,57.3,[],{}];
    map[n.stAnnRangers] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(10.6615435, -61.53307856),
      'Hasely Crawford Stadium',24000,1979,_country.trinidadTobago,55.1,[],{}];

    //////////////////////////////////////////////////////////////////////////////////
    //CHINA
    map[n.august1] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.beijingguoan] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(39.865559, 116.272423),
      'Beijing Fengtai Stadium',31043,1992,_country.china,71.6,[],{}];
    map[n.cangzhou] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Cangzhou Stadium',31836,2011,_country.china,69.0,[],{}];
    map[n.chengfeng] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.changchun] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.836849, 125.39063),
      'Development Area Stadium',25000,1996,_country.china,69.3,[],{}];
    map[n.chengdu] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.97869, 103.648159),
      'Chengdu Phoenix Hill',57087,2018,_country.china,67.3,[],{}];
    map[n.chinaOlympic] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.chongqing] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.dalian] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(39.0208235, 121.56178),
      'Dalian Sports Center',61000,2009,_country.china,71.2,[],{}];
    map[n.ghuangzhou] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(23.1405485, 113.319334),
      'Tianhe Stadium',58500,1954,_country.china,65.3,[],{}];
    map[n.ghuangzhouCity] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,63.1,[],{}];
    map[n.guangdong] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.hebei] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Qinhuangdao Stadium',33000,2010,_country.china,66.2,[],{}];
    map[n.henan] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(34.71675, 113.72510),
      'Zhengzhou Hanghai',29860,1994,_country.china,68.6,[],{}];
    map[n.jiangsu] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(0, 0),
      'Nanjing Olympic Sports Centre',61443,1958,_country.china,50.0,[],{"extinto": 2021}]; //EXTINTO 2021
    map[n.meizhou] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(23.914710, 115.765430),
      'Huitang Stadium',27000,2013,_country.china,62.7,[],{}];
    map[n.nantong] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(32.376731, 120.584843),
      'Rugao Olympic Sports Center',15000,2016,_country.china,63.8,[],{}];
    map[n.liaoning] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(0,0),
      'Olímpico de Shenyang',60000,1953,_country.china,50.0,[],{}];
    map[n.qingdaohainiu] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Qingdao Tiantai Stadium',20525,1990,_country.china,65.3,[],{}];
    map[n.qingdaofc] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{"extinto": 2022}]; //EXTINTO 2022
    map[n.shandong] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(36.656062, 117.11020),
      'Luneng Stadium',56808,1993,_country.china,73.0,[],{}];
    map[n.shanghaisipg] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.1835,121.437278),
      'Estádio de Shanghai',56842,2005,_country.china,73.2,[],{}];
    map[n.shanghaishenhua] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(31.2734280, 121.476465),
      'Hongkou Stadium',33060,1993,_country.china,72.5,[],{}];
    map[n.shenxin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.shenzhen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(22.5620751, 114.0869843),
      'Luneng Stadium',32500,1994,_country.china,70.8,[],{}];
    map[n.sichuan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.tianjin] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.03144590, 117.7252421),
      'TEDA Football Stadium',37450,1957,_country.china,71.2,[],{}];
    map[n.wuhan] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(30.58665415, 114.27357162),
      'Xinhua Road Sports Center',22000,2009,_country.china,69.6,[],{}];
    map[n.wuhan3towns] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Wuhan Sports Center',54000,2013,_country.china,63.3,[],{}];
    map[n.yanbian] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.china,50.0,[],{}];
    map[n.zhejiang] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(30.2684601, 120.1288182),
      'Yellow Dragon Sports Center',52672,1998,_country.china,65.7,[],{}];
    //HONG KONG
    map[n.bulova] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.hongkong,50.0,[],{}];
    map[n.easternSC] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(22.326124787, 114.1731577),
      'Mong Kok Stadium',6664,1932,_country.hongkong,62.6,[],{}];
    map[n.happyvalley] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Happy Valley Recreation Ground',55000,1950,_country.hongkong,52.2,[],{}];
    map[n.jardines] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.hongkong,50.0,[],{}];
    map[n.kitchee] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(22.3260865, 114.1730563),
      'Mong Kok Stadium',6769,1931,_country.hongkong,64.2,[],{}];
    map[n.kmb] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.hongkong,50.0,[],{}];
    map[n.instantdict] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0,0),
      '',1000,1979,_country.hongkong,49.5,[],{}]; //2nd div.
    map[n.leeMan] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(22.3119310, 114.2638485),
      'Tseung Kwan O Sports Ground',3500,2017,_country.hongkong,61.5,[],{}];
    map[n.pegasus] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.hongkong,50.0,[],{}];
    map[n.rangersHK] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(0,0),
      'Hammer Hill Road Sports Ground',2200,1958,_country.hongkong,54.6,[],{}];
    map[n.seiko] = [ClubColors(darkblue,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      '',0,1970,_country.hongkong,50.0,[],{}]; //EXTINTO 1986
    map[n.southchina] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Happy Valley Recreation Ground',55000,1904,_country.hongkong,58.2,[],{}];
    map[n.sunhei] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      '',0,1986,_country.hongkong,43.5,[],{}];  //3rd division
    map[n.taipo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Tai Po Sports Ground',3200,2002,_country.hongkong,56.2,[],{}];
    //TAIWAN
    map[n.hangyuen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.taiwan,50.0,[],{}];
    map[n.tainancity] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.3208436, 120.3129334),
      'Tainan Football Field',2000,2016,_country.taiwan,62.7,[],{}];
    map[n.taipower] = [ClubColors(grena,Colors.green),pattern.solid,Coordinates(22.70342824, 120.29450958),
      'Kaoshiung National Stadium',55000,1978,_country.taiwan,62.0,[],{}];
    map[n.tatung] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.taiwan,50.0,[],{}];

    //JAPÃO
    map[n.albirex] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(37.88270153, 139.05925980),
      'Estádio Big Swan',42300,1955,_country.japan,67.5,[],{}];
    map[n.avispa] = [ClubColors(Colors.black,Colors.grey),pattern.solid,Coordinates(33.5859820, 130.460848),
      'Best Denki Stadium',22563,1982,_country.japan,68.6,[],{}];
    map[n.cerezoOsaka] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(34.61412159, 135.5185547),
      'Estádio Nagai',47000,1957,_country.japan,71.7,[],{}];
    map[n.fcTokyo] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(35.664162, 139.527388),
      'Ajinomoto Stadium',50100,1999,_country.japan,70.4,[],{}];
    map[n.gambaOsaka] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(34.802526,135.538278),
      'Suita Stadium',39694,1980,_country.japan,72.4,[],{}];
    map[n.jefUnited] = [ClubColors(Colors.yellow,Colors.green,Colors.red),pattern.solid,Coordinates(35.5775392, 140.122862),
      'Fukuda Denshi Arena',19781,1946,_country.japan,66.4,[],{}];
    map[n.jubiloiwata] = [ClubColors(Colors.lightBlueAccent,Colors.blueAccent),pattern.solid,Coordinates(34.7434570, 137.970775),
      'Shizuoka Ecopa',50000,1970,_country.japan,71.3,[],{}];
    map[n.kashimaantlers] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(35.992503, 140.64383881),
      'Kashima Soccer Stadium',40728,1994,_country.japan,72.6,[],{}];
    map[n.kashiwaReysol] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(35.8485972, 139.975101733),
      'Hitachi Kashiwa Soccer Stadium',15900,1940,_country.japan,71.7,[],{}];
    map[n.kawasakifrontale] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(35.585895,139.652731),
      'Todoroki Athletics Stadium',27495,1997,_country.japan,72.3,[],{}];
    map[n.kyoto] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(35.017214, 135.5850010),
      'Sanga Stadium',21326,1921,_country.japan,69.7,[],{}];
    map[n.hiroshima] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(34.440852708, 132.39482460),
      'Edion Stadium Hiroshima',1938,1938,_country.japan,68.6,[],{}];
    map[n.yamagata] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.japan,50.0,[],{}];
    map[n.nagoya] = [ClubColors(Colors.red,Colors.orange),pattern.solid,Coordinates(35.084593, 137.17108),
      'Estádio de Toyota',45000,1939,_country.japan,68.3,[],{}];
    map[n.omiyaardija] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(0,0),
      'NACK5 Stadium Omiya',15500,1964,_country.japan,64.3,[n.urawareddiamonds],{}];
    map[n.oitatrinita] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Big Eye',43000,1994,_country.japan,62.6,[],{}];
    map[n.sagantosu] = [ClubColors(Colors.blue,Colors.pink),pattern.solid,Coordinates(33.37167358, 130.520184),
      'Best Amenity',24490,1987,_country.japan,66.8,[],{}];
    map[n.sapporo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(43.0151545, 141.4096851),
      'Sapporo Dome',41484,1939,_country.japan,68.4,[],{}];
    map[n.shimizuSPulse] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(34.7430896, 137.9709125),
      'Shizuoka Stadium',51349,1991,_country.japan,68.7,[],{}];
    map[n.shonanbellmare] = [ClubColors(Colors.green,Colors.blue),pattern.solid,Coordinates(35.3436334, 139.341192),
      'Hiratsuka Athletics',18500,1968,_country.japan,66.1,[],{}];
    map[n.tokushima] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.japan,50.0,[],{}];
    map[n.tokyoVerdy] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.6634977, 139.52787047),
      'Ajinomoto Stadium',50000,1991,_country.japan,65.7,[],{}];
    map[n.urawareddiamonds] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(35.903142,139.717492),
      'Estádio Saitama 2002',63700,1950,_country.japan,74.2,[],{}];
    map[n.vegaltaSendai] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(38.31913456, 140.88192),
      'Yurtec Stadium Sendai',19694,1988,_country.japan,67.7,[],{}];
    map[n.ventforet] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.japan,50.0,[],{}];
    map[n.visselkobe] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(34.65734782, 135.1696),
      'Estádio Kobe Wing',30182,1966,_country.japan,74.0,[],{}];
    map[n.yokohamaFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.46916, 139.603706),
      'Mitsuzawa Stadium',15046,1999,_country.japan,70.4,[],{}];
    map[n.flugels] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.japan,50.0,[],{}];
    map[n.yokohamamarinos] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(35.5102166, 139.60648),
      'Estádio Internacional de Yokohama',72327,1972,_country.japan,72.0,[],{}];

    //SOUTH KOREA
    map[n.busan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.190186683, 129.05830),
      'Busan Asiad',53864,1979,_country.southKorea,67.6,[],{}];
    map[n.daejeon] = [ClubColors(Colors.teal,Colors.red),pattern.solid,Coordinates(0,0),
      'Purple Arena',41295,1997,_country.southKorea,65.4,[],{}];
    map[n.daegu] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(35.881330, 128.588442),
      'DGB Daegu Bank Park',12415,2002,_country.southKorea,66.8,[],{}];
    map[n.gangwon] = [ClubColors(Colors.orange,Colors.green),pattern.solid,Coordinates(37.7737816, 128.897490),
      'Gangneung Stadium',30000,2008,_country.southKorea,64.7,[],{}];
    map[n.gimcheon] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.139672, 128.08642078),
      'Gimcheon Stadium',32000,1984,_country.southKorea,63.5,[],{}];
    map[n.gwangju] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(35.134007983384144, 126.87496766795036),
      'Gwangju World Cup Stadium',40074,2010,_country.southKorea,62.5,[],{}];
    map[n.gyeongnam] = [ClubColors(Colors.red,Colors.black),pattern.diagonal,Coordinates(35.22327294841361, 128.70572619764155),
      'Changwon Football Center',15074,2006,_country.southKorea,66.5,[],{}];
    map[n.hallelujah] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southKorea,50.0,[],{}];
    map[n.hanil] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southKorea,50.0,[],{}];
    map[n.incheon] = [ClubColors(Colors.blue,Colors.black),pattern.stripes4,Coordinates(37.466183, 126.64357953),
      'Incheon Football Stadium',20891,2003,_country.southKorea,68.9,[],{}];
    map[n.jeonnam] = [ClubColors(Colors.purple,Colors.yellow),pattern.solid,Coordinates(34.932827412380334, 127.72747519763314),
      'Gwang-Yang Stadium',14284,1994,_country.southKorea,65.1,[],{}];
    map[n.jeonbuk] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(35.8683430, 127.064329),
      'Jeonju World Cup Stadium',42477,1994,_country.southKorea,71.8,[],{}];
    map[n.jeju] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(33.24632024, 126.509235),
      'Jeju World Cup Stadium',35657,1982,_country.southKorea,67.5,[],{}];
    map[n.pohang] = [ClubColors(Colors.red,Colors.black),pattern.horStripes2,Coordinates(36.0088520, 129.363788),
      'Pohang Steel Yard',25000,1973,_country.southKorea,70.8,[],{}];
    map[n.fcseoul] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(37.56837781, 126.897502),
      'Seoul World Cup Stadium',66704,1983,_country.southKorea,68.4,[],{}];
    map[n.seongnam] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(37.4101435, 127.1213833),
      'Tancheon Sports Complex',16146,1989,_country.southKorea,66.7,[],{}];
    map[n.suwonFC] = [ClubColors(Colors.red,darkblue),pattern.stripes2,Coordinates(37.29781725789677, 127.01108810563669),
      'Suwon Sports Complex',11808,2016,_country.southKorea,63.1,[],{}];
    map[n.suwonsamsung] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(37.2866172728, 127.0367),
      'Big Bird',43288,1995,_country.southKorea,70.1,[],{}];
    map[n.ulsan] = [ClubColors(Colors.blue,Colors.blueAccent),pattern.stripes3,Coordinates(35.56251397, 129.3483643),
      'Munsu Cup Stadium',44474,1983,_country.southKorea,73.0,[],{}];
    //NORTH KOREA
    map[n.amnokgang] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northKorea,50.0,[],{}];
    map[n.april25] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(39.0495805, 125.775884),
      'Rungrado 1st of May',114000,1983,_country.northKorea,64.2,[],{}];
    map[n.hwaebul] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northKorea,50.0,[],{}];
    map[n.kigwancha] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(40.11040, 124.41391785),
      'Sinuiju Stadium',17500,1956,_country.northKorea,62.5,[],{}];
    map[n.pyongyang] = [ClubColors(Colors.blue,Colors.red,Colors.white),pattern.solid,Coordinates(39.04828881, 125.77541058),
      'Rungrado 1st of May',114000,1956,_country.northKorea,62.0,[],{}];
    map[n.ryomyong] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northKorea,50.0,[],{}];
    map[n.sobaeksu] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.northKorea,50.0,[],{}];

    //RESTO ASIA - TAILANDIA
    map[n.bangkok] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(14.06813405, 100.599042),
      'Thammasat Stadium',25000,1988,_country.thailand,50.0,[],{}];
    map[n.bangkokBank] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(0,0),
      'Bangkok Bank Ground',2000,1955,_country.thailand,50.0,[],{}];
    map[n.buriram] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(14.96592429, 103.0944633),
      'New i-mobile Stadium',32600,1970,_country.thailand,50.0,[],{}];
    map[n.chainat] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(15.2192277, 100.155405),
      'Khao Plong Stadium',12000,2009,_country.thailand,50.0,[],{}];
    map[n.chiangrai] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(19.9569382, 99.87459810),
      'Leo Chiangrai Stadium',11354,2009,_country.thailand,50.0,[],{}];
    map[n.chonburi] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(13.411198007, 100.9935489),
      'Chonburi Stadium',8680,1997,_country.thailand,50.0,[],{}];
    map[n.khonkaen] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(16.412952125, 102.8276527),
      'Khon Kaen Provincial',7000,2014,_country.thailand,50.0,[],{}];
    map[n.lampang] = [ClubColors(Colors.teal,Colors.black),pattern.solid,Coordinates(0,0),
      'Lampang Province Stadium',5500,2010,_country.thailand,50.0,[],{}];
    map[n.lamphun] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Mae Guang Stadium',3000,2011,_country.thailand,50.0,[],{}];
    map[n.muangthong] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(13.918021654, 100.5473407),
      'Thunderdome Stadium',15000,1989,_country.thailand,50.0,[],{}];
    map[n.nakhon] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(14.92710584, 102.0494550),
      '80th Birthday Stadium',24641,1999,_country.thailand,50.0,[],{}];
    map[n.nongbuaPitchaya] = [ClubColors(Colors.purpleAccent,Colors.blue),pattern.solid,Coordinates(17.1942153, 102.43564512),
      'Pitchaya Stadium',6000,2010,_country.thailand,50.0,[],{}];
    map[n.pattaya] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Nong Prue Stadium',5500,1989,_country.thailand,54.0,[],{}];
    map[n.pathum] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(14.00078645, 100.679328),
      'Leo Stadium',10114,2006,_country.thailand,50.0,[],{}];
    map[n.prachuap] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(11.81750065, 99.7886435),
      'Sam Ao Stadium',5000,2009,_country.thailand,50.0,[],{}];
    map[n.portFC] = [ClubColors(Colors.blue,Colors.orange),pattern.divided,Coordinates(13.7151569, 100.55962713),
      'PAT Stadium',8000,1967,_country.thailand,50.0,[],{}];
    map[n.policetero] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(13.86733613, 100.578051),
      'Boonyachinda Stadium',3550,1992,_country.thailand,50.0,[],{}];
    map[n.ratchaburi] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(13.52162906, 99.7698381),
      'Mitr Phol Stadium',10000,2004,_country.thailand,50.0,[],{}];
    map[n.thaiAirForce] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Thupatemi Stadium',25000,1937,_country.thailand,54.0,[],{}];
    map[n.samutPrakan] = [ClubColors(Colors.blue,Colors.lightGreenAccent),pattern.horStripes2,Coordinates(13.5792926, 100.7946855),
      'Samut Prakarn SAT Stadium',5100,2019,_country.thailand,50.0,[],{}];
    map[n.sukhothai] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Thalay Luang Stadium',8000,2009,_country.thailand,50.0,[],{}];
    map[n.suphanburi] = [ClubColors(darkblue,Colors.orange),pattern.solid,Coordinates(14.4740419, 100.08671126),
      'Estádio Municipal de Suphanburi',25000,1998,_country.thailand,50.0,[],{}];
    map[n.thai] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(0,0),
      'Kasikorn Bank Stadium',5000,1987,_country.thailand,50.0,[],{}];
    //INDIA
    map[n.aizawl] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Rajiv Gandhi Stadium',20000,1984,_country.india,57.8,[],{}];
    map[n.atk] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Salt Lake Stadium',85000,2014,_country.india,50.0,[],{"extinto": 2020}]; //EXTNTO 2020
    map[n.bengaluru] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(12.9698491, 77.5938683),
      'Sree Kanteerava',19000,2013,_country.india,63.5,[],{}];
    map[n.chennaiyin] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(13.0858151, 80.271831),
      'Jawaharlal Nehru',40000,2014,_country.india,64.8,[],{}];
    map[n.churchill] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Fatorda Stadium',27300,1951,_country.india,55.5,[],{}];
    map[n.delhi] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(20.28804185, 85.8236558),
      'Kalinga Stadium',60000,2014,_country.india,65.6,[],{}];
    map[n.dempo] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(15.28902862, 73.96277713),
      'Fatorda Stadium',24500,1968,_country.india,58.6,[],{}];
    map[n.eastbengal] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(22.55947727, 88.3438917),
      'East Bengal Ground',23500,1920,_country.india,65.0,[],{}];
    map[n.jamshedpur] = [ClubColors(Colors.red,Colors.blue),pattern.sleeves,Coordinates(22.8062110, 86.19337526),
      'JRD Tata Sports Complex',23887,2017,_country.india,63.6,[],{}];
    map[n.jct] = [ClubColors(Colors.red,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Guru Nanak Stadium',22000,1971,_country.india,50.0,[],{"extinto": 2011}]; //EXTINOTO 2011
    map[n.goa] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(15.28948422, 73.962551),
      'Fatorda Stadium',24500,2014,_country.india,66.3,[],{}];
    map[n.hyderabad] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(17.446364257, 78.34410),
      'G.M.C Balayogi Athletic',30000,2019,_country.india,64.1,[],{}];
    map[n.kerala] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(13.08564797, 80.2716407),
      'Jawaharlal Nehru',75000,2014,_country.india,63.3,[],{}];
    map[n.mahindra] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Cooperage Ground',5000,1962,_country.india,50.0,[],{"extinto": 2010}]; //EXTINTO 2010
    map[n.mohunbagan] = [ClubColors(Colors.green,Colors.red),pattern.stripes3,Coordinates(22.5622357, 88.34235),
      'Mohun Bagan Ground',20000,2020,_country.india,61.5,[],{}];
    map[n.mumbai] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(19.042204573, 73.0269),
      'DY Patil Stadium',55000,2014,_country.india,65.8,[],{}];
    map[n.pune] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,2014,_country.india,50.8,[],{}]; //EXTINTO 2019
    map[n.northeast] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(26.115528, 91.760329),
      'Indira Gandhi Athletic Stadium',35000,2004,_country.india,66.2,[],{}];
    map[n.odisha] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(20.2880451, 85.82383754),
      'Kalinga Stadium',60000,2014,_country.india,62.6,[],{}];
    map[n.salgaocar] = [ClubColors(Colors.green,Colors.white),pattern.oneHorStripe,Coordinates(0, 0),
      '',0,0,_country.india,50.0,[],{}];
    //BANGLADESH
    map[n.bashundhara] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.93206572, 88.845353167),
      'Estádio Sheikh Kamal',21359,2013,_country.bangladesh,61.8,[],{}];
    map[n.dhakaAbahani] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(23.72791777, 90.4135417),
      'Bangabandhu National Stadium',60000,1972,_country.bangladesh,60.1,[],{}];
    map[n.mohammedan] = [ClubColors(Colors.black,Colors.white),pattern.sleeves,Coordinates(22.56896939, 88.4089041),
      'Vivekananda Yuba Bharati Krirangan',85000,1891,_country.bangladesh,63.3,[],{}];
    map[n.saif] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.54811565, 90.5364364),
      'Munshigonj District Stadium',10000,2016,_country.bangladesh,58.3,[],{}];
    map[n.sheikhJamal] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(23.5477248, 90.53690),
      'Munshigonj District Stadium',10000,1962,_country.bangladesh,56.8,[],{}];
    //CAMBOJA
    map[n.boeungKet] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(11.536736, 104.9561471),
      'Cambodia Airways Stadium',2500,2008,_country.cambodia,60.5,[],{}];
    map[n.buildbright] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cambodia,50.0,[],{}];
    map[n.khemara] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Olympic Stadium',50000,1977,_country.cambodia,50.0,[],{"extinto": 2011}]; //EXTINTO 2011
    map[n.nationaldef] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cambodia,50.0,[],{}];
    map[n.nagaworld] = [ClubColors(Colors.purple,Colors.black),pattern.solid,Coordinates(11.4883311, 104.483529),
      'Kampong Speu Stadium',3000,2001,_country.cambodia,61.2,[],{}];
    map[n.phnomPenhCrown] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(11.6047089, 104.894398),
      'RSN Stadium',5000,2001,_country.cambodia,63.1,[],{}];
    map[n.preahKhan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(11.082494, 105.802971),
      'Svay Rieng Stadium',2150,1997,_country.cambodia,62.6,[],{}];
    map[n.svayrieng] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.cambodia,50.0,[],{}];
    map[n.visakha] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(11.62644372, 104.8736629),
      'Prince Stadium',10000,2016,_country.cambodia,62.0,[],{}];
    //INDONESIA
    map[n.arema] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Kanjuruhan Stadium',42449,1987,_country.indonesia,60.9,[],{}];
    map[n.bali] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-8.5468398, 115.3064336),
      'Kapten I Wayan Dipta',18000,2015,_country.indonesia,67.1,[],{}];
    map[n.bandung] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.indonesia,50.0,[],{}];
    map[n.baritoputera] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '17th May Stadium',15000,1988,_country.indonesia,55.6,[],{}];
    map[n.bhayangkara] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Wibawa Mukti Stadium',30000,2010,_country.indonesia,59.7,[],{}];
    map[n.borneo] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.49305867, 117.14939),
      'Segiri Stadium',16000,2014,_country.indonesia,65.4,[],{}];
    map[n.dewa] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Indomilk Arena',15000,2009,_country.indonesia,52.7,[],{}];
    map[n.madura] = [ClubColors(Colors.white,Colors.red),pattern.horStripes3,Coordinates(0,0),
      'Gelora Ratu Pamelingan Stadium',13500,2016,_country.indonesia,60.7,[],{}];
    map[n.persib] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-6.957815877, 107.712158),
      'Gelora Bandung Lautan Api Stadium',38000,1933,_country.indonesia,63.6,[],{}];
    map[n.persebaya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-7.223110, 112.6228187),
      'Gelora Bung Tomo Stadium',30000,1927,_country.indonesia,66.1,[],{}];
    map[n.persija] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Patriot Candrabhaga Stadium',30000,1928,_country.indonesia,62.4,[],{}];
    map[n.persipura] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-2.5790803, 140.57361),
      'Lukas Enembe',40263,1963,_country.indonesia,65.1,[],{}];
    map[n.persik] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Brawijaya Stadium',20000,1950,_country.indonesia,56.3,[],{}];
    map[n.persikabo] = [ClubColors(darkgreen,Colors.black),pattern.divided,Coordinates(0,0),
      'Pakansari Stadium',30000,2015,_country.indonesia,50.0,[],{}];
    map[n.persis] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Manahan Stadium',20000,1923,_country.indonesia,56.2,[],{}];
    map[n.persita] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(0,0),
      'Indomilk Arena',15000,1953,_country.indonesia,59.1,[],{}];
    map[n.psis] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Jatidiri Stadium',25000,1932,_country.indonesia,62.8,[],{}];
    map[n.psmMakassar] = [ClubColors(grena,Colors.yellow),pattern.solid,Coordinates(-4.03674060, 119.6459761),
      'Gelora B.J. Habibie Stadium',20000,1915,_country.indonesia,61.6,[],{}];
    map[n.pss] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Maguwoharjo Stadium',31700,1976,_country.indonesia,55.6,[],{}];
    map[n.psmsMedan] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(3.5649591, 98.6956563),
      'Teladan Stadium',20000,1950,_country.indonesia,62.6,[],{}];
    map[n.sriwijaya] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.indonesia,50.0,[],{}];
    //LAOS
    map[n.chanthabouly] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(18.0615339, 102.703581),
      'New Laos National Stadium',25000,2013,_country.laos,58.8,[],{}];
    map[n.laobank] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.laos,50.0,[],{}];
    map[n.laopolice] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.laos,50.0,[],{}];
    map[n.shbvientiane] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.laos,50.0,[],{}];
    map[n.youngElephants] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(18.0620644, 102.703995),
      'New Laos National Stadium',25000,2015,_country.laos,59.5,[],{}];
    map[n.vientianefc] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.laos,50.0,[],{}];
    map[n.yotha] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.laos,50.0,[],{}];
    //MALAYSIA
    map[n.felda] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malaysia,50.0,[],{}];
    map[n.johordarul] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.497541866, 103.751479),
      'Larkin Stadium',30000,1970,_country.malaysia,68.4,[],{}];
    map[n.kedah] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(6.135977965, 100.3716979),
      'Darul Aman Stadium',32387,1924,_country.malaysia,62.6,[],{}];
    map[n.kelantanunited] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Sultan Muhammad IV Stadium',22000,2016,_country.malaysia,55.3,[],{}];
    map[n.kelantan] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(6.1242980, 102.243682),
      'Sultan Muhammad IV Stadium',22000,1946,_country.malaysia,58.4,[],{}];
    map[n.kualalumpur] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.10071364, 101.721440),
      'Kuala Lumpur Stadium',18000,1974,_country.malaysia,65.8,[],{}];
    map[n.kuching] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(0,0),
      'Sarawak State Stadium',40000,2015,_country.malaysia,55.7,[],{}];
    map[n.lionsxii] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.malaysia,50.0,[],{}];
    map[n.negeri] = [ClubColors(Colors.red,Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Tuanku Abdul Rahman Stadium',45000,1923,_country.malaysia,57.6,[],{}];
    map[n.pdrm] = [ClubColors(Colors.red,Colors.orange),pattern.solid,Coordinates(0,0),
      'Petaling Jaya Stadium',18000,1990,_country.malaysia,58.6,[],{}];
    map[n.penang] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.26120426, 100.437613187),
      'Penang State Stadium',40000,1921,_country.malaysia,63.1,[],{}];
    map[n.perak] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Perak Stadium',42500,1921,_country.malaysia,58.9,[],{}];
    map[n.perlis] = [ClubColors(Colors.yellow,blue),pattern.stripes3,Coordinates(0,0),
      'Tuanku Syed Putra Stadium',20000,1963,_country.malaysia,50.0,[],{}]; //EXTINTO 209
    map[n.sabah] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(5.98317860, 116.0955644),
      'Likas Stadium',35000,1950,_country.malaysia,59.3,[],{}];
    map[n.sripahang] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(3.814934281, 103.3237541),
      'Darul Makmur Stadium',40000,1959,_country.malaysia,61.5,[],{}];
    map[n.selangor] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(3.08214134, 101.54496),
      'Our Tampines Hub',80372,1905,_country.malaysia,65.4,[],{}];
    map[n.terengganu] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Sultan Mizan Zainal Abidin Stadium',50000,1956,_country.malaysia,62.5,[],{}];
    //MALDIVES
    map[n.maziya] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(4.174317668, 73.513048572),
      'National Football Stadium',11850,1956,_country.maldives,58.6,[],{}];
    //MYANMAR
    map[n.ayeyawady] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(21.97699345, 96.0992539),
      'Ayar Stadium',3000,2009,_country.myanmar,59.0,[],{}];
    map[n.shanUnited] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(16.4950564, 97.62395418),
      'KBZ Stadium',7000,2005,_country.myanmar,61.6,[],{}];
    map[n.yadanarbon] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(21.97707786, 96.099176),
      'Bahtoo Stadium',17000,2009,_country.myanmar,59.6,[],{}];
    map[n.yangon] = [ClubColors(darkblue,Colors.greenAccent),pattern.solid,Coordinates(16.8473329, 96.1271126),
      'Yangon United Sports Complex',3500,2009,_country.myanmar,62.0,[],{}];
    //MONGOLIA
    map[n.athletic220] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(47.900222, 106.916315),
      'MFF Football Centre',5000,2016,_country.mongolia,56.1,[],{}];
    map[n.erchim] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(47.888914, 106.79751),
      'Erchim Stadium',2000,1994,_country.mongolia,58.7,[],{}];
    map[n.khoromkhon] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.9022031, 106.91699),
      'MFF Football Centre',5000,1999,_country.mongolia,57.6,[],{}];
    map[n.ulaanbaatar] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(47.8013018, 106.744977),
      'G-Mobile Arena',5300,2016,_country.mongolia,59.5,[],{}];
    //VIETNA
    map[n.becamex] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(10.97050, 106.67195),
      'Gò Đậu Stadium',18250,1976,_country.vietnam,58.5,[],{}];
    map[n.danang] = [ClubColors(Colors.orange,Colors.purple),pattern.solid,Coordinates(10.97050, 106.67195),
      'Hòa Xuân Stadium',20500,1976,_country.vietnam,61.2,[],{}];
    map[n.dongtam] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(10.53649442990149, 106.40791233920433),
      'Long An Stadium',19975,2000,_country.vietnam,62.1,[],{}];
    map[n.haiphong] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(20.851882, 106.688773),
      'Lạch Tray Stadium',30000,1952,_country.vietnam,60.5,[],{}];
    map[n.hanoi] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(21.0298189, 105.833028),
      'Hàng Đẫy Stadium',22500,2006,_country.vietnam,64.6,[],{}];
    map[n.hanoipolice] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Hàng Đẫy Stadium',22500,1956,_country.vietnam,58.4,[],{}];
    map[n.gialai] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(13.9791847, 108.0048264),
      'Pleiku Stadium',25000,2001,_country.vietnam,57.8,[],{}];
    map[n.hochiminh] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(10.76034756, 106.66339),
      'Thống Nhất Stadium',15000,1960,_country.vietnam,62.1,[],{}];
    map[n.honglinhhatinh] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Hà Tĩnh Stadium',30000,2015,_country.vietnam,59.7,[],{}];
    map[n.khanhhoa] = [ClubColors(darkblue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Nha Trang Stadium',25000,1976,_country.vietnam,56.4,[],{}];
    map[n.namdinh] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Thiên Trường Stadium',30000,1965,_country.vietnam,59.2,[],{}];
    map[n.quangNam] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(15.559992, 108.50684),
      'Tam Ky Stadium',15624,1997,_country.vietnam,60.2,[],{}];
    map[n.saigon] = [ClubColors(Colors.purpleAccent,Colors.purple),pattern.solid,Coordinates(10.761339, 106.663524),
      'Thong Nhat Stadium',15000,2016,_country.vietnam,64.0,[],{}];
    map[n.songLam] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(18.669197, 105.669119),
      'Vinh Stadium',18000,1979,_country.vietnam,59.5,[],{}];
    map[n.thanhoa] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(19.799246, 105.772764),
      'Thanh Hóa Stadium',14000,1962,_country.vietnam,58.1,[],{}];
    map[n.topenland] = [ClubColors(Colors.brown,Colors.orange),pattern.solid,Coordinates(0,0),
      'Quy Nhơn Stadium',25000,1975,_country.vietnam,63.4,[],{}];
    map[n.viettel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(21.0303177, 105.832964),
      'Hàng Đẫy Stadium',22500,1954,_country.vietnam,62.5,[],{}];
    //FILIPINAS
    map[n.globalCebu] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(10.300411, 123.8953386),
      'Cebu City Sports Center',5500,2000,_country.philippines,62.1,[],{}];
    map[n.kaya] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(10.7119240, 122.56245),
      'Iloilo Sports Complex',7000,1996,_country.philippines,61.3,[],{}];
    map[n.loyola] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.philippines,50.0,[],{}];
    map[n.maharlikaManila] = [ClubColors(Colors.black,Colors.purple),pattern.solid,Coordinates(14.563410, 120.9921828),
      'Rizal Memorial Stadium',12873,2020,_country.philippines,65.3,[],{}];
    map[n.stallionLaguna] = [ClubColors(Colors.pink,Colors.black),pattern.solid,Coordinates(14.3149952, 121.0779346),
      'Biñan Football Stadium',2580,2002,_country.philippines,62.1,[],{}];
    map[n.unitedCity] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(15.3455705, 120.5335554),
      'New Clark City Athletics',20000,2012,_country.philippines,64.6,[],{}];
    //NEPAL
    map[n.churchboys] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.friendsclub] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.jawalakhel] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.khumaltar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.himalayansherpa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.machhindra] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(27.69569827, 85.3148114),
      'Dasarath Rangasala',15000,1973,_country.nepal,61.8,[],{}];
    map[n.manangMarshyangdi] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(27.6950160, 85.314920),
      'Dasarath Rangasala',15000,1982,_country.nepal,60.3,[],{}];
    map[n.nepalPolice] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.nepalapf] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.newroad] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.satdobatoyouth] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.sankata] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.threestar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    map[n.tribhuvanarmy] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nepal,50.0,[],{}];
    //SINGAPORE
    map[n.albirexSINGAPORE] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(1.346770647, 103.7298978),
      'Jurong East Stadium',2700,2004,_country.singapore,60.1,[],{}];
    map[n.geylang] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.singapore,50.0,[],{}];
    map[n.lionCitySailors] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(1.310122578, 103.86030328),
      'Estádio Jalan Besar',6000,1946,_country.singapore,55.6,[],{}];
    map[n.tampines] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(1.3528877, 103.940622),
      'Our Tampines Hub',5000,1945,_country.singapore,59.2,[],{}];
    map[n.warriors] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(1.391140, 103.74921),
      'Choa Chu Kang Stadium',10000,1975,_country.singapore,58.6,[],{}];
    //BRUNEI
    map[n.bruneidpmm] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(1.35453962, 103.851562),
      'Ground Bishan',30000,2000,_country.brunei,58.4,[],{}];

    //ORIENTE MÉDIO
    //QATAR
    map[n.alahlidoha] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(25.251639093616497, 51.5350507206643),
      'Hamad bin Khalifa Stadium',12000,1950,_country.qatar,64.8,[],{}];
    map[n.alarabi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.25861235, 51.520695),
      'Grand Hamad Stadium',18000,1952,_country.qatar,68.4,[],{}];
    map[n.alduhail] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(25.373468, 51.469251),
      'Abdullah bin Khalifa',10221,1938,_country.qatar,71.2,[],{}];
    map[n.algharafa] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(25.3448014, 51.4405835),
      'Al-Gharafa Stadium',25000,1979,_country.qatar,69.5,[],{}];
    map[n.alittihaddoha] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.qatar,50.0,[],{}];
    map[n.alkharaitiyat] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.qatar,50.0,[],{}];
    map[n.alkhor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.qatar,50.0,[],{}];
    map[n.almarkhiya] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Markhiya Stadium',200,1995,_country.qatar,63.6,[],{}];
    map[n.alrayyan] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(25.329864, 51.342718),
      'Ahmed bin Ali Stadium',27000,1967,_country.qatar,70.2,[],{}];
    map[n.alsadd] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(25.267630, 51.484458),
      'Jassim Bin Hamad',15000,1969,_country.qatar,71.8,[],{}];
    map[n.alsailiya] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Hamad bin Khalifa Stadium',12000,1995,_country.qatar,59.7,[],{}];
    map[n.alshamal] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Shamal SC Stadium',5300,1980,_country.qatar,62.6,[],{}];
    map[n.alshahania] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.qatar,50.0,[],{}];
    map[n.alwakrah] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.sleeves,Coordinates(25.159858119997757, 51.57380662210604),
      'Al-Wakrah Stadium',20000,1959,_country.qatar,63.2,[],{}];
    map[n.eljaish] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(25.372635, 51.4686),
      'Abdullah bin Khalifa Stadium',12000,2017,_country.qatar,67.5,[],{}];
    map[n.qatar] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(25.31702622, 51.51216724),
      'Suheim bin Hamad Stadium',15000,1961,_country.qatar,65.6,[],{}];
    map[n.ummsalal] = [ClubColors(Colors.redAccent,Colors.orange),pattern.solid,Coordinates(25.3169538, 51.5122531),
      'Qatar SC Stadium',20000,1979,_country.qatar,64.2,[],{}];
    //UAE
    map[n.ajman] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(25.392500, 55.450728),
      'Estádio Ajman',5537,1974,_country.uae,68.1,[],{}];
    map[n.alain] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(24.245059, 55.7170932),
      'Hazza bin Zayed',25053,1968,_country.uae,71.6,[],{}];
    map[n.albataeh] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Al Bataeh Stadium',2000,2012,_country.uae,59.8,[],{}];
    map[n.aldhafra] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Al Dhafra Stadium',5020,2000,_country.uae,50.0,[],{}];
    map[n.aljazira] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(24.452764,54.392019),
      'Estádio Mohammed Bin Zayed',42000,1974,_country.uae,73.2,[],{}];
    map[n.alnasrEAU] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(25.23990846, 55.312893),
      'Al Maktoum Stadium',15058,1945,_country.uae,70.3,[],{}];
    map[n.alshaab] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uae,50.0,[],{}];
    map[n.alshababEAU] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(25.2398565, 55.3129988),
      'Al Maktoum',20000,1958,_country.uae,64.7,[],{}];
    map[n.alsharjah] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(25.3332735, 55.4195766),
      'Sharjah Stadium',10000,1966,_country.uae,69.1,[],{}];
    map[n.alwahda] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(24.469883556, 54.3753338),
      'Estádio Al Nahyan',12000,1974,_country.uae,71.2,[],{}];
    map[n.alwasl] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(25.219131, 55.3169737),
      'Zabeel Stadium',18000,1960,_country.uae,70.4,[],{}];
    map[n.baniyas] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(24.34986, 54.68571),
      'Baniyas Stadium',9047,1974,_country.uae,66.2,[],{}];
    map[n.dibbafuj] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'New Dibba Stadium',9000,1976,_country.uae,58.6,[],{}];
    map[n.emirates] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uae,50.0,[],{}];
    map[n.kalba] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Ittihad Kalba Stadium',8500,1972,_country.uae,63.0,[],{}];
    map[n.khorfakkan] = [ClubColors(darkgreen,Colors.white),pattern.solid,Coordinates(0,0),
      'Saqr bin Mohammed Al Qasimi Stadium',7500,1981,_country.uae,62.8,[],{}];
    map[n.shababalahli] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(25.279691, 55.3607072),
      'Rashed Stadium',15000,1958,_country.uae,68.4,[],{}];
    //BAHREIN
    map[n.alahliBAH] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(25.2633977, 51.4475668),
      'Khalifa International Stadium',50000,1950,_country.bahrein,66.8,[],{}];
    map[n.alhala] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Muharraq Club Stadium',10000,1955,_country.bahrein,60.2,[],{}];
    map[n.alhidd] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.15366, 50.54359),
      'Bahrain National Stadium',24000,1945,_country.bahrein,65.6,[],{}];
    map[n.alkhaldiya] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Bahrain National Stadium',24000,2020,_country.bahrein,63.0,[],{}];
    map[n.almuharraq] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(26.25750173, 50.62779),
      'Al Muharraq Stadium',20000,1928,_country.bahrein,68.7,[],{}];
    map[n.alnasrBAH] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.bahrein,50.0,[],{}];
    map[n.alriffa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(26.1528, 50.542743),
      'Bahrain National Stadium',24000,1953,_country.bahrein,66.2,[],{}];
    map[n.alshababBAH] = [ClubColors(Colors.white,grena),pattern.solid,Coordinates(0,0),
      'Bahrain National Stadium',24000,2001,_country.bahrein,50.0,[],{}];
    map[n.bahrain] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(26.2576, 50.6278),
      'Al Muharraq Stadium',20000,1928,_country.bahrein,61.3,[],{}];
    map[n.budaiya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Hamad Town Stadium',0,0,_country.bahrein,50.0,[],{}];
    map[n.eastriffa] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(26.15307, 50.543223),
      'Bahrain National Stadium',24000,1958,_country.bahrein,64.3,[],{}];
    map[n.malkiya] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Madinat \'Isa Stadium',15000,1968,_country.bahrein,62.0,[],{}];
    map[n.manama] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(26.1535, 50.54359),
      'Bahrain National Stadium',24000,1946,_country.bahrein,66.5,[],{}];
    map[n.sitra] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0,0),
      'Bahrain National Stadium',24000,1957,_country.bahrein,61.8,[],{}];
    //SOUTH ARABIA
    map[n.abha] = [ClubColors(Colors.white,darkblue),pattern.solid,Coordinates(0,0),
      'Prince Sultan bin Abdul Aziz Stadium',25000,1966,_country.southArabia,62.3,[],{}];
    map[n.aladalah] = [ClubColors(darkblue,vinho),pattern.solid,Coordinates(0,0),
      'Prince Abdullah bin Jalawi Stadium',26000,1984,_country.southArabia,62.5,[],{}];
    map[n.alahli] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(21.446627355, 39.2523386),
      'Prince Abdullah al-Faisal Stadium',27000,1937,_country.southArabia,69.7,[],{}];
    map[n.albatin] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Batin Club Stadium',6000,1979,_country.southArabia,58.5,[],{}];
    map[n.alettifaq] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.426514, 50.114128),
      'Prince Mohamed bin Fahd Stadium',26000,1945,_country.southArabia,68.4,[],{}];
    map[n.alFaisalyARABIA] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(25.88693735, 45.36807),
      'Al Majma\'ah Sports City',7000,1954,_country.southArabia,66.3,[],{}];
    map[n.alfateh] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(25.305669, 49.61340246),
      'Prince Abdullah bin Jalawi Stadium',19550,1958,_country.southArabia,67.2,[],{}];
    map[n.alfayha] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(0,0),
      'King Salman Sport City Stadium',1953,7000,_country.southArabia,61,7,[],{}];
    map[n.alhazem] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southArabia,50.0,[],{}];
    map[n.alhilal] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(24.78903170, 46.8395937),
      'King Fahd Stadium',67000,1957,_country.southArabia,74.6,[],{}];
    map[n.alkhaleej] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Prince Nayef bin Abdulaziz Stadium',10000,1945,_country.southArabia,61.3,[],{}];
    map[n.alIttihad] = [ClubColors(Colors.black,Colors.yellow),pattern.stripes3,Coordinates(21.44662735, 39.2524137),
      'Prince Abdullah Al-Faisal Stadium',27000,1927,_country.southArabia,72.5,[],{}];
    map[n.alnahda] = [ClubColors(darkblue,Colors.black),pattern.sleeves,Coordinates(0,0),
      'Prince Mohamed bin Fahd Stadium',26000,1949,_country.southArabia,61.6,[],{}];
    map[n.alnajma] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southArabia,50.0,[],{}];
    map[n.alnassr] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(21.76355015, 39.164367968),
      'Universitário Rei Saud',25000,1955,_country.southArabia,73.1,[],{}];
    map[n.alQadisiya] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(26.36978679702696, 50.20531143365966),
      'Príncipe Saud bin Jalawi Stadium',15000,1967,_country.southArabia,65.3,[],{}];
    map[n.alraed] = [ClubColors(Colors.red,Colors.grey),pattern.solid,Coordinates(26.3795, 43.948),
      'King Abdullah Sports City Stadium',30000,1954,_country.southArabia,67.1,[],{}];
    map[n.alriad] = [ClubColors(Colors.black,Colors.red),pattern.stripes2,Coordinates(0, 0),
      'Prince Faisal bin Fahd Stadium',24000,1953,_country.southArabia,61.8,[],{}];
    map[n.alshabab] = [ClubColors(Colors.white,Colors.orange),pattern.solid,Coordinates(24.78829136, 46.839111),
      'Estádio Internacional Rei Fahd',75000,1947,_country.southArabia,70.2,[],{}];
    map[n.altaawoun] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(26.37901905, 43.9477167),
      'King Abdullah Sport City Stadium',25000,1956,_country.southArabia,68.4,[],{}];
    map[n.altai] = [ClubColors(Colors.grey,Colors.black),pattern.solid,Coordinates(27.50443671, 41.697737),
      'Prince Abdul Aziz bin Musa\'ed Stadium',12250,1961,_country.southArabia,65.6,[],{}];
    map[n.alwehda] = [ClubColors(Colors.red,Colors.white),pattern.horStripes2,Coordinates(21.485628639631926, 39.97341283681545),
      'King Abdul Aziz Stadium',38000,1945,_country.southArabia,66.1,[],{}];
    map[n.damac] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(18.3105417, 42.597956),
      'Prince Sultan bin Abdul Aziz Stadium',20000,1972,_country.southArabia,66.6,[],{}];
    map[n.ohod] = [ClubColors(Colors.brown,Colors.orange),pattern.solid,Coordinates(24.662447731029168, 46.73996035875249),
      'Prince Faisal bin Fahd Stadium',24000,1936,_country.southArabia,60.8,[],{}];
    //IRÃ
    map[n.persepolis] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.72465, 51.27574),
      'Azadi Stadium',100000,1963,_country.iran,70.6,[],{}];
    map[n.esteghlal] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.7246, 51.2758),
      'Azadi Stadium',100000,1945,_country.iran,70.0,[],{}];
    map[n.aluminiumarak] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Imam Khomeini',15000,2001,_country.iran,64.3,[],{}];
    map[n.daraei] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.esteghlalahvaz] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.esteghlalkhuzestan] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.fajrsepasi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.foolad] = [ClubColors(Colors.red,Colors.yellow),pattern.dividedHor,Coordinates(31.27940887, 48.779954),
      'Foolad Arena',30655,1971,_country.iran,68.5,[],{}];
    map[n.golgohar] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Gol Gohar Sport Complex',8000,1997,_country.iran,66.8,[],{}];
    map[n.havadar] = [ClubColors(Colors.purple,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Shahid Dastgerdi Stadium',8250,2018,_country.iran,50.0,[],{}];
    map[n.homa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.malavan] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(37.4656557, 49.4555056),
      'Ghayeghran Stadium',8000,1969,_country.iran,63.7,[],{}];
    map[n.meskerman] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Shahid Bahonar Stadium',15430,1998,_country.iran,57.5,[],{}];
    map[n.mesrafsanjan] = [ClubColors(Colors.orange,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'Shohadaye Mes Stadium',3800,1997,_country.iran,63.8,[],{}];
    map[n.nafttehran] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(38.06720361289564, 46.30146846703867),
      'Estádio Takhti',30122,1950,_country.iran,62.2,[],{}];
    map[n.naftmasjedsoleyman] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Behnam Mohammadi Stadium',8000,1965,_country.iran,58.2,[],{}];
    map[n.nassajimazandaran] = [ClubColors(Colors.red,darkblue),pattern.solid,Coordinates(0,0),
      'Vatani Stadium',15000,1959,_country.iran,56.5,[],{}];
    map[n.pastehran] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Shahid Dastgerdi Stadium',8250,1963,_country.iran,0,[],{"extinto": 2007}]; //EXTINTO 2007
    map[n.paykan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Shahr-e Qods Stadium',25000,1967,_country.iran,58.6,[],{}];
    map[n.sabaqom] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.saipa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(35.850008586, 50.9585994),
      'Enghelab Stadium',15000,1989,_country.iran,67.4,[],{}];
    map[n.sanatnaft] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Takhti Stadium',15000,1972,_country.iran,55.7,[],{}];
    map[n.sepahan] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.74323273, 51.686141),
      'Naghsh-e Jahan',75000,1953,_country.iran,68.4,[],{}];
    map[n.shahrkhodro] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.taj] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iran,50.0,[],{}];
    map[n.tractor] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.026986, 46.29611924),
      'Sahand Stadium',66833,1970,_country.iran,66.5,[],{}];
    map[n.zobahan] = [ClubColors(Colors.white,Colors.green),pattern.oneHorStripe,Coordinates(32.48286848, 51.42148270),
      'Foolad Shahr Stadium',25000,1969,_country.iran,66.1,[],{}];
    //IRAQUE
    map[n.aldiwaniya] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Diwaniya Stadium',5000,1965,_country.iraq,53.9,[],{}];
    map[n.alhudood] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Al Taji Stadium',10000,1976,_country.iraq,59.8,[],{}];
    map[n.aljaishIRAQ] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0, 0),
      'Al Jaish Stadium',6000,1974,_country.iraq,58.4,[],{}];
    map[n.aljamiea] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iraq,50.0,[],{}];
    map[n.alkarkh] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Al-Saher Ahmed Radhi Stadium',5150,1963,_country.iraq,61.1,[],{}];
    map[n.alkahrabaa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Kahrabaa Stadium',2000,2001,_country.iraq,63.6,[],{}];
    map[n.alnajaf] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(32.06649995646604, 44.316522535998885),
      'Al-Najaf International Stadium',30000,1961,_country.iraq,62.8,[],{}];
    map[n.alshababIRAQ] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iraq,50.0,[],{}];
    map[n.alShortaIRAQ] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(33.324906, 44.435304),
      'Al-Shaab Stadium',34200,1932,_country.iraq,66.3,[],{}];
    map[n.alQuwaAlJawiya] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(33.3535912, 44.4543854),
      'Al-Zawraa Stadium',6000,1931,_country.iraq,67.2,[],{}];
    map[n.alminaa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.552446545782608, 47.77825289285119),
      'Al-Minaa Olympic Stadium',30000,1931,_country.iraq,60.4,[],{}];
    map[n.alnaft] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0, 0),
      'Al Naft Stadium',3000,1979,_country.iraq,58.4,[],{}];
    map[n.alqasim] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Al Kifl Stadium',8000,1973,_country.iraq,55.6,[],{}];
    map[n.alsinaa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Sinaa Stadium',10000,1965,_country.iraq,56.0,[],{}];
    map[n.alTalaba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(33.35487913150901, 44.4551793306512),
      'Al-Madina Stadium',32000,1977,_country.iraq,65.9,[],{}];
    map[n.alzawraa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(33.3443251, 44.36832511),
      'Al-Zawraa Stadium',15443,1969,_country.iraq,66.6,[],{}];
    map[n.duhok] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0, 0),
      '',0,1970,_country.iraq,50.0,[],{}];
    map[n.erbil] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(36.17239419584394, 44.01174293577056),
      'Franso Hariri Stadium',25000,1968,_country.iraq,63.4,[],{}];
    map[n.karbalaa] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Karbala International Stadium',30000,1958,_country.iraq,57.5,[],{}];
    map[n.naftAlwasat] = [ClubColors(darkgreen,Colors.black),pattern.stripes2,Coordinates(0, 0),
      'Al-Najaf International Stadium',30000,2008,_country.iraq,63.0,[],{}];
    map[n.naftalbasra] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Fayhaa Stadium',10000,1979,_country.iraq,61.3,[],{}];
    map[n.naftmaysan] = [ClubColors(vinho,Colors.lightBlueAccent),pattern.sleeves,Coordinates(0,0),
      'Maysan Olympic Stadium',25000,2003,_country.iraq,63.0,[],{}];
    map[n.newroz] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(0,0),
      'Sulaymaniyah Stadium',15000,1997,_country.iraq,58.4,[],{}];
    map[n.salahaddin] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.iraq,50.0,[],{}];
    map[n.zakho] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Zakho International Stadium',25000,1987,_country.iraq,57.2,[],{}];
    //JORDAN
    map[n.alFaisalyJORD] = [ClubColors(Colors.lightBlue,Colors.white),pattern.solid,Coordinates(31.9846345, 35.902814),
      'Estádio Internacional de Amã',25000,1932,_country.jordan,64.5,[],{}];
    map[n.alahliJOR] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Amman International Stadium',17619,1944,_country.jordan,59.7,[],{}];
    map[n.aljazeeraJORD] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.98449751563597, 35.90309487089629),
      'Amman International Stadium',17619,1947,_country.jordan,62.1,[],{}];
    map[n.alhussein] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(32.53749750529685, 35.86002002084294),
      'Al-Hassan Stadium',12000,1964,_country.jordan,61.5,[],{}];
    map[n.alRamtha] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(32.540733, 36.0193454),
      'Prince Hashim Stadium',5000,1966,_country.jordan,64.8,[],{}];
    map[n.alsalt] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(32.0579113, 35.7019326),
      'Al-Salt Stadium',1000,1965,_country.jordan,60.2,[],{}];
    map[n.alWehdat] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(31.92822, 35.95329),
      'King Abdullah II Stadium',13265,1956,_country.jordan,65.1,[],{}];
    map[n.amman] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1976,_country.jordan,59.7,[],{}];
    map[n.shababAlOrdon] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(31.9277385, 35.9525510),
      'King Abdullah II Stadium',13000,2002,_country.jordan,63.7,[],{}];
    //KUWAIT
    map[n.alarabiKUW] = [ClubColors(Colors.green,Colors.green),pattern.solid,Coordinates(29.35759875, 47.9999575),
      'Sabah Al Salem Stadium',22000,1960,_country.kuwait,63.1,[],{}];
    map[n.alfahaheel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Nayif Al Dabbous Stadium Kuwait',2000,1964,_country.kuwait,57.6,[],{}];
    map[n.aljahra] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Al Shabab Mubarak Alaiar Stadium',17000,1966,_country.kuwait,54.5,[],{}];
    map[n.alqadsia] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(29.34052466, 48.0307858),
      'Mohammed Al-Hamad Stadium',26000,1960,_country.kuwait,63.4,[],{}];
    map[n.alnasar] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Ali Sabah Al-Salem Stadium',10000,1965,_country.kuwait,58.5,[],{}];
    map[n.alsalmiya] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(29.341094414957308, 48.08857776474847),
      'Thamir Stadium',20000,1964,_country.kuwait,60.8,[],{}];
    map[n.alkuwait] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(29.34280293, 47.95224442),
      'Al Kuwait Sports Club',12350,1960,_country.kuwait,65.8,[],{}];
    map[n.alsahel] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Abu Halifa City Stadium',2000,1967,_country.kuwait,51.5,[],{}];
    map[n.altadhamon] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Farwaniya Stadium',14000,1965,_country.kuwait,53.2,[],{}];
    map[n.kazma] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(29.328998, 47.9877632),
      'Al-Sadaqua Walsalam Stadium',21500,1964,_country.kuwait,62.8,[],{}];
    //LEBANON
    map[n.alahed] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(33.840550954, 35.4898395),
      'Al Ahed',2000,1964,_country.lebanon,64.6,[],{}];
    map[n.alansar] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(33.8384684, 35.495880),
      'Al Ansar',5000,1951,_country.lebanon,65.1,[],{}];
    map[n.alsafa] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(33.87476897, 35.492256455),
      'Safa Stadium',4000,1939,_country.lebanon,59.2,[],{}];
    map[n.akhaaaley] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Amin AbdelNour Stadium',3500,1962,_country.lebanon,54.2,[],{}];
    map[n.bourj] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Bourj el-Barajneh Stadium',1500,1967,_country.lebanon,62.6,[],{}];
    map[n.chababghazieh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Kfarjoz Stadium',2000,1961,_country.lebanon,50.0,[],{}];
    map[n.homenetmen] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1921,_country.lebanon,47.2,[],{}];
    map[n.racingbeirut] = [ClubColors(Colors.white,blue),pattern.solid,Coordinates(33.98655407265724, 35.63924069945886),
      'Fouad Chehab Stadium',5000,1934,_country.lebanon,54.2,[],{}];
    map[n.nejmeh] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(33.894420, 35.4695427),
      'Prince Mohammed bin Abdul Aziz',5000,1945,_country.lebanon,66.2,[],{}];
    map[n.sagesse] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1943,_country.lebanon,58.5,[],{}];
    map[n.salamzgharta] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Zgharta Sports Complex',5500,1933,_country.lebanon,56.8,[],{}];
    map[n.shababsahel] = [ClubColors(Colors.blue,Colors.white),pattern.sleeves,Coordinates(0,0),
      '',0,1966,_country.lebanon,62.6,[],{}];
    map[n.tadamonsour] = [ClubColors(Colors.red,darkblue),pattern.stripes2,Coordinates(0,0),
      'Sour Municipal Stadium',6500,1946,_country.lebanon,61.7,[],{}];
    map[n.tripoliLEB] = [ClubColors(Colors.blue,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Tripoli Municipal Stadium',22000,2001,_country.lebanon,60.7,[],{}];
    //OMAN
    map[n.alnasrOMAN] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.oman,50.0,[],{}];
    map[n.alnahdaOMAN] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.oman,50.0,[],{}];
    map[n.alorouba] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(22.527735, 59.47351),
      'Sur Sports Complex',10000,1970,_country.oman,62.6,[],{}];
    map[n.alseeb] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(23.6192524, 58.216613),
      'Al-Seeb Stadium',14000,1972,_country.oman,61.5,[],{}];
    map[n.alsuwaiq] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(23.6183616, 58.2166664),
      'Al-Seeb Stadium',14000,1972,_country.oman,62.0,[],{}];
    map[n.dhofar] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(17.0827617, 54.143738),
      'Al-Saada Stadium',14000,1968,_country.oman,64.2,[],{}];
    map[n.fanja] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(23.573023, 58.39957523),
      'Sultan Qaboos Sports Complex',34000,1970,_country.oman,63.6,[],{}];
    map[n.muscat] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.oman,50.0,[],{}];
    map[n.omanclub] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.oman,50.0,[],{}];
    map[n.sur] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.oman,50.0,[],{}];
    //PALESTINE
    map[n.shababAlKhalil] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(31.50767914, 35.0321318),
      'Dura International Stadium',18000,1943,_country.palestine,60.6,[],{}];
    map[n.hilalAlQuds] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(31.8476340, 35.23024420),
      'Faisal Al-Husseini International',12500,1972,_country.palestine,61.2,[],{}];
    //SYRIA
    map[n.alfutowa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0, 0),
      'Deir ez-Zor Municipal Stadium',13000,1930,_country.syria,57.7,[],{}];
    map[n.alhurriya] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Al-Hamadaniah Stadium',15000,1952,_country.syria,54.7,[],{}];
    map[n.aljaish] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(33.5227937, 36.3200108),
      'Abbasiyyin Stadium Damascus',30000,1945,_country.syria,63.5,[],{}];
    map[n.aljazeeraSYR] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Al Baladi Stadium Hasakah',25000,1941,_country.syria,61.4,[],{}];
    map[n.alkaramah] = [ClubColors(Colors.blue,Colors.orange),pattern.solid,Coordinates(34.729750, 36.69807434),
      'Khalid ibn al-Walid',32000,1928,_country.syria,67.3,[],{}];
    map[n.alittihadSYR] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(36.1855477, 37.120093),
      'Al-Hamadaniah Stadium',15000,1949,_country.syria,65.4,[],{}];
    map[n.almajd] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Jalaa Stadium',10000,1932,_country.syria,57.4,[],{}];
    map[n.altaliya] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Hama Municipal Stadium',22000,1941,_country.syria,58.2,[],{}];
    map[n.alshortadamascus] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(33.5048124, 36.288935),
      'Tishreen Stadium',12000,1947,_country.syria,65.1,[],{}];
    map[n.alwahdaSYR] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(0, 0),
      'Al-Jalaa Stadium',10000,1928,_country.syria,62.3,[],{}];
    map[n.alWathba] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(34.72953927051385, 36.69825235900537),
      'Khaled bin Walid Stadium',32000,1937,_country.syria,60.7,[],{}];
    map[n.jableh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(35.364225, 35.926686),
      'Al-Baath Stadium',10000,1958,_country.syria,63.4,[],{}];
    map[n.hutteen] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Al-Assad Stadium',28000,1945,_country.syria,61.7,[],{}];
    map[n.tishreen] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(33.5053761, 36.2892507),
      'Tishreen',28000,1947,_country.syria,66.4,[],{}];


    //ASIA CENTRAL
    //KYRGYSTAN
    map[n.algaBishkek] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(42.8387036, 74.59046472),
      'Dynamo Stadion',10000,1947,_country.kyrgyzstan,60.3,[],{}];
    map[n.abdyshAtaKant] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.sleeves,Coordinates(42.8804125, 74.5978947),
      'Sportkompleks Abdysh-Ata',3000,1992,_country.kyrgyzstan,62.0,[],{}];
    map[n.alay] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.5210113, 72.8044473),
      'Suyumbayev Stadion',11200,1967,_country.kyrgyzstan,63.2,[],{}];
    map[n.dordoiBishkek] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(42.8891419, 74.6099425),
      'Stadion Dordoi',3000,1997,_country.kyrgyzstan,65.1,[],{}];
    //TAJIKISTAN
    map[n.dynamodushambe] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tajikistan,50.0,[],{}];
    map[n.istiklol] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(38.58518545, 68.7687534),
      'Central Republican Stadium',20000,2007,_country.tajikistan,67.3,[],{}];
    map[n.khujand] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(40.2920138, 69.6141332),
      'Bistsolagii Istiqloliyati Stadium',25000,1976,_country.tajikistan,65.0,[],{}];
    map[n.pamirDushanbe] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(38.58589341, 68.7694599),
      'Markazii Tojikiston',20000,1950,_country.tajikistan,65.4,[],{}];
    map[n.ravshan] = [ClubColors(Colors.purple,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Kulob Central Stadium',20000,1965,_country.tajikistan,50.0,[],{}];
    map[n.regartadaz] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(38.5175302, 68.216069866),
      'TALCO Arena',10000,1976,_country.tajikistan,61.4,[],{}];
    map[n.sitora] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tajikistan,50.0,[],{}];
    map[n.vakhsh] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tajikistan,50.0,[],{}];
    map[n.varzob] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      '',0,1996,_country.tajikistan,50.0,[],{}];
    //TURKMENISTAN
    map[n.ahalAnew] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(37.92816482, 58.350370),
      'Ashgabat Stadium',20000,1989,_country.turkmenistan,62.8,[],{}];
    map[n.altynAsyr] = [ClubColors(darkblue,Colors.blue),pattern.solid,Coordinates(38.0461412, 58.19675041),
      'Büzmeýin Sport Topulmy',10000,2008,_country.turkmenistan,64.6,[],{}];
    map[n.ashgabat] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.turkmenistan,50.0,[],{}];
    map[n.kopetdag] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(37.94950226, 58.3703196),
      'Köpetdag Stadium',26000,1947,_country.turkmenistan,63.1,[],{}];
    map[n.nebitci] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(41.826113637, 59.9346186),
      'Sport Toplumy Stadium',10000,1960,_country.turkmenistan,62.5,[],{}];
    map[n.nisaAshgabat] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Nisa-Çandybil Stadium',1500,1994,_country.turkmenistan,63.7,[],{}];
    map[n.sagadam] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(40.0144962, 52.987931256),
      'Şagadam Stadium',5000,1949,_country.turkmenistan,62.1,[],{}];
    map[n.yedigen] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(37.9571185, 58.33029616),
      'HTTU Stadium',1000,2003,_country.turkmenistan,61.7,[],{}];
    //UZBEQUISTÃO
    map[n.agmk] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(40.845856398, 69.61275686),
      'OKMK Sport Majmuasi',12000,2004,_country.uzbekistan,63.5,[],{}];
    map[n.andijon] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Soghlom Avlod Stadium',18366,1964,_country.uzbekistan,60.4,[],{}];
    map[n.bunyodkor] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(41.2796393, 69.212486),
      'Milliy Stadioni',34000,2005,_country.uzbekistan,69.0,[],{}];
    map[n.buxoro] = [ClubColors(Colors.lightBlueAccent,Colors.blue),pattern.solid,Coordinates(0,0),
      'Buxoro Arena',22700,1989,_country.uzbekistan,62.9,[],{}];
    map[n.metallurg] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Metallurg Bekabad Stadium',15000,1945,_country.uzbekistan,63.7,[],{}];
    map[n.mhsk] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.uzbekistan,50.0,[],{}];
    map[n.nasafqarshi] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(41.24051632, 71.546443),
      'Markaziy Stadium',21000,1986,_country.uzbekistan,65.4,[],{}];
    map[n.navbahor] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Markaziy Stadium',22000,1978,_country.uzbekistan,67.6,[],{}];
    map[n.neftchifargona] = [ClubColors(Colors.green,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Istiqlol Stadium',20000,1962,_country.uzbekistan,68.2,[],{}];
    map[n.olympictashkent] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Jar Stadium',12000,2021,_country.uzbekistan,58.9,[],{}];
    map[n.pakhtakor] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(41.3156628, 69.26059),
      'Pakhtakor Markaziy Stadium',35000,1956,_country.uzbekistan,69.5,[],{}];
    map[n.loktashkent] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(41.36116543, 69.394842616),
      'Lokomotiv Stadium',8000,2002,_country.uzbekistan,66.8,[],{}];
    map[n.qizilqum] = [ClubColors(Colors.orange,darkblue),pattern.solid,Coordinates(0,0),
      'Yoshlar Stadium',12500,1967,_country.uzbekistan,60.8,[],{}];
    map[n.sogdiyona] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(40.115161, 67.82866878),
      'Sogdiyona Sport Majmuasi',11850,1970,_country.uzbekistan,64.3,[],{}];
    map[n.surkhon] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Alpamish Stadium',6000,1968,_country.uzbekistan,61.6,[],{}];
    map[n.turon] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Uzbekistan Stadium',9000,0,_country.uzbekistan,58.6,[],{}];
    map[n.dustlik] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1963,_country.uzbekistan,67.6,[],{}]; //EXTINTO 2003
    map[n.navbahor] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      '',0,1963,_country.uzbekistan,67.6,[],{}];

    //////////////////////////////////////////////////////////////////////////
    //OCEANIA
    //NEW ZEALAND
    map[n.auckland] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(-36.89779, 174.736646117),
      'Kiwitea Street',3500,2004,_country.newZealand,68.3,[],{}];
    map[n.aucklandutd] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Keith Hay Park',500,2020,_country.newZealand,64.4,[],{}];
    map[n.birkenhead] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Shepherds Park',500,1960,_country.newZealand,55.4,[],{}];
    map[n.canterbury] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.easternsuburbs] = [ClubColors(Colors.white,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Bill McKinlay Park',5000,1934,_country.newZealand,62.4,[],{}];
    map[n.hamiltonwanderers] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Porritt Stadium',5000,1913,_country.newZealand,60.4,[],{}];
    map[n.hawkebay] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.manukau] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.melville] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Gower Park',500,1972,_country.newZealand,56.4,[],{}];
    map[n.otago] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.southernunited] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.waikato] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.newZealand,50.0,[],{}];
    map[n.waitakere] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Fred Taylor Park',4000,2003,_country.newZealand,63.1,[],{}];
    map[n.wellingtonphoenix] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-41.273115, 174.78582),
      'Westpac Stadium',35000,2007,_country.newZealand,65.4,[],{}];
    map[n.teamwellington] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'David Farrington Park',2250,2004,_country.newZealand,50.0,[],{"extinto": 2021}]; //EXTINTO 2021

    //AUSTRALIA
    map[n.adelaide] = [ClubColors(Colors.red,Colors.blue),pattern.solid,Coordinates(-34.9074787, 138.56896413),
      'Coopers Stadium',16500,2003,_country.australia,65.1,[],{}];
    map[n.brisbane] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-27.464607, 153.0096921280),
      'Suncorp Stadium',53223,2005,_country.australia,63.7,[],{}];
    map[n.centralcoast] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-33.42820, 151.3379147192544),
      'Bluetongue Stadium',20119,2004,_country.australia,64.2,[],{}];
    map[n.macarthur] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(-34.05025627, 150.8336304),
      'Campbelltown Stadium',20000,2017,_country.australia,63.5,[],{}];
    map[n.marconiStallions] = [ClubColors(Colors.green,Colors.white,Colors.red),pattern.solid,Coordinates(-33.863507, 150.880201),
      'Marconi Stadium',9000,1958,_country.australia,54.7,[],{}];
    map[n.melbournecity] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(-37.8251, 144.9840),
      'AAMI Park',30050,2009,_country.australia,64.3,[],{}];
    map[n.melbournevictory] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(-37.825063012, 144.983956),
      'AAMI Park',30050,2004,_country.australia,68.3,[],{}];
    map[n.newcastlejets] = [ClubColors(Colors.yellow,darkblue),pattern.solid,Coordinates(-32.918943, 151.726707182),
      'Hunter Stadium',34000,2000,_country.australia,65.2,[],{}];
    map[n.perth] = [ClubColors(Colors.purple,Colors.white),pattern.solid,Coordinates(-31.945730, 115.86990),
      'HBF Park Stadium',20500,1995,_country.australia,66.1,[],{}];
    map[n.sydneyFC] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.888853, 151.22556784),
      'Sydney Football Stadium',45500,2004,_country.australia,68.3,[],{}];
    map[n.sydneywanderers] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-33.8079, 150.99936),
      'Parramatta Stadium',20741,2012,_country.australia,65.3,[],{}];
    map[n.westernunited] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-38.157997, 144.355),
      'GMHBA Stadium',26000,2018,_country.australia,64.7,[],{}];
    
    //FIJI
    map[n.ba] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-17.53471030105424, 177.66962532319994),
      'Govind Park',13500,1935,_country.fiji,54.7,[],{}];
    map[n.labasa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.fiji,50.0,[],{}];
    map[n.lautoka] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-17.606725734774464, 177.45208248942035),
      'Estádio Churchill Park',18000,1934,_country.fiji,56.7,[],{}];
    map[n.nadi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.fiji,50.0,[],{}];
    map[n.nadroga] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.fiji,50.0,[],{}];
    map[n.rewa] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-18.031241919000315, 178.53537523970556),
      'Vodafone Ratu Cakobau Park',8000,1928,_country.fiji,55.7,[],{}];
    map[n.suva] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.fiji,50.0,[],{}];
    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    //NORTE AFRICA
    //EGITO
    map[n.alahly] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(30.069291, 31.31241),
      'Estádio Internacional do Cairo',71400,1907,_country.egypt,75.1,[n.zamalek],{}];
    map[n.alittihadalexandriaclub] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.almasry] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(31.271395, 32.291329),
      'Porto Said Stadium',18000,1920,_country.egypt,70.2,[],{}];
    map[n.almokawloonalarab] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes2,Coordinates(30.051032954087077, 31.29710369533754),
      'Osman Ahmed Stadium',35000,1973,_country.egypt,64.8,[],{}];
    map[n.aswan] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Aswan Stadium',20000,1930,_country.egypt,63.0,[],{}];
    map[n.ceramicacleopatra] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(29.957375, 32.542372),
      'Suez Stadium',27000,2007,_country.egypt,65.6,[],{}];
    map[n.eldakhleya] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Police Academy Stadium',12000,2005,_country.egypt,62.4,[],{}];
    map[n.elgouna] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.elmansoura] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.elolympi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0, 0),
      'Izz al-Din Yacoub Stadium',15000,1905,_country.egypt,54.8,[],{}];
    map[n.elqanah] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.enppi] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(30.1113215, 31.36746089),
      'Cairo Military Academy Stadium',22000,1985,_country.egypt,66.1,[],{}];
    map[n.future] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(30.174269, 31.435062),
      'Al Salam Stadium',30000,2011,_country.egypt,68.7,[],{}];
    map[n.ghazlelmahalla] = [ClubColors(Colors.lightBlueAccent,Colors.black),pattern.solid,Coordinates(30.96108104, 31.1728547),
      'Estádio Ghazl El Mahalla',14564,1936,_country.egypt,65.9,[],{}];
    map[n.haraselhodoud] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Haras El Hodood Stadium',22000,1932,_country.egypt,59.6,[],{}];
    map[n.ismaily] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(30.6010391, 32.27382),
      'Ismaília Stadium',35000,1924,_country.egypt,66.1,[],{}];
    map[n.mahala] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.misrelmakasa] = [ClubColors(Colors.green,Colors.blue),pattern.oneVertStripe,Coordinates(29.31851894086129, 30.840393372640037),
      'Faiyum Stadium',20000,1937,_country.egypt,57.8,[],{}];
    map[n.nationalbankofegypt] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'El Shorta Stadium',80000,2009,_country.egypt,61.0,[],{}];
    map[n.olympicclub] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.petrojet] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.pharco] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Borg el-Arab Stadium',86000,2010,_country.egypt,64.2,[],{}];
    map[n.pyramids] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.02028, 31.3737282),
      'Estádio 30 de junho',30000,2008,_country.egypt,70.8,[],{}];
    map[n.smouha] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(31.1970242, 29.91324509),
      'Alexandria Stadium',22000,1949,_country.egypt,61.6,[],{}];
    map[n.suezmontakhab] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.egypt,50.0,[],{}];
    map[n.talaeaelgaish] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Gehaz El Reyada Stadium',20000,1997,_country.egypt,63.2,[],{}];
    map[n.tersana] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(30.04525754, 31.22334535),
      'Mit Okba Stadium',15000,1921,_country.egypt,61.6,[],{}];
    map[n.zamalek] = [ClubColors(Colors.white,Colors.red),pattern.oneHorStripe,Coordinates(30.0693, 31.312),
      'Estádio Internacional do Cairo',71400,1911,_country.egypt,73.4,[n.alahly],{}];
    //MOROCCO
    map[n.rajacasablanca] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(33.582906, -7.6464496),
      'Stade Mohamed V',67000,1949,_country.morocco,72.4,[n.wydad],{}];
    map[n.wydad] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(33.582, -7.64647),
      'Stade Mohamed V',67000,1937,_country.morocco,73.5,[n.rajacasablanca],{}];
    map[n.beniMellal] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade d\'honneur de Beni Mellal',15000,1956,_country.morocco,59.5,[],{}];
    map[n.berkane] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(0,0),
      'Stade Municipal de Berkane',10000,1938,_country.morocco,63.6,[],{}];
    map[n.chababmoh] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Bachir Stadium',11000,1948,_country.morocco,63.1,[],{}];
    map[n.difaa] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade El Abdi',8000,1956,_country.morocco,62.4,[],{}];
    map[n.farrabat] = [ClubColors(Colors.black,Colors.green),pattern.solid,Coordinates(33.959915, -6.8890915),
      'Estádio Príncipe Moulay Abdellah',53000,1958,_country.morocco,70.4,[],{}];
    map[n.fusrabat] = [ClubColors(Colors.white,Colors.red),pattern.stripes2,Coordinates(34.0100016, -6.84037124),
      'Stade Belvédère',15000,1946,_country.morocco,67.2,[],{}];
    map[n.hassaniaAgadir] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(30.4281448, -9.5405740),
      'Stade Adrar',45480,1946,_country.morocco,64.5,[],{}];
    map[n.irtanger] = [ClubColors(Colors.blue,Colors.white),pattern.stripes3,Coordinates(35.74091688, -5.85791870),
      'Estádio Ibn Batouta',45000,1983,_country.morocco,60.8,[],{}];
    map[n.kawkab] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(31.7071404, -7.9804646),
      'Stade de Marrakech',45240,1947,_country.morocco,65.1,[],{}];
    map[n.kenitra] = [ClubColors(Colors.green,Colors.white),pattern.horStripes4,Coordinates(34.2527053, -6.5714618),
      'Municipal de Kenitra',15000,1938,_country.morocco,56.2,];
    map[n.khouribga] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(32.8781274, -6.907258),
      'Complexe OCP',10000,1923,_country.morocco,61.2,[],{}];
    map[n.maghreb] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(34.0028129, -4.96905145),
      'Complexe Sportif de Fès',45000,1946,_country.morocco,68.4,[],{}];
    map[n.meknes] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.oCasablanca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.ouedzem] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.racingcasablanca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.safi] = [ClubColors(darkblue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Stade El Massira',7000,1921,_country.morocco,65.0,[],{}];
    map[n.settat] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.sidikacem] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    map[n.soualem] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Errazi a Berrechid',2000,1984,_country.morocco,60.7,[],{}];
    map[n.uniontouarga] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Estádio Barid',0,1969,_country.morocco,63.6,[],{}];
    map[n.moghrebtetouan] = [ClubColors(Colors.red,Colors.white,Colors.blue),pattern.solid,Coordinates(35.5728560, -5.3487861),
      'Stade Saniat Rmel',10000,1922,_country.morocco,63.6,[],{}];
    map[n.moulodiaoujda] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(34.6596594, -1.93453730),
      'Estádio Honneur',19000,1946,_country.morocco,61.5,[],{}];
    map[n.youssoufia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.morocco,50.0,[],{}];
    //ALGERIA
    map[n.usmannaba] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0, 0),
      '19 May Stadium',56000,1983,_country.algeria,54.8,[],{}];
    map[n.asochlef] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Boumezrag Mohamed',30000,1947,_country.algeria,58.6,[],{}];
    map[n.asmoran] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      'Habib Bouakeul Stadium',20000,1935,_country.algeria,53.6,[],{}];
    map[n.jsmbejaia] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(0, 0),
      'Stade de l\'Unité maghrébine',17500,1936,_country.algeria,59.5,[],{}];
    map[n.belouizdad] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.7456313, 3.0786813),
      'Stade du 20-Août-1955',10000,1955,_country.algeria,66.5,[],{}];
    map[n.cabordjbouarreridj] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.usmblida] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Brakni Brothers Stadium',10000,1932,_country.algeria,50.9,[],{}];
    map[n.uschaouia] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0, 0),
      'Hassouna Zerdani Stadium',5000,1936,_country.algeria,50.8,[],{}];
    map[n.cabatna] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.csconstantine] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio Chahid Hamlaoui',45000,1898,_country.algeria,68.8,[],{}];
    map[n.esmguelma] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.chelghoumlaid] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0,0),
      '11 December 1961 Stadium',10000,1945,_country.algeria,55.3,[],{}];
    map[n.essetif] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(36.18707773, 5.3937329179),
      'Estádio 8 de Maio',25000,1958,_country.algeria,70.4,[],{}];
    map[n.mcelbayadh] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Young sheldon',15000,1936,_country.algeria,63.7,[],{}];
    map[n.moconstantine] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.jskawkabi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.usmelharrach] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      '1 November 1954 Stadium',5000,1935,_country.algeria,59.6,[],{}];
    map[n.nahusseindey] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(0, 0),
      'Stade du 20 Août 1955',10000,1955,_country.algeria,57.8,[],{}];
    map[n.jsbordjmenaiel] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.jskabylie] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(36.706899, 4.0560295),
      'Stade 1er Novembre',22000,1946,_country.algeria,66.2,[],{}];
    map[n.rckouba] = [ClubColors(Colors.green,Colors.white),pattern.stripes3,Coordinates(0, 0),
      'Mohamed Benhaddad Stadium',10000,1945,_country.algeria,51.8,[],{}];
    map[n.gcrmascara] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'The African Unity Stadium',22000,1925,_country.algeria,49.6,[],{}];
    map[n.mcalger] = [ClubColors(Colors.green,Colors.red),pattern.horStripes2,Coordinates(36.75986425, 2.99499536),
      'Estádio 5 de Julho de 1962',76000,1921,_country.algeria,69.2,[],{}];
    map[n.mcoran] = [ClubColors(Colors.white,Colors.red),pattern.horStripes2,Coordinates(35.683435418, -0.63621669),
      'Estádio Ahmed Zabana',40000,1917,_country.algeria,65.7,[],{}];
    map[n.ncmagra] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Boucheligue Brothers Stadium',5000,1998,_country.algeria,61.6,[],{}];
    map[n.paradouac] = [ClubColors(Colors.yellow,blue),pattern.solid,Coordinates(0,0),
      'Omar Benrabah Stadium',11000,1994,_country.algeria,56.6,[],{}];
    map[n.mcsaida] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.mobejaia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.olympiquedemedea] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.jssaoura] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0, 0),
      '20 August Stadium',20000,2008,_country.algeria,62.5,[],{}];
    map[n.rcarbaa] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Ismaïl Makhlouf Stadium',5000,1941,_country.algeria,60.8,[],{}];
    map[n.rckouba] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.rcrelizane] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.usmalger] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(36.80114535, 3.04854982),
      'Omar Hamadi Stadium',15000,1937,_country.algeria,69.5,[],{}];
    map[n.usmkhenchela] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Amar Hamam Stadium',5000,1943,_country.algeria,66.0,[],{}];
    map[n.esmbelabbes] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    map[n.usbiskra] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(0,0),
      'February 18',35000,1934,_country.algeria,64.7,[],{}];
    map[n.widaddetlemcen] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.algeria,50.0,[],{}];
    //LIBYA
    map[n.tripoliLIB] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(32.8599, 13.1358),
      'Tripoli Stadium',65000,1950,_country.libya,66.2,[],{}];
    map[n.aldhahra] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.libya,50.0,[],{}];
    map[n.almadina] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.libya,50.0,[],{}];
    map[n.almahala] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(0, 0),
      'GMR Stadium',3000,1977,_country.libya,59.5,[],{}];
    map[n.alNasrLIB] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.libya,50.0,[],{}];
    map[n.alittihadLIB] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.85989333, 13.1358680),
      'Tripoli Stadium',65000,1944,_country.libya,64.8,[],{}];
    map[n.alshat] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.libya,50.0,[],{}];
    map[n.altahaddi] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(32.101443438, 20.0722980),
      '28 de Março',55000,1954,_country.libya,62.8,[],{}];
    map[n.benghazi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(32.1022578, 20.072776),
      '28 de Março',65000,1950,_country.libya,65.3,[],{}];
    //TUNISIA
    map[n.benguerdane] = [ClubColors(Colors.yellow,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Stade du 7 Mars',10000,1936,_country.tunisia,64.1,[],{}];
    map[n.bizertin] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(37.27906354, 9.8657169),
      'Stade 15 Octobre',20000,1928,_country.tunisia,63.4,[],{}];
    map[n.clubafricain] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(36.839919, 10.185206),
      'Olympique d\'El Menzah',45000,1920,_country.tunisia,69.6,[],{}];
    map[n.esperance] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(36.7477777,10.2727777),
      'Estadio Olímpico de Radès',60500,1919,_country.tunisia,72.2,[],{}];
    map[n.etoilesahel] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(35.82355464, 10.6134521),
      'Estádio Olímpico de Sousse',28000,1925,_country.tunisia,70.8,[],{}];
    map[n.gafsa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.hammamlif] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.jskairouan] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(0, 0),
      'Stade Hamda Laouani',5000,1942,_country.tunisia,58.5,[],{}];
    map[n.marsaTUN] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.metlaoui] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.monastir] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.solid,Coordinates(0, 0),
      'Stade Mustapha Ben Jannet',22000,1923,_country.tunisia,65.5,[],{}];
    map[n.olympiquebeja] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(0,0),
      'Stade Municipal',15000,1929,_country.tunisia,62.5,[],{}];
    map[n.rejiche] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.sfax] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.sidibouzid] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.stadetunisien] = [ClubColors(Colors.green,Colors.red,Colors.white),pattern.stripes2,Coordinates(36.81442945, 10.12487585),
      'Hedi Ennaifer',11000,1948,_country.tunisia,62.9,[],{}];
    map[n.sfaxien] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(34.73365186, 10.74661154),
      'Estádio Taïeb Mehiri',11000,1928,_country.tunisia,67.9,[],{}];
    map[n.tataouine] = [ClubColors(darkblue,Colors.red),pattern.stripes2,Coordinates(0,0),
      'Stade Nejib Khattab',0,1996,_country.tunisia,61.7,[],{}];
    map[n.transports] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];
    map[n.zarzis] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tunisia,50.0,[],{}];

    //AFRICA NEGRA
    //AFRICA DO SUL
    map[n.amazulu] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-29.828736, 31.030474),
      'Moses Mabhida Stadium',52000,1932,_country.southAfrica,65.6,[],{}];
    map[n.baroka] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southAfrica,50.0,[],{}];
    map[n.blackLeopards] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southAfrica,50.0,[],{}];
    map[n.bloemfontein] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southAfrica,50.0,[],{}];
    map[n.bushbucks] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.southAfrica,50.0,[],{}];
    map[n.capetown] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-33.9034463, 18.411186156),
      'Cape Town Stadium',55000,1962,_country.southAfrica,67.4,[],{}];
    map[n.capetownAjax] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Athlone Stadium',34000,1970,_country.southAfrica,56.0,[],{}];
    map[n.chippa] = [ClubColors(Colors.lightBlueAccent,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Nelson Mandela Bay Stadium',46000,2010,_country.southAfrica,50.0,[],{}];
    map[n.freestate] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(0,0),
      'Goble Park',20000,1977,_country.southAfrica,58.3,[],{}];
    map[n.goldenarrows] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(-29.824950, 31.029732),
      'Kings Park Stadium',52000,1996,_country.southAfrica,69.1,[],{}];
    map[n.jomocosmos] = [ClubColors(Colors.red,blue),pattern.solid,Coordinates(0,0),
      'Johannesburg Stadium',37500,1983,_country.southAfrica,56.0,[],{}];
    map[n.kaizer] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(-26.23449118, 27.98311136),
      'Soccer City',78000,1970,_country.southAfrica,69.5,[n.orlandopirates],{}];
    map[n.maritzburg] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-29.6175844, 30.3856279),
      'Harry Gwala Stadium',12000,1979,_country.southAfrica,64.8,[],{}];
    map[n.mamelodi] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-25.75319343, 28.22302862),
      'Loftus Versfeld',51762,1960,_country.southAfrica,71.8,[],{}];
    map[n.manningRangers] = [ClubColors(Colors.yellow,blue),pattern.solid,Coordinates(0,0),
      'Chatsworth Stadium',35000,1928,_country.southAfrica,50.0,[],{}];
    map[n.marumo] = [ClubColors(Colors.teal,darkblue),pattern.solid,Coordinates(0,0),
      'Peter Mokaba Stadium',46000,2021,_country.southAfrica,58.4,[],{}];
    map[n.morokaSwallows] = [ClubColors(grena,Colors.blue),pattern.sleeves,Coordinates(-26.226719, 27.8639952),
      'Volkswagen Dobsonville',24000,1947,_country.southAfrica,71.8,[],{}];
    map[n.orlandopirates] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-26.23098107, 27.9229158),
      'Orlando Stadium',40000,1937,_country.southAfrica,69.8,[n.kaizer],{}];
    map[n.richardsbay] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,2017,_country.southAfrica,61.8,[],{}];
    map[n.royalAM] = [ClubColors(Colors.black,Colors.yellow),pattern.oneVertStripe,Coordinates(-29.910352, 30.8774252),
      'Chatsworth Stadium',22000,2020,_country.southAfrica,65.3,[],{}];
    map[n.santosAfrica] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(0,0),
      'Athlone Stadium',30000,1982,_country.southAfrica,56.0,[],{}];
    map[n.sekhukhune] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(0,0),
      'Makhulong Stadium',10000,0,_country.southAfrica,61.8,[],{}];
    map[n.stellenbosch] = [ClubColors(grena,Colors.yellow),pattern.solid,Coordinates(-33.940025, 18.8734315),
      'Danie Craven Stadium',16000,2016,_country.southAfrica,63.5,[],{}];
    map[n.supersport] = [ClubColors(Colors.blue,Colors.red),pattern.solid,Coordinates(-25.7757792, 28.0729553),
      'Super Stadium',28900,1994,_country.southAfrica,66.5,[],{}];
    map[n.tsgalaxy] = [ClubColors(Colors.red,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      'Mbombela Stadium',40929,2015,_country.southAfrica,63.8,[],{}];
    map[n.bidvestWits] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(0,0),
      'Bidvest Stadium',5000,1921,_country.southAfrica,63.0,[],{"extinto": 2020}]; //EXTINTO 2020
    map[n.platinumAFS] = [ClubColors(Colors.lightGreenAccent,Colors.black),pattern.solid,Coordinates(0,0),
      'Royal Bafokeng Stadium',44530,1998,_country.southAfrica,50.0,[],{"extinto": 2018}]; //EXTINTO 2018
    //ANGOLA
    map[n.agosto] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(-8.96985911, 13.2837),
      'Estádio Nacional 11 de Novembro',48500,1977,_country.angola,67.6,[],{}];
    map[n.aviacao] = [ClubColors(Colors.orange,Colors.black),pattern.sleeves,Coordinates(-8.82740657, 13.255665),
      'Estádio da Cidadela',60000,1953,_country.angola,62.1,[],{}];
    map[n.caala] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Mártires da Canhala',11000,55.8,_country.angola,57.5,[],{}];
    map[n.cuandocubango] = [ClubColors(vinho,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio dos Eucaliptos',4000,2009,_country.angola,54.2,[],{}];
    map[n.huilaANG] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0,0),
      'Estádio do Ferroviário da Huíla',30000,1998,_country.angola,57.8,[],{}];
    map[n.interclube] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(-8.8690929, 13.2090373),
      'Estádio 22 de Junho',10000,1976,_country.angola,63.2,[],{}];
    map[n.kabuscorp] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(-8.8142235, 13.2258846),
      'Estádio dos Coqueiros',12000,1994,_country.angola,63.7,[],{}];
    map[n.libolo] = [ClubColors(Colors.blue,Colors.lightBlueAccent),pattern.solid,Coordinates(-10.0065429, 14.9053024),
      'Estádio Municipal de Calulo',10000,1942,_country.angola,62.5,[],{}];
    map[n.lobito] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-12.39278911, 13.5537560),
      'Estádio do Buraco',3000,1970,_country.angola,59.2,[],{}];
    map[n.lundasul] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio das Mangueiras',12000,2020,_country.angola,56.1,[],{}];
    map[n.maio] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-12.5937217, 13.39020088),
      'Edelfride Palhares da Costa',6000,1981,_country.angola,60.4,[],{}];
    map[n.maquis] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(0,0),
      'Estádio Mundunduleno',4300,1983,_country.angola,56.5,[],{}];
    map[n.petrohuambo] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.angola,50.0,[],{}];
    map[n.petroluanda] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-8.9699, 13.28365),
      'Estádio Nacional 11 de Novembro',48500,1980,_country.angola,68.4,[],{}];
    map[n.sagradaesperanca] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(-7.3883419, 20.8334375),
      'Estádio Sagrada Esperança',8200,1976,_country.angola,63.8,[],{}];
    map[n.sambizanga] = [ClubColors(Colors.yellow,Colors.black),pattern.horStripes3,Coordinates(0,0),
      'Estádio da Cidadela',60000,1975,_country.angola,54.2,[],{}];
    map[n.sptCabinda] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(-5.5079227, 12.240064),
      'Estádio Nacional do Chiazi',20000,1975,_country.angola,60.2,[],{}];
    map[n.sptBenguela] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(0,0),
      'Estádio do Arregaça',2000,1915,_country.angola,52.1,[],{}];
    map[n.wiliete] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio de Ombaka',35000,2018,_country.angola,53.7,[],{}];
    //BOTSWANA
    map[n.botswana] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.botswana,50.0,[],{}];
    map[n.eccocity] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.botswana,50.0,[],{}];
    map[n.gaborone] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-24.6567388, 25.9327138),
      'Botswana National Stadium',22000,1967,_country.botswana,50.0,[],{}];
    map[n.jwaneng] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Galaxy Stadium',2000,2014,_country.botswana,50.0,[],{}];
    map[n.lobatse] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.botswana,50.0,[],{}];
    map[n.mochudi] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(-24.6567, 25.9323),
      'Botswana National Stadium',22000,1972,_country.botswana,50.0,[],{}];
    map[n.mogoditshane] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Molepolole Stadium',6600,1925,_country.botswana,50.0,[],{}];
    map[n.notwane] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.botswana,50.0,[],{}];
    map[n.township] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-24.6565, 25.9327),
      'Botswana National Stadium',22000,1961,_country.botswana,50.0,[],{}];
    //CAMEROON
    map[n.bafoussam] = [ClubColors(Colors.red,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stade Municipal de Bamendzi',5000,1950,_country.cameroon,58.6,[],{}];
    map[n.cotonsport] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.32640861, 13.3998728),
      'Roumdé Adjia',35000,1986,_country.cameroon,67.3,[],{}];
    map[n.canonYaounde] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(3.8855102, 11.54057732),
      'Ahmadou Ahidjo',42500,1930,_country.cameroon,65.2,[],{}];
    map[n.douala] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(4.0560857, 9.7187861),
      'Stade de la Réunification',30000,1958,_country.cameroon,64.2,[],{}];
    map[n.oryx] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(4.0557386, 9.7189017),
      'Stade de la Réunification',30000,1927,_country.cameroon,62.2,[],{}];
    map[n.tonnerre] = [ClubColors(Colors.white,Colors.black),pattern.solid,Coordinates(0,0),
      'Omnisports Ahmadou-Ahidjo',42500,1934,_country.cameroon,62.6,[],{}];
    map[n.loum] = [ClubColors(blue,Colors.yellow),pattern.solid,Coordinates(0,0),
      'Stade de Njombé',1000,2011,_country.cameroon,62.6,[],{}];
    //CAPE VERDE
    map[n.acadsal] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.capeVerde,50.0,[],{}];
    map[n.amarantes] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.capeVerde,50.0,[],{}];
    map[n.boavistapraia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(14.9162, -23.512),
      'Estádio da Várzea',8000,1936,_country.capeVerde,58.6,[],{}];
    map[n.derbyfc] = [ClubColors(Colors.blue,Colors.white),pattern.stripes2,Coordinates(16.8824126, -24.98574223),
      'Estádio Municipal Adérito Sena',5000,1929,_country.capeVerde,54.6,[],{}];
    map[n.acadmindelo] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Municipal Adérito Sena',5000,1940,_country.capeVerde,55.6,[],{}];
    map[n.acadpraia] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio da Várzea',8000,1962,_country.capeVerde,56.6,[],{}];
    map[n.mindelense] = [ClubColors(Colors.orange,Colors.red),pattern.solid,Coordinates(16.882555, -24.985470),
      'Estádio Municipal Aderito Sena',5000,1919,_country.capeVerde,63.2,[],{}];
    map[n.onzeunidos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.capeVerde,50.0,[],{}];
    map[n.salrei] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.capeVerde,50.0,[],{}];
    map[n.sptClubePraia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(14.916149, -23.511936),
      'Estádio da Várzea',8000,1923,_country.capeVerde,62.6,[],{}];
    map[n.travadores] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio da Várzea',8000,1930,_country.capeVerde,54.9,[],{}];
    //CENTRAL AFRICAN REPUBLIC
    map[n.bangui] = [ClubColors(Colors.black,Colors.white),pattern.stripes3,Coordinates(4.374442797, 18.5642879),
      'Barthelemy Boganda Stadium',50000,1945,_country.centralAfrica,61.5,[],{}];
    map[n.dfc8] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,58.3,[],{}];
    map[n.fatima] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      '',0,1952,_country.centralAfrica,55.3,[],{}];
    map[n.dfc8] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,58.3,[],{}];
    map[n.faca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.centralAfrica,50.0,[],{}];
    map[n.mouara] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.centralAfrica,50.0,[],{}];
    map[n.tempeteMocaf] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(4.3738335, 18.56408385),
      'Barthelemy Boganda Stadium',50000,1940,_country.centralAfrica,60.8,[],{}];
    map[n.tocages] = [ClubColors(Colors.red,Colors.green),pattern.stripes3,Coordinates(4.3738, 18.564083),
      'Barthelemy Boganda Stadium',50000,0,_country.centralAfrica,59.3,[],{}];
    map[n.usca] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.centralAfrica,50.0,[],{}];
    //CONGO
    map[n.caraBrazaville] = [ClubColors(Colors.red,Colors.black),pattern.sleeves,Coordinates(-4.27381489, 15.24904533),
      'Stade Alphonse Massemba-Débat',33037,1935,_country.congo,57.7,[],{}];
    map[n.diablesNoirs] = [ClubColors(Colors.black,Colors.yellow),pattern.solid,Coordinates(-4.27254194, 15.24862744),
      'Stade Alphonse Massemba-Débat',33037,1950,_country.congo,64.2,[],{}];
    map[n.etoilecongo] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-4.272841, 15.24845),
      'Stade Alphonse Massemba-Débat',33037,0,_country.congo,60.7,[],{}];
    map[n.leopardsCON] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-4.207234, 12.6858943),
      'Stade Denis Sassou Nguesso',5000,1953,_country.congo,62.1,[],{}];
    map[n.otoho] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(-4.15460467, 15.3242211),
      'Kintélé Sports Complex',60055,2014,_country.congo,64.0,[],{}];
    map[n.talangai] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-4.27341746, 15.2487253),
      'Stade Alphonse Massemba-Débat',33037,1935,_country.congo,62.7,[],{}];
    //RD CONGO
    map[n.bantous] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.congoRD,50.0,[],{}];
    map[n.dragons] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-4.32253435, 15.312970),
      'Stade 24 Novembre',24000,1938,_country.congoRD,64.3,[],{}];
    map[n.lupopo] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-11.704666, 27.48393538),
      'Stade Kibassa Maliba',35000,1939,_country.congoRD,60.6,[],{}];
    map[n.maniema] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33021337, 15.310353),
      'Joseph Kabila Kabange',22000,2005,_country.congoRD,65.6,[],{}];
    map[n.mazembe] = [ClubColors(Colors.black,Colors.black),pattern.solid,Coordinates(-11.67807733, 27.4899193),
      'Stade TP Mazembe',35000,1939,_country.congoRD,68.5,[],{}];
    map[n.mikishi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.congoRD,50.0,[],{}];
    map[n.motema] = [ClubColors(Colors.green,Colors.white),pattern.horStripes3,Coordinates(-4.33067, 15.31035),
      'Stade des Martyrs',80000,1936,_country.congoRD,62.7,[],{}];
    map[n.sangabalende] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(-6.144978, 23.60518483),
      'Stade Kashala Bonzola',15000,1962,_country.congoRD,64.3,[],{}];
    map[n.tshinkunku] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.congoRD,50.0,[],{}];
    map[n.vita] = [ClubColors(Colors.green,Colors.black),pattern.solid,Coordinates(-4.33065248, 15.31034443),
      'Stade des Martyrs',80000,1935,_country.congoRD,67.3,[],{}];
    //ETHIOPIA
    map[n.asmara] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ethiopia,50.0,[],{}];
    map[n.awassa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ethiopia,50.0,[],{}];
    map[n.cotton] = [ClubColors(Colors.white,Colors.black),pattern.stripesThin,Coordinates(0,0),
      'Dire Dawa Stadium',18000,1936,_country.ethiopia,50.0,[],{"extinto": 2000}]; //EXTINTO 2000
    map[n.eepco] = [ClubColors(Colors.red,Colors.white),pattern.stripes3,Coordinates(0,0),
      'Mebrat Hail Stadium',8000,1960,_country.ethiopia,50.0,[],{}];
    map[n.ethiocement] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ethiopia,50.0,[],{}];
    map[n.ethiocoffee] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.ethiopia,50.0,[],{}];
    map[n.fasil] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(12.618048, 37.45961),
      'Fasiledes Stadium',20000,1968,_country.ethiopia,56.9,[],{}];
    map[n.mechal] = [ClubColors(Colors.green,Colors.yellow,Colors.red),pattern.solid,Coordinates(0,0),
      'Addis Ababa Stadium',35000,1938,_country.ethiopia,61.6,[],{}];
    map[n.stGeorge] = [ClubColors(Colors.yellow,Colors.red),pattern.solid,Coordinates(9.0132947, 38.7565828),
      'Addis Ababa Stadium',24000,1935,_country.ethiopia,64.6,[],{}];
    //GABON
    map[n.cercleMberi] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(0.392741994, 9.452454156),
      'Stade Omar-Bongo',41000,1962,_country.gabon,63.2,[],{}];
    map[n.mangasport] = [ClubColors(Colors.greenAccent,Colors.yellow),pattern.solid,Coordinates(-1.55915389, 13.2272941),
      'Stade Henri Sylvoz',4000,1962,_country.gabon,63.2,[],{}];
    map[n.mounana] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(0.3917496, 9.45228079),
      'Stade Omar-Bongo',41000,2006,_country.gabon,62.0,[],{}];
    //GHANA
    map[n.asantekotoko] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(6.68225260, -1.6050228),
      'Baba Yara Stadium',43000,1935,_country.ghana,67.3,[],{}];
    map[n.heartsoak] = [ClubColors(Colors.red,Colors.purple),pattern.solid,Coordinates(5.55150373, -0.19180352),
      'Ohene Djan Stadium',40000,1911,_country.ghana,67.0,[],{}];
    //GUINEA
    map[n.hafia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(9.54617954, -13.672815),
      'Stade 28 Septembre',25000,1951,_country.guinea,66.8,[],{}];
    map[n.horoya] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(9.5462, -13.6728),
      'Stade 28 Septembre',25000,1975,_country.guinea,66.0,[],{}];
    map[n.fello] = [ClubColors(darkblue,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Saïfoulaye Diallo',5000,1988,_country.guinea,57.7,[],{}];
    map[n.kaloum] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(9.51237526, -13.7038060),
      'Stade de la Mission',1000,1958,_country.guinea,61.3,[],{}];
    //KHENYA
    map[n.kakamega] = [ClubColors(Colors.yellow,Colors.green,Colors.green),pattern.stripeCrest,Coordinates(0.28970512, 34.7605814),
      'Bukhungu Stadium',10000,2010,_country.kenya,65.1,[],{}];
    map[n.gorMahia] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-1.294090, 36.842290),
      'City Stadium',15000,1968,_country.kenya,63.6,[],{}];
    map[n.leopardsQUE] = [ClubColors(Colors.blue,Colors.white),pattern.horStripes3,Coordinates(-1.30396442, 36.8244987),
      'Nyayo National Stadium Nairobi',15000,1964,_country.kenya,62.6,[],{}];
    map[n.mathare] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2300765, 36.8924818),
      'Moi International Sports Centre',60000,1994,_country.kenya,63.0,[],{}];
    map[n.oserian] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.kenya,54.2,[],{}];
    map[n.reunion] = [ClubColors(Colors.blue,Colors.black),pattern.solid,Coordinates(0, 0),
      '',0,0,_country.kenya,47.2,[],{}];
    map[n.sofapaka] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.kenya,50.0,[],{}];
    map[n.tusker] = [ClubColors(Colors.yellow,Colors.yellow),pattern.solid,Coordinates(-1.2345079, 36.8804135),
      'Ruaraka Stadium',1000,1969,_country.kenya,64.1,[],{}];
    map[n.ulinzi] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-0.2955202, 36.07390),
      'Afraha Stadium',8200,1995,_country.kenya,63.5,[],{}];
    //IVORY COAST
    map[n.africaSports] = [ClubColors(Colors.green,Colors.red),pattern.solid,Coordinates(5.328283842, -4.01839865),
      'Estádio Houphouet-Boigny',35000,1947,_country.ivorycoast,65.5,[],{}];
    map[n.asecmimosas] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(5.3049676, -3.99280839),
      'Stade Robert Champroux',10000,1947,_country.ivorycoast,67.3,[],{}];
    map[n.gagnoa] = [ClubColors(Colors.blue,Colors.yellow),pattern.solid,Coordinates(6.1192630, -5.9613877),
      'Stade Victor Biaka Boda',15000,1960,_country.ivorycoast,60.1,[],{}];
    map[n.omnisport] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(6.8279876, -5.246351),
      'Stade de Yamoussoukro',6000,1932,_country.ivorycoast,62.6,[],{}];
    map[n.sanPedro] = [ClubColors(Colors.orange,Colors.black),pattern.solid,Coordinates(4.7607713, -6.638301),
      'Stade Auguste Denise',8000,2004,_country.ivorycoast,58.6,[],{}];
    map[n.seweSport] = [ClubColors(Colors.blue,Colors.white),pattern.oneHorStripe,Coordinates(5.3054157, -3.99233047),
      'Stade Robert Champroux',10000,1977,_country.ivorycoast,62.4,[],{}];
    map[n.stadeDAbidjan] = [ClubColors(Colors.blue,Colors.red),pattern.stripes2,Coordinates(5.30523287, -3.992462281),
      'Stade Robert Champroux',10000,1936,_country.ivorycoast,63.3,[],{}];
    map[n.stella] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Robert Champroux',10000,1953,_country.ivorycoast,57.6,[],{}];
    map[n.tanda] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Stade Henri Konan Bédié',3000,0,_country.ivorycoast,56.3,[],{}];
    //MADAGASCAR
    map[n.adema] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-18.15230, 49.4160806),
      'Stade Municipal de Toamasina',2500,1955,_country.madagascar,62.1,[],{}];
    map[n.ajesaia] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.madagascar,50.0,[],{}];
    map[n.cnapsSport] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-18.919411, 47.5259711),
      'Mahamasina Stadium',23000,1990,_country.madagascar,61.5,[],{}];
    map[n.ecoredipharm] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.madagascar,50.0,[],{}];
    map[n.fosa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.madagascar,50.0,[],{}];
    map[n.japanactuels] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.madagascar,50.0,[],{}];
    map[n.uscafoot] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.madagascar,50.0,[],{}];
    //MALI
    map[n.djoliba] = [ClubColors(Colors.red,Colors.green),pattern.solid,Coordinates(12.6038545, -7.9215315),
      'Stade 26 Mars',50000,1960,_country.mali,63.6,[],{}];
    map[n.realbamako] = [ClubColors(Colors.black,Colors.white),pattern.stripes2,Coordinates(12.6598898, -7.993129994),
      'Stade Modibo Keïta',25000,1960,_country.mali,65.6,[],{}];
    map[n.stademalien] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(12.60506870, -7.9218513),
      'Stade 26 Mars',50000,1960,_country.mali,65.0,[],{}];
    //MAURITANIA
    map[n.concorde] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.mauritania,50.0,[],{}];
    map[n.ksar] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.mauritania,50.0,[],{}];
    map[n.nasr] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.mauritania,50.0,[],{}];
    map[n.nouadhibou] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(20.9131555, -17.0466032),
      'Stade Municipal de Nouadhibou',10300,1999,_country.mauritania,59.5,[],{}];
    map[n.snim] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.mauritania,50.0,[],{}];
    map[n.tevraghzeina] = [ClubColors(Colors.white,Colors.white),pattern.solid,Coordinates(18.104679673, -15.9854073389),
      'Stade Olympique Nouakchott',20000,2005,_country.mauritania,57.1,[],{}];
    //MOZAMBIQUE
    map[n.costasol] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(-25.9413178, 32.61610373),
      'Estádio do Costa do Sol',10000,1955,_country.mozambique,65.7,[],{}];
    map[n.desportivomap] = [ClubColors(Colors.black,Colors.white),pattern.solid,Coordinates(-25.93553262, 32.58640965),
      'Estádio 1º de Maio',8000,1921,_country.mozambique,60.8,[],{}];
    map[n.ferroviariomaputo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-25.9173539, 32.52639366),
      'Estádio da Machava',45000,1924,_country.mozambique,63.0,[],{}];
    map[n.ldMaputo] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-25.9567109, 32.44568156),
      'Estádio da Liga',5000,1990,_country.mozambique,61.7,[],{}];
    map[n.maxaquene] = [ClubColors(Colors.blue,Colors.red),pattern.stripes3,Coordinates(-25.974593945, 32.57804403),
      'Estádio do Maxaquene',15000,1920,_country.mozambique,64.2,[],{}];
    map[n.songo] = [ClubColors(darkblue,Colors.black),pattern.stripes3,Coordinates(0,0),
      'Estadio da HCB',2000,1982,_country.mozambique,63.2,[],{}];
    //NAMIBIA
    map[n.blackafrica] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(-22.5159386, 17.060735),
      'Sam Nujoma Stadium',10300,1986,_country.namibia,64.4,[],{}];
    map[n.africanstars] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-22.5162, 17.060),
      'Sam Nujoma Stadium',10300,1962,_country.namibia,64.0,[],{}];
    map[n.bluewaters] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-22.93193059, 14.5286355),
      'Kuisebmund Stadium',4000,1936,_country.namibia,57.4,[],{}];
    map[n.civics] = [ClubColors(grena,Colors.white),pattern.solid,Coordinates(-22.5164, 17.062),
      'Sam Nujoma Stadium',10300,1983,_country.namibia,61.3,[],{}];
    //NIGERIA
    map[n.akwa] = [ClubColors(Colors.orange,Colors.white),pattern.solid,Coordinates(5.0062256, 7.88568411),
      'Godswill Akpabio Stadium',30000,1996,_country.nigeria,63.5,[],{}];
    map[n.bendel] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.elkanemi] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.enyimba] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(5.125570, 7.379054),
      'Enyimba International',25000,1976,_country.nigeria,68.1,[],{}];
    map[n.gombe] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.heartland] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(5.48386575, 7.04376783),
      'Dan Anyiam Stadium',10000,1976,_country.nigeria,67.5,[],{}];
    map[n.juliusberger] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.kano] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(11.999726271, 8.52926678),
      'Sani Abacha',25000,1990,_country.nigeria,65.5,[],{}];
    map[n.kwaraUtd] = [ClubColors(Colors.green,Colors.yellow),pattern.solid,Coordinates(8.4755402, 4.542177479),
      'Kwara State Stadium',18000,1997,_country.nigeria,60.4,[],{}];
    map[n.lobiStars] = [ClubColors(Colors.yellow,Colors.blue),pattern.oneHorStripe,Coordinates(7.73139777, 8.5211409866),
      'Aper Aku Stadium',20000,1981,_country.nigeria,62.0,[],{}];
    map[n.nasarawa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.plateau] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(5.0063769, 7.88565836),
      'New Jos Stadium',60000,1975,_country.nigeria,62.4,[],{}];
    map[n.rangersInt] = [ClubColors(Colors.white,Colors.red),pattern.solid,Coordinates(6.444346813, 7.496462056),
      'Nnamdi Azikiwe Stadium',22000,1970,_country.nigeria,63.8,[],{}];
    map[n.remostars] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.nigeria,50.0,[],{}];
    map[n.riversutd] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(4.96715013, 6.971510),
      'Adokiye Amiesimaka Stadium',38000,2016,_country.nigeria,64.0,[],{}];
    map[n.shootingstars] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(7.39632598, 3.885855),
      'Lekan Salami Stadium',10000,1950,_country.nigeria,64.7,[],{}];
    map[n.sunshinestars] = [ClubColors(Colors.orange,Colors.blue),pattern.solid,Coordinates(7.25847070, 5.1896354),
      'Akure Township Stadium',5000,1995,_country.nigeria,65.2,[],{}];
    map[n.dolphin] = [ClubColors(blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Liberation Stadium',25000,1988,_country.nigeria,50.0,[],{"extinto": 2016}]; //EXTINTO 2016
    //RWANDA
    map[n.apr] = [ClubColors(Colors.white,Colors.black),pattern.stripes3,Coordinates(-1.9780671, 30.04428081),
      'Stade Régional Nyamirambo',22000,1993,_country.rwanda,64.2,[],{}];
    map[n.atraco] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.rwanda,50.0,[],{}];
    map[n.kiyovu] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.rwanda,50.0,[],{}];
    map[n.mukungwa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.rwanda,50.0,[],{}];
    map[n.pantheresnoires] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.rwanda,50.0,[],{}];
    map[n.rayonsports] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-1.97863430, 30.0442474),
      'Stade Régional Nyamirambo',22000,1965,_country.rwanda,61.3,[],{}];
    //SENEGAL
    map[n.casasports] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    map[n.douanes] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(14.711, -17.458),
      'Demba Diop',20000,1980,_country.senegal,65.7,[],{}];
    map[n.genefoot] = [ClubColors(Colors.blue,Colors.green),pattern.solid,Coordinates(0,0),
      'Stade Déni Birame Ndao',1001,2000,_country.senegal,64.6,[],{}];
    map[n.goree] = [ClubColors(Colors.teal,Colors.white),pattern.solid,Coordinates(0,0),
      'Stade Demba Diop',20000,1974,_country.senegal,58.6,[],{}];
    map[n.jaraaf] = [ClubColors(Colors.white,Colors.green),pattern.solid,Coordinates(14.7108854, -17.458191),
      'Demba Diop',20000,1933,_country.senegal,63.2,[],{}];
    map[n.jeannedarc] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(14.746812323, -17.45177448),
      'Léopold Sédar Senghor',60000,1923,_country.senegal,65.3,[],{}];
    map[n.ndiambour] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    map[n.pikine] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    map[n.portautonome] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    map[n.suneor] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    map[n.teungueth] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.senegal,50.0,[],{}];
    //SUDÃO
    map[n.omdurman] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(15.6473138, 32.4749635),
      'Al Hilal Stadium',25000,1930,_country.sudan,66.0,[],{}];
    map[n.almerrikh] = [ClubColors(Colors.red,Colors.yellow),pattern.solid,Coordinates(15.64140, 32.471581),
      'Al Merriekh Stadium',43645,1908,_country.sudan,66.4,[],{}];
    //TANZANIA
    map[n.azam] = [ClubColors(Colors.white,Colors.blue),pattern.solid,Coordinates(-6.97053633, 39.22352095),
      'Chamazi Stadium',10000,2004,_country.tanzania,62.3,[],{}];
    map[n.maji] = [ClubColors(blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Maji Maji Stadium',30000,1978,_country.tanzania,59.4,[],{}];
    map[n.malindi] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Amaan Stadium',15000,1942,_country.tanzania,57.4,[],{}];
    map[n.mtibwa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tanzania,50.0,[],{}];
    map[n.pamba] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tanzania,50.0,[],{}];
    map[n.prisons] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.tanzania,50.0,[],{}];
    map[n.simba] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-6.85248, 39.273848),
      'Mkapa Stadium',60000,1936,_country.tanzania,69.5,[],{}];
    map[n.yanga] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(-6.854515, 39.274032),
      'Mkapa Stadium',60000,1935,_country.tanzania,67.4,[],{}];
    //TOGO
    map[n.agaza] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.togo,50.0,[],{}];
    map[n.asfosa] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.togo,50.0,[],{}];
    map[n.askoKara] = [ClubColors(Colors.yellow,Colors.black),pattern.oneHorStripe,Coordinates(9.5726839, 1.179215596),
      'Stade Municipal Kara',10000,1974,_country.togo,62.0,[],{}];
    map[n.etoilefilante] = [ClubColors(Colors.blue,Colors.white),pattern.sleeves,Coordinates(0,0),
      'Stade Oscar Anthony',2000,1932,_country.togo,58.3,[],{}];
    map[n.koroki] = [ClubColors(Colors.yellow,Colors.green),pattern.solid,Coordinates(0,0),
      'Stade Maman N\'Danida',5000,1961,_country.togo,57.3,[],{}];
    map[n.lome] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.togo,50.0,[],{}];
    map[n.maranatha] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.togo,50.0,[],{}];
    map[n.modelelome] = [ClubColors(Colors.white,Colors.yellow),pattern.diagonalInv,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1935,_country.togo,48.3,[],{}];
    map[n.togolais] = [ClubColors(Colors.white,Colors.red),pattern.sleeves,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1961,_country.togo,56.3,[],{}];
    map[n.togoport] = [ClubColors(Colors.yellow,Colors.blue),pattern.sleeves,Coordinates(0,0),
      'Stade Agoè-Nyivé',2000,1961,_country.togo,57.3,[],{}];
    map[n.semassi] = [ClubColors(Colors.red,Colors.white),pattern.oneHorStripe,Coordinates(8.981679877, 1.147266657),
      'Stade Municipal Sokodé',10000,1974,_country.togo,60.4,[],{}];
    //UGANDA
    map[n.express] = [ClubColors(Colors.red,Colors.red),pattern.solid,Coordinates(0.284026157, 32.5483295),
      'Muteesa II Stadium',20202,1957,_country.uganda,62.5,[],{}];
    map[n.kampala] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0.3278116, 32.6069444),
      'MTN Omondi Stadium',10000,1963,_country.uganda,64.6,[],{}];
    map[n.uganda] = [ClubColors(Colors.yellow,Colors.white),pattern.solid,Coordinates(0,0),
      'Arena of Vision',40000,1997,_country.uganda,59.4,[],{}];
    map[n.villa] = [ClubColors(Colors.blue,Colors.blue),pattern.solid,Coordinates(0.34748797, 32.65875396),
      'Mandela National Stadium',50000,1975,_country.uganda,65.0,[],{}];
    map[n.vipers] = [ClubColors(Colors.red,Colors.black),pattern.solid,Coordinates(0.19786167, 32.532340),
      'St Mary\'s Stadium-Kitende',25000,1969,_country.uganda,64.4,[],{}];
    //ZAMBIA
    map[n.greenEagles] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-16.813924, 26.987975),
      'Choma Independence Stadium',1000,2002,_country.zambia,61.8,[],{}];
    map[n.greenbuffaloes] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Independence Stadium',10000,1965,_country.zambia,59.4,[],{}];
    map[n.kabwe] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Godfrey \'Ucar\' Chitalu',10000,1966,_country.zambia,60.1,[],{}];
    map[n.lusaka] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zambia,50.0,[],{}];
    map[n.mufulira] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(0,0),
      'Estádio Shinde Mufulira',5000,1953,_country.zambia,64.7,[],{}];
    map[n.nchanga] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zambia,50.0,[],{}];
    map[n.nkana] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(-12.847060, 28.2112330),
      'Nkana Stadium',10000,1935,_country.zambia,65.1,[],{}];
    map[n.powerdynamos] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Arthur Davies Stadium',10000,1971,_country.zambia,60.7,[],{}];
    map[n.redArrows] = [ClubColors(Colors.red,Colors.white),pattern.solid,Coordinates(0,0),
      'Nkoloma Stadium',5000,2017,_country.zambia,62.1,[],{}];
    map[n.zanaco] = [ClubColors(Colors.red,Colors.black),pattern.stripes2,Coordinates(0,0),
      'Sunset Stadium',20000,1985,_country.zambia,62.4,[],{}];
    map[n.zesco] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-12.9751432, 28.611562),
      'Levy Mwanawasa',49800,1974,_country.zambia,66.3,[],{}];
    //ZIMBABWE
    map[n.amazuluZIM] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zimbabwe,50.0,[],{}];
    map[n.blackaces] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zimbabwe,50.0,[],{}];
    map[n.blackrhinos] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zimbabwe,50.0,[],{}];
    map[n.caps] = [ClubColors(Colors.green,Colors.white),pattern.stripes4,Coordinates(-17.821754729, 30.99484456),
      'National Sports Stadium',80000,1973,_country.zimbabwe,66.5,[],{}];
    map[n.chickeninn] = [ClubColors(Colors.yellow,Colors.black),pattern.stripesThin,Coordinates(-20.10438525, 28.50619545),
      'Luveve Stadium',8000,1997,_country.zimbabwe,64.4,[],{}];
    map[n.dynamos] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(-17.853630, 31.0376418),
      'Rufaro',45500,1963,_country.zimbabwe,66.5,[],{}];
    map[n.harare] = [ClubColors(Colors.yellow,Colors.blue),pattern.solid,Coordinates(0,0),
      'Rufaro Stadium',60000,1989,_country.zimbabwe,58.4,[],{}];
    map[n.highlanders] = [ClubColors(Colors.black,Colors.white),pattern.stripes4,Coordinates(-20.13111048, 28.569573348),
      'Barbourfields Stadium',40000,1926,_country.zimbabwe,65.7,[],{}];
    map[n.manicadiamonds] = [ClubColors(Colors.yellow,Colors.black),pattern.solid,Coordinates(-18.996833, 32.6409931),
      'Sakubva',35000,2017,_country.zimbabwe,64.1,[],{}];
    map[n.monomotapa] = [ClubColors(Colors.blue,Colors.white),pattern.solid,Coordinates(0,0),
      'Rufaro Stadium',35000,2003,_country.zimbabwe,56.4,[],{}];
    map[n.motoraction] = [ClubColors(Colors.grey,Colors.cyanAccent),pattern.solid,Coordinates(0,0),
      '',0,0,_country.zimbabwe,50.0,[],{}];
    map[n.platinum] = [ClubColors(Colors.green,Colors.white),pattern.solid,Coordinates(-20.306090, 30.0568275),
      'Mandava',15000,1995,_country.zimbabwe,65.2,[],{}];
  }

}