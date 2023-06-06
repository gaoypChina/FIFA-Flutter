import 'package:flutter/material.dart';

convertOverallToStars(double overall){
  double star = 0;
  if(overall < 60){star = 0;}
  else if(overall < 66){star = 0.5;}
  else if(overall < 68){star = 1;}
  else if(overall < 70){star = 1.5;}
  else if(overall < 72){star = 2;}
  else if(overall < 74){star = 2.5;}
  else if(overall < 76){star = 3;}
  else if(overall < 79){star = 3.5;}
  else if(overall < 81){star = 4;}
  else if(overall < 83){star = 4.5;}
  else if(overall >= 83){star = 5;}
  return star;
}

Widget starsWidgetFromOverall(double overall){
  return starsWidget(convertOverallToStars(overall));
}
Widget starsWidget(double star){

  return Row(
    children: [
      if (star == 0)
        ...List.generate(5, (_) => const Icon(Icons.star_outline, color: Colors.white)),
      if (star == 0.5)
        ...List.generate(1, (_) => const Icon(Icons.star_half, color: Colors.white))
          ..addAll(List.generate(4, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 1)
        ...List.generate(1, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(4, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 1.5)
        ...List.generate(1, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_half, color: Colors.white)))
          ..addAll(List.generate(3, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 2)
        ...List.generate(2, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(3, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 2.5)
        ...List.generate(2, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_half, color: Colors.white)))
          ..addAll(List.generate(2, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 3)
        ...List.generate(3, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(2, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 3.5)
        ...List.generate(3, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_half, color: Colors.white)))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 4)
        ...List.generate(4, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_outline, color: Colors.white))),
      if (star == 4.5)
        ...List.generate(4, (_) => const Icon(Icons.star, color: Colors.white))
          ..addAll(List.generate(1, (_) => const Icon(Icons.star_half, color: Colors.white))),
      if (star == 5)
        ...List.generate(5, (_) => const Icon(Icons.star, color: Colors.white)),

    ],
  );
}