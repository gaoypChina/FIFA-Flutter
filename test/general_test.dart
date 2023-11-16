
import 'dart:convert';

import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Testes', (){

    test('Json Encode', () {
      List<int> myPlayers = [1,3,52,5,23,54,76];
      List list = json.decode(myPlayers.toString());
      expect(list, myPlayers);
    });

    test('Teste Mundial Map', () {
      Map global = {'Mundial':{}};
      global['Mundial'][2012] = ['oi','boi'];
      global['Mundial'][2013] = ['oi','boi'];
    });

    test('Teste map Names', () {
      void printQuotedMap(String leagueName, [int indentation = 0]) {
        Map map = {leagueName: mapChampions(leagueName)};

        String indent = '    ' * indentation; // Adjust the indentation as needed

        map.forEach((key, value) {
          print('$indent"$key": {');
          value.forEach((innerKey, innerValue) {
            print('$indent  "$innerKey": [');
            innerValue.forEach((item) {
              bool isLast = item == innerValue.last;
              print('$indent    "$item"${isLast ? '' : ','}');
            });
            print('$indent  ],');
          });
          print('$indent},');
        });
      }
      LeagueOfficialNames l = LeagueOfficialNames();

      printQuotedMap(l.belgica);

    });

  });
}


/*

      printQuotedMap(l.andorra);
      printQuotedMap(l.austria);
      printQuotedMap(l.belgica);
      printQuotedMap(l.dinamarca);
      printQuotedMap(l.escocia);
      printQuotedMap(l.estonia);
      printQuotedMap(l.finlandia);
      printQuotedMap(l.gibraltar);
      printQuotedMap(l.ilhasfaroe);
      printQuotedMap(l.irlanda);
      printQuotedMap(l.irlandanorte);
      printQuotedMap(l.islandia);
      printQuotedMap(l.israel);
      printQuotedMap(l.letonia);
      printQuotedMap(l.lituania);
      printQuotedMap(l.liechtenstein);
      printQuotedMap(l.luxemburgo);
      printQuotedMap(l.malta);
      printQuotedMap(l.paisgales);
      printQuotedMap(l.polonia);
      printQuotedMap(l.saomarino);
      printQuotedMap(l.suecia);
      printQuotedMap(l.suica);

      printQuotedMap(l.armenia);
      printQuotedMap(l.azerbaijao);
      printQuotedMap(l.belarus);
      printQuotedMap(l.bosnia);
      printQuotedMap(l.bulgaria);
      printQuotedMap(l.chipre);
      printQuotedMap(l.croacia);
      printQuotedMap(l.eslovaquia);
      printQuotedMap(l.eslovenia);
      printQuotedMap(l.georgia);
      printQuotedMap(l.grecia);
      printQuotedMap(l.hungria);
      printQuotedMap(l.kosovo);
      printQuotedMap(l.macedonia);
      printQuotedMap(l.moldova);
      printQuotedMap(l.montenegro);
      printQuotedMap(l.reptcheca);
      printQuotedMap(l.romenia);
      printQuotedMap(l.russia);
      printQuotedMap(l.servia);
      printQuotedMap(l.turquia);

      printQuotedMap(l.coreiaSul);
      printQuotedMap(l.japao);
      printQuotedMap(l.china);
      printQuotedMap(l.bangladesh);
      printQuotedMap(l.brunei);
      printQuotedMap(l.butao);
      printQuotedMap(l.camboja);
      printQuotedMap(l.cingapura);
      printQuotedMap(l.coreiaNorte);
      printQuotedMap(l.filipinas);
      printQuotedMap(l.hongkong);
      printQuotedMap(l.india);
      printQuotedMap(l.indonesia);
      printQuotedMap(l.laos);
      printQuotedMap(l.malasia);
      printQuotedMap(l.maldivas);
      printQuotedMap(l.myanmar);
      printQuotedMap(l.mongolia);
      printQuotedMap(l.nepal);
      printQuotedMap(l.srilanka);
      printQuotedMap(l.tailandia);
      printQuotedMap(l.taiwan);
      printQuotedMap(l.vietna);

      printQuotedMap(l.afeganistao);
      printQuotedMap(l.arabia);
      printQuotedMap(l.bahrein);
      printQuotedMap(l.eau);
      printQuotedMap(l.libano);
      printQuotedMap(l.iemen);
      printQuotedMap(l.iraque);
      printQuotedMap(l.iran);
      printQuotedMap(l.jordania);
      printQuotedMap(l.kuwait);
      printQuotedMap(l.qatar);
      printQuotedMap(l.oman);
      printQuotedMap(l.paquistao);
      printQuotedMap(l.siria);


      printQuotedMap(l.australia);
      printQuotedMap(l.novazelandia);
      printQuotedMap(l.fiji);
      printQuotedMap(l.papua);
      printQuotedMap(l.samoa);
      printQuotedMap(l.taiti);
      printQuotedMap(l.timor);


      printQuotedMap(l.argelia);
      printQuotedMap(l.egito);
      printQuotedMap(l.libia);
      printQuotedMap(l.marrocos);
      printQuotedMap(l.tunisia);

      printQuotedMap(l.africaSul);
      printQuotedMap(l.angola);
      printQuotedMap(l.benin);
      printQuotedMap(l.botswana);
      printQuotedMap(l.burkina);
      printQuotedMap(l.burundi);
      printQuotedMap(l.caboverde);
      printQuotedMap(l.camaroes);
      printQuotedMap(l.centralAfrica);
      printQuotedMap(l.chade);
      printQuotedMap(l.comores);
      printQuotedMap(l.congo);
      printQuotedMap(l.congoRD);
      printQuotedMap(l.costamarfim);
      printQuotedMap(l.djibouti);
      printQuotedMap(l.eritreia);
      printQuotedMap(l.eswatini);
      printQuotedMap(l.etiopia);
      printQuotedMap(l.gabao);
      printQuotedMap(l.gambia);
      printQuotedMap(l.gana);
      printQuotedMap(l.guine);
      printQuotedMap(l.guinebissau);
      printQuotedMap(l.guineequatorial);
      printQuotedMap(l.lesoto);
      printQuotedMap(l.liberia);
      printQuotedMap(l.malawi);
      printQuotedMap(l.mali);
      printQuotedMap(l.mauricio);
      printQuotedMap(l.mauritania);
      printQuotedMap(l.niger);
      printQuotedMap(l.nigeria);
      printQuotedMap(l.madagascar);
      printQuotedMap(l.mocambique);
      printQuotedMap(l.quenia);
      printQuotedMap(l.ruanda);
      printQuotedMap(l.saotome);
      printQuotedMap(l.senegal);
      printQuotedMap(l.serraleoa);
      printQuotedMap(l.seychelles);
      printQuotedMap(l.somalia);
      printQuotedMap(l.sudao);
      printQuotedMap(l.sudaosul);
      printQuotedMap(l.tanzania);
      printQuotedMap(l.togo);
      printQuotedMap(l.uganda);
      printQuotedMap(l.zambia);
      printQuotedMap(l.zimbabwe);


      printQuotedMap(l.mundial);
      printQuotedMap(l.championsLeague);
      printQuotedMap(l.europaLeagueOficial);
      printQuotedMap(l.conferenceLeague);
      printQuotedMap(l.libertadores);
      printQuotedMap(l.copaSulAmericana);
      printQuotedMap(l.concacaf);
      printQuotedMap(l.africa);
      printQuotedMap(l.asia);


      printQuotedMap(l.englandCup);
      printQuotedMap(l.franceCup);
      printQuotedMap(l.italyCup);
      printQuotedMap(l.spainCup);
      printQuotedMap(l.germanyCup);
      printQuotedMap(l.portugalCup);
      printQuotedMap(l.netherlandsCup);
      printQuotedMap(l.belgiumCup);
      printQuotedMap(l.russiaCup);
      printQuotedMap(l.turkeyCup);
      printQuotedMap(l.brazilCup);
      printQuotedMap(l.argentinaCup);
      printQuotedMap(l.mexicoCup);


      printQuotedMap(l.paulistao);
      printQuotedMap(l.carioca);
      printQuotedMap(l.mineiro);
      printQuotedMap(l.es);
      printQuotedMap(l.rs);
      printQuotedMap(l.sc);
      printQuotedMap(l.parana);
      printQuotedMap(l.df);
      printQuotedMap(l.ms);
      printQuotedMap(l.mt);
      printQuotedMap(l.goias);
      printQuotedMap(l.to);
      printQuotedMap(l.alagoas);
      printQuotedMap(l.bahia);
      printQuotedMap(l.ceara);
      printQuotedMap(l.maranhao);
      printQuotedMap(l.paraiba);
      printQuotedMap(l.pernambuco);
      printQuotedMap(l.piaui);
      printQuotedMap(l.potiguar);
      printQuotedMap(l.sergipe);
      printQuotedMap(l.acre);
      printQuotedMap(l.amapa);
      printQuotedMap(l.amazonas);
      printQuotedMap(l.para);
      printQuotedMap(l.rondonia);
      printQuotedMap(l.roraima);


      printQuotedMap(l.rioSP);
      printQuotedMap(l.latina);
      printQuotedMap(l.mitropa);
      printQuotedMap(l.cupwinners);
      printQuotedMap(l.copaNordeste);
      printQuotedMap(l.copaVerde);
      printQuotedMap(l.pequenaTaca);
      printQuotedMap(l.balkansCup);
      printQuotedMap(l.balticleague);
      printQuotedMap(l.arabcup);

      printQuotedMap(l.copamundo);
      printQuotedMap(l.copaconfederacoes);
      printQuotedMap(l.eurocopa);
      printQuotedMap(l.copaamerica);
      printQuotedMap(l.copaasia);
      printQuotedMap(l.copaafrica);
      printQuotedMap(l.copaconcacaf);
      printQuotedMap(l.copamundoFem);


      printQuotedMap(l.recopaeuropa);
      printQuotedMap(l.recopasula);
      printQuotedMap(l.recopabrasil);
 */