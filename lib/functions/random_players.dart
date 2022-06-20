import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/classes/words.dart';
import 'package:fifa/database/csv/read_csv.dart';
import 'package:fifa/global_variables.dart';

class AddRandomPlayer{
  PlayerBasicInfo playerBasicInfo = PlayerBasicInfo();

  late Club club;
  AddRandomPlayer({required this.club}){
    randomName();
    randomStatus();
    playerBasicInfo.createNewPlayerToDatabase();
  }

  randomName(){
    List<String> list = listRandomNames();
    int randomNum = Random().nextInt(list.length);
    playerBasicInfo.name = list[randomNum];
  }

  randomStatus(){
    playerBasicInfo.age = Random().nextInt(21)+17;
    playerBasicInfo.overall = Random().nextInt(8)-8+club.getOverall().round();
    playerBasicInfo.position = globalAllPositions[Random().nextInt(globalAllPositions.length)];
    playerBasicInfo.playerID = globalJogadoresIndex.last;
    playerBasicInfo.clubID = club.index;
    playerBasicInfo.imagePlayer = ReadCSV().correctImageUrl('/notfound_0_120.png');
    playerBasicInfo.nationality = club.nationality;
  }

  List<String> listRandomNames(){
    if(club.nationality == Words.country.england
    || club.nationality == Words.country.unitedStates
        || club.nationality == Words.country.canada
        || club.nationality == Words.country.scotland
        || club.nationality == Words.country.wales){
      return [
        'Jay Smith',        'Roy Atkins',
        'Booby Moore',        'Charles Deckins',
        'Olye Sykes',        'Carlton Banks',
        'Will Smith',        'Devon Rowins',
        'Charles Chaplin',        'Benjamin Franklin',
        'Barack Obama',        'Bob Trump',
        'Jimmy Hendrix',        'Michael Jordan',
        'Jason Tatum',        'Stephen Curry',
        'Klay Thompshon',        'Tom Sawer',
        'Jack Black',        'Jack White',
        'Chad Smith',        'John Frusciante',
        'Eric Cartman',        'Jimmy Butler',
        'Oliver Naismith',
        ];
    }

    else if(club.nationality == Words.country.germany || club.nationality == Words.country.austria){
      return [
        'Miroslav Klose',
        'Gerd Muller',
        'Beethoven',
        'Backenbauer',
        'Oliver Kahn',
      ];
    }

    else{
      return [
        'Miguel Júnior',        'Eduardo Souza',
        'Carlinhos Bala',        'Fernando Capixaba',
        'Daniel Guedes',        'Uilson Matias',
        'Willian Caprari',        'Vitinho Souza',
        'Roger Almeida',        'Ronaldo Miguel',
        'Cristovão Rodolfo',        'Borges Avila',
        'Marcos Fernandes',        'Sérgio Oliveira',
        'Emanuel Souza',        'Edson Passos',
        'Dorival Fagundes',        'Luciano Santos',
        'Adriano Guibert',        'Antônio Ramos',
        'Lúcio Flávio',        'Wanderson Nascimento',
        'Lucas Matheus',        'Fernando Issao',
        'Bruno Menezes',        'Edemílson Raimundo',
        'Roberto Balaio',        'Murilo Tadeu',
        'Sérgio Aperguis',        'Claudio Adão',
        'Rodrigo Farias',         'Renato Abreu',
      ];
    }

  }
}