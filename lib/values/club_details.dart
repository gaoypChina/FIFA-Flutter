import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/contries_continents.dart';
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
  Coordinates getCoordinate(String clubName){
    return map[clubName][1] ?? Coordinates(0, 0);
  }
  String getStadium(String clubName){
    return map[clubName][2];
  }
  int getStadiumCapacity(String clubName){
    return map[clubName][3];
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
    return map[clubName][4];
  }
  String getCountry(String clubName){
    try {
      return map[clubName][5];
    }catch (e) {
      print('ERROR GETCOUNTRY: $clubName');
      return '';
    }
  }
  String getContinent(String clubName){
    return Continents().funcCountryContinents(getCountry(clubName));
  }
  List getRivals(String clubName){
    return map[clubName][6];
  }

  ClubDetails(){
    //map['generico'] = [ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',0,1900,_country.england];
    var _country = Words.country;
    Color darkblue = const Color(0xFF001050);
    Color blue = const Color(0xFF001FBB);
    Color grena = const Color(0xFF760025);
    
    ClubName _name = ClubName();
    //https://query.wikidata.org/#SELECT%20%3Fclub%20%3FclubLabel%20%3Fvenue%20%3FvenueLabel%20%3Fcoordinates%0AWHERE%0A%7B%0A%09%3Fclub%20wdt%3AP31%20wd%3AQ476028%20.%0A%09%3Fclub%20wdt%3AP115%20%3Fvenue%20.%0A%09%3Fvenue%20wdt%3AP625%20%3Fcoordinates%20.%0A%09SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22pt%22%20%7D%0A%7D
    map[_name.arsenal] = [ClubColors(Colors.red,Colors.white),Coordinates(51.555,-0.108611),
			'Estádio Emirates',60704,1886,_country.england,[_name.tottenham,_name.chelsea]];
    map[_name.astonvilla] = [ClubColors(Colors.purple,Colors.blueAccent),Coordinates(52.509166666,-1.884722222),
			'Villa Park',42660,1874,_country.england,[_name.birmigham]];
    map[_name.crystalpalace] = [ClubColors(Colors.purple,Colors.blueAccent),Coordinates(51.398333333,-0.085555555),
			'Selhurst Park',26047,1905,_country.england,];
    map[_name.chelsea] = [ClubColors(blue,Colors.white),Coordinates(51.481666666,-0.191111111),
			'Stamford Brigde',41837,1905,_country.england,[_name.tottenham,_name.arsenal]];
    map[_name.everton] = [ClubColors(blue,Colors.white),Coordinates(53.438888888,-2.966388888),
			'	Goodison Park',39571,1878,_country.england,[_name.liverpool]];
    map[_name.leicester] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.620277777,-1.142222222),
			'King Power Stadium',39571,1884,_country.england,];
    map[_name.leeds] = [ClubColors(Colors.white,Colors.white),Coordinates(53.777777777,-1.572222222),
			'Elland Road',37890,1919,_country.england,];
    map[_name.liverpool] = [ClubColors(Colors.red,Colors.white),Coordinates(53.430833333,-2.960833333),
			'Anfield',54167,1892,_country.england,[_name.manchesterunited,_name.everton]];
    map[_name.manchestercity] = [ClubColors(Colors.lightBlue,Colors.white),Coordinates(53.48331043737668, -2.200470393744969),
			'Etihad Stadium',53400,1880,_country.england,[_name.manchesterunited]];
    map[_name.manchesterunited] = [ClubColors(Colors.red,Colors.white),Coordinates(53.463055555,-2.291388888),
			'Old Trafford',76212,1878,_country.england,[_name.manchestercity]];
    map[_name.newcastle] = [ClubColors(Colors.black,Colors.white),Coordinates(54.975555555,-1.621666666),
			'St. James Park',52409,1892,_country.england,[_name.sunderland]];
    map[_name.southampton] = [ClubColors(Colors.red,Colors.white),Coordinates(50.90583333,-1.39111111),
			'St. Mary\'s',32690,1885,_country.england,[_name.portsmouth]];
    map[_name.tottenham] = [ClubColors(Colors.white,darkblue),Coordinates(51.604444444,-0.066388888),
			'Tottenham Hotspur Stadium',62850,1882,_country.england,[_name.arsenal,_name.chelsea]];
    map[_name.westbromwich] = [ClubColors(darkblue,Colors.white),Coordinates(52.509166666,-1.963888888),
			'The Hawthorns',26850,1878,_country.england,[_name.wolves]];
    map[_name.westham] = [ClubColors(grena,Colors.blue),Coordinates(51.538611111,-0.016388888),
			'Olímpico de Londres',60000,1895,_country.england,[_name.millwall,_name.tottenham]];
    map[_name.wolves] = [ClubColors(Colors.orange,Colors.black),Coordinates(52.590277777,-2.130277777),
			'Molineux Stadium',32050,1877,_country.england,[_name.westbromwich]];

    map[_name.birmigham] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.475702777,-1.868188888),
			'St Andrew\'s Stadium',30016,1875,_country.england,[_name.astonvilla]];
    map[_name.blackburn] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.728611111,-2.489166666),
			'Ewood Park',30016,1875,_country.england,[_name.burnley]];
    map[_name.bournemouth] = [ClubColors(Colors.black,Colors.red),Coordinates(50.735278,-1.838333),
			'Dean Court',11464,1890,_country.england,[_name.southampton]];
    map[_name.burnley] = [ClubColors(Colors.purple,Colors.blueAccent),Coordinates(53.789064,-2.230225),
			'Turf Moor',22546,1882,_country.england,[_name.blackburn]];
    map[_name.brighton] = [ClubColors(Colors.blue,Colors.white),Coordinates(50.861822222,-0.083277777),
			'Falmer Stadium',30750,1901,_country.england,[_name.crystalpalace]];
    map[_name.derbycount] = [ClubColors(Colors.white,Colors.white10),Coordinates(52.915,-1.447222222),
			'Pride Park',33597,1884,_country.england,[_name.nottinghamforest]];
    map[_name.fulham] = [ClubColors(Colors.white,Colors.black),Coordinates(51.475,-0.221666666),
			'Craven Cottage',19000,1879,_country.england,[_name.chelsea,_name.qpr]];
    map[_name.hullcity] = [ClubColors(Colors.orange,Colors.black),Coordinates(53.746111,-0.367777),
			'KCOM Stadium',25400,1904,_country.england,];
    map[_name.middlesbrough] = [ClubColors(Colors.red,Colors.white),Coordinates(54.578333,-1.2169444),
			'Riverside Stadium',34988,1876,_country.england,[_name.newcastle]];
    map[_name.norwich] = [ClubColors(Colors.yellow,Colors.green),Coordinates(52.622128,1.308653),
			'Carrow Road',27033,1902,_country.england,[_name.ipswichTown]];
    map[_name.nottinghamforest] = [ClubColors(Colors.red,Colors.white),Coordinates(52.94,-1.132778),
			'City Ground',30446,1865,_country.england,[_name.leicester]];
    map[_name.qpr] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.50916666,-0.232222222),
			'Loftus Road',18439,1882,_country.england,[_name.chelsea,_name.fulham]];
    map[_name.reading] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.4222,-0.98277),
			'Madejski Stadium',24250,1871,_country.england,];
    map[_name.sheffieldunited] = [ClubColors(Colors.red,Colors.black),Coordinates(53.37055504286472, -1.4709732045853037),
			'Bramall Lane',39859,1889,_country.england,[_name.sheffieldWednesday]];
    map[_name.stoke] = [ClubColors(Colors.red,Colors.white),Coordinates(52.988333333,-2.175555555),
			'Bet365 Stadium',30089,1863,_country.england,];
    map[_name.swansea] = [ClubColors(Colors.white,Colors.white),Coordinates(51.6422,-3.9351),
			'Liberty Stadium',21088,1912,_country.england,[_name.cardiffCity]];
    map[_name.watford] = [ClubColors(Colors.yellow,Colors.black),Coordinates(51.649928,-0.401606),
			'Vicarage Road',21577,1881,_country.england,[_name.luton]];


    map[_name.barnsley] = [ClubColors(Colors.red,Colors.white),Coordinates(53.552222,-1.4675),
			'Oakwell Stadium',23000,1887,_country.england,];
    map[_name.blackpool] = [ClubColors(Colors.orange,Colors.white),Coordinates(53.804722,-3.048056),
			'Bloomfield Road',12555,1887,_country.england,];
    map[_name.bradford] = [ClubColors(Colors.orangeAccent,Colors.red),Coordinates(53.804222222,-1.759022222),
			'Valley Parade',25136,1903,_country.england,];
    map[_name.brentford] = [ClubColors(Colors.red,Colors.white),Coordinates(51.488167,-0.302639),
			'Griffin Park',17250,1889,_country.england,];
    map[_name.bolton] = [ClubColors(Colors.white,darkblue),Coordinates(53.580555555,-2.535555555),
			'Reebok Stadium',28723,1874,_country.england,];
    map[_name.bristol] = [ClubColors(Colors.red,Colors.white),Coordinates(51.44,-2.620278),
			'Ashton Gate Stadium',21497,1897,_country.england,];
    map[_name.cardiffCity] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.472778,-3.203056),
			'Cardiff City Stadium',33000,1899,_country.england,];
    map[_name.coventry] = [ClubColors(Colors.yellow,Colors.black),Coordinates(52.44849844, -1.496216266),
			'Coventry Building Society Arena',32609,1883,_country.england,];
    map[_name.charlton] = [ClubColors(Colors.red,Colors.black),Coordinates(51.487489,0.035632),
			'The Valley',27116,1905,_country.england,];
    map[_name.huddersfield] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.654166666,-1.768333333),
			'Kirklees Stadium',24500,1908,_country.england,];
    map[_name.ipswichTown] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.055067557529036, 1.1451992575230177),
			'Portman Road',30311,1878,_country.england,];
    map[_name.luton] = [ClubColors(Colors.red,Colors.blue),Coordinates(51.88368823867562, -0.4305913598086313),
			'Kenilworth Road',10356,1885,_country.england,];
    map[_name.millwall] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.485833,-0.050833),
			'The New Den',20146,1885,_country.england,];
    map[_name.notts] = [ClubColors(Colors.black,Colors.white),Coordinates(52.9425,-1.137222),
			'Meadow Lane',19841,1862,_country.england,];
    map[_name.oxford] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(51.716419,-1.208067),
			'Oxford Stadium',30582,1893,_country.england,];
    map[_name.peterborough] = [ClubColors(Colors.blue,Colors.blue),Coordinates(52.5648333233, -0.240204256),
			'Weston Homes Stadium',15314,1934,_country.england,];
    map[_name.portsmouth] = [ClubColors(Colors.blue,Colors.white),Coordinates(50.796388888,-1.063888888),
			'Fratton Park',20688,1898,_country.england,];
    map[_name.plymouth] = [ClubColors(Colors.green,Colors.black),Coordinates(50.388055555,-4.150833333),
			'Home Park',19500,1886,_country.england,];
    map[_name.prestonNorthEnd] = [ClubColors(Colors.white,darkblue),Coordinates(53.772222222,-2.688055555),
			'Deepdale',23408,1880,_country.england,];
    map[_name.rotherham] = [ClubColors(Colors.red,Colors.white),Coordinates(53.4279,-1.362),
			'New York Stadium',12021,1925,_country.england,];
    map[_name.shrewsbury] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(52.6887706, -2.749098116),
			'New Meadow',9875,1886,_country.england,];
    map[_name.sheffieldWednesday] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.411388888,-1.50055),
			'Estádio Hillsborough',39732,1867,_country.england,[_name.sheffieldunited]];
    map[_name.sunderland] = [ClubColors(Colors.red,Colors.white),Coordinates(54.9144,-1.3882),
			'Stadium of Light',49000,1879,_country.england,[_name.newcastle]];
    map[_name.wigan] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.547778,-2.653889),
			'DW Stadium',25135,1932,_country.england,];
    map[_name.wimbledon] = [ClubColors(Colors.yellow,Colors.black),Coordinates(51.431363888,-0.186669444),
			'Plough Lane',9215,2002,_country.england,];
    map[_name.york] = [ClubColors(Colors.red,Colors.blue),Coordinates(53.98449, -1.052972250),
			'York Community Stadium',8500,1922,_country.england,];

    //ITALIA
    map[_name.atalanta] = [ClubColors(Colors.blue,Colors.black),Coordinates(45.708889,9.680833),
			'Atleti Azzurri d\'Italia',21300,1907,_country.italy,];
    map[_name.bologna] = [ClubColors(Colors.red,darkblue),Coordinates(44.49362,11.309719),
			'Renato Dall\'Ara',39444,1909,_country.italy,];
    map[_name.cagliari] = [ClubColors(Colors.red,darkblue),Coordinates(39.199888888,9.137583333),
			'Unipol Domus',16416,1920,_country.italy,];
    map[_name.fiorentina] = [ClubColors(Colors.purple,Colors.white),Coordinates(43.780822,11.282258),
			'Artemio Franchi',47282,1926,_country.italy,];
    map[_name.genoa] = [ClubColors(Colors.red,darkblue),Coordinates(44.416431,8.952428),
			'Luigi Ferraris',36600,1893,_country.italy,[_name.sampdoria]];
    map[_name.inter] = [ClubColors(Colors.blue,Colors.black),Coordinates(45.478055,9.123947),
			'Giuseppe Meazza',80018,1908,_country.italy,[_name.milan,_name.juventus]];
    map[_name.juventus] = [ClubColors(Colors.black,Colors.white),Coordinates(45.109594,7.641247),
			'Allianz Stadium',41507,1897,_country.italy,[_name.milan,_name.inter]];
    map[_name.milan] = [ClubColors(Colors.red,Colors.black),Coordinates(45.4786,9.1244),
			'Giuseppe Meazza',80018,1899,_country.italy,[_name.juventus,_name.inter]];
    map[_name.lazio] = [ClubColors(Colors.blueAccent,Colors.white),Coordinates(41.933872,12.454714),
			'Stadio Olimpico',73261,1900,_country.italy,[_name.roma]];
    map[_name.napoli] = [ClubColors(Colors.blueAccent,Colors.white),Coordinates(40.827967,14.193008),
			'Diego Armando Maradona',54726,1926,_country.italy,];
    map[_name.parma] = [ClubColors(Colors.white,Colors.yellow),Coordinates(44.794916666,10.338444444),
			'Ennio Tardini',22359,1913,_country.italy,];
    map[_name.roma] = [ClubColors(Colors.deepOrange,Colors.red),Coordinates(41.9339,12.454),
			'Stadio Olimpico',73261,1900,_country.italy,[_name.lazio]];
    map[_name.sampdoria] = [ClubColors(Colors.blue,Colors.red),Coordinates(44.4164,8.9524),
			'Luigi Ferraris',36600,1946,_country.italy,[_name.genoa]];
    map[_name.sassuolo] = [ClubColors(Colors.green,Colors.black),Coordinates(44.714722,10.649722),
			'MAPEI Stadium',23717,1920,_country.italy,];
    map[_name.torino] = [ClubColors(grena,Colors.white),Coordinates(45.041667,7.65),
			'Olímpico Grande Torino',27994,1906,_country.italy,];
    map[_name.udinese] = [ClubColors(Colors.black,Colors.white),Coordinates(46.081603,13.200136),
			'Friuli',25000,1896,_country.italy,];

    map[_name.ascoli] = [ClubColors(Colors.white,Colors.black),Coordinates(42.861111,13.594167),
			'Stadio Cino e Lillo Del Duca',20000,1898,_country.italy,];
    map[_name.bari] = [ClubColors(Colors.white,Colors.red),Coordinates(41.084736,16.840072),
			'San Nicola',58270,1908,_country.italy,];
    map[_name.benevento] = [ClubColors(Colors.yellow,Colors.red),Coordinates(41.116691, 14.78177738),
			'Municipal Stadium Ciro Vigorito',17554,1929,_country.italy,];
    map[_name.brescia] = [ClubColors(Colors.blue,Colors.white),Coordinates(45.570556,10.236944),
			'Estádio Mario Rigamonti',27592,1911,_country.italy,];
    map[_name.catania] = [ClubColors(Colors.blue,Colors.red),Coordinates(37.515833,15.071389),
			'Angelo Massimino',26000,1946,_country.italy,];
    map[_name.cesena] = [ClubColors(Colors.white,Colors.black),Coordinates(44.140556,12.261944),
			'Dino Manuzzi',23860,1940,_country.italy,];
    map[_name.chievo] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(45.435356,10.968647),
			'Estádio Marcantonio Bentegodi',39371,1929,_country.italy,];
    map[_name.como] = [ClubColors(Colors.blue,Colors.white),Coordinates(45.81424754723032, 9.072349181538822),
			'Giuseppe Sinigaglia',13602,1907,_country.italy,];
    map[_name.cremonese] = [ClubColors(Colors.red,Colors.grey),Coordinates(45.140424475662854, 10.034943289585),
			'Estádio Giovanni Zini',16003,1913,_country.italy,];
    map[_name.crotone] = [ClubColors(Colors.red,Colors.blue),Coordinates(39.079167,17.116667),
			'Ezio Scida',16547,1923,_country.italy,];
    map[_name.empoli] = [ClubColors(Colors.blue,Colors.white),Coordinates(43.726389,10.955),
			'Carlo Castellanni',19847,1920,_country.italy,];
    map[_name.foggia] = [ClubColors(Colors.red,Colors.black),Coordinates(41.45503127086417, 15.542573073997119),
			'Pino Zaccheria',25085,1920,_country.italy,];
    map[_name.frosinone] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(41.634981139201074, 13.321672921),
			'Benito Stirpe',16227,1906,_country.italy,];
    map[_name.hellasVerona] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(45.435356,10.968647),
			'Marcantonio Bentegodi',39371,1903,_country.italy,];
    map[_name.lecce] = [ClubColors(Colors.yellow,Colors.red),Coordinates(40.3654579445129, 18.20937082941416),
			'Via del Mare',36285,1908,_country.italy,];
    map[_name.livorno] = [ClubColors(grena,Colors.white),Coordinates(43.52680444, 10.314478472792636),
			'Stadio Armando Picchi',20000,1915,_country.italy,];
    map[_name.messina] = [ClubColors(Colors.red,Colors.yellow),Coordinates(38.161626115119, 15.52055759),
			'Stadio San Filippo',38722,1947,_country.italy,];
    map[_name.monza] = [ClubColors(Colors.red,Colors.white),Coordinates(45.582778,9.308056),
			'Stadio Brianteo',18568,1912,_country.italy,];
    map[_name.padova] = [ClubColors(Colors.white,Colors.red),Coordinates(45.43245775, 11.858382067334047),
			'Estádio Euganeo',32336,1910,_country.italy,];
    map[_name.palermo] = [ClubColors(Colors.purpleAccent,Colors.black),Coordinates(38.152767,13.342275),
			'Renzo Barbera',36871,1900,_country.italy,];
    map[_name.pescara] = [ClubColors(Colors.blue,Colors.white),Coordinates(42.455270727645, 14.2295803170869),
			'Adriático',24500,1936,_country.italy,];
    map[_name.perugia] = [ClubColors(Colors.red,Colors.white),Coordinates(43.1064162085987, 12.3574171183534),
			'Estádio Renato Curi',23625,1905,_country.italy,];
    map[_name.piacenza] = [ClubColors(Colors.red,Colors.white),Coordinates(45.029777170461, 9.69040781777808),
			'Leonardo Garilli',21608,1919,_country.italy,];
    map[_name.pisa] = [ClubColors(Colors.blue,Colors.black),Coordinates(43.7256289806979, 10.400910245512971),
			'Stadio Romeo Anconetani',17000,1909,_country.italy,];
    map[_name.pordenone] = [ClubColors(Colors.black,Colors.green),Coordinates(45.957921, 12.648520),
			'Stadio Ottavio Bottecchia',3000,1928,_country.italy,];
    map[_name.reggina] = [ClubColors(grena,Colors.white),Coordinates(38.09282370807243, 15.635732713372386),
			'Stadio Oreste',27763,1914,_country.italy,];
    map[_name.salernitana] = [ClubColors(grena,Colors.white),Coordinates(40.64574181157901, 14.82401436498),
			'Arechi',38000,1919,_country.italy,];
    map[_name.siena] = [ClubColors(grena,Colors.white),Coordinates(43.32184905388, 11.326110568071993),
			'Artemio Franchi',15373,1901,_country.italy,];
    map[_name.spal] = [ClubColors(Colors.blue,Colors.white),Coordinates(44.839722,11.6075),
			'Estádio Paolo Mazza',16751,1907,_country.italy,];
    map[_name.spezia] = [ClubColors(Colors.grey,Colors.white),Coordinates(44.102222,9.808611),
			'Alberto Picco',11466,1906,_country.italy,];
    map[_name.venezia] = [ClubColors(Colors.green,Colors.orange),Coordinates(45.427761,12.363731),
			'Pierluigi Penzo',9977,1907,_country.italy,];
    map[_name.vicenza] = [ClubColors(Colors.red,Colors.white),Coordinates(45.544167,11.555556),
			'Estádio Romeo Menti',17163,1902,_country.italy,];

    //ESPANHA
    map[_name.athleticbilbao] = [ClubColors(Colors.red,Colors.white),Coordinates(43.264205,-2.949369),
			'San Mamés',53289,1898,_country.spain,[_name.realsociedad]];
    map[_name.atleticomadrid] = [ClubColors(Colors.red,Colors.white),Coordinates(40.436111,-3.599444),
			'Wanda Metropolitano',67829,1903,_country.spain,[_name.realmadrid]];
    map[_name.barcelona] = [ClubColors(Colors.red,Colors.blue),Coordinates(41.380833,2.1225),
			'Camp Nou',99354,1899,_country.spain,[_name.realmadrid]];
    map[_name.celtavigo] = [ClubColors(Colors.blueAccent,Colors.white),Coordinates(42.211861,-8.740328),
			'Balaídos',29000,1923,_country.spain,];
    map[_name.espanyol] = [ClubColors(Colors.blue,Colors.white),Coordinates(41.347861,2.075667),
			'Cornellà-El Prat',40500,1900,_country.spain,];
    map[_name.getafe] = [ClubColors(Colors.blue,Colors.green),Coordinates(40.325556,-3.714722),
			'Coliseum Alfonso Pérez',17700,1983,_country.spain,];
    map[_name.osasuna] = [ClubColors(Colors.red,Colors.blue),Coordinates(42.796667,-1.636944),
			'Reyno de Navarra',19800,1920,_country.spain,];
    map[_name.lacoruna] = [ClubColors(Colors.blue,Colors.white),Coordinates(43.368667,-8.417372),
			'Municipal de Riazor',35600,1906,_country.spain,];
    map[_name.levante] = [ClubColors(grena,Colors.blue),Coordinates(39.494722,-0.364167),
			'	Ciutat de Valencia',25534,1909,_country.spain,[_name.valencia]];
    map[_name.realbetis] = [ClubColors(Colors.green,Colors.white),Coordinates(37.356403,-5.981611),
			'Benito Villamarín',60720,1907,_country.spain,[_name.sevilla]];
    map[_name.realmadrid] = [ClubColors(Colors.white,Colors.white),Coordinates(40.45306,-3.68835),
			'Santiago Bernabeu',81044,1902,_country.spain,[_name.barcelona,_name.atleticomadrid]];
    map[_name.realsociedad] = [ClubColors(Colors.blue,Colors.white),Coordinates(43.301378,-1.973617),
			'Anoeta',39500,1909,_country.spain,[_name.athleticbilbao]];
    map[_name.sevilla] = [ClubColors(Colors.white,Colors.red),Coordinates(37.383878,-5.970467),
			'Ramón Sánchez Pizjuán',43883,1890,_country.spain,[_name.realbetis]];
    map[_name.valladolid] = [ClubColors(Colors.purple,Colors.white),Coordinates(41.644444,-4.761111),
			'José Zorrilla',26512,1928,_country.spain,];
    map[_name.valencia] = [ClubColors(Colors.white,Colors.orange),Coordinates(39.474722,-0.358333),
			'Mestalla',48600,1919,_country.spain,];
    map[_name.villareal] = [ClubColors(Colors.yellow,Colors.yellow),Coordinates(39.944167,-0.103611),
			'La Cerámica',23500,1923,_country.spain,];

    map[_name.alaves] = [ClubColors(Colors.blue,Colors.white),Coordinates(42.837224, -2.68794204),
			'Mendizorroza',19840,1921,_country.spain,];
    map[_name.albacete] = [ClubColors(Colors.white,Colors.white),Coordinates(38.981201108390465, -1.8516267370025241),
			'Carlos Belmonte',17300,1940,_country.spain,];
    map[_name.almeria] = [ClubColors(Colors.red,Colors.white),Coordinates(36.84,-2.435278),
			'Estadio de los Juegos Mediterráneos',22000,1989,_country.spain,];
    map[_name.barcelonaB] = [ClubColors(grena,Colors.blue),Coordinates(41.37443652, 2.050680580),
			'Estadi Johan Cruyff',6000,1970,_country.spain,];
    map[_name.badajoz] = [ClubColors(Colors.white,Colors.black),Coordinates(38.85909805058098, -7.005712641258505),
			'Nuevo Vivero',14898,1905,_country.spain,];
    map[_name.burgos] = [ClubColors(Colors.white,Colors.black),Coordinates(42.34445896760816, -3.6803115846755574),
			'Estádio Municipal de El Plantío',12200,1994,_country.spain,];
    map[_name.cadiz] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(36.50274029685163, -6.272703671625995),
			'Estadio Ramón de Carranza',20724,1910,_country.spain,];
    map[_name.cartagena] = [ClubColors(Colors.white,Colors.black),Coordinates(37.60997607308336, -0.9961850276088828),
			'Estádio Cartagonova',15105,1995,_country.spain,];
    map[_name.compostela] = [ClubColors(Colors.blue,Colors.white),Coordinates(42.88266375966114, -8.51672248511444),
			'Vero Boquete',13000,1962,_country.spain,];
    map[_name.cordoba] = [ClubColors(Colors.green,Colors.white),Coordinates(37.872294,-4.764642),
			'Estadio Nuevo Arcángel',25100,1954,_country.spain,];
    map[_name.eibar] = [ClubColors(Colors.blue,Colors.red),Coordinates(43.18193713680332, -2.47563195763621),
			'Municipal de Ipurua',8164,1940,_country.spain,];
    map[_name.elche] = [ClubColors(Colors.white,Colors.green),Coordinates(38.266944,-0.663333),
			'Martínez Valero',36017,1922,_country.spain,];
    map[_name.extremadura] = [ClubColors(Colors.red,Colors.blue),Coordinates(0,0),
			'Francisco de la Hera',11580,1924,_country.spain,];
    map[_name.girona] = [ClubColors(Colors.red,Colors.white),Coordinates(41.961560623544194, 2.8289012665501416),
			'Estádio Montilivi',13500,1930,_country.spain,];
    map[_name.tarragona] = [ClubColors(Colors.red,Colors.white),Coordinates(42.19020152864727, 2.4763709658248683),
			'Nou Estadi',14500,1886,_country.spain,];
    map[_name.granada] = [ClubColors(Colors.red,Colors.white),Coordinates(37.152967,-3.595736),
			'Nuevo Los Cármenes',22524,1931,_country.spain,];
    map[_name.hercules] = [ClubColors(Colors.blue,Colors.white),Coordinates(38.35806250426043, -0.4914326032648159),
			'José Rico Pérez',29500,1922,_country.spain,];
    map[_name.huelva] = [ClubColors(Colors.white,Colors.blue),Coordinates(37.24660814, -6.9540283),
			'Estadio Nuevo Colombino',21670,1889,_country.spain,];
    map[_name.huesca] = [ClubColors(Colors.blue,Colors.red),Coordinates(42.131944,-0.424444),
			'Estádio El Alcoraz',8000,1960,_country.spain,];
    map[_name.ibiza] = [ClubColors(Colors.blue,Colors.white),Coordinates(38.913791833, 1.415050),
			'Estádio Municipal de Can Misses',4500,2015,_country.spain,];
    map[_name.lasPalmas] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(28.1,-15.456667),
			'Estádio Gran Canaria',31250,1949,_country.spain,];
    map[_name.leganes] = [ClubColors(Colors.white,Colors.blue),Coordinates(40.34069357468791, -3.7602580613941674),
			'Municipal de Butarque',10958,1928,_country.spain,];
    map[_name.malaga] = [ClubColors(Colors.blue,Colors.white),Coordinates(36.734092,-4.426422),
			'La Rosaleda',30044,1948,_country.spain,];
    map[_name.mallorca] = [ClubColors(Colors.red,Colors.black),Coordinates(39.59,2.63),
			'Iberostar Estádio',23142,1916,_country.spain,];
    map[_name.merida] = [ClubColors(Colors.white,Colors.black),Coordinates(38.91448460097904, -6.336490389883272),
			'Estadio Romano',14600,1912,_country.spain,];
    map[_name.murcia] = [ClubColors(Colors.red,Colors.white),Coordinates(38.04249942843141, -1.144061948739576),
			'Nueva Condomina',33900,1908,_country.spain,];
    map[_name.numancia] = [ClubColors(Colors.red,Colors.blue),Coordinates(41.754444,-2.467778),
			'Nuevo Estadio Los Pajaritos',9025,1945,_country.spain,];
    map[_name.rayoVallecano] = [ClubColors(Colors.red,Colors.white),Coordinates(40.391944,-3.658961),
			'Vallecas Campo de Futebol',15105,1924,_country.spain,];
    map[_name.realmadridB] = [ClubColors(Colors.white,Colors.white),Coordinates(40.4770605354219, -3.6142376094313704),
			'Estádio Alfredo Di Stéfano',12000,1930,_country.spain,];
    map[_name.salamanca] = [ClubColors(Colors.white,Colors.red),Coordinates(40.99550031894454, -5.6647436453888655),
			'El Helmántico',17341,2013,_country.spain,];
    map[_name.sportingGijon] = [ClubColors(Colors.red,Colors.white),Coordinates(43.536111,-5.637222),
			'El Molinón',30000,1905,_country.spain,];
    map[_name.tenerife] = [ClubColors(Colors.blue,Colors.white),Coordinates(28.463192602614335, -16.26089786672371),
			'Heliodoro López',24000,1912,_country.spain,];
    map[_name.toledo] = [ClubColors(Colors.green,Colors.white),Coordinates(39.86914546764724, -4.0182605067083665),
			'Salto del Caballo',5500,1928,_country.spain,];
    map[_name.realOviedo] = [ClubColors(Colors.blue,Colors.white),Coordinates(43.36087515372579, -5.869790783374754),
			'Novo Estádio Carlos Tartiere',30500,1926,_country.spain,];
    map[_name.xerez] = [ClubColors(Colors.blue,Colors.white),Coordinates(36.6896000729543, -6.119811153994252),
			'Estadio de Chapín',20523,1947,_country.spain,];
    map[_name.zaragoza] = [ClubColors(Colors.white,Colors.blue),Coordinates(41.636592,-0.901822),
			'La Romareda',34596,1932,_country.spain,];

    //ALEMANHA
    map[_name.moenchengladbach] = [ClubColors(Colors.green,Colors.black),Coordinates(51.174583333,6.385463888),
			'Borussia-Park',54022,1900,_country.germany,];
    map[_name.dortmund] = [ClubColors(Colors.yellow,Colors.black),Coordinates(51.4925,7.451667),
			'Signal Iduna Park',81359,1909,_country.germany,[_name.schalke04]];
    map[_name.bayernmunique] = [ClubColors(Colors.red,Colors.white),Coordinates(48.218775,11.624752777),
			'Allianz Arena',75024,1900,_country.germany,];
    map[_name.leverkusen] = [ClubColors(Colors.red,Colors.black),Coordinates(51.038255555,7.002205555),
			'BayArena',30210,1904,_country.germany,];
    map[_name.eintrachtfrankfurt] = [ClubColors(Colors.white,Colors.black),Coordinates(50.068611,8.645278),
			'Deutsche Bank Park',51500,1899,_country.germany,];
    map[_name.augsburg] = [ClubColors(Colors.white,Colors.red),Coordinates(48.32333464205292, 10.886761848412458),
			'SGL Arena',30660,1907,_country.germany,];
    map[_name.freiburg] = [ClubColors(Colors.red,Colors.white),Coordinates(47.988889,7.893056),
			'Europa-Park Stadion',34700,1904,_country.germany,];
    map[_name.hamburgo] = [ClubColors(Colors.blue,Colors.red),Coordinates(53.58722733673814, 9.898539843337923),
			'Volksparkstadion',57000,1887,_country.germany,];
    map[_name.colonia] = [ClubColors(Colors.red,Colors.white),Coordinates(50.933611,6.875),
			'RheinEnergieStadion',50000,1948,_country.germany,];
    map[_name.herthaberlim] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.514722222,13.239444444),
			'Olímpico de Berlim',74649,1892,_country.germany,];
    map[_name.hoffenheim] = [ClubColors(Colors.blue,Colors.white),Coordinates(49.239,8.888278),
			'Rhein-Neckar-Arena',30150,1899,_country.germany,];
    map[_name.rbleipzig] = [ClubColors(Colors.white,Colors.red),Coordinates(51.345833,12.348056),
			'Red Bull Arena',42146,2009,_country.germany,];
    map[_name.schalke04] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.554502777,7.067588888),
			'Veltins-Arena',62271,1904,_country.germany,[_name.dortmund]];
    map[_name.stuttgart] = [ClubColors(Colors.white,Colors.red),Coordinates(48.792222,9.231944),
			'Mercedes-Benz Arena',60441,1893,_country.germany,];
    map[_name.werderbremen] = [ClubColors(Colors.green,Colors.white),Coordinates(53.066389,8.8375),
			'Wohninvest Weserstadion',42100,1899,_country.germany,];
    map[_name.wolfsburg] = [ClubColors(Colors.green,Colors.white),Coordinates(52.431944,10.803889),
			'Volkswagen Arena',30000,1945,_country.germany,];

    map[_name.aachen] = [ClubColors(Colors.yellow,Colors.black),Coordinates(50.793333333,6.097222222),
			'New Tivoli',32960,1900,_country.germany,];
    map[_name.arminiaBiefeld] = [ClubColors(Colors.white,Colors.blue),Coordinates(52.031389,8.516944),
			'Bielefelder Alm',27300,1905,_country.germany,];
    map[_name.berliner] = [ClubColors(Colors.red,Colors.black),Coordinates(52.540621572758376, 13.4768246),
			'Dynamo-Sportforum',10000,1953,_country.germany,];
    map[_name.bochum] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.489944,7.236489),
			'Vonovia Ruhrstadion',27599,1848,_country.germany,];
    map[_name.darmstadt] = [ClubColors(Colors.blue,Colors.white),Coordinates(49.85781666103, 8.672877134887),
			'Merck-Stadion am Böllenfalltor',17000,1898,_country.germany,];
    map[_name.duisburg] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.409028,6.778639),
			'MSV-Arena',31500,1902,_country.germany,];
    map[_name.dynamoDresden] = [ClubColors(Colors.yellow,Colors.black),Coordinates(51.040278,13.747778),
			'DDV-Stadion',32066,1953,_country.germany,];
    map[_name.erzgebirgeaue] = [ClubColors(Colors.purple,Colors.black),Coordinates(50.5975,12.711111),
			'Erzgebirgsstadion',15711,1946,_country.germany,];
    map[_name.energieCottbus] = [ClubColors(Colors.white,Colors.red),Coordinates(51.751389,14.345556),
			'Stadion der Freundschaft',25450,1966,_country.germany,];
    map[_name.eintrachtBraunschweiger] = [ClubColors(Colors.white,Colors.blue),Coordinates(52.29,10.521389),
			'Eintracht-Stadion',23325,1895,_country.germany,];
    map[_name.fortunaDusseldorf] = [ClubColors(Colors.red,Colors.white),Coordinates(51.261539,6.733083),
			'Merkur Spielarena',54600,1895,_country.germany,];
    map[_name.greutherFurth] = [ClubColors(Colors.green,Colors.white),Coordinates(49.4870762463, 11.0000170),
			'Stadion am Laubenweg',15500,1903,_country.germany,];
    map[_name.hannover96] = [ClubColors(Colors.green,Colors.black),Coordinates(52.3601348913, 9.73151458536),
			'HDI-Arena',49000,1896,_country.germany,];
    map[_name.hansaRostock] = [ClubColors(Colors.blue,Colors.white),Coordinates(54.08495,12.095188888),
			'Ostseestadion',29000,1965,_country.germany,];
    map[_name.karlsruher] = [ClubColors(Colors.blue,Colors.white),Coordinates(49.02,8.413055555),
			'Wildparkstadion',32306,1894,_country.germany,];
    map[_name.kaiserslautern] = [ClubColors(Colors.red,Colors.white),Coordinates(49.43448524967153, 7.777611613160712),
			'Fritz Walter',49850,1900,_country.germany,];
    map[_name.magdeburg] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.12540760351741, 11.670571043503788),
			'MDCC-Arena',30098,1965,_country.germany,];
    map[_name.mainz05] = [ClubColors(Colors.red,Colors.white),Coordinates(49.984167,8.224167),
			'Opel Arena',34034,1905,_country.germany,];
    map[_name.munique1860] = [ClubColors(Colors.black,Colors.white),Coordinates(48.110833,11.574444),
			'Grünwalder Stadion',15000,1860,_country.germany,];
    map[_name.nurnberg] = [ClubColors(Colors.red,Colors.white),Coordinates(49.426322331052155, 11.126222688757741),
			'Max-Morlock-Stadion',49923,1900,_country.germany,];
    map[_name.paderborn] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.731389,8.710833),
			'Benteler-Arena',15000,1907,_country.germany,];
    map[_name.uerdigen] = [ClubColors(Colors.red,Colors.blue),Coordinates(51.339167,6.603611),
			'Grotenburg-Stadion',34500,1905,_country.germany,];
    map[_name.rotWeissEssen] = [ClubColors(Colors.white,Colors.red),Coordinates(51.4867758, 6.9768),
			'Georg-Melches-Stadion',22500,1907,_country.germany,];
    map[_name.saarbrucken] = [ClubColors(Colors.blue,Colors.black),Coordinates(49.2475,6.984167),
			'Ludwigsparkstadion',16003,1903,_country.germany,];
    map[_name.unionBerlin] = [ClubColors(Colors.red,Colors.yellow),Coordinates(52.457222,13.568056),
			'An der Alten Försterei',22012,1966,_country.germany,];
    map[_name.stPauli] = [ClubColors(grena,Colors.white),Coordinates(53.554444,9.967778),
			'Millerntor-Stadion',29546,1910,_country.germany,];

    //FRANÇA
    map[_name.bordeaux] = [ClubColors(Colors.blue,Colors.white),Coordinates(44.897472252314174, -0.5612858873333884),
			'Matmut Atlantique',42052,1881,_country.france,];
    map[_name.lille] = [ClubColors(Colors.red,Colors.blue),Coordinates(50.611944,3.130556),
			'Pierre-Mauroy',50186,1944,_country.france,];
    map[_name.lyon] = [ClubColors(Colors.white,Colors.blue),Coordinates(45.765224,4.982131),
			'Parc Olympique Lyonnais',59186,1950,_country.france,];
    map[_name.monaco] = [ClubColors(Colors.red,Colors.white),Coordinates(43.72761542667342, 7.415587736406536),
			'Louis II',18523,1924,_country.france,];
    map[_name.montpellier] = [ClubColors(Colors.blue,Colors.orange),Coordinates(43.269722222,5.395833333),
			'Stade de la Mosson',32939,1919,_country.france,[_name.nimes]];
    map[_name.nantes] = [ClubColors(Colors.yellow,Colors.green),Coordinates(47.25625627127256, -1.524267292221139),
			'Stade de la Beaujoire',37463,1943,_country.france,];
    map[_name.nice] = [ClubColors(Colors.red,Colors.black),Coordinates(43.705138888,7.192583333),
			'Allianz Riviera',35624,1904,_country.france,];
    map[_name.om] = [ClubColors(Colors.blueAccent,Colors.white),Coordinates(43.269983072632826, 5.3962199073682795),
			'Vélodrome',67395,1899,_country.france,[_name.psg]];
    map[_name.psg] = [ClubColors(Colors.red,Colors.blue),Coordinates(48.8413888,2.2530555),
			'Parc des Princes',48583,1970,_country.france,[_name.om]];
    map[_name.reims] = [ClubColors(Colors.red,Colors.white),Coordinates(49.246667,4.025),
			'Auguste Delaune',21668,1931,_country.france,];
    map[_name.rennes] = [ClubColors(Colors.black,Colors.red),Coordinates(48.107472222,-1.712861111),
			'Roazhon Park',29778,1901,_country.france,];
    map[_name.saintetienne] = [ClubColors(Colors.green,Colors.white),Coordinates(45.460833,4.39),
			'Geoffroy-Guichard',42000,1919,_country.france,];
    map[_name.metz] = [ClubColors(grena,Colors.white),Coordinates(49.11020796, 6.1603276020),
			'Stade Saint-Symphorien',26700,1919,_country.france,];

    map[_name.ajaccio] = [ClubColors(Colors.red,Colors.white),Coordinates(41.931255913324556, 8.777428344160677),
			'François Coty',12000,1910,_country.france,];
    map[_name.amiens] = [ClubColors(Colors.white,Colors.black),Coordinates(49.89432770891168, 2.2633171547653776),
			'Stade de la Licorne',12097,1901,_country.france,];
    map[_name.angers] = [ClubColors(Colors.white,Colors.black),Coordinates(47.460623285494066, -0.5314198073077759),
			'Stade Jean-Bouin',18752,1919,_country.france,];
    map[_name.auxerre] = [ClubColors(Colors.blue,Colors.white),Coordinates(47.787179642341265, 3.589488769405181),
			'Stade l\'Abbé-Deschamps',23467,1905,_country.france,];
    map[_name.bastia] = [ClubColors(Colors.blue,Colors.white),Coordinates(42.6514,9.442619),
			'Stade Armand Cesari',16500,1905,_country.france,];
    map[_name.brest] = [ClubColors(Colors.red,Colors.white),Coordinates(48.402932,-4.461694),
			'Stade Francis-Le Blé',15000,1950,_country.france,];
    map[_name.caen] = [ClubColors(Colors.red,Colors.blue),Coordinates(49.17955727851539, -0.3960763935464237),
			'Michel d\'Ornano',21500,1913,_country.france,];
    map[_name.clermont] = [ClubColors(Colors.red,Colors.blue),Coordinates(45.81592183512457, 3.1208739034264137),
			'Stade Gabriel-Montpied',10607,1990,_country.france,];
    map[_name.dijon] = [ClubColors(Colors.red,Colors.white),Coordinates(47.32493401383849, 5.068403775093125),
			'Stade Gaston-Gérard',16000,1998,_country.france,];
    map[_name.grenoble] = [ClubColors(Colors.blue,Colors.white),Coordinates(45.1875313, 5.740180234),
			'Stade des Alpes',20062,1892,_country.france,];
    map[_name.guingamp] = [ClubColors(Colors.red,Colors.black),Coordinates(48.565492846592825, -3.1643878327483543),
			'Stade du Roudourou',18256,1912,_country.france,];
    map[_name.lehavre] = [ClubColors(Colors.red,Colors.yellow),Coordinates(49.49886129674284, 0.16988383259535667),
			'Stade Océane',25178,1872,_country.france,];
    map[_name.lemans] = [ClubColors(Colors.red,Colors.yellow),Coordinates(47.95919009398701, 0.22315307550729924),
			'MMArena',17500,1985,_country.france,];
    map[_name.lens] = [ClubColors(Colors.yellow,Colors.red),Coordinates(50.433001866775776, 2.8153625563302236),
			'Félix Bollaert',41229,1906,_country.france,];
    map[_name.lorient] = [ClubColors(Colors.orange,Colors.black),Coordinates(47.748335851418815, -3.368186057917497),
			'Stade du Moustoir',18500,1926,_country.france,];
    map[_name.nancy] = [ClubColors(Colors.white,Colors.red),Coordinates(48.6955,6.210687),
			'Stade Marcel Picot',20085,1967,_country.france,];
    map[_name.nimes] = [ClubColors(Colors.red,Colors.white),Coordinates(43.81613586835348, 4.359880),
			'Stade des Costières',18482,1937,_country.france,[_name.montpellier]];
    map[_name.parisFC] = [ClubColors(Colors.blue,Colors.black),Coordinates(48.818611,2.346667),
			'Stade Sébastien Charléty',20000,1969,_country.france,];
    map[_name.redstar] = [ClubColors(Colors.green,Colors.red),Coordinates(48.90659978841236, 2.3419795192638113),
			'Stade Bauer',10000,1897,_country.france,];
    map[_name.rouen] = [ClubColors(Colors.red,Colors.black),Coordinates(49.41143361097126, 1.070693944843452),
			'Stade Robert Diochon',12018,1899,_country.france,];
    map[_name.sedan] = [ClubColors(Colors.green,Colors.red),Coordinates(49.69404732203414, 4.938800956160281),
			'Stade Louis Dugauguez',23189,1919,_country.france,];
    map[_name.sochaux] = [ClubColors(Colors.red,Colors.black),Coordinates(47.512403,6.811094),
			'Auguste Bonal',20005,1928,_country.france,];
    map[_name.strasbourg] = [ClubColors(Colors.blue,Colors.black),Coordinates(48.560064,7.754969),
			'Stade de la Meinau',26109,1906,_country.france,];
    map[_name.toulouse] = [ClubColors(Colors.purple,Colors.white),Coordinates(43.583296,1.434055),
			'Stade de Toulouse',35500,1937,_country.france,];
    map[_name.troyes] = [ClubColors(Colors.red,Colors.black),Coordinates(48.307668564872614, 4.098788858025232),
			'Stade de l\'Aube',20400,1900,_country.france,];
    map[_name.valenciennes] = [ClubColors(Colors.red,Colors.black),Coordinates(50.34901002249929, 3.532545128224054),
			'Stade du Hainaut',25172,1913,_country.france,];

    //PORTUGAL
    map[_name.benfica] = [ClubColors(Colors.red,Colors.white),Coordinates(38.753014954909695, -9.184471075757182),
			'Estádio da Luz',64642,1904,_country.portugal,[_name.porto,_name.sporting]];
    map[_name.porto] = [ClubColors(Colors.blue,Colors.white),Coordinates(41.161758,-8.583933),
			'Estádio do Dragão',50035,1893,_country.portugal,[_name.benfica,_name.sporting]];
    map[_name.sporting] = [ClubColors(Colors.green,Colors.white),Coordinates(38.761194444,-9.160783333),
			'José Alvalade',50095,1906,_country.portugal,[_name.porto,_name.benfica]];
    map[_name.arouca] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(40.933557625342736, -8.249067288994908),
			'Estádio Municipal de Arouca',5000,1952,_country.portugal,];
    map[_name.beiramar] = [ClubColors(Colors.yellow,Colors.black),Coordinates(40.6478986, -8.593620),
			'Municipal de Aveiro',32830,1923,_country.portugal,];
    map[_name.braga] = [ClubColors(Colors.red,Colors.white),Coordinates(41.56272876228549, -8.429015524257611),
			'Municipal de Braga',30286,1921,_country.portugal,[_name.vitoriaguimaraes]];
    map[_name.boavista] = [ClubColors(Colors.black,Colors.white),Coordinates(41.162222222,-8.642777777),
			'Estádio do Bessa Século XXI',28263,1903,_country.portugal,];
    map[_name.belenenses] = [ClubColors(Colors.blue,Colors.white),Coordinates(38.702778,-9.207778),
			'Estádio do Restelo',32000,1919,_country.portugal,];
    map[_name.casapia] = [ClubColors(Colors.black,Colors.white),Coordinates(38.737646418741065, -9.203400440540962),
			'Estádio Pina Manique',5000,1920,_country.portugal,];
    map[_name.chaves] = [ClubColors(Colors.blue,Colors.red),Coordinates(41.750948861113564, -7.464533445112992),
			'	Estádio Municipal de Chaves',9000,1949,_country.portugal,];
    map[_name.coimbra] = [ClubColors(Colors.black,Colors.white),Coordinates(40.203551299086485, -8.406711275334688),
			'Estádio Cidade de Coimbra',29622,1887,_country.portugal,];
    map[_name.covilha] = [ClubColors(Colors.green,Colors.white),Coordinates(40.282833411212124, -7.512237336166966),
			'Municipal José Santos Pinto',3500,1923,_country.portugal,];
    map[_name.estoril] = [ClubColors(Colors.yellow,Colors.white),Coordinates(38.715306503284516, -9.405738171709386),
			'António Coimbra da Mota',8000,1939,_country.portugal,];
    map[_name.estrelaamadora] = [ClubColors(Colors.red,Colors.green),Coordinates(38.752164768925276, -9.227266112379061),
			'Estádio José Gomes',9288,1932,_country.portugal,];
    map[_name.famalicao] = [ClubColors(Colors.blue,Colors.blue),Coordinates(41.40168297860769, -8.5224331910798),
			'Estádio Municipal de Famalicão',5307,1931,_country.portugal,];
    map[_name.farense] = [ClubColors(Colors.white,Colors.black),Coordinates(37.022328114893085, -7.928202608333228),
			'Estádio de São Luís',7000,1910,_country.portugal,];
    map[_name.gilVicente] = [ClubColors(Colors.red,Colors.blue),Coordinates(41.533888888,-8.611111111),
			'Estádio Cidade de Barcelos',12046,1924,_country.portugal,];
    map[_name.leixoes] = [ClubColors(Colors.white,Colors.red),Coordinates(41.1842451364265, -8.666396418466357),
			'Estádio do Mar',9821,1907,_country.portugal,];
    map[_name.maritimo] = [ClubColors(Colors.green,Colors.red),Coordinates(32.645561,-16.928331),
			'Estádio dos Barreiros',10932,1910,_country.portugal,];
    map[_name.moreirense] = [ClubColors(Colors.green,Colors.white),Coordinates(41.37820476039625, -8.354246900622611),
			'Comendador Joaquim de Almeida Freitas',6153,1938,_country.portugal,];
    map[_name.nacionalMadeira] = [ClubColors(Colors.yellow,Colors.black),Coordinates(32.670625,-16.883525),
			'Estádio da Madeira',5500,1910,_country.portugal,];
    map[_name.pacosDeFerreira] = [ClubColors(Colors.yellow,Colors.green),Coordinates(41.271446682366985, -8.384887813773972),
			'Capital do Móvel',9077,1950,_country.portugal,];
    map[_name.penafiel] = [ClubColors(Colors.red,Colors.black),Coordinates(41.211767965307956, -8.27777600),
			'Estádio Municipal 25 de Abril',5300,1951,_country.portugal,];
    map[_name.portimonense] = [ClubColors(Colors.black,Colors.white),Coordinates(37.13587991920043, -8.540001),
			'Estádio Municipal de Portimão',6000,1914,_country.portugal,];
    map[_name.olhanense] = [ClubColors(Colors.red,Colors.black),Coordinates(37.02937056542217, -7.848373130442676),
			'Estádio José Arcanjo',10080,1912,_country.portugal,];
    map[_name.rioAve] = [ClubColors(Colors.green,Colors.white),Coordinates(41.36282573110833, -8.739653212718668),
			'Estádio dos Arcos',5000,1939,_country.portugal,];
    map[_name.salgueiros] = [ClubColors(Colors.red,Colors.white),Coordinates(41.15904746475558, -8.572435608280456),
			'Complexo Desportivo de Campanhã',1500,1911,_country.portugal,];
    map[_name.santaClara] = [ClubColors(Colors.red,Colors.white),Coordinates(37.76392847557282, -25.622288584700296),
			'Estádio de São Miguel',10000,1927,_country.portugal,];
    map[_name.uniaoLeiria] = [ClubColors(Colors.white,Colors.white),Coordinates(39.74945449173086, -8.812609974276361),
			'Estádio Dr. Magalhães Pessoa',125000,1966,_country.portugal,];
    map[_name.tondela] = [ClubColors(Colors.green,Colors.yellow),Coordinates(40.51203795619266, -8.082878165507793),
			'Estádio João Cardoso',5000,1933,_country.portugal,];
    map[_name.varzim] = [ClubColors(Colors.white,Colors.black),Coordinates(41.38797001360432, -8.771977516024036),
			'Estádio do Varzim Sport Club',7280,1915,_country.portugal,];
    map[_name.viseu] = [ClubColors(Colors.black,Colors.white),Coordinates(40.65955321602642, -7.900396978887168),
			'Estádio do Fontelo',6912,1914,_country.portugal,];
    map[_name.vizela] = [ClubColors(Colors.white,Colors.blue),Coordinates(41.38882478623334, -8.306887911413858),
			'Estádio do Futebol Clube de Vizela',6000,1939,_country.portugal,];
    map[_name.vitoriaguimaraes] = [ClubColors(Colors.white,Colors.black),Coordinates(41.446135622185416, -8.300460354957018),
			'D. Afonso Henriques',30146,1922,_country.portugal,[_name.braga]];
    map[_name.vitoriaSetubal] = [ClubColors(Colors.green,Colors.white),Coordinates(38.53138889,-8.891111),
			'Estádio do Bonfim',21530,1910,_country.portugal,];

    //HOLANDA
    map[_name.ajax] = [ClubColors(Colors.red,Colors.white),Coordinates(52.314166666,4.941944444),
			'Johan Cruijff Arena',54990,1900,_country.netherlands,[_name.psv,_name.feyenoord]];
    map[_name.feyenoord] = [ClubColors(Colors.red,Colors.black),Coordinates(51.893894444,4.523252777),
			'De Kuip',51577,1908,_country.netherlands,[_name.psv,_name.ajax]];
    map[_name.psv] = [ClubColors(Colors.red,Colors.white),Coordinates(51.441887861331786, 5.467844776087513),
			'Philips Stadion',35000,1912,_country.netherlands,[_name.ajax,_name.feyenoord]];
    map[_name.azAlkmaar] = [ClubColors(Colors.red,Colors.white),Coordinates(52.61309660473495, 4.742401887061996),
			'AFAS Stadium',17023,1967,_country.netherlands,];
    map[_name.denhaag] = [ClubColors(Colors.yellow,Colors.green),Coordinates(52.06288118890376, 4.383067425010522),
			'Estádio Cars Jeans',15000,1905,_country.netherlands,];
    map[_name.groningen] = [ClubColors(Colors.white,Colors.green),Coordinates(53.20622029818472, 6.591709065321877),
			'Euroborg',22329,1915,_country.netherlands,];
    map[_name.heerenveen] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.9588594880557, 5.936259769861008),
			'Abe Lenstra',26100,1920,_country.netherlands,];
    map[_name.rodajc] = [ClubColors(Colors.yellow,Colors.black),Coordinates(50.85726782055724, 6.00583433712426),
			'Parkstad Limburg Stadion',9790,1962,_country.netherlands,];
    map[_name.rapidjc] = [ClubColors(Colors.red,Colors.blue),Coordinates(0,0),
			'Gemeentelijk Sportpark Kaalheide',25000,1954,_country.netherlands,];    //EXTINTO vira roda jc
    map[_name.spartarotterdam] = [ClubColors(Colors.red,Colors.white),Coordinates(51.92002413159479, 4.433776185185383),
			'Sparta Stadion Het Kasteel',11026,1888,_country.netherlands,];
    map[_name.twente] = [ClubColors(Colors.red,Colors.white),Coordinates(52.2366666,6.8375),
			'De Grolsch Veste',30205,1965,_country.netherlands,];
    map[_name.utrecht] = [ClubColors(Colors.red,Colors.black),Coordinates(52.07852859560473, 5.14622137691634),
			'Galgenwaard',24426,1970,_country.netherlands,];
    map[_name.vitesse] = [ClubColors(Colors.yellow,Colors.white),Coordinates(51.962924539860964, 5.893073596119453),
			'GelreDome',21248,1892,_country.netherlands,];
    map[_name.willem] = [ClubColors(Colors.blue,Colors.red),Coordinates(51.54301953859648, 5.067781658922021),
			'Willen II Stadion',45500,1896,_country.netherlands,];

    //BELGICA
    map[_name.anderlecht] = [ClubColors(Colors.purple,Colors.white),Coordinates(50.8344335180823, 4.297968133381998),
			'Constant Vanden Stock',28063,1908,_country.belgium,];
    map[_name.brugge] = [ClubColors(Colors.blue,Colors.black),Coordinates(51.19333388412542, 3.180370157121857),
			'Jan Breydel',30000,1891,_country.belgium,];
    map[_name.standardliege] = [ClubColors(Colors.red,Colors.white),Coordinates(50.60992888780169, 5.544381876008557),
			'Maurice Dufrasne',30030,1898,_country.belgium,];
    map[_name.genk] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.005054823283146, 5.533549432602612),
			'Cristal Arena',24604,1988,_country.belgium,];
    map[_name.gent] = [ClubColors(Colors.blue,Colors.white),Coordinates(51.01671567515562, 3.7347187609123194),
			'Ghelamco Arena',20000,1900,_country.belgium,];
    map[_name.lierse] = [ClubColors(Colors.yellow,Colors.black),Coordinates(51.144333497109585, 4.57393474070042),
			'Herman Vanderpoorten Stadion',15500,1906,_country.belgium,];
    map[_name.royalAntwerp] = [ClubColors(Colors.red,Colors.white),Coordinates(51.23260015472852, 4.472522635773205),
			'Stadium “BOSUIL“',10000,1880,_country.belgium,];
    map[_name.mechelen] = [ClubColors(Colors.red,Colors.yellow),Coordinates(51.03687065526583, 4.487291537988871),
			'AFAS Stadion',10000,1904,_country.belgium,];
    map[_name.charleroi] = [ClubColors(Colors.white,Colors.black),Coordinates(50.41487489997499, 4.453183668882974),
			'Stade du Pays de Charleroi',25000,1904,_country.belgium,];
    map[_name.beveren] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(51.21436504721321, 4.244221247543427),
			'Freethiel Stadion',13290,1936,_country.belgium,];
    map[_name.cerclebrugge] = [ClubColors(Colors.green,Colors.black),Coordinates(0,0),
			'Jan Breydel',29062,1899,_country.belgium,];
    map[_name.molenbeek] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.belgium,];

    //ESCOCIA
    map[_name.celtic] = [ClubColors(Colors.green,Colors.white),Coordinates(55.849711111,-4.205588888),
			'Celtic Park',60355,1888,_country.scotland,[_name.rangers]];
    map[_name.rangers] = [ClubColors(Colors.blue,Colors.white),Coordinates(55.853055555,-4.309166666),
			'Ibrox Stadium',50817,1872,_country.scotland,[_name.celtic]];
    map[_name.aberdeen] = [ClubColors(Colors.red,Colors.white),Coordinates(57.159861789437294, -2.088085376186921),
			'Pittodrie Stadium',22199,1903,_country.scotland];
    map[_name.dundee] = [ClubColors(Colors.orange,Colors.black),Coordinates(56.4748207062714, -2.968603106135804),
			'Tannadice Park',14209,1909,_country.scotland,];
    map[_name.hibernian] = [ClubColors(Colors.green,Colors.white),Coordinates(55.96189876551645, -3.165065686953412),
			'Easter Road',20421,1875,_country.scotland,];
    map[_name.kilmarnock] = [ClubColors(Colors.blue,Colors.black),Coordinates(55.604225,-4.508122),
			'Rugby Park',18128,1869,_country.scotland,];
    map[_name.hearts] = [ClubColors(grena,Colors.white),Coordinates(55.9389923, -3.232460),
			'Tynecastle Stadium',20099,1874,_country.scotland,];
    //IRLANDA DO NORTE GALES
    map[_name.linfield] = [ClubColors(Colors.blue,Colors.white),Coordinates(54.582700483277314, -5.954806801881155),
			'Windsor Park',21000,1886,_country.northernIreland,];
    map[_name.glentoran] = [ClubColors(Colors.green,Colors.red),Coordinates(51.48389007836147, -0.1146840139686766),
			'The Oval',26556,1882,_country.northernIreland,];
    map[_name.newsaints] = [ClubColors(Colors.green,Colors.blue),Coordinates(52.8759,-3.02631),
			'Park Hall',2034,1896,_country.wales];
    //IRLANDA
    map[_name.bohemian] = [ClubColors(Colors.red,Colors.black),Coordinates(53.361538308043656, -6.274242753466988),
			'Dalymount Park',8030,1890,_country.ireland,];
    map[_name.cork] = [ClubColors(Colors.green,Colors.white),Coordinates(51.885517701229794, -8.468353748635607),
			'Turner Cross',7000,1984,_country.ireland,];
    map[_name.derry] = [ClubColors(Colors.red,Colors.white),Coordinates(54.990852621806944, -7.336110758450032),
			'Brandywell',7700,1928,_country.ireland,];
    map[_name.dundalk] = [ClubColors(Colors.white,Colors.black),Coordinates(53.99921346123983, -6.415993491759424),
			'Oriel Park',13600,1919,_country.ireland,];
    map[_name.shamrock] = [ClubColors(Colors.green,Colors.white),Coordinates(53.28363777169359, -6.373458012215909),
			'Estádio de Tallaght',6000,1899,_country.ireland,];

    //NORDICOS
    //NORUEGA
    map[_name.fredrikstad] = [ClubColors(Colors.red,Colors.white),Coordinates(59.21162675932621, 10.93747001118653),
			'Nye Fredrikstad Stadion',13300,1903,_country.norway,];
    map[_name.glimt] = [ClubColors(Colors.yellow,Colors.black),Coordinates(67.27666691868009, 14.384742457176511),
			'Aspmyra Stadion',7354,1916,_country.norway,];
    map[_name.lyn] = [ClubColors(Colors.red,Colors.blue),Coordinates(59.94913441249035, 10.734334),
			'Ullevaal Stadion',25572,1896,_country.norway,];
    map[_name.rosenborg] = [ClubColors(Colors.black,Colors.white),Coordinates(63.41251977639531, 10.405168424163572),
			'Lerkendal Stadion',21405,1917,_country.norway,[_name.molde]];
    map[_name.molde] = [ClubColors(Colors.blue,Colors.white),Coordinates(62.73348179745543, 7.148313098699186),
			'Aker Stadion',11167,1911,_country.norway,[_name.rosenborg]];
    map[_name.lillestrom] = [ClubColors(Colors.yellow,Colors.black),Coordinates(59.962752,11.063458),
			'Åråsen Stadion',12000,1917,_country.norway,];
    map[_name.valerenga] = [ClubColors(Colors.blue,Colors.white),Coordinates(59.94925250486655, 10.73449506268394),
			'Ullevaal Stadion',25000,1913,_country.norway,];
    map[_name.viking] = [ClubColors(Colors.black,Colors.white),Coordinates(58.9146757, 5.73094724),
			'	Viking Stadion',16000,1899,_country.norway,];
    //SUECIA
    map[_name.aik] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(57.705889, 11.98060),
			'Estádio Gamla Ullevi',18416,1904,_country.sweden,];
    map[_name.atvidabergs] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.sweden,];
    map[_name.djurgarden] = [ClubColors(Colors.lightBlueAccent,darkblue),Coordinates(59.291191, 18.0846677),
			'Stockholmsarenan',33000,1899,_country.sweden,];
    map[_name.elfsborg] = [ClubColors(Colors.yellow,Colors.black),Coordinates(57.734357, 12.934777207168842),
			'Arena de Borås',17000,1904,_country.sweden,];
    map[_name.hammarby] = [ClubColors(Colors.green,Colors.white),Coordinates(59.290854, 18.085401471742404),
			'Tele2 Arena',33000,1915,_country.sweden,];
    map[_name.helsingborg] = [ClubColors(Colors.red,Colors.blue),Coordinates(59.345391, 18.079072201513352),
			'Stockholm Olympic Stadium',17100,1907,_country.sweden,];
    map[_name.kalmar] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.sweden,];
    map[_name.ifkgoteborg] = [ClubColors(Colors.blue,Colors.white),Coordinates(57.706313, 11.980112),
			'Gamla Ullevi',18416,1904,_country.sweden,];
    map[_name.malmo] = [ClubColors(Colors.blue,Colors.white),Coordinates(55.583611111,12.987777777),
			'Eleda Stadion',24000,1910,_country.sweden,];
    map[_name.norrkoping] = [ClubColors(Colors.white,Colors.blue),Coordinates(58.584254, 16.1730),
			'Nya Parken',17234,1897,_country.sweden,];
    //DINAMARCA
    map[_name.copenhague] = [ClubColors(Colors.white,Colors.blue),Coordinates(55.702801493878425, 12.572584226298794),
			'Parken Stadium',42358,1992,_country.denmark,];
    map[_name.midtjylland] = [ClubColors(Colors.black,Colors.red),Coordinates(56.117084943757675, 8.952439451278998),
			'MCH Arena',11800,1999,_country.denmark,];
    map[_name.brondby] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(55.64892327650882, 12.417979390429544),
			'Brøndby Stadion',29000,1964,_country.denmark,];
    map[_name.randers] = [ClubColors(Colors.white,Colors.blue),Coordinates(56.46572077485179, 10.009500677727642),
			'AutoC Park Randers',10300,2003,_country.denmark,];
    map[_name.obodense] = [ClubColors(Colors.white,Colors.blue),Coordinates(55.39794088243304, 10.350535478742769),
			'TRE-FOR Park',15761,1887,_country.denmark,];
    map[_name.lyngby] = [ClubColors(Colors.blue,Colors.white),Coordinates(55.78079102321677, 12.50617005734735),
			'Lyngby Stadion',12000,1921,_country.denmark,];
    map[_name.aalborg] = [ClubColors(Colors.red,Colors.white),Coordinates(57.052210568355, 9.899045278578187),
			'Estádio Aalborg',13800,1885,_country.denmark,];
    map[_name.aarhus] = [ClubColors(Colors.white,Colors.white),Coordinates(56.1319897, 10.196636954464124),
			'NRGi Park',20032,1880,_country.denmark,];
    map[_name.horsens] = [ClubColors(Colors.yellow,Colors.black),Coordinates(55.871661, 9.857663512789747),
			'CASA Arena Horsens',10400,1994,_country.denmark,];
    map[_name.nordsjaelland] = [ClubColors(Colors.red,Colors.yellow),Coordinates(55.81610534417498, 12.352498875054323),
			'Farum Park',10000,1991,_country.denmark,];
    map[_name.esbjerg] = [ClubColors(Colors.red,Colors.black),Coordinates(55.48228994837166, 8.439832057459824),
			'Blue Water Arena',18000,1924,_country.denmark,];
    map[_name.vejle] = [ClubColors(Colors.red,Colors.white),Coordinates(55.71376447, 9.55639463),
			'Vejle Stadion',10491,1891,_country.denmark,];
    //FINLANDIA
    map[_name.helsinki] = [ClubColors(Colors.blue,Colors.white),Coordinates(60.187631525241386, 24.9233445914813),
			'Bolt Arena',10770,1907,_country.finland,];
    map[_name.haka] = [ClubColors(Colors.white,Colors.black),Coordinates(61.26808062242725, 24.02085023428088),
			'Tehtaan kenttä',6400,1934,_country.finland,];
    map[_name.kups] = [ClubColors(Colors.yellow,Colors.black),Coordinates(62.884580, 27.6718364),
			'Väre Areena',4700,1923,_country.finland,];
    map[_name.lahti] = [ClubColors(Colors.red,Colors.black),Coordinates(0, 0),
			'Estádio',10000,1900,_country.finland,];
    //ISLANDIA
    map[_name.akraness] = [ClubColors(Colors.yellow,Colors.black),Coordinates(64.31819030288712, -22.057136641306297),
			'Akranesvöllur',6000,1946,_country.iceland,];
    map[_name.hafnarfjardar] = [ClubColors(Colors.white,Colors.black),Coordinates(64.07608583455675, -21.935295742073322),
			'Kaplakriki',6450,1928,_country.iceland,];
    map[_name.vikingur] = [ClubColors(Colors.red,Colors.black),Coordinates(64.11637343002897, -21.855003210025927),
			'Víkingsvöllur',1450,1908,_country.iceland,];
    map[_name.valur] = [ClubColors(Colors.red,Colors.white),Coordinates(64.13294129158774, -21.922968096546022),
			'Vodafonevöllurinn',3000,1911,_country.iceland,];

    //AUSTRIA
    map[_name.rbsalzburg] = [ClubColors(Colors.white,Colors.red),Coordinates(47.81636150019733, 12.998601542498593),
			'Red Bull Arena',31895,2005,_country.austria,];
    map[_name.rapidviena] = [ClubColors(Colors.green,Colors.white),Coordinates(48.19810877379337, 16.266096105421564),
			'Allianz Stadion',28000,1899,_country.austria,];
    map[_name.laskLinz] = [ClubColors(Colors.red,Colors.black),Coordinates(48.29382580071369, 14.27661433857404),
			'Linzer Stadion',30138,1908,_country.austria,];
    map[_name.sturmGraz] = [ClubColors(Colors.black,Colors.white),Coordinates(47.04664567173094, 15.455268492776918),
			'Merkur Arena',16400,1909,_country.austria,];
    map[_name.austria] = [ClubColors(Colors.purple,Colors.white),Coordinates(48.16250323169553, 16.387632263981203),
			'Franz Horr',17656,1911,_country.austria,];
    map[_name.tirol] = [ClubColors(Colors.red,Colors.black),Coordinates(47.255992, 11.4113934),
			'Tivoli Stadium',16008,1930,_country.austria,];
    //SUIÇA
    map[_name.basel] = [ClubColors(Colors.red,Colors.blue),Coordinates(47.541690741203624, 7.620676421307312),
			'St. Jakob-Park',42500,1893,_country.switzerland,];
    map[_name.youngBoys] = [ClubColors(Colors.yellow,Colors.black),Coordinates(46.96337579394358, 7.465335873936408),
			'Estádio da Suíça',32000,1898,_country.switzerland,];
    map[_name.zurich] = [ClubColors(Colors.blue,Colors.white),Coordinates(47.38279,8.503801),
			'Letzigrund',26500,1896,_country.switzerland,];
    map[_name.grasshoppers] = [ClubColors(Colors.blue,Colors.white),Coordinates(47.38286, 8.5036),
			'Letzigrund',26500,1886,_country.switzerland,];
    map[_name.sion] = [ClubColors(Colors.red,Colors.white),Coordinates(46.233536282465536, 7.376404736355037),
			'Estádio Tourbillon',14500,1909,_country.switzerland,];
    map[_name.servette] = [ClubColors(grena,Colors.white),Coordinates(46.177778,6.1275),
			'Stade de Genève',30084,1890,_country.switzerland,];
    map[_name.thun] = [ClubColors(Colors.red,Colors.white),Coordinates(46.74390559123201, 7.606633229549598),
			'Stockhorn Arena',10300,1898,_country.switzerland,];
    map[_name.neuchatel] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Stade de la Maladière',12000,1970,_country.switzerland,]; //FALIU
    map[_name.chauxdefonds] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(47.112810878543364, 6.8375679316335995),
			'Centre Sportif de la Charrière',12700,1894,_country.switzerland,];
    //POLONIA
    map[_name.gornik] = [ClubColors(Colors.white,Colors.black),Coordinates(50.296646268479854, 18.76963765376737),
			'Estádio Ernest Pohl',24563,1948,_country.poland,];
    map[_name.gwardia] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.poland,];
    map[_name.legiaWarszawa] = [ClubColors(Colors.green,Colors.white),Coordinates(52.22057926406805, 21.04088559869264),
			'Pepsi Arena',31000,1916,_country.poland,];
    map[_name.lechPoznan] = [ClubColors(Colors.blue,Colors.white),Coordinates(52.397751830308636, 16.858715952507303),
			'Estádio Municipal de Poznań',41609,1922,_country.poland,];
    map[_name.ruchchorzow] = [ClubColors(Colors.blue,Colors.white),Coordinates(50.28228733849798, 18.945276380028233),
			'Stadion Ruchu Chorzów',9300,1920,_country.poland,];
    map[_name.poloniabytom] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Stadion Edwarda Szymkowiaka',6000,1920,_country.poland,];
    map[_name.szombierki] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.poland,];
    map[_name.wisla] = [ClubColors(Colors.red,Colors.white),Coordinates(50.06384019955333, 19.911990725893965),
			'Estádio Henryk Reyman',33326,1906,_country.poland,];
    map[_name.widzew] = [ClubColors(Colors.red,Colors.white),Coordinates(51.764935, 19.511602864656513),
			'MOSiR Widzew Łódź',18008,1922,_country.poland,];

    //TURQUIA
    map[_name.galatasaray] = [ClubColors(Colors.orange,Colors.red),Coordinates(41.103388888,28.991),
			'NEF Stadyumu',52280,1905,_country.turkey,[_name.fenerbahce,_name.besiktas]];
    map[_name.fenerbahce] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(40.98779516222245, 29.036899168700117),
			'Şükrü Saraçoğlu',50509,1907,_country.turkey,[_name.galatasaray,_name.besiktas]];
    map[_name.besiktas] = [ClubColors(Colors.black,Colors.white),Coordinates(41.03949093761059, 28.994748483503184),
			'Vodafone Park',41903,1903,_country.turkey,[_name.fenerbahce,_name.galatasaray]];
    map[_name.trabzonspor] = [ClubColors(Colors.red,Colors.blue),Coordinates(39.6463,40.9987),
			'Şenol Güneş Stadium',41461,1967,_country.turkey,];
    map[_name.instanbul] = [ClubColors(Colors.red,Colors.blue),Coordinates(41.123235956, 28.8084614620),
			'Fatih Terim de Başakşehir',17319,1990,_country.turkey,];
    map[_name.adanaspor] = [ClubColors(Colors.orange,Colors.black),Coordinates(37.063725539285606, 35.37545482106474),
			'Novo Estádio de Adana',33543,1954,_country.turkey,];
    map[_name.antalyaspor] = [ClubColors(Colors.red,Colors.white),Coordinates(36.8884456442093, 30.66902964083748),
			'Estádio de Antália',32539,1966,_country.turkey,];
    map[_name.bursaspor] = [ClubColors(Colors.green,Colors.red),Coordinates(0,0),
			'Estádio',10000,1900,_country.turkey,];
    map[_name.denizlispor] = [ClubColors(Colors.green,Colors.black),Coordinates(37.76621146831148, 29.082656073088405),
			'Denizli Atatürk Stadyumu',18745,1966,_country.turkey,];
    map[_name.goztepe] = [ClubColors(Colors.red,Colors.yellow),Coordinates(38.39559521318485, 27.076046407636582),
			'Estádio Gürsel Aksel',20035,1925,_country.turkey,];
    map[_name.konyaspor] = [ClubColors(Colors.white,Colors.green),Coordinates(37.94633114402268, 32.48842835745111),
			'Estádio Municipal Metropolitano de Cônia',41981,1922,_country.turkey,];
    map[_name.gaziantepspor] = [ClubColors(Colors.white,Colors.red),Coordinates(37.12306537693131, 37.38378410259563),
			'Estádio de Gaziantepe',35574,1988,_country.turkey];
    map[_name.sivasspor] = [ClubColors(Colors.red,Colors.white),Coordinates(39.724524244154836, 36.97510870),
			'Yeni Sivas 4 Eylül Stadı',27532,1967,_country.turkey,];
    //GRECIA
    map[_name.olympiacos] = [ClubColors(Colors.red,Colors.white),Coordinates(37.946169,23.664536),
			'Karaiskákis',32130,1925,_country.greece,];
    map[_name.aek] = [ClubColors(Colors.yellow,Colors.black),Coordinates(38.036111111,23.7875),
			'Olímpico de Atenas',71030,1924,_country.greece,];
    map[_name.paok] = [ClubColors(Colors.black,Colors.white),Coordinates(40.613839,22.972422),
			'Toumba Stadium',29000,1926,_country.greece,];
    map[_name.panathinaikos] = [ClubColors(Colors.green,Colors.white),Coordinates(37.987606, 23.753651),
			'Apostolos Nikolaidis',16003,1908,_country.greece,];
    map[_name.aris] = [ClubColors(Colors.yellow,Colors.black),Coordinates(40.600069,22.9695),
			'Kleanthis Vikelidis',22800,1914,_country.greece,];
    map[_name.ofi] = [ClubColors(Colors.white,Colors.black),Coordinates(35.33687873134752, 25.106282),
			'Pankritio',26400,1925,_country.greece,];
    //CHIPRE
    map[_name.apoel] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(35.1145399234782, 33.3630869672),
			'GSP Stadium',22859,1926,_country.cyprus,];
    map[_name.omonia] = [ClubColors(Colors.green,Colors.white),Coordinates(35.1145, 33.3631),
			'GSP Stadium',22859,1948,_country.cyprus,];
    map[_name.apollon] = [ClubColors(Colors.white,Colors.blue),Coordinates(34.700914,33.022975),
			'Tsirion Stadium',13331,1954,_country.cyprus,];
    map[_name.aeklarnaca] = [ClubColors(Colors.yellow,Colors.green),Coordinates(37.946463, 23.664613),
			'Georgios Karapatis',13032,1994,_country.cyprus,];
    //ISRAEL
    map[_name.maccabiTelAviv] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(32.0517917, 34.761783),
			'Bloomfield Stadium',29400,1906,_country.israel,];
    map[_name.maccabiHaifa] = [ClubColors(Colors.green,Colors.black),Coordinates(32.7830479, 34.9658581),
			'Sammy Ofer',10000,1913,_country.israel,];
    map[_name.hapoelTelAviv] = [ClubColors(Colors.red,Colors.white),Coordinates(32.0518, 34.7618),
			'	Bloomfield Stadium',29400,1927,_country.israel,];

    //RUSSIA
    map[_name.akhmatGrozny] = [ClubColors(Colors.green,Colors.white),Coordinates(43.3244449, 45.6900699),
      'Sultan Bilimkhanov',10200,1958,_country.russia,];
    map[_name.anzhi] = [ClubColors(Colors.yellow,Colors.black),Coordinates(42.90790006811621, 47.618420756749),
			'Arena Anji',10000,1991,_country.russia,];
    map[_name.cska] = [ClubColors(Colors.red,Colors.blue),Coordinates(55.7921063937405, 37.51594608742029),
      'VEB Arena',30000,1911,_country.russia,];
    map[_name.dinamoMoscou] = [ClubColors(Colors.blue,Colors.white),Coordinates(55.7909515602138, 37.56105906),
      'Dinamo Lev Yashin Stadium',36000,1923,_country.russia,];
    map[_name.krasnodar] = [ClubColors(Colors.green,Colors.black),Coordinates(45.04504922699846, 39.029426495),
      'Estádio Krasnodar',35074,2008,_country.russia,];
    map[_name.krylyaSovetov] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.277987, 50.2374051),
      'Solidarnost Arena',44918,1942,_country.russia,];
    map[_name.lokomotivMoscou] = [ClubColors(Colors.green,Colors.red),Coordinates(55.80355,37.741169),
      'Estádio Lokomotiv de Moscou',28800,1922,_country.russia,];
    map[_name.nizhnyNovgorod] = [ClubColors(Colors.lightBlueAccent,Colors.blue),Coordinates(56.3374867, 43.963353),
      'Nizhny Novgorod Stadium',44900,2015,_country.russia,];
    map[_name.rostov] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(47.20833333,39.74166667),
      'Rostov Arena',45000,1930,_country.russia,];
    map[_name.rotor] = [ClubColors(Colors.blue,Colors.black),Coordinates(48.73463702, 44.54914292288772),
			'Volgograd Arena',45568,1929,_country.russia,];
    map[_name.rubinKazan] = [ClubColors(Colors.green,Colors.red),Coordinates(55.82109839, 49.161094869),
      'Arena Kazan',45379,1958,_country.russia,];
    map[_name.sochi] = [ClubColors(Colors.white,Colors.blue),Coordinates(43.401925, 39.9562793781204),
      'Fisht',47659,2018,_country.russia,];
    map[_name.spartakmoscou] = [ClubColors(Colors.red,Colors.white),Coordinates(55.8178315, 37.4406002),
      'Otkrytie Arena',44929,1922,_country.russia,];
    map[_name.torpedo] = [ClubColors(Colors.white,Colors.black),Coordinates(55.71643276656806, 37.65631509953),
			'Eduard Streltsov',13400,1930,_country.russia,];
    map[_name.tula] = [ClubColors(Colors.red,Colors.yellow),Coordinates(54.174818906120684, 37.60259093270525),
			'Arsenal Stadium',20048,1946,_country.russia,];
    map[_name.ural] = [ClubColors(Colors.orange,Colors.black),Coordinates(56.8325198, 60.573520),
      'Arena Ekaterinburg',35163,1930,_country.russia,];
    map[_name.vladikavkaz] = [ClubColors(Colors.red,Colors.yellow),Coordinates(43.0233065, 44.69528968),
			'Republican Spartak Stadium',32464,1921,_country.russia,];
    map[_name.zenit] = [ClubColors(Colors.blue,Colors.white),Coordinates(59.9728083770, 30.22200532914),
      'Gazprom Arena',69000,1925,_country.russia,];

    //UCRANIA
    map[_name.shaktardonetsk] = [ClubColors(Colors.orange,Colors.black),Coordinates(50.43354243340474, 30.522135),
			'Donbass Arena',52187,1936,_country.ukraine,[_name.dinamokiev]];
    map[_name.dinamokiev] = [ClubColors(Colors.blue,Colors.white),Coordinates(50.43343227559437, 30.52202498),
			'Olímpico de Kiev',70050,1927,_country.ukraine,[_name.shaktardonetsk]];
    map[_name.dnipro] = [ClubColors(Colors.blue,Colors.white),Coordinates(0,0),
			'Dnipro Arena',31003,1918,_country.ukraine,]; //FALIU
    map[_name.zorya] = [ClubColors(Colors.black,Colors.white),Coordinates(47.8595997162, 35.097371331),
			'Slavutych Arena',22888,1923,_country.ukraine,];
    map[_name.metalist] = [ClubColors(Colors.yellow,Colors.white),Coordinates(49.9810086546, 36.2617732),
			'OSC Metalist',40003,1925,_country.ukraine,];
    //EX-URSS
    map[_name.sheriffTiraspol] = [ClubColors(Colors.black,Colors.yellow),Coordinates(46.8383774, 29.558222),
			'Sheriff Stadium',12746,1997,_country.moldova,];
    map[_name.bate] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(54.192777777,28.475694444),
			'Borisov Arena',12900,1973,_country.belarus,];
    map[_name.dinamoBrest] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(52.089810, 23.68361232),
			'Sport Complex Brestskiy',10060,1960,_country.belarus,];
    map[_name.dinamoMinsk] = [ClubColors(Colors.blue,Colors.white),Coordinates(53.881454, 27.6175440),
			'Traktar Stadium',16500,1927,_country.belarus,];
    map[_name.qarabag] = [ClubColors(Colors.black,Colors.white),Coordinates(40.39740489689798, 49.852724642),
			'Estádio Tofig Bahramov',31200,1951,_country.azerbaijan,];
    map[_name.astana] = [ClubColors(Colors.white,Colors.blue),Coordinates(51.10838287814807, 71.4031747095404),
			'Astana Arena',30000,2009,_country.kazakhstan,];
    map[_name.kairat] = [ClubColors(Colors.yellow,Colors.black),Coordinates(43.238482, 76.92419294393495),
			'Central Stadium',23804,1954,_country.kazakhstan,];
    map[_name.tobol] = [ClubColors(Colors.yellow,Colors.green),Coordinates(53.2263205, 63.636574),
			'Tsentralny Kostanay',8323,1967,_country.kazakhstan,];
    map[_name.tbilisi] = [ClubColors(Colors.white,Colors.blue),Coordinates(41.72,44.78),
			'Tbilisi Sports Palace',53279,1925,_country.georgia,];
    map[_name.araratArmenia] = [ClubColors(Colors.white,Colors.black),Coordinates(40.1713237, 44.5255822),
			'Vazgen Sargsyan Republican',14530,2017,_country.armenia,];
    map[_name.yerevan] = [ClubColors(Colors.red,Colors.white),Coordinates(40.18052, 44.4948721),
			'Hrazdan Stadium',53849,1935,_country.armenia,];
    map[_name.alashkent] = [ClubColors(Colors.yellow,Colors.black),Coordinates(40.15448480125367, 44.47532),
			'Alashkert Stadium',22570,1921,_country.armenia,];
    map[_name.rigafc] = [ClubColors(Colors.green,Colors.greenAccent),Coordinates(56.961413, 24.116307963764125),
			'Skonto',9100,2014,_country.latvia,];
    map[_name.zalgiris] = [ClubColors(Colors.green,Colors.greenAccent),Coordinates(54.669264, 25.2951),
			'LFF Stadium',5400,1947,_country.lithuania,];
    map[_name.floratallinn] = [ClubColors(Colors.green,Colors.white),Coordinates(59.421331, 24.73216),
			'A. Le Coq Arena',10340,1990,_country.estonia,];

    //SERVIA
    map[_name.estrelavermelha] = [ClubColors(Colors.red,Colors.white),Coordinates(44.783172178, 20.465097812647),
			'Rajko Mitić',55538,1945,_country.serbia,[_name.partizan]];
    map[_name.partizan] = [ClubColors(Colors.black,Colors.white),Coordinates(44.78861754918, 20.45902153226),
			'Stadion Partizana',32710,1945,_country.serbia,[_name.estrelavermelha]];
    map[_name.vojvodina] = [ClubColors(Colors.red,Colors.white),Coordinates(45.246939989314725, 19.84175658419325),
			'Stadium of Vojvodina',15754,1914,_country.serbia,];
    //BULGARIA
    map[_name.ludogorets] = [ClubColors(Colors.green,Colors.black),Coordinates(43.534406185, 26.528121692),
			'	Ludogorets Arena',12500,1940,_country.bulgaria,];
    map[_name.cskaSofia] = [ClubColors(Colors.white,Colors.red),Coordinates(42.68425940789659, 23.339713929894728),
			'Balgarska Armiya Stadium',22015,1948,_country.bulgaria,];
    map[_name.lokplovdiv] = [ClubColors(Colors.red,Colors.black),Coordinates(42.1338578, 24.771618769013543),
			'Lokomotiv',11800,1926,_country.bulgaria,];
    map[_name.levski] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.bulgaria,];
    map[_name.loksofia] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.bulgaria,];
    //CROATIA
    map[_name.dinamozagreb] = [ClubColors(Colors.red,Colors.blue),Coordinates(45.81867321710, 16.0181650412),
			'Maksimir',38923,1911,_country.croatia,];
    map[_name.hadjuksplit] = [ClubColors(Colors.red,Colors.white),Coordinates(43.51984618230551, 16.432360984167556),
			'Polijud',35000,1911,_country.croatia,];
    map[_name.rijeka] = [ClubColors(Colors.blue,Colors.white),Coordinates(45.347946972, 14.4026226413),
			'Kantrida',12600,1906,_country.croatia,];
    //REP. TCHECA
    map[_name.spartapraga] = [ClubColors(grena,Colors.white),Coordinates(50.099954027154006, 14.416325802977713),
			'Generali Arena',20111,1893,_country.czechRepublic,[_name.slaviaPraha]];
    map[_name.slaviaPraha] = [ClubColors(Colors.red,Colors.white),Coordinates(50.06761576190498, 14.471716155477006),
			'Stadion Eden',21000,1892,_country.czechRepublic,[_name.spartapraga]];
    map[_name.banikostrava] = [ClubColors(Colors.blue,Colors.white),Coordinates(49.8453373, 18.29918785113781),
			'Bazaly',17400,1922,_country.czechRepublic,];
    map[_name.bohemians] = [ClubColors(Colors.green,Colors.white),Coordinates(50.067005, 14.454192422766054),
			'Ďolíček',5000,1905,_country.czechRepublic,];
    map[_name.brno] = [ClubColors(Colors.red,Colors.white),Coordinates(49.22719586396984, 16.586590266614262),
			'Městský fotbalový Stadion Srbská',12550,1913,_country.czechRepublic,];
    map[_name.viktoriaPlzen] = [ClubColors(Colors.red,Colors.blue),Coordinates(49.75007167479573, 13.385528253448518),
			'Doosan Arena',12500,1911,_country.czechRepublic,];
    //HUNGRIA
    map[_name.debreceni] = [ClubColors(Colors.red,Colors.white),Coordinates(47.55435955, 21.63374620),
			'Nagyerdei Stadion',20020,1902,_country.hungary,];
    map[_name.ferencvaros] = [ClubColors(Colors.green,Colors.white),Coordinates(47.475396323123604, 19.0958287905669),
			'Gouprama Arena',22000,1899,_country.hungary,];
    map[_name.gyori] = [ClubColors(Colors.green,Colors.white),Coordinates(47.69580, 17.663847462),
			'ETO Park',16000,1904,_country.hungary,];
    map[_name.honved] = [ClubColors(Colors.red,Colors.black),Coordinates(47.442567, 19.1553822),
			'József Bozsik',15000,1909,_country.hungary,];
    map[_name.mtk] = [ClubColors(Colors.blue,Colors.white),Coordinates(47.490919444,19.106725),
			'Hidegkuti Nándor Stadion',12700,1888,_country.hungary,];
    map[_name.ujpest] = [ClubColors(Colors.purple,Colors.white),Coordinates(47.5750, 19.085368),
			'Ferenc Szusza',13600,1885,_country.hungary,];
    map[_name.puskas] = [ClubColors(darkblue,Colors.yellow),Coordinates(47.4640167, 18.586763),
			'Pancho Aréna',3816,2005,_country.hungary,];
    map[_name.vasas] = [ClubColors(Colors.red,Colors.blue),Coordinates(47.537036, 19.080578381),
			'Rudolf Illovszky',18000,1911,_country.hungary,];
    //ROMENIA
    map[_name.steauaBucureste] = [ClubColors(Colors.red,Colors.blue),Coordinates(44.43741937450663, 26.153142180019834),
			'Arena Națională',55634,1947,_country.romania,];
    map[_name.dinamoBucureste] = [ClubColors(Colors.red,Colors.white),Coordinates(44.455083,26.102444),
			'Stadionul Dinamo',15300,1948,_country.romania,];
    map[_name.rapidBucureste] = [ClubColors(grena,Colors.white),Coordinates(44.45708788751633, 26.055645172166557),
			'Estádio Giulești-Valentin Stănescu',19100,1929,_country.romania,];
    map[_name.pitesti] = [ClubColors(Colors.purple,Colors.white),Coordinates(44.8466756, 24.866616),
			'Stadionul Nicolae Dobrin',15000,1953,_country.romania,];
    map[_name.cluj] = [ClubColors(Colors.red,Colors.white),Coordinates(46.779678,23.577247),
			'Stadionul Dr. Constantin Rădulescu',21000,1907,_country.romania,];
    map[_name.craiova] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.romania,];
    //ESLOVAQUIA
    map[_name.slovanBratislava] = [ClubColors(Colors.blue,Colors.white),Coordinates(48.16596266838141, 17.142208986599012),
			'Pasienky',30085,1919,_country.slovakia,];
    map[_name.interBratislava] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.slovakia,];
    map[_name.trnava] = [ClubColors(Colors.red,Colors.black),Coordinates(48.3736672524, 17.5916824784249),
			'Štadión Antona Malatinského',18448,1923,_country.slovakia,];
    //OUTROS
    map[_name.tiranafk] = [ClubColors(Colors.blue,Colors.white),Coordinates(41.319399423347576, 19.811329867125156),
			'Selman Stermasi Stadium',7000,1920,_country.albania,];
    map[_name.maribor] = [ClubColors(Colors.purple,Colors.yellow),Coordinates(46.5625,15.640556),
			'Ljudski vrt',12702,1960,_country.slovenia,];
    map[_name.vardar] = [ClubColors(Colors.red,Colors.black),Coordinates(42.00609543518768, 21.42580392778437),
			'Nacional Arena Philip II Macedônia',24000,1947,_country.macedonia,];
    map[_name.sarajevo] = [ClubColors(grena,Colors.white),Coordinates(43.873918631077544, 18.40907842205062),
			'Estádio Asim Ferhatović Hase',35630,1946,_country.bosnia,];
    map[_name.zrinjski] = [ClubColors(Colors.white,darkblue),Coordinates(43.34565408295433, 17.79541801458307),
			'Bijeli Brijeg Stadium',25000,1905,_country.bosnia,];
    map[_name.podgorica] = [ClubColors(Colors.blue,Colors.white),Coordinates(42.44493750109364, 19.26417934262946),
			'Podgorica City Stadium',12000,1925,_country.montenegro,];
    map[_name.tiranafk] = [ClubColors(Colors.blue,Colors.white),Coordinates(41.319020740064545, 19.811694611424013),
			'Selman Stermasi Stadium',7000,1920,_country.albania,];
    map[_name.dudelange] = [ClubColors(Colors.yellow,Colors.white),Coordinates(49.47303716840933, 6.085128060337294),
			'Jos Nosbaum',2558,1921,_country.luxembourg,];
    map[_name.jeunesseesch] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.luxembourg,];
    map[_name.vaduz] = [ClubColors(Colors.red,Colors.white),Coordinates(47.14046983094139, 9.510560348343917),
			'Rheinpark Stadion',7838,1932,_country.liechtenstein,];
    map[_name.sliema] = [ClubColors(Colors.blueAccent,Colors.blue),Coordinates(35.89488, 14.415361),
			'Estádio Ta\' Qali',18000,1909,_country.malta,];
    map[_name.valletta] = [ClubColors(Colors.white,grena),Coordinates(35.8950, 14.414893),
			'Estádio Ta\' Qali',18000,1943,_country.malta,];
    map[_name.lafiorita] = [ClubColors(darkblue,Colors.yellow),Coordinates(43.91492856, 12.48212),
			'Estádio Igor Crescentini',4000,1967,_country.sanMarino,];
    map[_name.europa] = [ClubColors(Colors.black,Colors.green),Coordinates(36.14918889073762, -5.3500741),
			'Victoria Stadium',2000,1925,_country.gibraltar,];


    ///////////////////////////////////////////////////////////////////////////
    map[_name.atleticomg] = [ClubColors(Colors.black,Colors.white),Coordinates(-19.86583,-43.97080),
			'Mineirão',61927,1900,_country.brazil,[_name.cruzeiro]];
    map[_name.atleticopr] = [ClubColors(Colors.black,Colors.red),Coordinates(-25.448333,-49.276944),
			'Arena da Baixada',42372,1924,_country.brazil,[_name.coritiba]];
    map[_name.bahia] = [ClubColors(Colors.blue,Colors.red),Coordinates(-12.978819444,-38.504252777),
			'Arena Fonte Nova',50025,1931,_country.brazil,[_name.vitoria,_name.sport]];
    map[_name.botafogo] = [ClubColors(Colors.black,Colors.white),Coordinates(-22.893172,-43.292269),
			'Nilton Santos',46831,1904,_country.brazil,[_name.flamengo,_name.vasco,_name.fluminense]];
    map[_name.corinthians] = [ClubColors(Colors.white,Colors.black),Coordinates(-23.545555555,-46.474),
			'Neo Química Arena',47605,1910,_country.brazil,[_name.palmeiras,_name.saopaulo,_name.santos]];
    map[_name.cruzeiro] = [ClubColors(Colors.blue,Colors.white),Coordinates(-19.865833,-43.970833),
			'Mineirão',61927,1921,_country.brazil,[_name.atleticomg]];
    map[_name.flamengo] = [ClubColors(Colors.red,Colors.black),Coordinates(-22.9113573571550, -43.2301129345785),
			'Maracanã',78838,1895,_country.brazil,[_name.botafogo,_name.vasco,_name.fluminense]];
    map[_name.fluminense] = [ClubColors(Colors.red,Colors.green),Coordinates(-22.91135735715502, -43.23011293457856),
			'Maracanã',78838,1902,_country.brazil,[_name.flamengo,_name.vasco,_name.botafogo]];
    map[_name.gremio] = [ClubColors(Colors.blue,Colors.black),Coordinates(-29.9728841319055, -51.1949268115477),
			'Arena do Grêmio',55662,1903,_country.brazil,[_name.internacional]];
    map[_name.goias] = [ClubColors(Colors.green,Colors.white),Coordinates(-16.698889,-49.233889),
			'Serrinha',16500,1943,_country.brazil,[_name.atleticogo,_name.vilanova]];
    map[_name.internacional] = [ClubColors(Colors.red,Colors.white),Coordinates(-30.064854769002213, -51.23598880116036),
			'Beira-Rio',50128,1909,_country.brazil,[_name.gremio]];
    map[_name.palmeiras] = [ClubColors(Colors.green,Colors.white),Coordinates(-23.52744641540078, -46.6784),
			'Allianz Parque',43713,1914,_country.brazil,[_name.saopaulo,_name.corinthians,_name.santos]];
    map[_name.santos] = [ClubColors(Colors.white,Colors.black),Coordinates(-23.950216, -46.3388120),
			'Vila Belmiro',17923,1912,_country.brazil,[_name.palmeiras,_name.corinthians,_name.saopaulo]];
    map[_name.saopaulo] = [ClubColors(Colors.red,Colors.black),Coordinates(-23.600125,-46.720155555),
			'Morumbi',66795,1930,_country.brazil,[_name.palmeiras,_name.corinthians,_name.santos]];
    map[_name.sport] = [ClubColors(Colors.red,Colors.white),Coordinates(-8.062888888,-34.902888888),
			'Ilha do Retiro',26418,1905,_country.brazil,[_name.nautico,_name.santacruz,_name.bahia]];
    map[_name.vasco] = [ClubColors(Colors.black,Colors.white),Coordinates(-22.890916666,-43.228252777),
			'São Januário',21880,1898,_country.brazil,[_name.flamengo,_name.fluminense,_name.botafogo]];

    map[_name.americamg] = [ClubColors(Colors.green,Colors.black),Coordinates(-19.9074787, -43.91821561),
			'Independência',23018,1912,_country.brazil,[_name.atleticomg,_name.cruzeiro]];
    map[_name.atleticogo] = [ClubColors(Colors.red,Colors.black),Coordinates(-16.653152, -49.284273482),
			'Antônio Accioly',12500,1937,_country.brazil,[_name.goias,_name.vilanova]];
    map[_name.cuiaba] = [ClubColors(Colors.green,Colors.yellow),Coordinates(-15.601869306435242, -56.1213671502529),
			'Arena Pantanal',44097,2001,_country.brazil,];
    map[_name.chapecoense] = [ClubColors(Colors.red,Colors.white),Coordinates(-27.10339550171507, -52.6068313331485),
			'Arena Condá',22600,1973,_country.brazil,];
    map[_name.bragantino] = [ClubColors(Colors.white,Colors.red),Coordinates(-22.965414,-46.536936),
			'Nabi Abi Chedid',12332,1928,_country.brazil,];
    map[_name.ceara] = [ClubColors(Colors.black,Colors.white),Coordinates(-3.8075,-38.5225),
			'Castelão',63904,1900,_country.brazil,[_name.fortaleza]];
    map[_name.coritiba] = [ClubColors(Colors.green,Colors.white),Coordinates(-25.421111,-49.2595),
			'Couto Pereira',40502,1909,_country.brazil,[_name.atleticopr]];
    map[_name.criciuma] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-28.684329, -49.36763),
			'Heriberto Hülse',19300,1947,_country.brazil,];
    map[_name.figueirense] = [ClubColors(Colors.black,Colors.white),Coordinates(-27.585556,-48.586667),
			'Orlando Scarpelli',19584,1921,_country.brazil,];
    map[_name.fortaleza] = [ClubColors(Colors.red,Colors.blue),Coordinates(-3.807,-38.522),
			'Castelão',63904,1918,_country.brazil,[_name.ceara]];
    map[_name.guarani] = [ClubColors(Colors.green,Colors.white),Coordinates(-22.909782888371286, -47.04375492124552),
			'Brinco de Ouro',29130,1911,_country.brazil,[_name.pontepreta]];
    map[_name.juventude] = [ClubColors(Colors.green,Colors.white),Coordinates(-29.162,-51.176),
			'Alfredo Jaconi',19924,1913,_country.brazil,];
    map[_name.nautico] = [ClubColors(Colors.red,Colors.white),Coordinates(-8.040533, -34.89678093),
			'Aflitos',22856,1901,_country.brazil,[_name.sport,_name.santacruz]];
    map[_name.parana] = [ClubColors(Colors.blue,Colors.red),Coordinates(-25.436122, -49.25595888),
			'Durival Britto',17140,1989,_country.brazil,[_name.coritiba,_name.atleticopr]];
    map[_name.pontepreta] = [ClubColors(Colors.white,Colors.black),Coordinates(-22.913611,-47.051389),
			'Moisés Lucarelli',17728,1900,_country.brazil,[_name.guarani]];
    map[_name.vitoria] = [ClubColors(Colors.red,Colors.black),Coordinates(-12.918502207380078, -38.42813070528619),
			'Barradão',30618,1899,_country.brazil,[_name.bahia]];

    map[_name.abc] = [ClubColors(Colors.white,Colors.black),Coordinates(-5.8884053612844065, -35.17937587272757),
			'Frasqueirão',18000,1915,_country.brazil,];
    map[_name.aguiamaraba] = [ClubColors(Colors.blue,Colors.white),Coordinates(-5.3520618, -49.13832461568409),
			'Zinho de Oliveira',4500,1982,_country.brazil,];
    map[_name.avai] = [ClubColors(Colors.blue,Colors.white),Coordinates(-27.665782676996276, -48.53165186257218),
			'Ressacada',17800,1923,_country.brazil,];
    map[_name.bangu] = [ClubColors(Colors.red,Colors.white),Coordinates(-22.87190639603716, -43.45643927718756),
			'Moça Bonita',9500,1904,_country.brazil,];
    map[_name.americaRJ] = [ClubColors(Colors.red,Colors.white),Coordinates(-22.7953107, -43.41957718),
			'Estádio',10000,1900,_country.brazil,];
    map[_name.americaRN] = [ClubColors(Colors.red,Colors.white),Coordinates(-5.93371016, -35.28271557468),
			'Arena América',5000,1915,_country.brazil,];
    map[_name.anapolina] = [ClubColors(Colors.white,Colors.red),Coordinates(-16.345930, -48.95587463),
			'Jonas Duarte',20000,1948,_country.brazil,];
    map[_name.aparecidense] = [ClubColors(darkblue,Colors.white),Coordinates(-16.81970, -49.245532),
			'Anníbal Batista de Toledo',5000,1985,_country.brazil,];
    map[_name.azuriz] = [ClubColors(darkblue,Colors.white),Coordinates(-26.2110895, -52.679588977107606),
			'Os Pioneiros',8000,2018,_country.brazil,];
    map[_name.bahiafeira] = [ClubColors(Colors.white,Colors.blue),Coordinates(-12.27632, -38.93577856),
			'Arena Cajueiro',7000,1937,_country.brazil,];
    map[_name.botafogoPB] = [ClubColors(Colors.red,Colors.black),Coordinates(-7.1668181, -34.873362768),
			'Almeidão',19000,1931,_country.brazil,];
    map[_name.botafogoSP] = [ClubColors(Colors.white,Colors.red),Coordinates(-21.201866, -47.78959753222946),
			'Estádio Santa Cruz',22292,1918,_country.brazil,];
    map[_name.brasilia] = [ClubColors(Colors.red,Colors.white),Coordinates(-15.78318347, -47.899305072763255),
			'Mané Garrincha',69349,1975,_country.brazil,];
    map[_name.brasiliense] = [ClubColors(Colors.yellow,Colors.white),Coordinates(-15.835889, -48.0801529),
			'Boca do Jacaré',27000,2000,_country.brazil,[_name.gama]];
    map[_name.brasilPelotas] = [ClubColors(Colors.red,Colors.black),Coordinates(-31.7712377, -52.332841550319394),
			'Bento Freitas',10200,1911,_country.brazil,];
    map[_name.brusque] = [ClubColors(Colors.yellow,Colors.red),Coordinates(-27.101266959635133, -48.91631895977114),
			'Augusto Bauer',5000,1987,_country.brazil,];
    map[_name.campinense] = [ClubColors(Colors.red,Colors.black),Coordinates(-7.253667571882561, -35.88033665180688),
			'O Amigão',25770,1915,_country.brazil,];
    map[_name.cascavel] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-24.9750456, -53.502418),
			'Olímpico Regional',28125,2008,_country.brazil,];
    map[_name.central] = [ClubColors(Colors.white,Colors.black),Coordinates(-8.2785053, -35.972948033),
			'Lacerdão',20000,1919,_country.brazil,];
    map[_name.cianorte] = [ClubColors(Colors.white,Colors.black),Coordinates(-23.661389780691362, -52.5938666182443),
			'Albino Turbay',4000,1993,_country.brazil,];
    map[_name.comercial] = [ClubColors(Colors.white,Colors.black),Coordinates(-21.186531211629447, -47.788333),
			'Estádio Palma Travassos',18277,1911,_country.brazil,];
    map[_name.confianca] = [ClubColors(Colors.blue,Colors.white),Coordinates(-10.894497556729105, -37.0538261),
			'Sabino Ribeiro',3000,1936,_country.brazil,];
    map[_name.caxias] = [ClubColors(Colors.red,Colors.blue),Coordinates(-29.164952005642775, -51.1964163918332),
			'Centenário',30000,1935,_country.brazil,];
    map[_name.crb] = [ClubColors(Colors.red,Colors.white),Coordinates(-9.670544324598046, -35.75930852597539),
			'Rei Pelé',17126,1912,_country.brazil,[_name.csa]];
    map[_name.csa] = [ClubColors(Colors.blue,Colors.white),Coordinates(-9.6705, -35.7593),
			'Rei Pelé',17126,1913,_country.brazil,[_name.crb]];
    map[_name.duque] = [ClubColors(Colors.orange,Colors.blue),Coordinates(-22.5854488,-43.305297),
			'Marrentão',3334,2005,_country.brazil,];
    map[_name.gremioNovorizontino] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-21.466885, -49.231995),
			'Estádio Jorge Ismael de Biasi',18000,1973,_country.brazil,];
    map[_name.ferroviaria] = [ClubColors(grena,Colors.black),Coordinates(-21.7750702, -48.17012629935174),
			'Fonte Luminosa',20000,1950,_country.brazil,];
    map[_name.gama] = [ClubColors(grena,Colors.white),Coordinates(-16.011271959253445, -48.06133544635439),
			'Bezerrão',20310,1975,_country.brazil,[_name.brasiliense]];
    map[_name.globo] = [ClubColors(Colors.white,Colors.black),Coordinates(-5.6489411, -35.4600464007721),
			'Barretão',10000,2012,_country.brazil,];
    map[_name.goytacaz] = [ClubColors(Colors.blue,Colors.white),Coordinates(-21.762024027957615, -41.31634627219756),
			'Ary de Oliveira e Souza',15000,1912,_country.brazil,];
    map[_name.ibis] = [ClubColors(Colors.red,Colors.black),Coordinates(-7.963256319054288, -34.84071130116947),
			'Ademir Cunha',10000,1938,_country.brazil,];
    map[_name.icasa] = [ClubColors(Colors.green,Colors.white),Coordinates(-7.22376, -39.317673),
			'Arena Romeirão',17000,2002,_country.brazil,];
    map[_name.interLimeira] = [ClubColors(Colors.white,Colors.black),Coordinates(-22.555294,-47.385042),
			'Major José Levy Sobrinho',27000,1913,_country.brazil,];
    map[_name.ipatinga] = [ClubColors(Colors.green,Colors.red),Coordinates(-19.470869944552266, -42.541159015158286),
			'Ipatingão',22000,1998,_country.brazil,];
    map[_name.ituano] = [ClubColors(Colors.red,Colors.black),Coordinates(-23.28033689912053, -47.287407673976766),
			'Novelli Júnior',16749,1947,_country.brazil,];
    map[_name.joinville] = [ClubColors(Colors.red,Colors.black),Coordinates(-26.31645224180872, -48.83343633827322),
			'Arena Joinville',22100,1976,_country.brazil,];
    map[_name.juventusMooca] = [ClubColors(grena,Colors.white),Coordinates(-23.553105198898812, -46.60451047969702),
			'Estádio Conde Rodolfo Crespi',5000,1924,_country.brazil,];
    map[_name.linense] = [ClubColors(Colors.red,Colors.white),Coordinates(-21.66650190477, -49.76321881819613),
			'Gilbertão',15770,1927,_country.brazil,];
    map[_name.londrina] = [ClubColors(Colors.blue,Colors.white),Coordinates(-23.282222,-51.165),
			'Estádio do Café',36000,1956,_country.brazil,];
    map[_name.luverdense] = [ClubColors(Colors.green,Colors.white),Coordinates(-13.074398270380579, -55.92376224621404),
			'Passo das Emas',10000,2004,_country.brazil,[_name.cuiaba]];
    map[_name.macae] = [ClubColors(Colors.white,Colors.blue),Coordinates(-22.3563513, -41.77086),
			'Moacyrzão',15000,1990,_country.brazil,];
    map[_name.madureira] = [ClubColors(Colors.purple,Colors.yellow),Coordinates(-22.869530143179063, -43.33703542589112),
			'Conselheiro Galvão',5014,1914,_country.brazil,];
    map[_name.manaus] = [ClubColors(Colors.green,Colors.black),Coordinates(-3.082731444136859, -60.02706630528541),
			'Arena da Amazônia',44000,2013,_country.brazil,];
    map[_name.marilia] = [ClubColors(Colors.white,Colors.blue),Coordinates(-22.21940335788294, -49.93949715059811),
			'Bento de Abreu',19800,1942,_country.brazil,];
    map[_name.mirassol] = [ClubColors(Colors.yellow,Colors.green),Coordinates(-20.821404501, -49.5065208),
			'	José Maria de Campos Maia',15000,1925,_country.brazil,];
    map[_name.mixto] = [ClubColors(Colors.white,Colors.black),Coordinates(-15.60386, -56.1210),
			'Arena Pantanal',44097,1934,_country.brazil,[_name.luverdense,_name.cuiaba]];
    map[_name.mogimirim] = [ClubColors(Colors.red,Colors.white),Coordinates(-22.43926392586487, -46.96171671069935),
			'Estádio Vail Chaves',19900,1932,_country.brazil,];
    map[_name.motoclub] = [ClubColors(Colors.red,Colors.black),Coordinates(-2.5483, -44.2600),
			'Castelão',40149,1937,_country.brazil,];
    map[_name.nacionalSP] = [ClubColors(Colors.blue,Colors.white),Coordinates(-23.51803349479412, -46.68519718429398),
			'	Nicolau Alayon',10723,1919,_country.brazil,];
    map[_name.noroeste] = [ClubColors(Colors.red,Colors.white),Coordinates(-22.3242, -49.09748),
			'Alfredo de Castilho',18866,1910,_country.brazil,];
    map[_name.novaiguacu] = [ClubColors(Colors.orange,Colors.black),Coordinates(-22.747857063112367, -43.46085192892773),
			'Jânio Moraes',4700,1990,_country.brazil,];
    map[_name.oeste] = [ClubColors(Colors.red,Colors.black),Coordinates(-23.512235751662757, -46.89928345373255),
			'Arena Barueri',31452,1921,_country.brazil,];
    map[_name.operarioms] = [ClubColors(Colors.white,Colors.black),Coordinates(-20.50119164, -54.610060),
			'Morenão',16000,1938,_country.brazil,];
    map[_name.operarioPR] = [ClubColors(Colors.black,Colors.white),Coordinates(-25.115991, -50.156180),
			'Germano Krüger',10632,1912,_country.brazil,];
    map[_name.palmas] = [ClubColors(Colors.white,Colors.blue),Coordinates(-10.2822114, -48.330556),
			'Nilton Santos',12000,1997,_country.brazil,];
    map[_name.paysandu] = [ClubColors(Colors.blue,Colors.white),Coordinates(-1.381095, -48.44458),
			'Mangueirão',35000,1914,_country.brazil,[_name.remo]];
    map[_name.paulista] = [ClubColors(Colors.black,Colors.white),Coordinates(-23.188026412832695, -46.85975253029435),
			'Jayme Cintra',10210,1909,_country.brazil,];
    map[_name.portuguesa] = [ClubColors(Colors.red,Colors.green),Coordinates(-23.520556,-46.618333),
			'Canindé',21004,1920,_country.brazil,];
    map[_name.remo] = [ClubColors(Colors.blue,Colors.white),Coordinates(-1.3811, -48.4447),
			'Mangueirão',35000,1905,_country.brazil,[_name.paysandu]];
    map[_name.riverPI] = [ClubColors(Colors.red,Colors.black),Coordinates(-5.116047825, -42.792511),
			'Albertão',52216,1946,_country.brazil,];
    map[_name.riobrancoAC] = [ClubColors(Colors.red,Colors.white),Coordinates(-9.9703778500, -67.80798345),
			'José de Melo',6000,1919,_country.brazil,];
    map[_name.rioclaro] = [ClubColors(Colors.blue,Colors.white),Coordinates(-22.4223454, -47.561880265634095),
			'Schmidtão',8284,1909,_country.brazil,];
    map[_name.riopreto] = [ClubColors(Colors.green,Colors.white),Coordinates(-20.83460, -49.4012242),
			'Anísio Haddad',14126,1919,_country.brazil,];
    map[_name.salgueiro] = [ClubColors(Colors.green,Colors.red),Coordinates(-8.0758843, -39.1194243),
			'Cornélio de Barros',12070,1972,_country.brazil,];
    map[_name.santacruz] = [ClubColors(Colors.red,Colors.white),Coordinates(-8.026711,-34.891175),
			'Arruda',60044,1914,_country.brazil,];
    map[_name.sampaio] = [ClubColors(Colors.yellow,Colors.red),Coordinates(-2.54823, -44.2599829),
			'Castelão',40149,1923,_country.brazil,];
    map[_name.santoandre] = [ClubColors(Colors.white,Colors.blue),Coordinates(-23.669687, -46.50901102),
			'Estádio Bruno José Daniel',12000,1967,_country.brazil,[_name.saocaetano]];
    map[_name.saobernardo] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-23.69973793957682, -46.55637005091989),
			'Primeiro de Maio',15159,2004,_country.brazil,];
    map[_name.saobento] = [ClubColors(Colors.white,Colors.blue),Coordinates(-23.4902975, -47.44815),
			'Estádio Walter Ribeiro',13772,1913,_country.brazil,];
    map[_name.saocaetano] = [ClubColors(Colors.blue,Colors.red),Coordinates(-23.630661, -46.560448),
			'Anacleto Campanella',16744,1989,_country.brazil,[_name.santoandre]];
    map[_name.saojose] = [ClubColors(Colors.white,Colors.blue),Coordinates(-23.1884290, -45.869829616250954),
			'Martins Pereira',15317,1933,_country.brazil,];
    map[_name.saojoseRS] = [ClubColors(Colors.blue,Colors.white),Coordinates(-30.006611, -51.173485531),
			'Passo D\'Areia',13000,1913,_country.brazil,];
    map[_name.saoraimundo] = [ClubColors(Colors.blue,Colors.white),Coordinates(-3.1215126, -60.037779),
			'Ismael Benigno',10000,1918,_country.brazil,];
    map[_name.sergipe] = [ClubColors(Colors.red,Colors.white),Coordinates(-10.92337996, -37.07210),
			'João Hora',6000,1909,_country.brazil,];
    map[_name.taubate] = [ClubColors(Colors.blue,Colors.white),Coordinates(-23.02785043474264, -45.57043134913763),
			'Joaquinzão',10000,1914,_country.brazil,];
    map[_name.tombense] = [ClubColors(Colors.red,Colors.white),Coordinates(-20.907664681440735, -42.030541527276654),
			'Antônio Guimarães de Almeida',3050,1914,_country.brazil,];
    map[_name.treze] = [ClubColors(Colors.white,Colors.black),Coordinates(-7.25430, -35.88053),
			'O Amigão',25770,1925,_country.brazil,];
    map[_name.tunaluso] = [ClubColors(Colors.red,Colors.green),Coordinates(-1.381, -48.445),
			'Mangueirão',35000,1903,_country.brazil,];
    map[_name.tupi] = [ClubColors(Colors.white,Colors.black),Coordinates(-21.787432790, -43.37794),
			'Mário Helênio',31863,1912,_country.brazil,];
    map[_name.uberlandia] = [ClubColors(Colors.green,Colors.white),Coordinates(-18.91340764, -48.2329414),
			'Parque do Sabiá',53350,1922,_country.brazil,];
    map[_name.vilanova] = [ClubColors(Colors.red,Colors.white),Coordinates(-16.673543, -49.236922),
			'Onésio Brasileiro Alvarenga',11788,1943,_country.brazil,];
    map[_name.voltaredonda] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-22.5082739, -44.096673),
			'Raulino de Oliveira',20255,1976,_country.brazil,];
    map[_name.xvpiracicaba] = [ClubColors(Colors.black,Colors.white),Coordinates(-22.7294362, -47.636847),
			'Barão de Serra Negra',18000,1913,_country.brazil,];
    map[_name.xvjau] = [ClubColors(Colors.green,Colors.yellow),Coordinates(-22.296089, -48.57224110487209),
			'Zezinho Magalhães',12978,1924,_country.brazil,];
    map[_name.ypirangaRS] = [ClubColors(Colors.yellow,Colors.green),Coordinates(-27.651311469047517, -52.26477924363159),
			'Colosso da Lagoa',22000,1924,_country.brazil,];


    ///////////////////////////////////////////////
    map[_name.aldosivi] = [ClubColors(Colors.green,Colors.yellow),Coordinates(-38.017726, -57.58193651284531),
			'José María Minella',35180,1913,_country.argentina,];
    map[_name.almagro] = [ClubColors(Colors.blue,Colors.black),Coordinates(-34.6140369, -58.5347054),
			'Tres de Febrero',19000,1911,_country.argentina,];
    map[_name.allboys] = [ClubColors(Colors.white,Colors.black),Coordinates(-34.6167200, -58.497540),
			'Islas Malvinas',21500,1913,_country.argentina,];
    map[_name.atleticoTucuman] = [ClubColors(Colors.blue,Colors.white),Coordinates(-26.812609554677092, -65.19878529580551),
			'Monumental José Fierro',35200,1902,_country.argentina,];
    map[_name.argentinojuniors] = [ClubColors(Colors.blue,Colors.red),Coordinates(-34.60592050835537, -58.4726517743551),
			'Diego Armando Maradona',25500,1904,_country.argentina,];
    map[_name.arsenalsarandi] = [ClubColors(Colors.blue,Colors.red),Coordinates(-34.67823093363552, -58.340308498270524),
			'Julio Humberto Grondona',18500,1957,_country.argentina,];
    map[_name.banfield] = [ClubColors(Colors.green,Colors.white),Coordinates(-34.75065029880952, -58.38785437115337),
			'Florencio Sola',34901,1896,_country.argentina,];
    map[_name.belgrano] = [ClubColors(Colors.blue,Colors.white),Coordinates(-31.403243615622532, -64.20642507795876),
			'Gigante de Alberdi',30000,1905,_country.argentina,];
    map[_name.bocajuniors] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(-34.63501001681254, -58.364928027094074),
			'La Bombonera',54000,1905,_country.argentina,[_name.riverplate]];
    map[_name.centralCordoba] = [ClubColors(Colors.grey,Colors.white),Coordinates(-27.765766, -64.26963233),
			'Único Madre de Ciudades',30000,1919,_country.argentina,];
    map[_name.chacarita] = [ClubColors(Colors.red,Colors.black),Coordinates(-34.567153366922206, -58.52778112220671),
			'Chacarita Juniors',10000,1906,_country.argentina,];
    map[_name.colon] = [ClubColors(Colors.red,Colors.black),Coordinates(-31.6625043280773, -60.724948091532866),
			'Brigadier General Estanislao López',40000,1905,_country.argentina,];
    map[_name.defensayjusticia] = [ClubColors(Colors.yellow,Colors.green),Coordinates(-34.82126662233948, -58.285822549406866),
			'Norberto "Tito" Tomaghello',18000,1935,_country.argentina,];
    map[_name.estudiantes] = [ClubColors(Colors.red,Colors.white),Coordinates(-34.91120720062634, -57.938757391444),
			'Jorge Luis Hirschi',30018,1905,_country.argentina,];
    map[_name.ferro] = [ClubColors(Colors.green,Colors.black),Coordinates(-34.61878249778913, -58.44715548984141),
			'Arquitecto Ricardo Etcheverri',29442,1904,_country.argentina,];
    map[_name.gimnasia] = [ClubColors(Colors.white,Colors.blue),Coordinates(-34.910828981858955, -57.93195896309595),
			'Juan Carmelo Zerillo',33000,1887,_country.argentina,];
    map[_name.godoycruz] = [ClubColors(Colors.blue,Colors.white),Coordinates(-32.88943892508501, -68.87974155370524),
			'Feliciano Gambarte',18000,1921,_country.argentina,];
    map[_name.huracan] = [ClubColors(Colors.red,Colors.white),Coordinates(-34.64277754540345, -58.396480365860974),
			'Tómas Adolfo Ducó',48314,1908,_country.argentina,];
    map[_name.independiente] = [ClubColors(Colors.red,Colors.white),Coordinates(-34.66979551648946, -58.371126168262506),
			'Libertadores de América',52360,1905,_country.argentina,[_name.racing]];
    map[_name.lanus] = [ClubColors(grena,Colors.white),Coordinates(-34.71693165712151, -58.383954833534666),
			'Ciudad de Lanús',47027,1915,_country.argentina,];
    map[_name.newells] = [ClubColors(Colors.red,Colors.black),Coordinates(-32.955315685463, -60.66129987605039),
			'Marcelo Bielsa',42000,1903,_country.argentina,[_name.rosariocentral]];
    map[_name.nuevachicago] = [ClubColors(Colors.green,Colors.black),Coordinates(-34.6678528205071, -58.499831612690606),
			'República de Mataderos',29000,1911,_country.argentina,];
    map[_name.patronato] = [ClubColors(Colors.red,Colors.black),Coordinates(-31.742991743434416, -60.508766064362696),
			'Presbítero Bartolomé Grella',22000,1914,_country.argentina,];
    map[_name.platense] = [ClubColors(Colors.grey,Colors.black),Coordinates(-34.54007017979063, -58.481458313671105),
			'Ciudad de Vicente López',34500,1905,_country.argentina,];
    map[_name.quilmes] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.740845302117364, -58.25159329432147),
			'Centenário',30200,1887,_country.argentina,];
    map[_name.racing] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.6675,-58.368611),
			'Presidente Perón',51389,1903,_country.argentina,[_name.independiente]];
    map[_name.riverplate] = [ClubColors(Colors.white,Colors.red),Coordinates(-34.54518243289981, -58.44934574907407),
			'Monumental de Núñez',70074,1901,_country.argentina,[_name.bocajuniors]];
    map[_name.rosariocentral] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(-32.91389523596278, -60.674474804512656),
			'Gigante de Arroyito',41654,1889,_country.argentina,[_name.newells]];
    map[_name.sanlorenzo] = [ClubColors(Colors.red,Colors.blue),Coordinates(-34.65058641613853, -58.4400964648805),
			'El Nuevo Gasómetro',47964,1908,_country.argentina,];
    map[_name.sanmartin] = [ClubColors(Colors.green,Colors.black),Coordinates(-31.611908, -68.52756178801768),
			'Estádio del Bicentenario',25286,1907,_country.argentina,];
    map[_name.talleres] = [ClubColors(Colors.blue,Colors.white),Coordinates(-31.367984088, -64.2448256165),
			'	Mario Alberto Kempes',57000,1913,_country.argentina,];
    map[_name.temperley] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.781713646559886, -58.40013736375882),
			'Alfredo Beranger',23000,1912,_country.argentina,];
    map[_name.tigre] = [ClubColors(Colors.red,Colors.blue),Coordinates(-34.44930541623292, -58.54255425127856),
			'José Dellagiovanna',26282,1902,_country.argentina,];
    map[_name.unionSantaFe] = [ClubColors(Colors.red,Colors.white),Coordinates(-31.631730028795666, -60.715128589292696),
			'15 de Abril',28000,1907,_country.argentina,];
    map[_name.velezsarsfield] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.6344873200416, -58.520825644169534),
			'José Amalfitani',49590,1910,_country.argentina,];

    map[_name.penarol] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-34.7963, -56.06693),
			'Campeón del Siglo',40000,1891,_country.uruguay,[_name.nacional]];
    map[_name.nacional] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.8845,-56.159),
			'Estádio Gran Parque Central',34000,1899,_country.uruguay,[_name.penarol]];
    map[_name.bellavista] = [ClubColors(Colors.blue,Colors.white),Coordinates(0,0),
			'Estádio',10000,1900,_country.uruguay,];
    map[_name.danubio] = [ClubColors(Colors.white,Colors.black),Coordinates(-34.8387170, -56.13208784133257),
			'Jardines del Hipódromo',18000,1932,_country.uruguay,];
    map[_name.defensor] = [ClubColors(Colors.purple,Colors.white),Coordinates(-34.91616, -56.16653),
			'Estádio Luis Franzini',16000,1913,_country.uruguay,];
    map[_name.fenix] = [ClubColors(Colors.purple,Colors.white),Coordinates(0,0),
			'Estádio',10000,1900,_country.uruguay,];
    map[_name.montevideo] = [ClubColors(Colors.blue,Colors.white),Coordinates(-34.82381, -56.32036),
			'Complejo Daniel Marsicano',14000,2007,_country.uruguay,];
    map[_name.rentistas] = [ClubColors(Colors.red,Colors.white),Coordinates(-34.776332564963774, -56.16521719395939),
			'Estádio',10000,1900,_country.uruguay,];
    map[_name.riverURU] = [ClubColors(Colors.red,Colors.white),Coordinates(-34.86192888169986, -56.201579),
			'Federico Omar Saroldi',6000,1932,_country.uruguay,];
    map[_name.wanderers] = [ClubColors(Colors.white,Colors.black),Coordinates(-34.859011, -56.203837),
			'Parque Alfredo Víctor Viera',10000,1902,_country.uruguay,];

    map[_name.olimpia] = [ClubColors(Colors.black,Colors.white),Coordinates(-25.291393476624485, -57.6085912),
			'Manuel Ferreira',25820,1902,_country.paraguay,[_name.cerroporteno]];
    map[_name.cerroporteno] = [ClubColors(Colors.blue,Colors.red),Coordinates(-25.3,-57.6375),
			'General Pablo Rojas',45000,1912,_country.paraguay,[_name.olimpia]];
    map[_name.libertad] = [ClubColors(Colors.black,Colors.white),Coordinates(-25.2768477, -57.61086),
			'Dr. Nicolás Leoz',10500,1905,_country.paraguay,];
    map[_name.guaraniPAR] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-25.30311, -57.61587),
			'Rogelio Livieres',8000,1903,_country.paraguay,];
    map[_name.nacionalPAR] = [ClubColors(Colors.red,Colors.blue),Coordinates(-25.29862, -57.63927),
			'Arsenio Erico',8500,1904,_country.paraguay,];
    map[_name.colegiales] = [ClubColors(Colors.red,Colors.blue),Coordinates(-25.348243, -57.592480),
			'Luciano Zacarías',4500,1977,_country.paraguay,];
    map[_name.luqueno] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(-25.2723013, -57.493120),
			'Estádio Feliciano Cáceres',27000,1921,_country.paraguay,];
    map[_name.octubre] = [ClubColors(Colors.red,Colors.black),Coordinates(-25.36745, -57.58476),
			'Luis Alfonso Giagni',11000,1909,_country.paraguay,];
    map[_name.soldeamerica] = [ClubColors(Colors.blue,Colors.white),Coordinates(-25.36735, -57.58480),
			'Estádio Luis Alfonso Giagni',11000,1909,_country.paraguay,];
    map[_name.tacuary] = [ClubColors(Colors.white,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.paraguay,];

    map[_name.colocolo] = [ClubColors(Colors.white,Colors.black),Coordinates(-33.506611,-70.605944),
			'Monumental David Arellano',47017,1925,_country.chile,];
    map[_name.lau] = [ClubColors(Colors.blue,Colors.white),Coordinates(-33.4640546614187, -70.61059042836708),
			'Estádio Nacional',55358,1927,_country.chile,];
    map[_name.univcatolica] = [ClubColors(Colors.blue,Colors.white),Coordinates(-33.394986601781625, -70.50053791828606),
			'San Carlos de Apoquindo',14768,1937,_country.chile,];
    map[_name.palestino] = [ClubColors(Colors.red,Colors.green),Coordinates(-33.520217673555024, -70.67294633780406),
			'Municipal de La Cisterna',12000,1920,_country.chile,];
    map[_name.huachipato] = [ClubColors(Colors.blue,Colors.black),Coordinates(-36.7550273321424, -73.1076052411388),
			'Estádio CAP',10500,1947,_country.chile,];
    map[_name.audax] = [ClubColors(Colors.green,Colors.white),Coordinates(-33.540543, -70.577821),
			'Municipal de La Florida',12000,1910,_country.chile,];
    map[_name.laCalera] = [ClubColors(Colors.red,Colors.white),Coordinates(-32.784167,-71.199444),
			'Municipal Nicolás Chahuán',9200,1954,_country.chile,];
    map[_name.cobreloa] = [ClubColors(Colors.orange,Colors.white),Coordinates(-22.46096, -68.9204540),
			'Municipal de Calama',12000,1977,_country.chile,];
    map[_name.cobresal] = [ClubColors(Colors.orange,Colors.green),Coordinates(-26.2518641, -69.628662),
			'Estádio El Cobre',12000,1979,_country.chile,];
    map[_name.coquimbo] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-29.9652247, -71.338293),
			'Francisco Sánchez Rumoroso',15000,1958,_country.chile,];
    map[_name.evertonchi] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(-33.014228, -71.535373),
			'Sausalito',23000,1909,_country.chile,];
    map[_name.iquique] = [ClubColors(Colors.blue,Colors.black),Coordinates(-20.242358, -70.1331452),
			'Tierra de Campeones',10000,1978,_country.chile,];
    map[_name.magallanes] = [ClubColors(Colors.blue,Colors.white),Coordinates(0,0),
			'Santiago Bueras',5000,1897,_country.chile,];
    map[_name.unionespanola] = [ClubColors(Colors.red,Colors.yellow),Coordinates(-33.40428485, -70.658703),
			'Santa Laura',22000,1897,_country.chile,];
    map[_name.ohiggins] = [ClubColors(Colors.green,Colors.white),Coordinates(-34.1775588, -70.737344506),
			'El Teniente',14450,1955,_country.chile,];
    map[_name.santiagowanderers] = [ClubColors(Colors.green,Colors.white),Coordinates(-33.0224104, -71.639742),
			'Elías Figueroa Brander',21113,1892,_country.chile,];

    map[_name.bolivar] = [ClubColors(Colors.blue,Colors.white),Coordinates(-16.499412183054098, -68.12262946768698),
			'Hernando Siles',42000,1925,_country.bolivia,];
    map[_name.theStrongest] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-16.4994121830, -68.12262946768698),
			'Hernando Siles',42000,1908,_country.bolivia,];
    map[_name.alwaysReady] = [ClubColors(Colors.red,Colors.white),Coordinates(-16.499412183054098, -68.12262946768698),
			'Hernando Siles',42000,1933,_country.bolivia,];
    map[_name.aurora] = [ClubColors(Colors.blue,Colors.white),Coordinates(0,0),
			'Estádio',10000,1900,_country.bolivia,];
    map[_name.blooming] = [ClubColors(Colors.blue,Colors.black),Coordinates(-17.796, -63.1832),
			'Tauhichi Aguilera',38000,1946,_country.bolivia,];
    map[_name.guabira] = [ClubColors(Colors.red,Colors.white),Coordinates(-17.34287, -63.261564),
			'Gilberto Parada',18000,1962,_country.bolivia,];
    map[_name.jorge] = [ClubColors(Colors.red,Colors.blue),Coordinates(-17.37959, -66.1617185),
			'Félix Capriles',32000,1949,_country.bolivia,];
    map[_name.orientePetrolero] = [ClubColors(Colors.white,Colors.green),Coordinates(-17.795982, -63.183182),
			'Estádio Ramón Tahuichi Aguilera',38500,1955,_country.bolivia,];
    map[_name.sanJoseBOL] = [ClubColors(Colors.blue,Colors.white),Coordinates(-17.94613, -67.1108436),
			'Estádio Jesús Bermúdez',39000,1942,_country.bolivia,];
    map[_name.realpotosi] = [ClubColors(Colors.white,Colors.blue),Coordinates(0,0),
			'Víctor Ugarte',32000,1986,_country.bolivia,]; //EXTINTO
    map[_name.sucre] = [ClubColors(Colors.red,Colors.blue),Coordinates(-19.03347852, -65.2576612),
			'Olímpico Patria',32000,1961,_country.bolivia,];

    map[_name.alianzalima] = [ClubColors(Colors.blue,Colors.white),Coordinates(-12.067655953347574, -77.02294850815305),
			'Alejandro Villanueva',35000,1901,_country.peru,];
    map[_name.sportingcristal] = [ClubColors(Colors.blue,Colors.white),Coordinates(-12.036261692303492, -77.0451327582773),
			'Alberto Gallardo',11600,1955,_country.peru,];
    map[_name.cienciano] = [ClubColors(Colors.red,Colors.white),Coordinates(-13.524209685195263, -71.96635190695508),
			'Inca Garcilaso de la Vega',45056,1901,_country.peru,];
    map[_name.universitario] = [ClubColors(Colors.white,Colors.red),Coordinates(-12.055024119204422, -76.93588717639652),
			'Monumental de Lima',80093,1924,_country.peru,];
    map[_name.melgar] = [ClubColors(Colors.red,Colors.black),Coordinates(-16.40644667860232, -71.52023602312065),
			'Estádio Monumental da UNSA',40370,1915,_country.peru,];
    map[_name.depmunicipal] = [ClubColors(Colors.red,Colors.white),Coordinates(-12.067919, -77.03348),
			'Nacional José Diáz',45000,1935,_country.peru,];
    map[_name.cusco] = [ClubColors(Colors.black,Colors.yellow),Coordinates(-13.525813, -71.966138),
			'Inca Garcilaso de la Vega',45056,2009,_country.peru,];
    map[_name.sportboys] = [ClubColors(Colors.pink,Colors.black),Coordinates(-12.059966, -77.1197877),
			'Miguel Grau',15000,1927,_country.peru,];

    map[_name.barcelonaequ] = [ClubColors(Colors.yellow,Colors.red),Coordinates(-2.18560555116918, -79.92476483629734),
			'Monumental Isidro Romero Carbo',57267,1925,_country.ecuador,];
    map[_name.emelec] = [ClubColors(Colors.blue,Colors.white),Coordinates(-2.2056540238633167, -79.89387535547),
			'George Capwell',40000,1929,_country.ecuador,];
    map[_name.ldu] = [ClubColors(Colors.white,Colors.grey),Coordinates(-0.10660691013189663, -78.48884040616441),
			'Rodrigo Paz Delgado',41575,1918,_country.ecuador,];
    map[_name.idelvalle] = [ClubColors(Colors.blue,Colors.black),Coordinates(-0.3488362151427068, -78.47082328252709),
			'Rumiñahui',10233,1958,_country.ecuador,];
    map[_name.elnacional] = [ClubColors(Colors.red,Colors.yellow),Coordinates(-0.177371, -78.47598),
			'Olímpico Atahualpa',38500,1964,_country.ecuador,];
    map[_name.delfin] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.ecuador,]; 
    map[_name.depcuenca] = [ClubColors(Colors.red,Colors.black),Coordinates(-2.906627, -79.005685),
			'Alejandro Serrano Aguilar',16500,1971,_country.ecuador,];
    map[_name.depquito] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.ecuador,];
    map[_name.olmedo] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.ecuador,];
    map[_name.uniequ] = [ClubColors(Colors.lightBlueAccent,darkblue),Coordinates(-0.1774, -78.476),
			'Olímpico Atahualpa',38500,1963,_country.ecuador,];

    map[_name.americadecali] = [ClubColors(Colors.red,Colors.white),Coordinates(3.43076413, -76.5409550595830),
			'Olímpico Pascual Guerrero',35405,1927,_country.colombia,];
    map[_name.atleticonacional] = [ClubColors(Colors.green,Colors.white),Coordinates(6.2570559, -75.589883235),
			'Atanasio Girardot',52872,1947,_country.colombia,];
    map[_name.deportivocali] = [ClubColors(Colors.green,Colors.white),Coordinates(3.52269250, -76.415711707944),
			'Estádio Deportivo Cali',55000,1912,_country.colombia,];
    map[_name.junior] = [ClubColors(Colors.red,Colors.white),Coordinates(10.927145429567, -74.80001718383603),
			'Metropolitano',46692,1924,_country.colombia,];
    map[_name.imedellin] = [ClubColors(Colors.red,Colors.blue),Coordinates(6.256939271, -75.58987728982818),
			'Atanasio Girardot',45953,1913,_country.colombia,];
    map[_name.oncecaldas] = [ClubColors(Colors.white,Colors.green),Coordinates(5.057102, -75.48972667784),
			'Palogrande',42600,1961,_country.colombia,];
    map[_name.millonarios] = [ClubColors(Colors.blue,Colors.white),Coordinates(4.645962128, -74.077269811),
			'El Campín',36343,1937,_country.colombia,];
    map[_name.santafe] = [ClubColors(Colors.white,Colors.red),Coordinates(4.646, -74.077),
			'El Campín',36343,1941,_country.colombia,];
    map[_name.tolima] = [ClubColors(Colors.yellow,Colors.red),Coordinates(4.43018613, -75.21773451564),
			'Manuel Murillo Toro',33000,1954,_country.colombia,];
    map[_name.bucaramanga] = [ClubColors(Colors.white,Colors.white),Coordinates(7.136745, -73.116192004072),
			'Alfonso López',10000,1900,_country.colombia,];
    map[_name.cucuta] = [ClubColors(Colors.red,Colors.black),Coordinates(7.8946915, -72.50194428901477),
			'General Santander',46519,1924,_country.colombia,];
    map[_name.laequidad] = [ClubColors(Colors.white,Colors.green),Coordinates(4.62375432, -74.13547816181497),
			'Metropolitano de Techo',15000,1982,_country.colombia,];

    map[_name.caracas] = [ClubColors(Colors.red,Colors.white),Coordinates(10.492202523098, -66.88564439303892),
			'Estádio Olímpico de Caracas',24900,1967,_country.venezuela,];
    map[_name.laGuaira] = [ClubColors(Colors.white,Colors.blue),Coordinates(10.4922025230, -66.88564439303892),
			'Estádio Olímpico de Caracas',24900,2008,_country.venezuela,];
    map[_name.deportivoTachira] = [ClubColors(Colors.white,Colors.black),Coordinates(7.787385, -72.1980212),
			'Pueblo Nuevo de San Cristóbal',42000,1974,_country.venezuela,];
    map[_name.estudiantesmerida] = [ClubColors(Colors.white,Colors.red),Coordinates(8.5769590, -71.16485),
			'Guillermo Soto Rosa',16500,1971,_country.venezuela,];
    map[_name.maracaibo] = [ClubColors(Colors.blue,Colors.red),Coordinates(10.6740610, -71.64507),
			'José Pachencho Romero',35000,2001,_country.venezuela,]; //FALENCIA
    map[_name.deplara] = [ClubColors(Colors.red,Colors.black),Coordinates(10.0809793, -69.32927),
			'Farid Richa',12480,2009,_country.venezuela,];
    map[_name.mineros] = [ClubColors(Colors.red,Colors.black),Coordinates(8.31272986, -62.6962946),
			'C.T.E. Cachamay',42000,1981,_country.venezuela,];
    map[_name.monagas] = [ClubColors(Colors.blue,grena),Coordinates(9.71000338, -63.2677268),
			'Monumental de Maturín',51796,1987,_country.venezuela,];
    map[_name.minerven] = [ClubColors(Colors.blue,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.venezuela,];
    map[_name.sancristobal] = [ClubColors(Colors.red,Colors.black),Coordinates(0,0),
			'Estádio',10000,1900,_country.venezuela,]; 
    map[_name.trujillanos] = [ClubColors(Colors.yellow,Colors.black),Coordinates(9.33347489, -70.60227),
			'José Alberto Pérez',12000,1981,_country.venezuela,];
    map[_name.zamora] = [ClubColors(Colors.white,Colors.black),Coordinates(8.625075, -70.20694),
			'Estadio Agustín Tovar',28000,1977,_country.venezuela,];
    map[_name.zulia] = [ClubColors(Colors.blue,Colors.black),Coordinates(10.6743723, -71.644651),
			'Estádio José Encarnación Romero',45000,2005,_country.venezuela,];

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    map[_name.atlas] = [ClubColors(Colors.red,Colors.black),Coordinates(20.7051916, -103.3277484),
			'Jalisco',63163,1916,_country.mexico,];
    map[_name.atlante] = [ClubColors(Colors.blue,grena),Coordinates(19.382696, -99.1782815),
			'Estádio Azul',32904,1916,_country.mexico,];
    map[_name.americamex] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(19.30399436934253, -99.15052764098895),
			'Estádio Azteca',87000,1916,_country.mexico,];
    map[_name.chivasguadalajara] = [ClubColors(Colors.red,Colors.white),Coordinates(20.6827395, -103.46255961),
			'Estadio Akron',49850,1906,_country.mexico,];
    map[_name.cruzazul] = [ClubColors(Colors.red,Colors.white),Coordinates(19.38374161229348, -99.1782640635787),
			'Estádio Azul',32904,1927,_country.mexico,];
    map[_name.jaguares] = [ClubColors(Colors.black,Colors.white),Coordinates(16.7630, -93.0960),
			'Estádio Víctor Manuel Reyna',28000,2002,_country.mexico,];
    map[_name.juarez] = [ClubColors(Colors.green,Colors.black),Coordinates(31.75317, -106.467471),
			'Estadio Olímpico Benito Juárez',19703,2015,_country.mexico,];
    map[_name.leon] = [ClubColors(Colors.green,Colors.white),Coordinates(21.1163456, -101.65787451933474),
			'Nou Camp',33943,1944,_country.mexico,];
    map[_name.leonesNegros] = [ClubColors(Colors.red,Colors.yellow),Coordinates(20.7052, -103.3277),
			'Jalisco',63163,1970,_country.mexico,];
    map[_name.mazatlan] = [ClubColors(Colors.purple,Colors.black),Coordinates(23.2360094, -106.43248715365873),
			'Estadio de Mazatlán',25000,2020,_country.mexico,];
    map[_name.monterrey] = [ClubColors(Colors.blue,Colors.white),Coordinates(25.6702825, -100.24467170207647),
			'Estádio BBVA',51348,1945,_country.mexico,];
    map[_name.morelia] = [ClubColors(Colors.yellow,Colors.red),Coordinates(19.7189655, -101.233201),
			'Estadio Morelos',41038,1950,_country.mexico,];
    map[_name.necaxa] = [ClubColors(Colors.red,Colors.white),Coordinates(21.881199555082244, -102.2754420031197),
			'Estadio Victoria',22000,1923,_country.mexico,];
    map[_name.pachuca] = [ClubColors(Colors.blue,Colors.white),Coordinates(20.10591055902596, -98.75566731369555),
			'Estádio Hidalgo',32000,1892,_country.mexico,];
    map[_name.puebla] = [ClubColors(Colors.blue,Colors.white),Coordinates(19.078863049335823, -98.16441034823123),
			'Estadio Cuauhtemoc',42684,1944,_country.mexico,];
    map[_name.pumas] = [ClubColors(Colors.blue,Colors.white),Coordinates(19.333086463110767, -99.19217763866962),
			'Olímpico Universitário',72000,1954,_country.mexico,];
    map[_name.queretaro] = [ClubColors(Colors.blue,Colors.black),Coordinates(20.57793742408316, -100.3662424098023),
			'Estádio Corregidora',40000,1950,_country.mexico,];
    map[_name.sanluis] = [ClubColors(Colors.red,Colors.white),Coordinates(22.1389898, -100.95071374670914),
			'Estadio Alfonso Lastras Ramírez',25709,2013,_country.mexico,];
    map[_name.santosLaguna] = [ClubColors(Colors.green,Colors.black),Coordinates(25.628468689219222, -103.37969958915643),
			'Nuevo Estadio Corona',30000,1983,_country.mexico,];
    map[_name.tigres] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(25.72329253464337, -100.31197952885417),
			'Estádio Universitario',42000,1960,_country.mexico,];
    map[_name.toluca] = [ClubColors(Colors.red,Colors.white),Coordinates(19.287397525926213, -99.66671939375858),
			'Estádio Nemesio Díez',30000,1917,_country.mexico,];
    map[_name.tijuana] = [ClubColors(Colors.red,Colors.black),Coordinates(32.50666004364992, -116.99310466113292),
			'Caliente',33333,2007,_country.mexico,];

    //USA
    map[_name.atlanta] = [ClubColors(Colors.red,Colors.black),Coordinates(33.755357712720134, -84.40062064453132),
			'Mercedes-Benz Stadium',72035,2014,_country.unitedStates,];
    map[_name.austin] = [ClubColors(Colors.black,Colors.green),Coordinates(30.387949632405302, -97.71926779375687),
			'Q2 Stadium',20738,2019,_country.unitedStates,];
    map[_name.minnesota] = [ClubColors(Colors.blue,Colors.grey),Coordinates(44.95329071425793, -93.16552316096995),
			'Allianz Field',19400,2010,_country.unitedStates,];
    map[_name.columbuscrew] = [ClubColors(Colors.yellow,Colors.black),Coordinates(40.009552334913025, -82.99103627481196),
			'Mapfre Stadium',19968,1994,_country.unitedStates,];
    map[_name.chicago] = [ClubColors(Colors.blue,Colors.red),Coordinates(41.765063860516534, -87.80527756829989),
			'Toyota Park',20000,1997,_country.unitedStates,];
    map[_name.colorado] = [ClubColors(grena,Colors.grey),Coordinates(39.805555555,-104.891944444),
			'DSG Park',19680,1995,_country.unitedStates,];
    map[_name.dcunited] = [ClubColors(Colors.red,Colors.black),Coordinates(38.869081611933176, -77.01259340022942),
			'Audi Field',20000,1995,_country.unitedStates,];
    map[_name.fcdallas] = [ClubColors(Colors.red,Colors.blue),Coordinates(33.15449939561873, -96.8350561289953),
			'Toyota Stadium',20500,1996,_country.unitedStates,[_name.houston]];
    map[_name.houston] = [ClubColors(Colors.orange,Colors.black),Coordinates(29.752578440282296, -95.35189527854703),
			'BBVA Compass Stadium',22000,2005,_country.unitedStates,[_name.fcdallas]];
    map[_name.lagalaxy] = [ClubColors(Colors.white,Colors.blue),Coordinates(33.864814147447696, -118.26112111006496),
			'Dignity Health Sports Park',27000,1994,_country.unitedStates,[_name.losangelesfc]];
    map[_name.losangelesfc] = [ClubColors(Colors.black,Colors.yellow),Coordinates(34.01283380233556, -118.28357956394143),
			'Banc of California Stadium',22000,2014,_country.unitedStates,[_name.lagalaxy]];
    map[_name.montreal] = [ClubColors(Colors.blue,Colors.black),Coordinates(45.56245239840091, -73.55283927419696),
			'Saputo Stadium',19619,2010,_country.canada,];
    map[_name.nerevolution] = [ClubColors(Colors.blue,Colors.red),Coordinates(42.091104989903016, -71.26423920597391),
			'Gillette Stadium',25000,1996,_country.unitedStates,];
    map[_name.nycity] = [ClubColors(Colors.blue,Colors.white),Coordinates(40.8297390634173, -73.9261731193736),
			'Yankee Stadium',33488,2013,_country.unitedStates,[_name.nyredbulls]];
    map[_name.nyredbulls] = [ClubColors(Colors.white,Colors.red),Coordinates(40.737136159251094, -74.14988141458025),
			'Red Bull Arena',25000,1995,_country.unitedStates,[_name.nycity]];
    map[_name.orlando] = [ClubColors(Colors.purple,Colors.black),Coordinates(28.54122030683539, -81.38898748081618),
			'Exploria Stadium',25500,2010,_country.unitedStates,];
    map[_name.portland] = [ClubColors(Colors.green,Colors.yellow),Coordinates(45.52168918987854, -122.69138305222297),
			'Providence Park',21144,1975,_country.unitedStates,];
    map[_name.seattle] = [ClubColors(Colors.purple,Colors.black),Coordinates(47.59539774447109, -122.33119950470088),
			'Lumen Field',68000,2007,_country.unitedStates,];
    map[_name.intermiami] = [ClubColors(Colors.purpleAccent,Colors.black),Coordinates(26.193247439798213, -80.16061670025503),
			'Lockhart Stadium',17417,2018,_country.unitedStates,];
    map[_name.philadelphia] = [ClubColors(darkblue,Colors.yellow),Coordinates(39.83275356055387, -75.3779441855293),
			'PPL Park',18500,2008,_country.unitedStates,];
    map[_name.torontofc] = [ClubColors(Colors.red,Colors.white),Coordinates(43.633340987226894, -79.41830505626623),
			'BMO Field',30000,2005,_country.canada,];
    map[_name.realSaltLake] = [ClubColors(Colors.red,Colors.black),Coordinates(40.58327223014679, -111.89327523514315),
			'Rio Tinto Stadium',20213,2004,_country.unitedStates,];
    map[_name.sanJoseEarthquakes] = [ClubColors(Colors.blue,Colors.black),Coordinates(37.35128154438451, -121.9244801339687),
			'Avaya Stadium',18000,1994,_country.unitedStates,];
    map[_name.sportingKansasCity] = [ClubColors(Colors.lightBlueAccent,darkblue),Coordinates(39.12169273633934, -94.82291920416965),
			'Children\'s Mercy Park',10000,1900,_country.unitedStates,];
    map[_name.vancouver] = [ClubColors(darkblue,Colors.lightBlueAccent),Coordinates(49.27705089651748, -123.11191313155723),
			'BC Place',54500,2009,_country.canada,];

    //CARIBE
    map[_name.saprissa] = [ClubColors(grena,Colors.white),Coordinates(9.9656632, -84.07525166),
			'Ricardo Saprissa Aymá',23112,1935,_country.costaRica,];
    map[_name.alajuelense] = [ClubColors(Colors.black,Colors.red),Coordinates(10.021861736970504, -84.20910),
			'Aleandro Morera Soto',17895,1919,_country.costaRica,];
    map[_name.cartagines] = [ClubColors(Colors.blue,Colors.white),Coordinates(9.85850690, -83.918919),
			'	José Rafael Fello Meza Ivankovich',18000,1906,_country.costaRica,];
    map[_name.olimpiaHON] = [ClubColors(Colors.white,Colors.red),Coordinates(14.098689796181219, -87.203603),
			'Carias Andino',30000,1965,_country.honduras,];
    map[_name.rcdespana] = [ClubColors(Colors.yellow,Colors.red),Coordinates(15.507659340379924, -88.033096),
			'Francisco Morazán',26781,1929,_country.honduras,];
    map[_name.tauro] = [ClubColors(Colors.black,Colors.white),Coordinates(9.0358766, -79.4693139),
			'Rommel Fernández',32000,1984,_country.panama,];
    map[_name.arabeunido] = [ClubColors(Colors.blue,Colors.white),Coordinates(9.34405, -79.89594),
			'Armando Dely Valdés',4000,1994,_country.panama,];
    map[_name.comunicaciones] = [ClubColors(Colors.white,Colors.lightBlueAccent),Coordinates(14.6258950, -90.509649),
			'Doroteo Guamuch Flores',26000,1949,_country.guatemala,];
    map[_name.aguila] = [ClubColors(Colors.orange,Colors.black),Coordinates(13.482514, -88.16900),
			'Juan Francisco Barraza',15500,1926,_country.elsalvador,];
    map[_name.villaclara] = [ClubColors(Colors.yellow,Colors.red),Coordinates(22.4045077, -79.954772),
			'Augusto César Sandino',18000,1978,_country.cuba,];
    map[_name.violette] = [ClubColors(Colors.blue,Colors.white),Coordinates(18.5361821, -72.342520),
			'Sylvio Cator',10500,1918,_country.haiti,];
    map[_name.defenseforce] = [ClubColors(Colors.yellow,Colors.lightBlue),Coordinates(10.661544, -61.533036),
			'Hasely Crawford',27000,1974,_country.trinidadTobago,];
    map[_name.robinhood] = [ClubColors(Colors.red,Colors.green),Coordinates(5.8376520, -55.1602422477897),
			'André Kamperveen Stadion',6000,1945,_country.suriname,];

    //////////////////////////////////////////////////////////////////////////////////
    //CHINA
    map[_name.ghuangzhou] = [ClubColors(Colors.red,Colors.white),Coordinates(23.138031,113.324661),
			'Tianhe Stadium',58500,1954,_country.china,];
    map[_name.beijingguoan] = [ClubColors(Colors.green,Colors.black),Coordinates(39.865559, 116.272423),
			'Beijing Fengtai Stadium',31043,1992,_country.china,];
    map[_name.dalian] = [ClubColors(Colors.blue,Colors.black),Coordinates(39.0208235, 121.56178),
			'Dalian Sports Center',61000,2009,_country.china,];
    map[_name.henan] = [ClubColors(Colors.red,Colors.blue),Coordinates(34.71675, 113.72510),
			'Zhengzhou Hanghai',29860,1994,_country.china,];
    map[_name.shandong] = [ClubColors(Colors.orange,Colors.white),Coordinates(36.6569476057816, 117.11656321454889),
			'Luneng Stadium',56808,1993,_country.china,];
    map[_name.shanghaisipg] = [ClubColors(Colors.red,Colors.white),Coordinates(31.1835,121.437278),
			'Estádio de Shanghai',56842,2005,_country.china,];
    map[_name.shanghaishenhua] = [ClubColors(Colors.blue,Colors.red),Coordinates(31.2734280, 121.47646528786846),
			'Hongkou Stadium',33060,1993,_country.china,];
    map[_name.tianjin] = [ClubColors(Colors.red,Colors.white),Coordinates(39.03144590255764, 117.72524210564828),
			'TEDA Football Stadium',37450,1957,_country.china,];
    map[_name.wuhan] = [ClubColors(Colors.orange,Colors.white),Coordinates(30.58665415258201, 114.27357162590276),
			'Xinhua Road Sports Center',22000,2009,_country.china,];

    //JAPÃO
    map[_name.cerezoOsaka] = [ClubColors(Colors.pink,Colors.black),Coordinates(34.61412159266685, 135.51855469354584),
			'Estádio Nagai',47000,1957,_country.japan,];
    map[_name.fcTokyo] = [ClubColors(Colors.blue,Colors.red),Coordinates(35.66416255606509, 139.5273887800898),
			'Ajinomoto Stadium',50100,1999,_country.japan,];
    map[_name.gambaOsaka] = [ClubColors(Colors.blue,Colors.black),Coordinates(34.802526,135.538278),
			'Suita Stadium',39694,1980,_country.japan,];
    map[_name.jubiloiwata] = [ClubColors(Colors.lightBlueAccent,Colors.blueAccent),Coordinates(34.74345700099584, 137.97077517443734),
			'Shizuoka Ecopa',50000,1970,_country.japan,];
    map[_name.kashimaantlers] = [ClubColors(Colors.red,Colors.grey),Coordinates(35.992503028347215, 140.64383880977616),
			'Kashima Soccer Stadium',40728,1994,_country.japan,];
    map[_name.kashiwaReysol] = [ClubColors(Colors.yellow,Colors.black),Coordinates(35.8485972, 139.97510173297843),
			'Hitachi Kashiwa Soccer Stadium',15900,1940,_country.japan,];
    map[_name.kawasakifrontale] = [ClubColors(Colors.blue,Colors.black),Coordinates(35.585895,139.652731),
			'Todoroki Athletics Stadium',27495,1997,_country.japan,];
    map[_name.kyoto] = [ClubColors(Colors.purple,Colors.black),Coordinates(35.017213996193966, 135.58500100355525),
			'Sanga Stadium',21326,1921,_country.japan,];
    map[_name.hiroshima] = [ClubColors(Colors.purple,Colors.white),Coordinates(34.440852707968666, 132.39482460751714),
			'Edion Stadium Hiroshima',1938,1938,_country.japan,];
    map[_name.nagoya] = [ClubColors(Colors.red,Colors.orange),Coordinates(35.084593390811456, 137.17108023590785),
			'Estádio de Toyota',45000,1939,_country.japan,];
    map[_name.sapporo] = [ClubColors(Colors.red,Colors.black),Coordinates(43.0151545, 141.4096851),
			'Sapporo Dome',41484,1939,_country.japan,];
    map[_name.shonanbellmare] = [ClubColors(Colors.green,Colors.blue),Coordinates(35.3436334, 139.341192),
			'Hiratsuka Athletics',18500,1968,_country.japan,];
    map[_name.urawareddiamonds] = [ClubColors(Colors.red,Colors.black),Coordinates(35.903142,139.717492),
			'Estádio Saitama 2002',63700,1950,_country.japan,];
    map[_name.visselkobe] = [ClubColors(Colors.black,Colors.white),Coordinates(34.6573478245801, 135.16959486362035),
			'Estádio Kobe Wing',30182,1966,_country.japan,];
    map[_name.yokohamamarinos] = [ClubColors(Colors.red,Colors.blue),Coordinates(35.51021666804383, 139.6064795458908),
			'Estádio Internacional de Yokohama',72327,1972,_country.japan,];

    //CORÉIA DO SUL
    map[_name.busan] = [ClubColors(Colors.red,Colors.white),Coordinates(35.1901866833, 129.05830606792048),
			'Busan Asiad',53864,1979,_country.southKorea,];
    map[_name.daegu] = [ClubColors(Colors.lightBlueAccent,Colors.white),Coordinates(35.881330, 128.588442),
			'DGB Daegu Bank Park',12415,2002,_country.southKorea,];
    map[_name.incheon] = [ClubColors(Colors.blue,Colors.black),Coordinates(37.466183, 126.6435795346),
			'Incheon Football Stadium',20891,2003,_country.southKorea,];
    map[_name.jeonbuk] = [ClubColors(Colors.green,Colors.white),Coordinates(35.868343073344604, 127.064329),
			'Jeonju World Cup Stadium',42477,1994,_country.southKorea,];
    map[_name.pohang] = [ClubColors(Colors.grey,Colors.black),Coordinates(36.008852085767806, 129.363788),
			'Pohang Steel Yard',25000,1973,_country.southKorea,];
    map[_name.fcseoul] = [ClubColors(Colors.red,Colors.black),Coordinates(37.56837781091576, 126.897502),
			'Seoul World Cup Stadium',66704,1983,_country.southKorea,];
    map[_name.seongnam] = [ClubColors(Colors.black,Colors.white),Coordinates(37.4101435, 127.1213833),
			'Tancheon Sports Complex',16146,1989,_country.southKorea,];
    map[_name.suwonsamsung] = [ClubColors(Colors.blue,Colors.red),Coordinates(37.28661727286699, 127.0367),
			'Big Bird',43288,1995,_country.southKorea,];
    map[_name.ulsan] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(35.56251396791964, 129.3483643),
			'Munsu Cup Stadium',44474,1983,_country.southKorea,];

    //RESTO ASIA - TAILANDIA
    map[_name.bangkok] = [ClubColors(Colors.red,Colors.black),Coordinates(14.068134049742088, 100.59904174726937),
			'Thammasat Stadium',25000,1988,_country.thailand,];
    map[_name.buriram] = [ClubColors(Colors.blue,Colors.black),Coordinates(14.965924287790594, 103.09446331149195),
			'New i-mobile Stadium',32600,1970,_country.thailand,];
    map[_name.pathum] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(14.000786452596694, 100.67932807263357),
			'Leo Stadium',10114,2006,_country.thailand,];
    //INDIA
    map[_name.bengaluru] = [ClubColors(Colors.blue,Colors.red),Coordinates(12.9698491467, 77.5938683),
			'Sree Kanteerava',19000,2013,_country.india,];
    map[_name.chennaiyin] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(13.085815134605419, 80.271831),
			'Jawaharlal Nehru',40000,2014,_country.india,];
    map[_name.goa] = [ClubColors(Colors.orange,Colors.blue),Coordinates(15.289484218447647, 73.96255090711321),
			'Fatorda',19000,2014,_country.india,];
    map[_name.hyderabad] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(17.446364257, 78.34410),
			'G.M.C Balayogi Athletic',30000,2019,_country.india,];
    map[_name.kerala] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(13.085647965425872, 80.2716407),
			'Jawaharlal Nehru',75000,2014,_country.india,];
    map[_name.mumbai] = [ClubColors(Colors.lightBlueAccent,Colors.yellow),Coordinates(19.04220457262697, 73.0269),
			'DY Patil Stadium',55000,2014,_country.india,];
    map[_name.odisha] = [ClubColors(Colors.orange,Colors.black),Coordinates(20.2880451, 85.82383754),
			'Kalinga Stadium',60000,2014,_country.india,];
    //INDONESIA
    map[_name.bali] = [ClubColors(Colors.red,Colors.black),Coordinates(-8.5468398, 115.30643358014062),
      'Kapten I Wayan Dipta',18000,2015,_country.indonesia,];
    map[_name.persebaya] = [ClubColors(Colors.green,Colors.white),Coordinates(-7.223110, 112.6228187),
      'Gelora Bung Tomo Stadium',30000,1927,_country.indonesia,];
    map[_name.persipura] = [ClubColors(Colors.red,Colors.black),Coordinates(-2.5790803, 140.5736097741294),
			'Lukas Enembe',40263,1963,_country.indonesia,];
    //VIETNA
    map[_name.hanoi] = [ClubColors(Colors.purple,Colors.white),Coordinates(21.0298189, 105.833028),
      'Hàng Đẫy Stadium',22500,2006,_country.vietnam,];
    //PHILIPPINNES
    map[_name.maharlika] = [ClubColors(Colors.black,Colors.purple),Coordinates(14.563410, 120.9921828),
      'Rizal Memorial Stadium',12873,2020,_country.philippines,];
    map[_name.unitedCity] = [ClubColors(Colors.yellow,Colors.black),Coordinates(15.3455705, 120.5335554),
      'New Clark City Athletics',20000,2012,_country.philippines,];
    //CAMBOJA
    map[_name.phnomPenhCrown] = [ClubColors(Colors.red,Colors.white),Coordinates(11.6047089, 104.894398),
      'RSN Stadium',5000,2001,_country.cambodia,];
    //NEPAL
    map[_name.machhindra] = [ClubColors(Colors.red,Colors.white),Coordinates(27.69569827, 85.3148114),
      'Dasarath Rangasala',15000,1973,_country.nepal,];
    map[_name.manangMarshyangdi] = [ClubColors(Colors.white,Colors.blue),Coordinates(27.6950160, 85.314920),
      'Dasarath Rangasala',15000,1982,_country.nepal,];

    //ORIENTE MÉDIO
    //QATAR
    map[_name.alsadd] = [ClubColors(Colors.white,Colors.black),Coordinates(25.267630373861838, 51.48445839148633),
			'Jassim Bin Hamad',15000,1969,_country.qatar,];
    map[_name.alduhail] = [ClubColors(Colors.red,Colors.white),Coordinates(25.37346857386201, 51.469251555342645),
			'Abdullah bin Khalifa',10221,1938,_country.qatar,];
    map[_name.alrayyan] = [ClubColors(Colors.red,Colors.black),Coordinates(25.32986391889229, 51.34271845785474),
			'Ahmed bin Ali Stadium',27000,1967,_country.qatar,];
    map[_name.alarabi] = [ClubColors(Colors.red,Colors.black),Coordinates(25.25861235, 51.520695),
			'Grand Hamad Stadium',18000,1952,_country.qatar,];
    //UAE
    map[_name.aljazira] = [ClubColors(Colors.white,Colors.black),Coordinates(24.452764,54.392019),
			'Estádio Mohammed Bin Zayed',42000,1974,_country.uae,];
    map[_name.alain] = [ClubColors(Colors.purple,Colors.white),Coordinates(24.207564781288873, 55.76636412488102),
			'Sheikh Khalifa International Stadium',16000,1968,_country.uae,];
    map[_name.alWahda] = [ClubColors(grena,Colors.white),Coordinates(24.469883556075786, 54.37533388534337),
			'Estádio Al Nahyan',12000,1974,_country.uae,];
    //BAHREIN
    map[_name.alhidd] = [ClubColors(Colors.blue,Colors.white),Coordinates(26.15366, 50.54359),
			'Bahrain National Stadium',24000,1945,_country.bahrein,];
    //SOUTH ARABIA
    map[_name.alhilal] = [ClubColors(Colors.blue,Colors.white),Coordinates(24.789031704642504, 46.83959376336615),
			'King Fahd Stadium',67000,1957,_country.southArabia,];
    map[_name.alnassr] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(21.76355015320557, 39.16436796854603),
			'Universitário Rei Saud',25000,1955,_country.southArabia,];
    map[_name.alIttihad] = [ClubColors(Colors.yellow,Colors.black),Coordinates(21.446627353923315, 39.25241375947442),
			'Prince Abdullah Al-Faisal Stadium',27000,1927,_country.southArabia,];
    map[_name.alShabab] = [ClubColors(Colors.white,Colors.orange),Coordinates(24.788291361712282, 46.83911094115153),
			'Estádio Internacional Rei Fahd',75000,1947,_country.southArabia,];
    map[_name.alahli] = [ClubColors(Colors.green,Colors.white),Coordinates(21.44662735509961, 39.25233865726637),
			'Prince Abdullah al-Faisal Stadium',27000,1937,_country.southArabia,];
    //IRÃ
    map[_name.persepolis] = [ClubColors(Colors.red,Colors.white),Coordinates(35.72465, 51.27574),
			'Azadi Stadium',100000,1963,_country.iran,];
    map[_name.esteghlal] = [ClubColors(Colors.blue,Colors.white),Coordinates(35.7246, 51.2758),
			'Azadi Stadium',100000,1945,_country.iran,];
    map[_name.sepahan] = [ClubColors(Colors.yellow,Colors.black),Coordinates(32.74323273, 51.686141),
			'Naghsh-e Jahan',75000,1953,_country.iran,];
    //UZBEQUISTÃO
    map[_name.pakhtakor] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(41.3156628, 69.26059),
			'Pakhtakor Markaziy Stadium',35000,1956,_country.uzbekistan,];
    //IRAQUE
    map[_name.alzawraa] = [ClubColors(Colors.blue,Colors.white),Coordinates(33.3443251, 44.36832511),
			'Al-Zawraa Stadium',15443,1969,_country.iraq,];
    map[_name.alQuwaAlJawiya] = [ClubColors(Colors.blue,Colors.yellow),Coordinates(33.3535912, 44.4543854),
			'Al-Zawraa Stadium',6000,1931,_country.iraq,];
    //SYRIA
    map[_name.alJaish] = [ClubColors(Colors.red,Colors.black),Coordinates(33.5227937, 36.3200108),
      'Abbasiyyin Stadium Damascus',30000,1945,_country.syria,];
    map[_name.tishreen] = [ClubColors(Colors.yellow,Colors.red),Coordinates(33.5053761, 36.2892507),
      'Tishreen',28000,1947,_country.syria,];
    //KUWAIT
    map[_name.alKuwait] = [ClubColors(Colors.white,Colors.red),Coordinates(29.34280293, 47.95224442),
      'Al Kuwait Sports Club',12350,1960,_country.kuwait,];
    //LEBANON
    map[_name.alAhed] = [ClubColors(Colors.yellow,Colors.black),Coordinates(33.840550954, 35.4898395),
      'Al Ahed',2000,1964,_country.lebanon,];
    map[_name.alAnsar] = [ClubColors(Colors.green,Colors.white),Coordinates(18.2228766, 42.4903386),
      'Al Ansar',5000,1951,_country.lebanon,];
    map[_name.nejmeh] = [ClubColors(grena,Colors.white),Coordinates(33.894420, 35.4695427),
      'Prince Mohammed bin Abdul Aziz',5000,1945,_country.lebanon,];

    //////////////////////////////////////////////////////////////////////////
    //OCEANIA
    map[_name.auckland] = [ClubColors(Colors.blue,Colors.blue),Coordinates(-36.89779, 174.736646117),
			'Kiwitea Street',3500,2004,_country.newZealand,];
    map[_name.wellingtonphoenix] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-41.273115, 174.78582),
			'Westpac Stadium',35000,2007,_country.newZealand,];
    //AUSTRALIA
    map[_name.adelaide] = [ClubColors(Colors.red,Colors.blue),Coordinates(-34.90747873216849, 138.56896413),
			'Coopers Stadium',16500,2003,_country.australia,];
    map[_name.brisbane] = [ClubColors(Colors.orange,Colors.black),Coordinates(-27.464606972144523, 153.0096921280),
			'Suncorp Stadium',53223,2005,_country.australia,];
    map[_name.centralcoast] = [ClubColors(Colors.yellow,darkblue),Coordinates(-33.42820054309167, 151.3379147192544),
			'Bluetongue Stadium',20119,2004,_country.australia,];
    map[_name.melbournecity] = [ClubColors(Colors.lightBlueAccent,Colors.white),Coordinates(-37.8251, 144.9840),
			'AAMI Park',30050,2009,_country.australia,];
    map[_name.melbournevictory] = [ClubColors(Colors.blue,Colors.white),Coordinates(-37.825063012, 144.983956),
			'AAMI Park',30050,2004,_country.australia,];
    map[_name.newcastlejets] = [ClubColors(Colors.yellow,darkblue),Coordinates(-32.918943, 151.726707182),
			'Hunter Stadium',34000,2000,_country.australia,];
    map[_name.perth] = [ClubColors(Colors.purple,Colors.white),Coordinates(-31.945730, 115.86990),
			'HBF Park Stadium',20500,1995,_country.australia,];
    map[_name.sydney] = [ClubColors(Colors.blue,Colors.white),Coordinates(-33.888853, 151.22556784),
			'Sydney Football Stadium',45500,2004,_country.australia,];
    map[_name.sydneywanderers] = [ClubColors(Colors.red,Colors.black),Coordinates(-33.8079, 150.99936),
			'Parramatta Stadium',20741,2012,_country.australia,];
    map[_name.westernunited] = [ClubColors(Colors.green,Colors.black),Coordinates(-38.157997, 144.355),
			'GMHBA Stadium',26000,2018,_country.australia,];

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    //NORTE AFRICA
    //EGITO
    map[_name.alahly] = [ClubColors(Colors.red,Colors.white),Coordinates(30.069291, 31.31241),
			'Estádio Internacional do Cairo',71400,1907,_country.egypt,[_name.zamalek]];
    map[_name.zamalek] = [ClubColors(Colors.white,Colors.red),Coordinates(30.0693, 31.312),
			'Estádio Internacional do Cairo',71400,1911,_country.egypt,[_name.alahly]];
    map[_name.ismaily] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(30.6010391, 32.27382),
			'Ismaília Stadium',35000,1924,_country.egypt,];
    map[_name.pyramids] = [ClubColors(Colors.blue,Colors.white),Coordinates(30.02028, 31.3737282),
			'Estádio 30 de junho',30000,2008,_country.egypt,];
    //CONGO
    map[_name.mazembe] = [ClubColors(Colors.black,Colors.black),Coordinates(-11.67807733, 27.4899193),
			'Stade TP Mazembe',35000,1939,_country.congoRD,];
    //MOROCCO
    map[_name.rajacasablanca] = [ClubColors(Colors.green,Colors.black),Coordinates(33.582906, -7.6464496),
			'Stade Mohamed V',67000,1949,_country.morocco,[_name.wydad]];
    map[_name.wydad] = [ClubColors(Colors.red,Colors.black),Coordinates(33.582, -7.64647),
			'Stade Mohamed V',67000,1937,_country.morocco,[_name.rajacasablanca]];
    map[_name.farRabat] = [ClubColors(Colors.black,Colors.green),Coordinates(33.959915, -6.8890915),
			'Estádio Príncipe Moulay Abdellah',53000,1958,_country.morocco,];
    map[_name.masfes] = [ClubColors(Colors.yellow,Colors.black),Coordinates(34.0028129, -4.96905145),
      'Complexe Sportif de Fès',45000,1946,_country.morocco,];
    //ALGERIA
    map[_name.essetif] = [ClubColors(Colors.black,Colors.white),Coordinates(36.18707773, 5.39373291788),
			'Estádio 8 de Maio',25000,1958,_country.algeria,];
    map[_name.usmAlger] = [ClubColors(Colors.red,Colors.black),Coordinates(36.80114535, 3.04854982),
			'Omar Hamadi Stadium',15000,1937,_country.algeria,];
    map[_name.kabylie] = [ClubColors(Colors.yellow,Colors.green),Coordinates(36.706899, 4.0560295),
			'Stade 1er Novembre',22000,1946,_country.algeria,];
    //LIBYA
    map[_name.alIttihadLIB] = [ClubColors(Colors.red,Colors.white),Coordinates(32.85989333, 13.1358680),
      'Tripoli Stadium',65000,1944,_country.libya,];
    //TUNISIA
    map[_name.esperance] = [ClubColors(Colors.red,Colors.yellow),Coordinates(36.7477777,10.2727777),
			'Estadio Olímpico de Radès',60500,1919,_country.tunisia,];
    map[_name.etoilesahel] = [ClubColors(Colors.red,Colors.white),Coordinates(35.82355464, 10.6134521),
			'Estádio Olímpico de Sousse',28000,1925,_country.tunisia,];
    map[_name.sfaxien] = [ClubColors(Colors.black,Colors.white),Coordinates(34.73365186, 10.74661154),
			'Estádio Taïeb Mehiri',11000,1928,_country.tunisia,];

    //AFRICA NEGRA
    //AFRICA DO SUL
    map[_name.orlandopirates] = [ClubColors(Colors.black,Colors.black),Coordinates(-26.23098107, 27.92291584),
			'Orlando Stadium',40000,1937,_country.southAfrica,];
    map[_name.capetown] = [ClubColors(Colors.blue,Colors.white),Coordinates(-33.9034463, 18.411186156),
			'Cape Town Stadium',55000,1962,_country.southAfrica,];
    map[_name.kaizer] = [ClubColors(Colors.orange,Colors.black),Coordinates(-26.23449118, 27.98311136),
			'Soccer City',78000,1970,_country.southAfrica,];
    map[_name.mamelodi] = [ClubColors(Colors.yellow,Colors.green),Coordinates(-25.75319343, 28.22302862),
			'Loftus Versfeld',51762,1960,_country.southAfrica,];
    //ANGOLA
    map[_name.petroluanda] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(-8.9699, 13.28365),
			'Estádio Nacional 11 de Novembro',48500,1980,_country.angola,];
    map[_name.agosto] = [ClubColors(Colors.red,Colors.black),Coordinates(-8.969859115, 13.2837),
			'Estádio Nacional 11 de Novembro',48500,1977,_country.angola,];
    //BOTSWANA
    map[_name.gaborone] = [ClubColors(Colors.red,Colors.white),Coordinates(-24.656738811920775, 25.932713780669275),
			'Botswana National Stadium',22500,1967,_country.botswana,];
    //GHANA
    map[_name.asantekotoko] = [ClubColors(Colors.red,Colors.yellow),Coordinates(6.68225260, -1.6050227961297294),
			'Baba Yara Stadium',43000,1935,_country.ghana,];
    map[_name.heartsoak] = [ClubColors(Colors.red,Colors.purple),Coordinates(5.55150373, -0.19180352483104485),
			'Ohene Djan Stadium',40000,1911,_country.ghana,];
    //GUINEA
    map[_name.hafia] = [ClubColors(Colors.green,Colors.white),Coordinates(9.54617954, -13.672815199325122),
			'Stade 28 Septembre',25000,1951,_country.guinea,];
    //MOZAMBIQUE
    map[_name.costaDoSol] = [ClubColors(Colors.yellow,Colors.blue),Coordinates(-25.9413178, 32.61610373),
      'Estádio do Costa do Sol',10000,1955,_country.mozambique,];
    //SENEGAL
    map[_name.jaraaf] = [ClubColors(Colors.white,Colors.green),Coordinates(14.7108854, -17.458191),
      'Demba Diop',20000,1933,_country.senegal];
    map[_name.jeannedarc] = [ClubColors(Colors.white,Colors.blue),Coordinates(14.746812323, -17.45177448),
			'Léopold Sédar Senghor',60000,1923,_country.senegal,];
    //CAMEROON
    map[_name.cotonsport] = [ClubColors(Colors.green,Colors.white),Coordinates(9.32640861, 13.399872815711385),
			'Roumdé Adjia',35000,1986,_country.cameroon,];
    map[_name.canon] = [ClubColors(Colors.red,Colors.white),Coordinates(3.8855102, 11.54057732),
			'Ahmadou Ahidjo',42500,1930,_country.cameroon,];
    //NIGERIA
    map[_name.enyimba] = [ClubColors(Colors.blue,Colors.white),Coordinates(5.125570, 7.379054),
			'Enyimba International',25000,1976,_country.nigeria,];
    map[_name.kano] = [ClubColors(Colors.yellow,Colors.green),Coordinates(11.999726271, 8.52926678),
      'Sani Abacha',25000,1990,_country.nigeria,];
    map[_name.rangersInt] = [ClubColors(Colors.white,Colors.red),Coordinates(6.444346813, 7.496462056),
      'Nnamdi Azikiwe Stadium',22000,1970,_country.nigeria,];
    //IVORY COAST
    map[_name.asecmimosas] = [ClubColors(Colors.yellow,Colors.black),Coordinates(5.32845434, -4.0184311),
			'Stade Robert Champroux',15000,1948,_country.ivorycoast];
    //TANZANIA
    map[_name.simba] = [ClubColors(Colors.red,Colors.white),Coordinates(-6.85384812, 39.273788814),
			'Mkapa Stadium',60000,1936,_country.tanzania];
    //ZAMBIA
    map[_name.zesco] = [ClubColors(Colors.blue,Colors.white),Coordinates(-12.9751432, 28.6115623477193),
			'Levy Mwanawasa',49800,1974,_country.zambia];
    //ZIMBABWE
    map[_name.dynamos] = [ClubColors(Colors.blue,Colors.white),Coordinates(-17.853630, 31.0376418),
			'Rufaro',45500,1963,_country.zimbabwe];
    map[_name.manicaDiamonds] = [ClubColors(Colors.yellow,Colors.black),Coordinates(-18.9968336, 32.6409931),
      'Sakubva',35000,2017,_country.zimbabwe];
    map[_name.platinum] = [ClubColors(Colors.green,Colors.white),Coordinates(-20.306090, 30.0568275),
      'Mandava',15000,1995,_country.zimbabwe];
  }


}