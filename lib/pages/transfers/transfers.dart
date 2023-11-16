import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/transfers/controller/filter_players.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/transfers/filter_transfers_page.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_square_selection.dart';
import 'package:flutter/material.dart';

import '../../classes/my.dart';

class Transfers extends StatefulWidget {
  final TransferParameters transferParameters;
  const Transfers({Key? key, required this.transferParameters}) : super(key: key);
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  FilterPlayers filterPlayers = FilterPlayers();

  bool showMatchsGoalsAssists = false;
  final ScrollController _scrollController = ScrollController();

  int showRows = 0;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    customToast("Organizing Overall");
    filterPlayers.setOverall();
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    showRows = 0;
    return Scaffold(
        body: Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Column(
            children: [
              Container(
                color: appBarMyClubColor(),
                child: Row(
                  children: [
                    backButtonText(context, Translation(context).text.transfers),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0,right: 4),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '${Translation(context).text.money}: ', style: EstiloTextoBranco.text16),
                            TextSpan(
                                text: '\$ ${My().money.toStringAsFixed(2)} mi',
                                style: EstiloTextoVerde.text20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: appBarMyClubColor(),
                padding: const EdgeInsets.all(8.0),
                child: searchNameBar(),
              ),

              //titulo da tabela
              showMatchsGoalsAssists
                  ? playersRowTitle2()
                  : playersRowTitle1(),
              //TABELA
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    color: AppColors().greyTransparent,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Table(
                      columnWidths: const {
                        0: FractionColumnWidth(.08),
                        1: FractionColumnWidth(.07),
                        3: FractionColumnWidth(.1),
                        4: FractionColumnWidth(.1),
                        5: FractionColumnWidth(.18),
                      },
                      children: [
                        for (int i = filterPlayers.transferParameters.page * 70;
                            i < filterPlayers.copyJogadoresID.length && showRows < 70;
                            i++)
                          showMatchsGoalsAssists
                              ? playersRow2(filterPlayers.copyJogadoresID[i])
                              : playersRow1(filterPlayers.copyJogadoresID[i])
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              //FILTRAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(
                        children: [
                          buttonSquareSelection(
                              primaryColor: AppColors().green,
                              secondColor: Colors.black,
                              conditionWhenTrue: showMatchsGoalsAssists == false,
                              height: 20, width: 40,
                              function: (){showMatchsGoalsAssists = false;setState((){});}
                          ),
                          const SizedBox(width: 4),
                          buttonSquareSelection(
                              primaryColor: AppColors().green,
                              secondColor: Colors.black,
                              conditionWhenTrue: showMatchsGoalsAssists == true,
                              height: 20, width: 40,
                              function: (){showMatchsGoalsAssists = true;setState((){});}
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Container(
                        color: AppColors().greyTransparent,
                        width: Sized(context).width,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            GestureDetector(
                              onTap: () {
                                sortByBottomSheet();
                              },
                              child: const Icon(Icons.sort_by_alpha, size: 30, color: Colors.white),
                            ),


                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => FilterTransfersPage(transferParameters: filterPlayers.transferParameters))
                                ).then((value) {
                                  if(value != null) {
                                    filterPlayers.transferParameters = value;
                                    filterPlayers.transferParameters.priceControl.fromRangeValues();
                                    customToast("Filtering Players");
                                    filterPlayers.filterByPosition();
                                    setState(() {});
                                  }
                                });
                              },
                              child: const Icon(Icons.filter_alt_outlined, size: 35, color: Colors.white),
                            ),

                            const SizedBox(width: 2),

                            //BOTAO ESQUERDA
                            GestureDetector(
                              onTap: () {
                                filterPlayers.transferParameters.page--;
                                if (filterPlayers.transferParameters.page <= 0) {
                                  filterPlayers.transferParameters.page = 0;
                                } else {
                                  customToast(Translation(context).text.loading);
                                }
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_left.png',width: 45),
                            ),

                            //BOTAO ESQUERDA
                            GestureDetector(
                              onTap: () {
                                if ((filterPlayers.transferParameters.page + 1) * 50 < filterPlayers.copyJogadoresID.length) {
                                  filterPlayers.transferParameters.page++;
                                  customToast(Translation(context).text.loading);
                                }
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_right.png',width: 45),
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),

                ],
              ),

            ],
          ),
        ));
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Future sortByBottomSheet(){
    return showModalBottomSheet(context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Text("Sort by",style: EstiloTextoPreto.negrito16),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    localButton(
                        title: Translation(context).text.age.toUpperCase(),
                        function: () {
                          customToast("Sorting...");
                          filterPlayers.setAge();
                          Navigator.pop(context);
                          setState(() {});
                        }),
                    localButton(
                        title: Translation(context).text.overall.toUpperCase(),
                        function: () {
                          customToast("Sorting...");
                          filterPlayers.setOverall();
                          Navigator.pop(context);
                          setState(() {});
                        }),
                    localButton(
                        title: Translation(context).text.price.toUpperCase(),
                        function: () {
                          customToast("Sorting...");
                          filterPlayers.setPrice();
                          Navigator.pop(context);
                          setState(() {});
                        }),
                  ],
                ),
              ],
            ),
          );
        });
  }




  Widget playersRowTitle1() {
    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Text(Translation(context).text.pos3, style: EstiloTextoBranco.negrito16),
          const SizedBox(width: 11),
          SizedBox(
              width: 206,
              child: Text(Translation(context).text.player, style: EstiloTextoBranco.negrito16)),
          GestureDetector(
              onTap: () {
                filterPlayers.setAge();
                setState(() {});
              },
              child: Row(
                children: [
                  Text(Translation(context).text.age3, style: EstiloTextoBranco.negrito16),
                  filterPlayers.transferParameters.ascOrDescAge > 0
                      ? filterPlayers.transferParameters.ascOrDescAge == 2
                          ? const Icon(Icons.arrow_drop_up,
                              color: Colors.white, size: 15)
                          : const Icon(Icons.arrow_drop_down,
                              color: Colors.white, size: 15)
                      : Container(),
                ],
              )),
          const SizedBox(width: 6),
          GestureDetector(
              onTap: () {
                filterPlayers.setOverall();
                setState(() {});
              },
              child: Row(
                children: [
                  Text(Translation(context).text.ovr3, style: EstiloTextoBranco.negrito16),
                  filterPlayers.transferParameters.ascOrDescOVR > 0
                      ? filterPlayers.transferParameters.ascOrDescOVR == 2
                          ? const Icon(Icons.arrow_drop_up,
                              color: Colors.white, size: 15)
                          : const Icon(Icons.arrow_drop_down,
                              color: Colors.white, size: 15)
                      : Container(),
                ],
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                filterPlayers.setPrice();
                setState(() {});
              },
              child: Row(
                children: [
                  const Text(' \$ ', style: EstiloTextoBranco.negrito16),
                  filterPlayers.transferParameters.ascOrDescMoney > 0
                      ? filterPlayers.transferParameters.ascOrDescMoney == 2
                          ? const Icon(Icons.arrow_drop_up,
                              color: Colors.white, size: 15)
                          : const Icon(Icons.arrow_drop_down,
                              color: Colors.white, size: 15)
                      : Container(),
                ],
              )),
        ],
      ),
    );
  }

  Widget playersRowTitle2() {
    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Text(Translation(context).text.pos3, style: EstiloTextoBranco.negrito16),
          const SizedBox(width: 10),
          SizedBox(
              width: 216,
              child: Text(Translation(context).text.player, style: EstiloTextoBranco.negrito16)),
          Text(Translation(context).text.playedP, style: EstiloTextoBranco.negrito16),
          const SizedBox(width: 25),
          Text(Translation(context).text.goalsG, style: EstiloTextoBranco.negrito16),
          const SizedBox(width: 44),
          Text(Translation(context).text.assistsA, style: EstiloTextoBranco.negrito16),
        ],
      ),
    );
  }
  TableRow playersRow1(int playerIndex) {
    Jogador player = Jogador(index: playerIndex);
    Color nameColor = Colors.white;
    if (player.injury > 0) {
      nameColor = Colors.red;
    }
    if (player.redCard > 0 || player.yellowCard == 3) {
      nameColor = Colors.orange;
    }
    //Get Background color of overall
    Color backgroundOverallColor = colorOverallBackground(player.overall);

    if (filterPlayers.searchString.isEmpty ||
        (filterPlayers.searchString.isNotEmpty &&
            player.name.toLowerCase().contains(filterPlayers.searchString.toLowerCase()))) {
      showRows++;
      return TableRow(
        children: [
          Row(
            children: [
              positionContainer(player.position),
            ],
          ),
          Images().getEscudoWidget(player.clubName,20,20),
          //Text(player.index.toString(), style: EstiloTextoBranco.text16),
          GestureDetector(
            onTap: () {
              customToast("opening profile");
              popUpOkShowPlayerInfos(
                  context: context,
                  playerID: player.index,
                  funcSetState: () {
                    setState(() {});
                  });
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(player.name, style: TextStyle(color: nameColor,fontFamily: 'Rajdhani',fontSize: 16,)),
                Row(
                  children: [
                    funcFlagsList(player.nationality, 7, 10),
                    const SizedBox(width: 4),
                    Text(player.nationality, style: TextStyle(color: nameColor,fontFamily: 'Rajdhani',fontSize: 10,)),
                  ],
                ),
              ],
            ),
          ),
          //IDADE
          Container(
              color:colorAgeBackground(player.age),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(player.age.toString(), textAlign:TextAlign.center,style: EstiloTextoPreto.text16)),
          //OVERALL
          Container(
              color: backgroundOverallColor,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Center(
                child: Text(player.overall.toStringAsFixed(0),
                    style: EstiloTextoPreto.text16),
              )),
          //PREÇO
          Text(' ${player.price.toStringAsFixed(2)} mi',
              style: player.price > My().money
                  ? EstiloTextoVermelho.text14
                  : EstiloTextoBranco.text14),
        ],
      );
    } else {
      return TableRow(children: [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ]);
    }
  }

  TableRow playersRow2(int playerIndex) {
    Jogador player = Jogador(index: playerIndex);
    Color nameColor = Colors.white;

    if (filterPlayers.searchString.isEmpty ||
        (filterPlayers.searchString.isNotEmpty &&
            player.name.toLowerCase().contains(filterPlayers.searchString.toLowerCase()))) {
      showRows++;
      return TableRow(
        children: [
          Row(
            children: [
              positionContainer(player.position),
            ],
          ),
          Images().getEscudoWidget(player.clubName,20,20),
          //Text(player.index.toString(), style: EstiloTextoBranco.text16),
          GestureDetector(
            onTap: () {
              //comprar  jogador
              popUpOkShowPlayerInfos(
                  context: context,
                  playerID: player.index,
                  funcSetState: () {
                    setState(() {});
                  });
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(player.name, style: TextStyle(color: nameColor,fontFamily: 'Rajdhani',fontSize: 16,)),
                Row(
                  children: [
                    funcFlagsList(player.nationality, 7, 10),
                    Text(player.nationality, style: TextStyle(color: nameColor,fontFamily: 'Rajdhani',fontSize: 10,)),
                  ],
                ),
              ],
            ),
          ),
          //JOGOS
          Text(player.matchsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          //GOLS
          Center(
            child: Text(player.goalsCarrer.toString(),style: EstiloTextoBranco.text16),
          ),
          //ASSISTENCIAS
          Center(
            child: Text(player.assistsCarrer.toString(),style: EstiloTextoBranco.text16),
          ),
        ],
      );
    } else {
      return TableRow(children: [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ]);
    }
  }

  Widget searchNameBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().greyTransparent2,
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(14.0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (term){
                onSearchString();
              },
              onChanged: (value) {
                filterPlayers.searchString = value;
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: Translation(context).text.playersNameSearch+'...',
                hintStyle: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                onSearchString();
                setState(() {});
              },
              child: const Icon(Icons.search, color: Colors.white)),
        ],
      ),
    );
  }

  Widget localButton({required String title, required Function()? function}) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,style: EstiloTextoBranco.text16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  onSearchString(){
    filterPlayers.copyJogadoresID = List.from(globalJogadoresIndex);
    List<int> searchResult = [];
    for(var id in filterPlayers.copyJogadoresID){
      try {
        if (Jogador(index: filterPlayers.copyJogadoresID.indexOf(id)).name.toLowerCase()
            .contains(filterPlayers.searchString.toLowerCase())) {
          searchResult.add( Jogador(index: filterPlayers.copyJogadoresID.indexOf(id)).index );
        }
      }catch(e){
        print('Jogador index: $id não existe');
      }
    }
     filterPlayers.copyJogadoresID = List.from(searchResult);
  }

}
