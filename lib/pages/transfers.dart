import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/filter_players.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/background/background_age.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/button_square_selection.dart';
import 'package:flutter/material.dart';

import '../classes/my.dart';


class Transfers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Transfers({Key? key}) : super(key: key);
  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  FilterPlayers filterPlayers = FilterPlayers();

  bool showMatchsGoalsAssists = false;

  int showRows = 0;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO +-160 com o teclado



    showRows = 0;
    return Scaffold(
        resizeToAvoidBottomInset: false, //Evita um overlay quando o layout é maior que a tela
        body: Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Stack(
              children: [
            Column(
              children: [
                Row(
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: searchNameBar(),
                ),

                //titulo da tabela
                showMatchsGoalsAssists
                    ? playersRowTitle2()
                    : playersRowTitle1(),
                //TABELA
                Container(
                  height: bottomSize > 0 ? Sized(context).height*0.3 : Sized(context).height*0.62,
                  color: AppColors().greyTransparent,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SingleChildScrollView(
                    child: Table(
                      columnWidths: const {
                        0: FractionColumnWidth(.08),
                        1: FractionColumnWidth(.07),
                        3: FractionColumnWidth(.1),
                        4: FractionColumnWidth(.1),
                        5: FractionColumnWidth(.18),
                      },
                      children: [
                        for (int i = filterPlayers.transferParameters.page * 50;
                            i < filterPlayers.copyJogadoresID.length && showRows < 50;
                            i++)
                          showMatchsGoalsAssists
                              ? playersRow2(filterPlayers.copyJogadoresID[i])
                              : playersRow1(filterPlayers.copyJogadoresID[i])
                      ],
                    ),
                  ),
                ),
                //FILTRAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        localButton(
                            title: Translation(context).text.age.toUpperCase(),
                            function: () {
                              filterPlayers.setAge();
                              setState(() {});
                            }),
                        localButton(
                            title: Translation(context).text.overall.toUpperCase(),
                            function: () {
                              filterPlayers.setOverall();
                              setState(() {});
                            }),
                        localButton(
                            title: Translation(context).text.price.toUpperCase(),
                            function: () {
                              filterPlayers.setPrice();
                              setState(() {});
                            }),
                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          children: [
                            buttonSquareSelection(
                                conditionWhenTrue: showMatchsGoalsAssists == false,
                                height: 20, width: 40,
                                function: (){showMatchsGoalsAssists = false;setState((){});}
                            ),
                            const SizedBox(width: 4),
                            buttonSquareSelection(
                                conditionWhenTrue: showMatchsGoalsAssists == true,
                                height: 20, width: 40,
                                function: (){showMatchsGoalsAssists = true;setState((){});}
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            //BOTAO ESQUERDA
                            GestureDetector(
                              onTap: () {
                                filterPlayers.transferParameters.page--;
                                if (filterPlayers.transferParameters.page <= 0) {
                                  filterPlayers.transferParameters.page = 0;
                                } else {
                                  customToast(Translation(context).text.loading);
                                }
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_left.png',width: 50),
                            ),

                            const SizedBox(width: 20),
                            //BOTAO ESQUERDA
                            GestureDetector(
                              onTap: () {
                                if ((filterPlayers.transferParameters.page + 1) * 50 < filterPlayers.copyJogadoresID.length) {
                                  filterPlayers.transferParameters.page++;
                                  customToast(Translation(context).text.loading);
                                }
                                setState(() {});
                              },
                              child: Image.asset('assets/icons/button_right.png',width: 50),
                            ),

                          ],
                        ),


                      ],
                    ),


                    Column(
                      children: [

                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(context: context,
                                builder: (context) {
                                  return filterByPositionWidget();
                                });
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/icons/assists.png',height: 40, width: 40),
                              Text(Translation(context).text.position,style: EstiloTextoBranco.text14),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(isScrollControlled: true,context: context,
                                builder: (context) {return filterByCountry();});
                          },
                          child: const Icon(Icons.flag, size: 35, color: Colors.white),
                        ),

                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(isScrollControlled: true,context: context,
                                builder: (context) {return maxMinSelectionWidget();});
                          },
                          child: const Icon(Icons.filter_alt, size: 35, color: Colors.white),
                        ),

                        const SizedBox(width: 20),


                      ],
                    ),

                  ],
                ),

              ],
            ),

          ]),
        ));
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget filterByPositionWidget(){
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Translation(context).text.positionsFilter,style: EstiloTextoPreto.text16),
          ),
          SizedBox(
            height: 150,
            child: Wrap(
              children: [
                for(String positionName in globalAllPositions)
                  bottomSheetButton(position: positionName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget filterByCountry() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(Translation(context).text.countryFilter,style: EstiloTextoPreto.text16),
          SizedBox(
            height: Sized(context).height/3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(String name in globalCountryNames)
                    countryRow(name),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget countryRow(String name){
    return Container(
      color: filterPlayers.transferParameters.filteredCountry == name ? Colors.green.shade200 : Colors.transparent,
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
          if (filterPlayers.transferParameters.filteredCountry == name) {
            filterPlayers.transferParameters.filteredCountry = "";
          } else {
            filterPlayers.transferParameters.filteredCountry = name;
          }
          filterPlayers.filterByCountry();
          customToast(Translation(context).text.loading);
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              funcFlagsList(name, 25, 35),
              const SizedBox(width: 8),
              SizedBox(
                  width: Sized(context).width-100,
                  child: Text(name,style: EstiloTextoPreto.text16),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget maxMinSelectionWidget() {
    return Container(
      height: 280 + 240,
      padding: const EdgeInsets.only(bottom: 240), //size of keyboard
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Translation(context).text.filter, style: EstiloTextoPreto.text16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(Translation(context).text.age.toUpperCase(), style: EstiloTextoPreto.text16),
                  ),
                  Column(
                    children: [
                      Text(Translation(context).text.min.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.minAge,autofocus:true),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(Translation(context).text.max.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.maxAge),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                      child: Text(Translation(context).text.overall.toUpperCase(), style: EstiloTextoPreto.text16),
                  ),
                  Column(
                    children: [
                      Text(Translation(context).text.min.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.minOVR),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(Translation(context).text.max.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.maxOVR),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(Translation(context).text.price.toUpperCase(), style: EstiloTextoPreto.text16),
                  ),
                  Column(
                    children: [
                      Text(Translation(context).text.min.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.minPrice),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(Translation(context).text.max.toUpperCase(), style: EstiloTextoPreto.text14),
                      widgetTextField(filterPlayers.transferParameters.maxPrice),
                    ],
                  ),
                ],
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap:(){
                        filterPlayers.transferParameters.minAge=TextEditingController();
                        filterPlayers.transferParameters.maxAge=TextEditingController();
                        filterPlayers.transferParameters.minOVR=TextEditingController();
                        filterPlayers.transferParameters.maxOVR=TextEditingController();
                        filterPlayers.transferParameters.minPrice=TextEditingController();
                        filterPlayers.transferParameters.maxPrice=TextEditingController();
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text(Translation(context).text.reset, style: EstiloTextoPreto.text16)),
                  GestureDetector(
                      onTap:(){
                        filterPlayers.filterByPosition();
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text('OK', style: EstiloTextoPreto.text16)),
                ],
              ),
              const SizedBox(height: 20),
            ]),
      ),
    );
  }

  Widget widgetTextField(TextEditingController controller,{bool autofocus = false}) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      margin: const EdgeInsets.only(left: 4),
      child: TextField(
        autofocus: autofocus,
        textAlign: TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(border: InputBorder.none,),
          ),
    );
  }

  Widget playersRowTitle1() {
    return Container(
      color: AppColors().greyTransparent,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Text(Translation(context).text.pos3, style: EstiloTextoBranco.text16),
          const SizedBox(width: 11),
          SizedBox(
              width: 200,
              child: Text(Translation(context).text.player, style: EstiloTextoBranco.text16)),
          GestureDetector(
              onTap: () {
                filterPlayers.setAge();
                setState(() {});
              },
              child: Row(
                children: [
                  Text(Translation(context).text.age3, style: EstiloTextoBranco.text16),
                  filterPlayers.transferParameters.ascOrDescAge > 0
                      ? filterPlayers.transferParameters.ascOrDescAge == 2
                          ? const Icon(Icons.arrow_drop_up,
                              color: Colors.white, size: 15)
                          : const Icon(Icons.arrow_drop_down,
                              color: Colors.white, size: 15)
                      : Container(),
                ],
              )),
          const SizedBox(width: 5),
          GestureDetector(
              onTap: () {
                filterPlayers.setOverall();
                setState(() {});
              },
              child: Row(
                children: [
                  Text(Translation(context).text.ovr3, style: EstiloTextoBranco.text16),
                  filterPlayers.transferParameters.ascOrDescOVR > 0
                      ? filterPlayers.transferParameters.ascOrDescOVR == 2
                          ? const Icon(Icons.arrow_drop_up,
                              color: Colors.white, size: 15)
                          : const Icon(Icons.arrow_drop_down,
                              color: Colors.white, size: 15)
                      : Container(),
                ],
              )),
          const SizedBox(width: 25),
          GestureDetector(
              onTap: () {
                filterPlayers.setPrice();
                setState(() {});
              },
              child: Row(
                children: [
                  const Text(' \$ ', style: EstiloTextoBranco.text16),
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
      child: Row(
        children: [
          const SizedBox(width: 5),
          Text(Translation(context).text.pos3, style: EstiloTextoBranco.text16),
          const SizedBox(width: 10),
          SizedBox(
              width: 210,
              child: Text(Translation(context).text.player, style: EstiloTextoBranco.text16)),
          Text(Translation(context).text.playedP, style: EstiloTextoBranco.text16),
          const SizedBox(width: 25),
          Text(Translation(context).text.goalsG, style: EstiloTextoBranco.text16),
          const SizedBox(width: 44),
          Text(Translation(context).text.assistsA, style: EstiloTextoBranco.text16),
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
                Text(player.name, style: TextStyle(color: nameColor,fontFamily: 'Roboto',fontSize: 16,)),
                Row(
                  children: [
                    funcFlagsList(player.nationality, 7, 10),
                    Text(player.nationality, style: TextStyle(color: nameColor,fontFamily: 'Roboto',fontSize: 10,)),
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
                Text(player.name, style: TextStyle(color: nameColor,fontFamily: 'Roboto',fontSize: 16,)),
                Row(
                  children: [
                    funcFlagsList(player.nationality, 7, 10),
                    Text(player.nationality, style: TextStyle(color: nameColor,fontFamily: 'Roboto',fontSize: 10,)),
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
        color: AppColors().greyTransparent,
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

  bottomSheetButton({required String position}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (filterPlayers.transferParameters.filteredPosition == position) {
            filterPlayers.transferParameters.filteredPosition = "";
          } else {
            filterPlayers.transferParameters.filteredPosition = position;
          }
          filterPlayers.filterByPosition();
          customToast(Translation(context).text.loading);
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: filterPlayers.transferParameters.filteredPosition == position
                ? Colors.green
                : Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(position, style: EstiloTextoBranco.text16),
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
