import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/historic/historic_my_players.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/best_player_box/best_player_box.dart';
import 'package:fifa/widgets/button/dropdown_button.dart';
import 'package:flutter/material.dart';

class MyPlayersHistoric extends StatefulWidget {
  final int year;
  const MyPlayersHistoric({Key? key, required this.year}) : super(key: key);

  @override
  State<MyPlayersHistoric> createState() => _MyPlayersHistoricState();
}

class _MyPlayersHistoricState extends State<MyPlayersHistoric> {

  late Club club;
  bool isActualYear = false;
  List<String> possibleYears = [];
  String selectedYearStr = anoInicial.toString();
  List<HistoricPlayerData> historicPlayerDatas =[];
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initialSelectedYear();
    super.initState();
  }
  initialSelectedYear(){
    if(ano<=anoInicial){
      selectedYearStr = (anoInicial).toString();
    }
    possibleYears = [];
    for(int year=anoInicial;year<=ano;year++){
      possibleYears.add(year.toString());
    }
    club = Club(index: My().clubID);
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {

    if(int.parse(selectedYearStr)==ano){
      isActualYear = true;
    }else{
      isActualYear = false;
    }
    historicPlayerDatas = HistoricMyPlayers().getPlayersList(year: int.parse(selectedYearStr), isActualYear: isActualYear);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [
              backButtonText(context,'Histórico dos meus times'),

              header(),

              bestPlayers(),

              listPlayersWidget(),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Comprados',style: EstiloTextoBranco.negrito18),
                  Text('Vendidos',style: EstiloTextoBranco.negrito18),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sellORbuyPlayers('Buy',int.parse(selectedYearStr)),
                      sellORbuyPlayers('Sell',int.parse(selectedYearStr)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget header(){
    late HistoricClubYear myClubData;
    if(!isActualYear){
      myClubData = HistoricClubYear(int.parse(selectedYearStr));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        dropDownButton(
            selectedYearStr: selectedYearStr,
            possibleYears: possibleYears,
            setStateFunc: (value){
              selectedYearStr = value.toString();
              setState(() {});
            }),

        Row(
          children: [
            Images().getEscudoWidget(club.name,50,50),
            Images().getUniformWidget(club.name,50,50),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          decoration: blackDecoration(),
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoLogo(club.leagueName),width: 50,height: 50),
                  isActualYear
                      ? Text(Classification(leagueIndex: My().leagueID).getClubPosition(My().clubID).toString()+'º',style: EstiloTextoBranco.text16)
                      : Text(myClubData.leaguePosition.toString()+"º",style: EstiloTextoBranco.text16),
               ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Image.asset(FIFAImages().campeonatoLogo(club.internationalLeagueName),width: 50,height: 50),
                  isActualYear
                      ? const Text('Oitavas',style: EstiloTextoBranco.text16)
                      : Text(myClubData.internationalLeaguePosition,style: EstiloTextoBranco.text16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
}

  Widget bestPlayers(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          bestPlayerBox('Craque',Jogador(index: HistoricMyPlayers().getBestPlayer(historicPlayerDatas: historicPlayerDatas)),''),
          bestPlayerBox('Artilheiro',Jogador(index: HistoricMyPlayers().getArtilheiro(historicPlayerDatas: historicPlayerDatas)),''),
          bestPlayerBox('Assistente',Jogador(index: HistoricMyPlayers().getAssistente(historicPlayerDatas: historicPlayerDatas)),''),
          bestPlayerBox('MVP',Jogador(index: HistoricMyPlayers().getMVP(historicPlayerDatas: historicPlayerDatas)),''),
        ],
      ),
    );
  }

  Widget listPlayersWidget(){
    return Column(
      children: [
        const Text('Lista de Jogadores',style: EstiloTextoBranco.negrito18),
        SizedBox(
          height: 180,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (HistoricPlayerData historicPlayerData in historicPlayerDatas)
                  oldPlayerRow(historicPlayerData)
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget oldPlayerRow(HistoricPlayerData historicPlayerData){
    Jogador jogador = Jogador(index: historicPlayerData.playerID);
    return GestureDetector(
      onTap: (){
        popUpOkShowPlayerInfos(
            context: context,
            playerID: historicPlayerData.playerID,
            funcSetState: (){setState((){});}
        );
      },
      child: Row(
        children: [
          Images().getPlayerPictureWidget(jogador,25,25),
          SizedBox(width:40,child: Text(jogador.position,style: EstiloTextoBranco.text16)),
          const SizedBox(width: 4),
          SizedBox(width:150,child: Text(historicPlayerData.name,style: EstiloTextoBranco.text16)),
          const SizedBox(width: 4),
          SizedBox(width:30,child:Text(historicPlayerData.matchs.toString(),style: EstiloTextoBranco.text16)),
          const SizedBox(width: 4),
          SizedBox(width:30,child:Text(historicPlayerData.goals.toString(),style: EstiloTextoBranco.text16)),
          const SizedBox(width: 4),
          SizedBox(width:30,child:Text(historicPlayerData.assists.toString(),style: EstiloTextoBranco.text16)),
        ],
      ),
    );
  }
Widget sellORbuyPlayers(String buyOrSellKeyword, int selectedYear){
  try{
    List<HighestSellBuy> listPlayers = HistoricMyTransfers().getTransfersYear(buyOrSellKeyword, selectedYear);

    if(listPlayers.isEmpty){
      return Container(
        width: Sized(context).width/2,
      );
    }

    return Column(
      children: [

        for(int i=0; i < listPlayers.length;i++)
          GestureDetector(
            onTap: (){
              popUpOkShowPlayerInfos(
                  context: context,
                  playerID: listPlayers[i].playerID,
                  funcSetState: (){setState((){});}
              );
            },
            child: SizedBox(
              width: Sized(context).width/2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Images().getEscudoWidget(Club(index: listPlayers[i].clubID).name,20,20),
                  Container(
                    color: colorOverallBackground(listPlayers[i].overall),
                    child: Text(listPlayers[i].overall.toString(),
                        style: EstiloTextoPreto.text16),
                  ),
                  Text(" "+Jogador(index: listPlayers[i].playerID).name,
                      style: EstiloTextoBranco.text12),
                  const Spacer(),
                  Text('\$'+listPlayers[i].maxPrice.toStringAsFixed(2),
                      style: EstiloTextoBranco.text16),
                ],
              ),
            ),
          ),


      ],
    );
  }catch(e){
    return Container();
  }
}

}
