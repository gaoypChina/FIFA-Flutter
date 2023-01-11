import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class Expectativa{
  String expInternacional = '';
  late int expectativaNacional;
  late int expLastYear;

  Expectativa(My my){
    setVariables(my);
  }

  setVariables(My my){
    expLastYear = my.getLastYearExpectativa();
    expectativaNacional = my.getLastYearExpectativa();

    if(leaguePlayInternationalCompetition(my.getLeagueName())){
      if(expectativaNacional <= 2){ expInternacional = Name().semifinal; }
      else if(expectativaNacional < 4){ expInternacional = Name().quartas; }
      else if(expectativaNacional < 6){ expInternacional = Name().oitavas; }
      else if(expectativaNacional < 10){ expInternacional = Name().qualify; }
    }
  }

  changeExpectativaGlobally({required int newValue,required My my}){
    globalMyExpectativa = newValue;
    setVariables(my);
  }

}
