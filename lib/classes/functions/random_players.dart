import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/classes/countries/words.dart';
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
    playerBasicInfo.overall = Random().nextInt(8)-9+club.getOverall().round();
    playerBasicInfo.position = globalAllPositions[Random().nextInt(globalAllPositions.length)];
    playerBasicInfo.playerID = globalJogadoresIndex.last+1;
    playerBasicInfo.clubID = club.index;
    playerBasicInfo.imageUrl = ReadCSV().correctImageUrl('/notfound_0_120.png');
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
        'Miroslav Klose',        'Gerd Muller',
        'Beethoven',        'Backenbauer',
        'Oliver Kahn',        'Uli Stielike',
        'K. Forster',        'Hrubesch',
        'Littbarski',        'M. Kaltz',
        'Dremmler',        'H. Siemens',
        'Weiss Bosch',        'F. Koncilia',
        'B. Obermayer',        'H. Weber',
        'Hintermaier',        'Schachner',
        'H. Krankl',        'B. Krauss',
        'J. Degeorgi',        'M. Schulz',
        'Sebastian Vettel',   'M. Schumacher',
        'Dreims Wolks',
      ];
    }
    else if(club.nationality == Words.country.brazil
        || club.nationality == Words.country.angola
        ||club.nationality == Words.country.portugal){
      return [
        'Miguel Júnior',        'Eduardo Souza',        'Carlinhos Bala',        'Fernando Capixaba',
        'Silveira',        'Flávio Minuano',        'Jairo',        'Toninho',
        'Jorge Vitório',        'Denílson',        'Ruy',        'Clation',
        'Diguinho',        'Ataliba',        'Thiago Xavier',        'Leandro Carvalho',
        'Joílson',        'Thiago Marín',        'Maicon',        'Juca',
        'Sérgio Manoel',        'Jorginho',        'Pedro Lima',        'Marcelinho Santos',
        'Felipe Adão',        'Lyndson',        'Léo Gaúcho',        'Romeu',
        'Artur Bernardes',        'Cicinho',        'Wágner',        'Hernande',
        'Taílson',        'Daniel Mendes',        'Wilson Goiano',        'Jamir',
        'Leandro Ávila',        'Varela',        'Jorge Parreco',        'Luisinho',
        'Josimar',        'Tiquinho',        'Odélio',        'Osmar Manga',
        'Anderson Silva', 'Ayrton Senna',        'Luciano Huck', 'Ademir Vicente',
        'Alfredo Deola', 'Tupãzinho',        'Jorge Rivellino',        'Edson Nascimento',
        'Túlio Chagas',        'Ronaldo Riveiro',        'Cafu Neto',        'Evair Camargo',
        'Leandro Magrão',        'Sérgio Velloso',        'Mendonça',        'Lineu Silva',
        'Tuco Aguiar',        'Manfrini',        'Rubens Nicola',        'Ubiratan Leal',
        'Paulo Amaral',   'Luis Inácio',         'Denis Vicente',        'Jorge Vargas',
        'Roberto Carlos',        'Levy Fidelix',        'Michel Temer',  'Christian Castro',
      ];
    }


    else if(club.nationality == Words.country.argentina
        || club.nationality == Words.country.spain
        || club.nationality == Words.country.mexico
        || club.nationality == Words.country.chile
        || club.nationality == Words.country.uruguay
        || club.nationality == Words.country.paraguay
        || club.nationality == Words.country.peru
        || club.nationality == Words.country.bolivia
        || club.nationality == Words.country.ecuador
        ||club.nationality == Words.country.colombia){
      return [
        'Alfonso Pérez',        'Rafael Nadal',
        'Sergio Alcaraz',        'Vicente',
        'Albert Ferrer',        'Guillermo Amor',
        'Gallego',        'Antonio Maceda',
        'Quini',        'Juanito',
        'Miguelito',        'Diego Forlán',
        'Diego Lugano',        'Mascherano',
        'Jesús Zamora',        'Zamora',
        'Cabanãs',        'Raúl Dias',
        'Manolo',        'Miguel Tendillo',
        'Joan Segarra',        'Ignacio Zoco',
        'Ismael Urzaiz',        'Enrique Saura',
        'Pablo Ibáñez',        'José Claramunt',
        'Tonono',        'Pedro Munitis',
        'Gregorio Benito',        'E. Basora',
        'Paco Jémez',        'Francisco López',
        'Santiago Pérez',        'Francisco Bernabeu',
        'Severino Reijia',        'Agustín Cejas',
        'Miguel Santoro',        'Roberto Perfumo',
        'Rúben Díaz',        'Edgardo Cantú',
        'Antonio Rosl',        'Norberto Madurga',
        'Miguel Ángel Raimondo',
      ];
    }

    else{
      return [
        'M. al Deayea',        'Mohammed Al Jahani',
        'Redha Tukar',        'Abdullah S. Zubromawi',
        'Mohsin Harthi',        'Fouzi Al Shehri',
        'Ibrahim Al Shahrani',        'Mohammed Noor',
        'Sami Al Jaber',        'Obeid Al Dossari',
        'Ahmed Dukhi',        'Hussein Sulimani',
        'Abdulaziz Al Khathran',        'Abdullah Al Dosary',
        'Khamis Al Dosari',        'Nawaf Al Temyat',
        'Omar Al Ghamdi',        'Al Hassan Al Yami',
        'Mabrouk Zaid',        'Mohammed K. Babkr',

        'Mansour Althagafi',        'Ali Boumnijel',
        'Hamdi Kasraoui',        'Adel Nefzi',
        'Anis Ayari',        'Riadh Bouazizi',
        'Karim Haggui',        'Radhi Jaïdi',
        'David Jemmali',        'Karim Saïdi',
        'Alaeddine Yahia',        'Kaies Ghodhbane',
        'Sofian Melliti',        'Jaouhar Mnari',
        'Mehdi Nafti',        'Hamed Namouchi',
        'Chaouki Ben Saada',        'Yacine Chikhaoui',
        'Karim Essediri',
      ];
    }

  }
}