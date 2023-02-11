tryCatchCreateMap(Map map, dynamic variable, dynamic initValue){
    var x = map[variable];
    if(x == null){
      map[variable] = initValue;
    }
}
tryCatchCreateMap2(Map map, dynamic variable,dynamic variable2,dynamic initValue){
  tryCatchCreateMap(map,variable,{});
  var x = map[variable][variable2];
  if(x == null){
    map[variable][variable2] = initValue;
  }
}