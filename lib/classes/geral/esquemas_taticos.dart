import 'package:fifa/global_variables.dart';

class EsquemaTatico{
  String e442 = '4-4-2';
  String e433 = '4-3-3';
  String e451 = '4-5-1';
  String e343 = '3-4-3';
  String meuEsquema = globalMyEsquemaTatico;

  changeMyEsquema(){
    if(globalMyEsquemaTatico==e442){globalMyEsquemaTatico = e433;}
    else if(globalMyEsquemaTatico==e433){globalMyEsquemaTatico = e343;}
    else if(globalMyEsquemaTatico==e343){globalMyEsquemaTatico = e451;}
    else if(globalMyEsquemaTatico==e451){globalMyEsquemaTatico = e442;}
  }

}
