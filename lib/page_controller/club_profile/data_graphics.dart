import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/historic_champions.dart';
import 'package:fifa/values/league_divisions.dart';

class ClassificationData {
  ClassificationData(this.year, this.position);

  final double year;
  final int position;
}

class DataGraphics{

  int nTitulos = 0;
  int n2ndivision = 0;
  int g4Years = 0;
  int averagePosition = 0;
  int currentPosition = 0;
  double points = 0;
  List<ClassificationData> data=[];
  List<ClassificationData> dataInternational=[];

  getData(Club club){
    //Posição Ano Atual
    currentPosition = Classification(leagueIndex: club.leagueID).getClubPosition(club.index);
    //novas temporadas ligas
    defineSimulationClassification(club);
    //historico de campeoes ligas
    defineHistoricClassification(club);

    //historico internacional
    defineHistoricInternational(club);

    averagePositionCount(data.take(10).toList());

    calculatePoints();
  }

  defineHistoricInternational(Club club){

    //para cada ano
    for(var keyYear in mapChampions(club.internationalLeagueName).keys) {
      List classificationNames = mapChampions(club.internationalLeagueName)[keyYear];
      //verifica se naquele ano tem o time
      int position = 32;
      if(classificationNames.contains(club.name)){
        position = classificationNames.indexOf(club.name) + 1;
      }
      dataInternational.add(ClassificationData(keyYear, position));
    }

  }


  defineSimulationClassification(Club club){
    //Posição anos simulados
    for(double year=ano-1; year>=anoInicial; year--){
      try {
        int position = HistoricFunctions().funcHistoricListFromClubID(year.toInt(), club.leagueName, club.index);
        data.add(ClassificationData(year, position));
        addTitlesCount(position);
        addG4Count(position);
        add2ndDivisionCount(position);
      }catch(e){
        data.add(ClassificationData(year, 21));
        add2ndDivisionCount(21);
      }
    }
  }
  defineHistoricClassification(Club club){

    //NOME DAS DIVISÕES
    List<String> divisionLeagueNames = Divisions().leagueDivisionsStructure(club.leagueName);
    //MAPA COM O HISTÓRICO DE CLASSIFICAÇÃO DE CADA DIVISÃO
    List<Map<double,dynamic>> listDivisionsHistoricResults = [];
    for( String division in divisionLeagueNames){
        listDivisionsHistoricResults.add(mapChampions(division));
    }

    //PARA CADA ANO VERIFICA SE O TIME PERTENCE A AQUELA DIVISÃO
    for(double year in listDivisionsHistoricResults.first.keys) {
      bool yearSet = false;
      int divisionNumber = 0;
      for (Map<double,dynamic> divisionMapResults in listDivisionsHistoricResults) {
        if (!yearSet) {
          divisionNumber++;
          try {
            if (divisionMapResults[year].contains(club.name)) {
              int position = divisionMapResults[year].indexOf(club.name) + 1 + (divisionNumber - 1) * 20;
              data.add(ClassificationData(year, position));
              addTitlesCount(position);
              addG4Count(position);
              add2ndDivisionCount(position);
              yearSet = true;
            }
        }catch(e){
            //print('divisão sem informações do campeonato naquele ano');
        }
      }
        //Se após checar todas as divisões ele ainda nao tem classificação
        if(!yearSet && listDivisionsHistoricResults.last == divisionMapResults){
          //SE A ÚLTIMA DIVISÃO TIVER UM MAPA COM O HISTÓRICO DE RESULTADOS
          if(listDivisionsHistoricResults.last.isNotEmpty){
            data.add(ClassificationData(year, listDivisionsHistoricResults.length*20+1));
            add2ndDivisionCount(listDivisionsHistoricResults.length*20+1);
            yearSet = true;
          }else{
            data.add(ClassificationData(year, (listDivisionsHistoricResults.length-1)*20+1));
            add2ndDivisionCount((listDivisionsHistoricResults.length-1)*20+1);
            yearSet = true;
          }
        }
    }
    }


    //SE NÃO TEM DADOS
    ifHistoricDataDontExist(data);
  }

  ifHistoricDataDontExist(List<ClassificationData> data){
    //CRIA UM ARRAY COM VALORES NEUTROS PARA MOSTRAR ALGUM GRAFICO
    if(data.isEmpty){
      for(double year=1; year<10; year++) {
        data.add(ClassificationData(anoInicial - year, 21));
      }
    }
  }

  addTitlesCount(int position){
    if(position == 1){
      nTitulos ++;
    }
  }
  add2ndDivisionCount(int position){
    if(position >= 21){
      n2ndivision ++;
    }
  }
  addG4Count(int position){
    if(position <= 4){
      g4Years ++;
    }
  }

  averagePositionCount(List<ClassificationData> dataLast10Years){
    averagePosition=0;
    for(ClassificationData data in dataLast10Years){
      averagePosition += data.position;
    }
    averagePosition = (averagePosition/10).round();
  }

  calculatePoints(){
    for(ClassificationData classificationData in data){
      points += classificationData.position;
    }
    //Compensa anos sem data
    if(data.length<60){
      int yearsWithoutData = 60- data.length ;
      points += 25 * yearsWithoutData;
    }

    points = 3000 - points;
  }

}
