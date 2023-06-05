Stopwatch timeStart(){
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  return stopwatch;
}

void timeEnd(Stopwatch stopwatch){
  stopwatch.stop();
  print('Execution time: ${stopwatch.elapsedMilliseconds} milliseconds');
}