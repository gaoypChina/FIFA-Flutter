import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/functions/end_year_updates/update_data_year.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class ReadCSV{
  int indexJog = 0;

  openCSV() async{

    resetPlayersData();
    resetData();

    //READ CSV
    indexJog = 0;
    await readCSVfunc("inglaterra");
    await readCSVfunc("inglaterra2");
    await readCSVfunc("inglaterra3");
    await readCSVfunc("italia");
    await readCSVfunc("italia2");
    await readCSVfunc("italia3");
    await readCSVfunc("espanha");
    await readCSVfunc("espanha2");
    await readCSVfunc("alemanha");
    await readCSVfunc("alemanha2");
    await readCSVfunc("franca");
    await readCSVfunc("franca2");

    await readCSVfunc("portugal");
    await readCSVfunc("holanda_belgica");
    await readCSVfunc("turquia_grecia");
    await readCSVfunc("europa_ocidental");
    await readCSVfunc("europa_ocidental2");
    await readCSVfunc("nordicos");
    await readCSVfunc("urss");
    await readCSVfunc("europa_leste");
    await readCSVfunc("europa_outros");

    await readCSVfunc("brasil");
    await readCSVfunc("brasil2");
    await readCSVfunc("brasil3");
    await readCSVfunc("brasil4");
    await readCSVfunc("argentina");
    await readCSVfunc("argentina2");
    await readCSVfunc("sulamericano");
    await readCSVfunc("chile");
    await readCSVfunc("sulamericano2");
    await readCSVfunc("colombia");
    await readCSVfunc("merconorte");

    await readCSVfunc("mexico");
    await readCSVfunc("eua");
    await readCSVfunc("eua2");

    await readCSVfunc("asia");
    await readCSVfunc("japao");
    await readCSVfunc("oriente_medio");
    await readCSVfunc("africa");
    await readCSVfunc("oceania");
  }
  readCSVfunc(String filename) async {
    List<List<dynamic>> _data = [];
    try{
      final _rawData   = await rootBundle.loadString("assets/csv/$filename.csv");
      List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
      _data = _listData;
    }catch(e){
      customToast('Arquivo Inexistente: '+ filename);
    }

    if(_data.length==1){
      customToast('Erro no arquivo '+ filename);
    }

    for(int line=1;line<29;line++){//*Linha 0 é o nome dos times
      for(int team=0;team<26;team++) { //até 24 times por arquivo
        int nVariables = 7;
        try{
        //Se tiver nome salva o jogador
          String club = _data[0][team * nVariables + 1];
          String name = _data[line][team * nVariables + 1].toString();
          String position = _data[line][team * nVariables + 2].toString();//VOLMCZAG =>VOL
          int age = int.parse(_data[line][team * nVariables + 3].toString().substring(0,2));
          int overall = int.parse(_data[line][team * nVariables + 4].toString().substring(0,2));
          String nationality = _data[line][team * nVariables + 5].toString();
          String imagePlayer = _data[line][team * nVariables + 6].toString();

            if (name.isNotEmpty && position.isNotEmpty && age > 10) {

              //REMOVE L form last character
              if(name[name.length-1]=='L'){name = name.substring(0, name.length - 1);}
              //CORRIGE A POSIÇÃO
              position = correctPlayerPostion(position);

              imagePlayer = correctImageUrl(imagePlayer);

              //VARIAVEIS GLOBAIS
              int clubIndex = clubsAllNameList.indexOf(club);
              if(clubIndex >= 0) { //se o clube existir e estiver cadastrado certo

                PlayerBasicInfo playerBasicInfo = PlayerBasicInfo();
                playerBasicInfo.clubID = clubIndex;
                playerBasicInfo.playerID = indexJog;
                playerBasicInfo.name = name;
                playerBasicInfo.position = position;
                playerBasicInfo.age = age;
                playerBasicInfo.overall = overall;
                playerBasicInfo.nationality = nationality;
                playerBasicInfo.imagePlayer = imagePlayer;
                playerBasicInfo.createNewPlayerToDatabase();
                indexJog++;

                //test jogadores importados
                //if(club == ClubName().saocaetano){
                //print('JOGADOR: $name $position $overall $nationality $imagePlayer       ...$club ${clubIndex.toString()}');
                //}
              }else{
                //ERRO NA IMPORTAÇÃO DO TIME
                //Provavelmente falta adicionar o nome do clube em: clubsAllNameList
                //print('ERRO IMPORTAÇÃO JOGADOR: $name $club ${clubIndex.toString()}');
              }
        }
        }catch(e){
          //Jogador com alguma informação errada
          //print('ERROR LOADING DATA: ');
          //print('ERRO DADOS DO JOGADOR:\nName: ${_data[line][team * 5 + 1].toString()} POSIÇÃO: ${_data[line][team * 5 + 2]} Club: ${_data[0][team * 5 + 1]}');
        }

      }
    }

  }

  correctImageUrl(String imagePlayer){
    if(imagePlayer.contains('wiki')){
      imagePlayer = imagePlayer.substring(5,);
      imagePlayer = 'https://cdn.soccerwiki.org/images/player/' + imagePlayer;
    }
    else{
      imagePlayer = imagePlayer.substring(1,);
      imagePlayer = 'https://cdn.sofifa.net/players/' + imagePlayer;
    }
    return imagePlayer;
  }

  correctPlayerPostion(String position){

    //Se logo de cara aparecer uma dessas posições ja salva como prioridade
    if(position.contains('LD')){position='LD';}
    if(position.contains('LE')){position='LE';}
    if(position.length>3){position = position.substring(0,3);}
    if(position.contains('GOL')){position='GOL';}
    else if(position.contains('LD')){position='LD';}
    else if(position.contains('ADD')){position='LD';}
    else if(position.contains('ADE')){position='LE';}
    else if(position.contains('LE')){position='LE';}
    else if(position.contains('ZAG')){position='ZAG';}
    else if(position.contains('VOL')){position='VOL';}
    else if(position.contains('MEI')){position='MEI';}
    else if(position.contains('MC')){position='MC';}
    else if(position.contains('ATA')){position='ATA';}
    else if(position.contains('SA')){position='ATA';}
    else if(position.contains('PD')){position='PD';}
    else if(position.contains('PE')){position='PE';}
    else if(position.contains('MD')){position='MD';}
    else if(position.contains('ME')){position='ME';}
    return position;
  }

}
