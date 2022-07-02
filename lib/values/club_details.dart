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
    String clubName = '';
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


    mapDetails[_name.barnsley] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.blackpool] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.bradford] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.brentford] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.bolton] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.bristol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.cardiffCity] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.coventry] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.charlton] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.grimsby] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.huddersfield] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.ipswichTown] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.luton] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.millwall] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.notts] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.oxford] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.peterborough] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.portsmouth] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.plymouth] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.prestonNorthEnd] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.rotherham] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.shrewsbury] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.sheffieldWednesday] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.sunderland] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.swindon] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.wigan] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};
    mapDetails[_name.wimbledon] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Vicarage Road',21577,1881,[_name.luton]};


    mapDetails[_name.atalanta] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bologna] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cagliari] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fiorentina] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.genoa] = {ClubColors(Colors.red,darkblue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.inter] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.juventus] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.milan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lazio] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.napoli] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.parma] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.roma] = {ClubColors(Colors.deepOrange,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sampdoria] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sassuolo] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.torino] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.udinese] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.ascoli] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bari] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.benevento] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brescia] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.catania] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cesena] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.como] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cremonese] = {ClubColors(Colors.red,Colors.grey),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chievo] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.crotone] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.empoli] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.foggia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.frosinone] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hellasVerona] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lecce] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.monza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.palermo] = {ClubColors(Colors.purpleAccent,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.piacenza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.perugia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pisa] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.reggina] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.salernitana] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.spal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.spezia] = {ClubColors(Colors.grey,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.venezia] = {ClubColors(Colors.green,Colors.orange),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vicenza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.athleticbilbao] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticomadrid] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.barcelona] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.celtavigo] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.espanyol] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.getafe] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.osasuna] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lacoruna] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.levante] = {ClubColors(grena,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realbetis] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realmadrid] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realsociedad] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sevilla] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valladolid] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valencia] = {ClubColors(Colors.white,Colors.orange),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.villareal] = {ClubColors(Colors.yellow,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.alaves] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.albacete] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.almeria] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alcorcon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticomadridB] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.barcelonaB] = {ClubColors(grena,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.badajoz] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.burgos] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cadiz] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cartagena] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.compostela] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cordoba] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.eibar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.elche] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.extremadura] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.girona] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tarragona] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.granada] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hercules] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huelva] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huesca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ibiza] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lasPalmas] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.leganes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.malaga] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mallorca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.merida] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.murcia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.numancia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rayoVallecano] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realmadridB] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.salamanca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sportingGijon] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tenerife] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.toledo] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realOviedo] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.xerez] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zaragoza] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.moenchengladbach] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dortmund] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bayernmunique] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.leverkusen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.eintrachtfrankfurt] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.augsburg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.freiburg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hamburgo] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.colonia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.herthaberlim] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hoffenheim] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rbleipzig] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.schalke04] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.stuttgart] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.werderbremen] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wolfsburg] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.aachen] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.arminiaBiefeld] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.berliner] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bochum] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.darmstadt] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.duisburg] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dynamoDresden] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.erzgebirgeaue] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.energieCottbus] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.eintrachtBraunschweiger] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fortunaDusseldorf] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hannover96] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hansaRostock] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.greutherFurth] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.karlsruher] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kaiserslautern] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.magdeburg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mainz05] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.munique1860] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.neunkirchen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nurnberg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.oberhausen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.paderborn] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.uerdigen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rotWeissEssen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saarbrucken] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.unionBerlin] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vorwarts] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.stPauli] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.bordeaux] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lille] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lyon] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.monaco] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.montpellier] = {ClubColors(Colors.blue,Colors.orange),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nantes] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nice] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.om] = {ClubColors(Colors.blueAccent,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.psg] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.reims] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rennes] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saintetienne] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.metz] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.ajaccio] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.angers] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.auxerre] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bastia] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brest] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.caen] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.clermont] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dijon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guingamp] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lens] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lorient] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nancy] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nimes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.parisFC] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.redstar] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rouen] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sedan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sochaux] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.strasbourg] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.toulouse] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.troyes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valenciennes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.benfica] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.porto] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sporting] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.arouca] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.beiramar] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.braga] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.boavista] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.belenenses] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chaves] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.coimbra] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.estoril] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.estrelaamadora] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.famalicao] = {ClubColors(Colors.blue,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.farense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.gilVicente] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.leixoes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.maritimo] = {ClubColors(Colors.green,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.moreirense] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nacionalMadeira] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pacosDeFerreira] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.portimonense] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.olhanense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rioAve] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.salgueiros] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.santaClara] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.uniaoLeiria] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.tondela] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.viseu] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vizela] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.vitoriaguimaraes] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vitoriaSetubal] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.ajax] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.feyenoord] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.psv] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.azAlkmaar] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.twente] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.utrecht] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.vitesse] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.heerenveen] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.spartarotterdam] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.willem] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dws] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rapidjc] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    


    mapDetails[_name.anderlecht] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brugge] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.standardliege] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.genk] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gent] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lierse] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.royalAntwerp] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mechelen] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.charleroi] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.beveren] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.molenbeek] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //ESCOCIA
    mapDetails[_name.celtic] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rangers] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aberdeen] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.dundee] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hibernian] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.rosenborg] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.molde] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lillestrom] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.valerenga] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    //SUECIA
    mapDetails[_name.aik] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atvidabergs] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.djurgarden] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.elfsborg] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.hammarby] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.helsingborg] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kalmar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ifkgoteborg] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lyn] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.malmo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.basel] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.youngBoys] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zurich] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.grasshoppers] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.galatasaray] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fenerbahce] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.besiktas] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.olympiacos] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aek] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.paok] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.panathinaikos] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aris] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.zenit] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cska] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.spartakmoscou] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.krasnodar] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.estrelavermelha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.spartapraga] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.slaviaPraha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
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
    mapDetails[_name.atleticomg] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticopr] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bahia] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.botafogo] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.corinthians] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cruzeiro] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.flamengo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.fluminense] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gremio] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.goias] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.internacional] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.palmeiras] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santos] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saopaulo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.sport] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vasco] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.americamg] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticogo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cuiaba] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chapecoense] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bragantino] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ceara] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.coritiba] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.criciuma] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.figueirense] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fortaleza] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guarani] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.juventude] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nautico] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.parana] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pontepreta] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vitoria] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    

    mapDetails[_name.abc] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.avai] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bangu] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.americaRJ] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.americaRN] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.anapolina] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.botafogoPB] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.botafogoSP] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brasilia] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brasiliense] = {ClubColors(Colors.yellow,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.brasilPelotas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.brusque] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.campinense] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.central] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.comercial] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.confianca] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.caxias] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.crb] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.csa] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gremioNovorizontino] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ferroviaria] = {ClubColors(grena,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gama] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.goiania] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.goytacaz] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ibis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.interLimeira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ipatinga] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.ituano] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.joinville] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
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
    mapDetails[_name.paysandu] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.paulista] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.portuguesa] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.remo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.riverPI] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.rionegro] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santacruz] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sampaio] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santoandre] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saobento] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saocaetano] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.saoraimundo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sergipe] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tiradentes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tombense] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.treze] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tunaluso] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tupi] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.vilanova] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.voltaredonda] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.xvpiracicaba] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.xvjau] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};


    ///////////////////////////////////////////////
    mapDetails[_name.aldosivi] = {ClubColors(Colors.green,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.almagro] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.allboys] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.atleticoTucuman] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.argentinojuniors] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.arsenalsarandi] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.banfield] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.belgrano] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bocajuniors] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.centralCordoba] = {ClubColors(Colors.grey,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chacarita] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};     
    mapDetails[_name.colon] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.defensayjusticia] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.estudiantes] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ferro] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.gimnasia] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.godoycruz] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huracan] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.independiente] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lanus] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.newells] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.nuevachicago] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.patronato] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.platense] = {ClubColors(Colors.grey,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.quilmes] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.racing] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.riverplate] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rosariocentral] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sanlorenzo] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sanmartin] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.talleres] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.temperley] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tigre] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.unionSantaFe] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.velezsarsfield] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.penarol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nacional] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.bellavista] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cerrouru] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.danubio] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.defensor] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fenix] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.montevideo] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.progreso] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rentista] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.riverURU] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rocha] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wanderers] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.olimpia] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cerroporteno] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.libertad] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guaraniPAR] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nacionalPAR] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.colegiales] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.luqueno] = {ClubColors(Colors.blue,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.octubre] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.soldeamerica] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tacuary] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.colocolo] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lau] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.univcatolica] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.palestino] = {ClubColors(Colors.red,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.huachipato] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
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

    mapDetails[_name.alianzalima] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sportingcristal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cienciano] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.universitario] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.melgar] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
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

    mapDetails[_name.bolivar] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.theStrongest] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alwaysReady] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aurora] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.blooming] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depmunicipal] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.guabira] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.octubre31] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.orientePetrolero] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sanJoseBOL] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.realpotosi] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sucre] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.barcelonaequ] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.emelec] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ldu] = {ClubColors(Colors.white,Colors.grey),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.idelvalle] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.elnacional] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
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

    mapDetails[_name.caracas] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.laGuaira] = {ClubColors(Colors.white,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.deportivoTachira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.estudiantesmerida] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ula] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.maracaibo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depgalicia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depitalia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.deplara] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.estudiantesmerida] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
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
    mapDetails[_name.zamora] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.zulia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 

    mapDetails[_name.americadecali] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.atleticonacional] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.deportivocali] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.junior] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.imedellin] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.oncecaldas] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.millonarios] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.santafe] = {ClubColors(Colors.white,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tolima] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.bucaramanga] = {ClubColors(Colors.white,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.boyaca] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.cucuta] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.depPasto] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.huila] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.laequidad] = {ClubColors(Colors.white,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};

    //////////////////////////////////////////////////////////////////////////////////
    //MÉXICO
    mapDetails[_name.atlas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.atlante] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.americamex] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.celaya] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chivasguadalajara] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cruzazul] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.jaguares] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.juarez] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.leon] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.leonesNegros] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.monterrey] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.morelia] = {ClubColors(Colors.yellow,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.necaxa] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pachuca] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.puebla] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pumas] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.queretaro] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sanluis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.santosLaguna] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.tigres] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.toluca] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.tijuana] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    //USA
    mapDetails[_name.atlanta] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.minnesota] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.columbuscrew] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.chicago] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.colorado] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.dcunited] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.fcdallas] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.houston] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.lagalaxy] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.losangelesfc] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.montreal] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};    
    mapDetails[_name.nerevolution] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.nycity] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.nyredbulls] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.orlando] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.portland] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};       
    mapDetails[_name.seattle] = {ClubColors(Colors.purple,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.intermiami] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};  
    mapDetails[_name.philadelphia] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};      
    mapDetails[_name.torontofc] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};      
    mapDetails[_name.realSaltLake] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.sanJoseEarthquakes] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.sportingKansasCity] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.vancouver] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //////////////////////////////////////////////////////////////////////////////////
    mapDetails[_name.evergrande] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.beijingguoan] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.shandongluneng] = {ClubColors(Colors.orange,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.shanghaisipg] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.kashimaantlers] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.urawareddiamonds] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.visselkobe] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kawasakifrontale] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.fcTokyo] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cerezoOsaka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.gambaOsaka] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.kashiwaReysol] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.yokohamaMarinos] = {ClubColors(Colors.red,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.jeonbuk] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.pohang] = {ClubColors(Colors.grey,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ulsan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.fcSeoul] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 
    mapDetails[_name.suwonSamsung] = {ClubColors(Colors.blue,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.ulsan] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,}; 

    //ORIENTE MÉDIO
    mapDetails[_name.alsadd] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alduhail] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.aljazira] = {ClubColors(Colors.white,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alain] = {ClubColors(Colors.purple,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alWahda] = {ClubColors(grena,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alhilal] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alnassr] = {ClubColors(Colors.yellow,Colors.blue),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alIttihad] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alShabab] = {ClubColors(Colors.white,Colors.orange),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.alahli] = {ClubColors(Colors.green,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};

    mapDetails[_name.persepolis] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.melbourneVictory] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.sydney] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.buriramUnited] = {ClubColors(Colors.blue,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};

    //////////////////////////////////////////////////////////////////////////
    //AFRICA
    mapDetails[_name.alahly] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.zamalek] = {ClubColors(Colors.black,Colors.red),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mazembe] = {ClubColors(Colors.black,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.rajacasablanca] = {ClubColors(Colors.green,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.wydad] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.orlandoPirates] = {ClubColors(Colors.black,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.kaizer] = {ClubColors(Colors.orange,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.esperance] = {ClubColors(Colors.red,Colors.yellow),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.mamelodi] = {ClubColors(Colors.yellow,Colors.green),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.agosto] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.usmAlger] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.etoileSahel] = {ClubColors(Colors.red,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.esSetif] = {ClubColors(Colors.black,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.cotonsport] = {ClubColors(Colors.red,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.enyimba] = {ClubColors(Colors.blue,Colors.white),Coordinates(0,0),'Estádio',10000,1900,};
    mapDetails[_name.asecMimosas] = {ClubColors(Colors.yellow,Colors.black),Coordinates(0,0),'Estádio',10000,1900,};
  }


}