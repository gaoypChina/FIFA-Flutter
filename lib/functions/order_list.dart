
class Order{

changeVariables(var a, var b){
  late var aux = a; a=b; b=aux;
  return [a,b];
}

listDecrescente({required List listA,required List listB,required int length}){
  dynamic help;
  for(int i=0;i<length;i++){
    for(int k=i;k<length;k++){
      if(listA[i]<listA[k]){
        help = listA[i];listA[i] = listA[k];listA[k] = help;
        help = listB[i];listB[i] = listB[k];listB[k] = help;
      }
    }
  }
  return [listA,listB];
}
listCrescente({required List listA,required List listB,required int length}){
  dynamic help;
  for(int i=0;i<length;i++){
    for(int k=i;k<length;k++){
      if(listA[i]>listA[k]){
        help = listA[i];listA[i] = listA[k];listA[k] = help;
        help = listB[i];listB[i] = listB[k];listB[k] = help;
      }
    }
  }
  return [listA,listB];
}

}
