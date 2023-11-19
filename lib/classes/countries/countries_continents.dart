import 'package:fifa/classes/countries/words.dart';

class Continents{

  String americaSul = 'América do Sul';
  String americaNorte = 'América do Norte';
  String europa = 'Europa';
  String asia = 'Ásia';
  String africa = 'África';
  String oceania = 'Oceania';
  String notExist = 'World';

  listContinents(){
    return [americaSul, americaNorte, europa, asia, africa, oceania];
  }

  funcCountryContinents(String country){

    Map continentMap = {
      Words.country.afghanistan: asia,
      Words.country.albania: europa,
      Words.country.angola: africa,
      Words.country.algeria: africa,
      Words.country.andorra: europa,
      Words.country.antiguabarbuda: americaNorte,
      Words.country.argentina: americaSul,
      Words.country.armenia: europa,
      Words.country.aruba: americaNorte,
      Words.country.australia: oceania,
      Words.country.austria: europa,
      Words.country.azerbaijan: europa,
      Words.country.bahrein: asia,
      Words.country.bahamas: americaNorte,
      Words.country.bangladesh: asia,
      Words.country.barbados: americaNorte,
      Words.country.belgium: europa,
      Words.country.belarus: europa,
      Words.country.belize: americaNorte,
      Words.country.benin: africa,
      Words.country.bolivia: americaSul,
      Words.country.bosnia: europa,
      Words.country.botswana: africa,
      Words.country.bulgaria: europa,
      Words.country.burkina: africa,
      Words.country.burundi: africa,
      Words.country.bhoutan: asia,
      Words.country.brunei: asia,
      Words.country.brazil: americaSul,
      Words.country.cameroon: africa,
      Words.country.cambodia: asia,
      Words.country.canada: americaNorte,
      Words.country.capeverde: africa,
      Words.country.centralAfrica: africa,
      Words.country.chad: africa,
      Words.country.china: asia,
      Words.country.chile: americaSul,
      Words.country.colombia: americaSul,
      Words.country.comoros: africa,
      Words.country.congo: africa,
      Words.country.congoRD: africa,
      Words.country.costarica: americaNorte,
      Words.country.cuba: americaNorte,
      Words.country.croatia: europa,
      Words.country.cyprus: europa,
      Words.country.czechrepublic: europa,
      Words.country.denmark: europa,
      Words.country.djibouti: africa,
      Words.country.dominica: americaNorte,
      Words.country.dominicanRepublic: americaNorte,
      Words.country.ecuador: americaSul,
      Words.country.egypt: africa,
      Words.country.elsalvador: americaNorte,
      Words.country.england: europa,
      Words.country.ethiopia: africa,
      Words.country.eritrea: africa,
      Words.country.estonia: europa,
      Words.country.faroe: europa,
      Words.country.fiji: oceania,
      Words.country.finland: europa,
      Words.country.france: europa,
      Words.country.gambia: africa,
      Words.country.gabon: africa,
      Words.country.georgia: europa,
      Words.country.gibraltar: europa,
      Words.country.ghana: africa,
      Words.country.germany: europa,
      Words.country.grenada: americaNorte,
      Words.country.greece: europa,
      Words.country.guatemala: americaNorte,
      Words.country.guyana: americaNorte,
      Words.country.guinea: africa,
      Words.country.guineaEquatorial: africa,
      Words.country.guineabissau: africa,
      Words.country.haiti: americaNorte,
      Words.country.honduras: americaNorte,
      Words.country.hongkong: asia,
      Words.country.hungary: europa,
      Words.country.iceland: europa,
      Words.country.italy: europa,
      Words.country.india: asia,
      Words.country.indonesia: asia,
      Words.country.iraq: asia,
      Words.country.iran: asia,
      Words.country.ireland: europa,
      Words.country.israel: europa,
      Words.country.ivorycoast: africa,
      Words.country.japan: asia,
      Words.country.jamaica: americaNorte,
      Words.country.jordan: asia,
      Words.country.kazakhstan: europa,
      Words.country.kenya: africa,
      Words.country.kiribati: oceania,
      Words.country.kosovo: europa,
      Words.country.kuwait: asia,
      Words.country.kyrgyzstan: asia,
      Words.country.laos: asia,
      Words.country.latvia: europa,
      Words.country.lebanon: asia,
      Words.country.lesoto: africa,
      Words.country.libya: africa,
      Words.country.liechtenstein: europa,
      Words.country.lithuania: europa,
      Words.country.liberia: africa,
      Words.country.luxembourg: europa,
      Words.country.macedonia: europa,
      Words.country.madagascar: africa,
      Words.country.malaysia: asia,
      Words.country.maldives: asia,
      Words.country.mali: africa,
      Words.country.malawi: africa,
      Words.country.malta: europa,
      Words.country.mauritania: africa,
      Words.country.mauritius: africa,
      Words.country.mexico: americaNorte,
      Words.country.micronesia: oceania,
      Words.country.moldova: europa,
      Words.country.monaco: europa,
      Words.country.montenegro: europa,
      Words.country.mongolia: asia,
      Words.country.morocco: africa,
      Words.country.mozambique: africa,
      Words.country.myanmar: asia,
      Words.country.namibia: africa,
      Words.country.nauru: oceania,
      Words.country.netherlands: europa,
      Words.country.nepal: asia,
      Words.country.nicaragua: americaNorte,
      Words.country.niger: africa,
      Words.country.nigeria: africa,
      Words.country.newzealand: oceania,
      Words.country.norway: europa,
      Words.country.northKorea: asia,
      Words.country.northernIreland: europa,
      Words.country.oman: asia,
      Words.country.pakistan: asia,
      Words.country.palestine: asia,
      Words.country.panama: americaNorte,
      Words.country.papua: oceania,
      Words.country.paraguay: americaSul,
      Words.country.peru: americaSul,
      Words.country.poland: europa,
      Words.country.portugal: europa,
      Words.country.puertoRico: americaNorte,
      Words.country.philippines: asia,
      Words.country.qatar: asia,
      Words.country.romania: europa,
      Words.country.russia: europa,
      Words.country.rwanda: africa,
      Words.country.sanMarino: europa,
      Words.country.samoa: oceania,
      Words.country.senegal: africa,
      Words.country.serbia: europa,
      Words.country.scotland: europa,
      Words.country.seychelles: africa,
      Words.country.sierraLeone: africa,
      Words.country.singapore: asia,
      Words.country.slovakia: europa,
      Words.country.slovenia: europa,
      Words.country.somalia: africa,
      Words.country.saudiarabia: asia,
      Words.country.southafrica: africa,
      Words.country.southkorea: asia,
      Words.country.spain: europa,
      Words.country.sweden: europa,
      Words.country.switzerland: europa,
      Words.country.syria: asia,
      Words.country.stKitts: americaNorte,
      Words.country.stLucia: americaNorte,
      Words.country.srilanka: asia,
      Words.country.sudan: africa,
      Words.country.suriname: americaNorte,
      Words.country.taiwan: asia,
      Words.country.tahiti: oceania,
      Words.country.timor: oceania,
      Words.country.tajikistan: asia,
      Words.country.tanzania: africa,
      Words.country.thailand: asia,
      Words.country.trinidadtobago: americaNorte,
      Words.country.togo: africa,
      Words.country.tonga: oceania,
      Words.country.tunisia: africa,
      Words.country.turkey: europa,
      Words.country.turkmenistan: asia,
      Words.country.uganda: africa,
      Words.country.ukraine: europa,
      Words.country.uae: asia,
      Words.country.unitedstates: americaNorte,
      Words.country.uruguay: americaSul,
      Words.country.uzbekistan: asia,
      Words.country.venezuela: americaSul,
      Words.country.vietnam: asia,
      Words.country.wales: europa,
      Words.country.yemen: asia,
      Words.country.zambia: africa,
      Words.country.zimbabwe: africa,
    };

    if(continentMap.containsKey(country)){
      return continentMap[country];
    }else{
      return notExist;
    }

  }


}
