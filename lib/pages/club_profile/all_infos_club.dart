import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/tabs/player_row_all_infos.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_square_selection.dart';
import 'package:flutter/material.dart';

class AllInfosClub extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final Club club;
  final Function() notifyParent;
  const AllInfosClub({Key? key, required this.club, required this.notifyParent}) : super(key: key);
  @override
  _AllInfosClubState createState() => _AllInfosClubState();
}

class _AllInfosClubState extends State<AllInfosClub> {

  double buttonSize = 50;
  int selection = 0;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  Expanded(
                    child: Container(
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: selection==0
                          ? tableWidget0()
                          : selection==1 ? tableWidgetLeague()
                          : selection==2 ? tableWidgetCups()
                          : selection==3 ? tableWidgetInternational()
                          : selection==4 ? tableWidgetCarrer()
                          : selection==5 ? tableWidgetCards()
                          : Container(),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                  for(int i=0; i <= 5; i++)
                      buttonSquareSelection(
                          primaryColor: widget.club.colors.primaryColor,
                          secondColor: widget.club.colors.secondColor,
                          conditionWhenTrue: selection==i,
                          height: 25, width: 50,
                          function: (){
                            selection = i;
                            setState(() {});
                          }),
                    ],
                  ),

                  const SizedBox(height: 10),

                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget title(String t1, String t2, String t3, String t4){
    return Row(
      children: [
        Text(t1, textAlign:TextAlign.center,style: EstiloTextoBranco.negrito14),
        const Spacer(),
        SizedBox(
          width: 145,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(t2, textAlign:TextAlign.center,style: EstiloTextoBranco.negrito14),
              Text(t3, textAlign:TextAlign.center,style: EstiloTextoBranco.negrito14),
              Text(t4, textAlign:TextAlign.center,style: EstiloTextoBranco.negrito14),
            ],
          ),
        ),
      ],
    );
  }

  Widget displayRows(int option){

    return Expanded(
      child: ReorderableListView(
        padding: EdgeInsets.zero,
        children: List.generate(
            widget.club.escalacao.length, (index) {
          Jogador player = Jogador(index: widget.club.escalacao[index]);
          return ListTile(
            key: Key('$index'), // Unique key for each item
              contentPadding: EdgeInsets.zero,
            title: PlayerRowAllInfos(
              row: index,
              playerIndex: widget.club.escalacao[index],
              option: option,
              child: SizedBox(
                width: 140,
                child: option == 0 ? playersStatsWidget0(player)
                    : option == 1 ? playersStatsWidgetLeague(player)
                    : option == 2 ? playersStatsWidgetCups(player)
                    : option == 3 ? playersStatsWidgetInternational(player)
                    : option == 4 ? playersStatsWidgetCarrer(player)
                    : option == 5 ? playersStatsWidgetCards(player)
                    : Container(),
              ),
              notifyParent: (){
                widget.notifyParent();
              },
            )
          );
        }),
        onReorder: (oldIndex, newIndex) {

          if(widget.club.name == My().clubName){
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = widget.club.escalacao.removeAt(oldIndex);
            widget.club.escalacao.insert(newIndex, item);

            final item2 = globalMyJogadores.removeAt(oldIndex);
            globalMyJogadores.insert(newIndex, item2);
          }


            setState(() {});
        },
      ),
    );
  }

  Widget tableWidget0(){
    return Column(
      children: <Widget>[

        title(
            Translation(context).text.name,
            Translation(context).text.age3,
            Translation(context).text.ovr3,
            '\$',
        ),

        displayRows(0),

      ],
    );
  }
  Widget tableWidgetLeague(){
    return Column(
      children: <Widget>[

        title(
          Translation(context).text.name,
          Translation(context).text.playedP,
          Translation(context).text.goalsG,
          Translation(context).text.assistsA,
        ),

        displayRows(1),

      ],
    );
  }

  Widget tableWidgetCups(){
    return Column(
      children: <Widget>[

        title(
          Translation(context).text.name,
          'Cup ${Translation(context).text.playedP}',
          'Cup ${Translation(context).text.goalsG}',
          'Cup ${Translation(context).text.assistsA}',
        ),

        displayRows(2),

      ],
    );
  }
  Widget tableWidgetInternational(){
    return Column(
      children: <Widget>[

        title(
          Translation(context).text.name,
          'Int ${Translation(context).text.playedP}',
          'Int ${Translation(context).text.goalsG}',
          'Int ${Translation(context).text.assistsA}',
        ),

        displayRows(3),

      ],
    );
  }
  Widget tableWidgetCarrer(){
    return Column(
      children: <Widget>[

        title(
          Translation(context).text.name,
          'All ${Translation(context).text.playedP}',
          'All ${Translation(context).text.goalsG}',
          'All ${Translation(context).text.assistsA}',
        ),

        displayRows(4),

      ],
    );
  }
  Widget tableWidgetCards(){
    return Column(
      children: <Widget>[

        title(
          Translation(context).text.name,
          '+',
          Translation(context).text.yellowCards3,
          Translation(context).text.redCards3,
        ),

        displayRows(5),

      ],
    );
  }






  Widget playersStatsWidget0(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              color: colorAgeBackground(player.age),
              padding: const EdgeInsets.all(4),
              child: Text(player.age.toString(), textAlign:TextAlign.center,style: EstiloTextoPreto.text16)),
        Container(
            color: colorOverallBackground(player.overall),
            padding: const EdgeInsets.all(4),
            child: Text(player.overall.toStringAsFixed(0),
                textAlign:TextAlign.center,
                style: EstiloTextoPreto.text16)
        ),
        SizedBox(
          width: 40,
          child: Text(player.price.toStringAsFixed(2),
              textAlign: TextAlign.center,
              style: EstiloTextoBranco.text14),
        ),
        ],
      );
  }
  Widget playersStatsWidgetLeague(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(player.matchsLeague.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.goalsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.assistsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        ],
      );
  }
  Widget playersStatsWidgetCards(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(player.injury.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Container(
              width: 22,
              height: 22,
              color: Colors.yellow,
              child: Center(child: Text(player.yellowCard.toString(),textAlign:TextAlign.center,style: EstiloTextoPreto.text14))
          ),
          Container(
              width: 22,
              height: 22,
              color: Colors.red,
              child: Center(child: Text(player.redCard.toString(),textAlign:TextAlign.center,style: EstiloTextoPreto.text14))
          ),
        ],
      );
  }
  Widget playersStatsWidgetCups(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(player.matchsCup.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.goalsCup.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.assistsCup.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        ],
      );
  }
  Widget playersStatsWidgetInternational(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(player.matchsInternational.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.goalsInternational.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.assistsInternational.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        ],
      );
  }
  Widget playersStatsWidgetCarrer(Jogador player){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(player.matchsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.goalsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
          Text(player.assistsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        ],
      );
  }




}