

class MyLastMatchResult{

  late int clubIDmy;
  late int clubIDadv;
  late int goalMy;
  late int goalAdv;
  late int victoryDrawLoss310;

  MyLastMatchResult(this.clubIDmy,this.clubIDadv,this.goalMy,this.goalAdv){
    if(goalMy > goalAdv){
      victoryDrawLoss310 = 3;
    }
    else if(goalMy == goalAdv){
      victoryDrawLoss310 = 1;
    }else{
      victoryDrawLoss310 = 0;
    }
  }


}
