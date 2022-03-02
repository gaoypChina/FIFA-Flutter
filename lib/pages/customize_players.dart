import 'package:fifa/classes/club.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/popup/popup_save_all_data.dart';
import 'package:fifa/popup/poup_edit.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import '../classes/jogador.dart';

class CustomizePlayers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int clubID;
  const CustomizePlayers({Key? key, required this.clubID}) : super(key: key);
  @override
  _CustomizePlayersState createState() => _CustomizePlayersState();
}

class _CustomizePlayersState extends State<CustomizePlayers> {

  TextEditingController textEditingController = TextEditingController();

  List listAll = [];
  List listShow = [];
  late int choosenPlayerID;
  late Club club;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    club = Club(index: widget.clubID);
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),

                  //LOGO DO CLUBE
                  Row(
                    children: [
                      GestureDetector(
                          onTap:(){
                            //Mudar Clube de liga
                            popupText('Substituir pelo time',club.name,'LeagueClub');

                          },
                          child: Image.asset('assets/clubs/${FIFAImages().imageLogo(club.name)}.png',height: 60,width: 60)
                      ),
                      const Text('Customizar Jogadores',style: EstiloTextoBranco.text22),
                    ],
                  ),


                  const SizedBox(height: 4),
                  //SHOW TABLE PLAYERS
                  Container(
                    color: AppColors().greyTransparent,
                    child: Row(
                      children: const[
                        SizedBox(width: 8),
                        Text('POS',style: EstiloTextoBranco.text16),
                        SizedBox(width: 25),
                        SizedBox(width:170,
                            child: Text('NOME',style: EstiloTextoBranco.text16)
                        ),
                        SizedBox(width: 4),
                        Text('IDA',style: EstiloTextoBranco.text16),
                        SizedBox(width: 12),
                        Text('OVR',style: EstiloTextoBranco.text16),
                        SizedBox(width: 14),
                        Text('PREÇO',style: EstiloTextoBranco.text16),
                      ],
                    ),
                  ),

                  Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    color: AppColors().greyTransparent,
                    child: SingleChildScrollView(
                      child: Table(
                        columnWidths: const {
                          0: FractionColumnWidth(.09),
                          1: FractionColumnWidth(.07),
                          2: FractionColumnWidth(.45),
                          5: FractionColumnWidth(.18),
                          6: FractionColumnWidth(.001),//container to create vertical spacing
                        },
                        children: [
                          for(int i=0;i<club.nJogadores;i++)
                            playersRow(i),
                        ],
                      ),
                    ),
                  ),


                  //CUSTOMIZE
                  Row(
                    children: [
                      buttonDesign(
                          title: 'Idade +1',
                          function: (){
                            setState(() {});
                            for(int i=0; i<globalJogadoresAge.length; i++){
                              globalJogadoresAge[i] += 1;
                            }
                          }
                      ),

                      buttonDesign(
                          title: 'Idade -1',
                          function: (){
                            setState(() {});
                            for(int i=0; i<globalJogadoresAge.length; i++){
                              globalJogadoresAge[i] -= 1;
                            }
                          }
                      ),

                    ],
                  ),

                  const Spacer(),

                  Padding(
                  padding: const EdgeInsets.all(8),
                  child: customButtonContinue(
                      title: 'SALVAR PERMANENTEMENTE',
                      function: (){
                        //Salva os dados
                        popUpSaveAllData(context: context);
                        //Navigator.pop(context);
                      }),
                  ),



                ],
              )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
TableRow playersRow(int i){

      int playerID = club.jogadores[i];
      Jogador player = Jogador(index: playerID);

    return TableRow(
      children: [

        //POSIÇÃO
        InkWell(
            onTap:(){
              choosenPlayerID = playerID;
              popupText('Alterar posição',player.position,'Position');
            },
            child: Text(player.position,style: EstiloTextoBranco.text16)),

        //CLUB
        InkWell(
            onTap:(){
              choosenPlayerID = playerID;
              popupText('Novo clube do jogador',player.clubName,'Club');
            },
            child: Image.asset('assets/clubs/${FIFAImages().imageLogo(player.clubName)}.png',height:30, width: 30)),

        //NOME
        InkWell(
          onTap:(){
            choosenPlayerID = playerID;
            popupText('Alterar nome',player.name,'Name');
          },
          child: SizedBox(
              width: 200,
              child: Text(player.name,style: EstiloTextoBranco.text16)
          ),
        ),

        //IDADE
        SizedBox(
          width: 22,
          child: InkWell(
              onTap:(){
                choosenPlayerID = playerID;
                popupNumber(player.age,'Idade');

              },
              child: Text(player.age.toStringAsFixed(0),style: EstiloTextoBranco.text16)),
        ),

        //OVERALL
        SizedBox(
          width: 22,
          child: InkWell(
              onTap:(){
                choosenPlayerID = playerID;
                popupNumber(globalJogadoresOverall[playerID],'Overall');
              },
              child: Text(player.overall.toStringAsFixed(0),style: EstiloTextoBranco.text16)),
        ),

        //PREÇO
        Text(player.price.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text16),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ],
    );

  }


popupText(String title,String variableString, String whichData){

  popupEdit(
      context: context,
      title: title,
      variable: variableString,
      intOrString: true,
      maxNcharacters: 22,
      functionOK: (value){
        if(whichData=='Club' && clubsAllNameList.contains(value)) {
          int clubID = clubsAllNameList.indexOf(value);
          globalJogadoresClubIndex[choosenPlayerID] = clubID;
        }
        if(whichData=='Club' && !clubsAllNameList.contains(value)){
          customToast('Clube Inexistente');
        }

         if(whichData=='Position' && positions442.containsKey(value)) {
            globalJogadoresPosition[choosenPlayerID] = value;
         }else if(whichData=='Position' && !positions442.containsKey(value)){
            customToast('Posição Inválida');
          }

        if(whichData=='Name') globalJogadoresName[choosenPlayerID] = value;

        if(whichData=='LeagueClub') {

          //GET POSIÇÃO DO CLUBNAME MAP
          int posicaoIndex1 = -1;
          String leagueName1 = Club(index: clubsAllNameList.indexOf(variableString)).leagueName;
          Map map1 = clubNameMap[leagueName1];
          map1.forEach((key, value) {
            if(value==variableString){
              posicaoIndex1 = key;
            }
          });
          String leagueName2 = Club(index: clubsAllNameList.indexOf(value)).leagueName;
          int posicaoIndex2 = -1;
          Map map2 = clubNameMap[leagueName2];
          map2.forEach((key, valueName) {
            if(valueName==value){
              posicaoIndex2 = key;
            }
          });
          //TROCA
          if(posicaoIndex2 == -1 || posicaoIndex1 ==-1){
            customToast('ERRO NA TROCA\n nome inválido');
          }else{
            clubNameMapPermanent[leagueName2][posicaoIndex2] = variableString; //novo time1
            clubNameMapPermanent[leagueName1][posicaoIndex1] = value; //novo time2
          }
        }

            setState(() {});

      }
  );
}
popupNumber(dynamic number, String whichData){
    popupEdit(
        context: context,
        title: 'Novo valor para '+whichData,
        variable: number,
        intOrString: true,
        maxNcharacters: 22,
        functionOK: (valueStr){
          int value = int.parse(valueStr);
          if(whichData=='Idade' && value<45 && value>=16) globalJogadoresAge[choosenPlayerID] = value;
          if(whichData=='Overall' && value<100 && value>50) globalJogadoresOverall[choosenPlayerID] = value;
          setState(() {});
        }
    );
  }


  buttonDesign({required String title, required Function()? function}) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(25.0) //                 <--- border radius here
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.text16,
            ),
          ],
        ),
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                           FUNCTIONS                                     //
////////////////////////////////////////////////////////////////////////////

}