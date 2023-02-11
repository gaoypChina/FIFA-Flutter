import 'package:fifa/global_variables.dart';

class EsquemaTatico{
  String e442 = '4-4-2';
  String e433 = '4-3-3';
  String e451 = '4-5-1';
  String e343 = '3-4-3';
  String e541 = '5-4-1';
  String meuEsquema = globalMyEsquemaTatico;
  List esquemasTaticos = [];

  EsquemaTatico(){
    esquemasTaticos = [e442,e433,e451,e343,e541];
  }

  changeMyEsquema(){
    int indexOf = esquemasTaticos.indexOf(globalMyEsquemaTatico);
    if(indexOf < esquemasTaticos.length-1){
      globalMyEsquemaTatico = esquemasTaticos[indexOf+1];
    }else{
      globalMyEsquemaTatico = esquemasTaticos[0];
    }
  }

  Map getMyPositionsMap(){
    return positions[globalMyEsquemaTatico];
  }

  Map getPositionsMap(){
    return positions[e442];
  }

}
