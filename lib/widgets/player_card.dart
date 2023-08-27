import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_moral.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/painter/colorize_image.dart';
import 'package:fifa/theme/painter/trapezoid.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

Widget playerCard(BuildContext context, ClubColors clubColors, Jogador player){
  double _heightCard = 120;
  return
    Container(
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(color: clubColors.secondColor, width:2),
      ),
      child: Column(
        children: [
          SizedBox(
            height: _heightCard,
            width: Sized(context).width,
            child: Stack(
              children: [

                ColorizedImage(
                  imagePath: 'assets/icons/background.png',
                  color: clubColors.primaryColor,
                  height: _heightCard,
                  width: Sized(context).width,
                ),

                Align(alignment:Alignment.center,child: Images().getPlayerPictureWidget(player,_heightCard,_heightCard)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(player.overall.toString(),style: EstiloTextoBranco.negrito40),
                ),
                //TRAPEZOIDE
                Padding(
                  padding: const EdgeInsets.only(right:60.0),
                  child: Align(alignment:Alignment.topRight,
                    child: CustomPaint(
                      painter: TrapezoidPainter(color:clubColors.secondColor,sizeObject: 20),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:70.0),
                  child: Align(alignment:Alignment.topRight,
                    child: CustomPaint(
                      painter: TrapezoidPainter(color:clubColors.primaryColor,sizeObject: 20),
                    ),),
                ),

                //ESCUDO
                GestureDetector(
                  onTap:(){
                      navigatorPush(context, ClubProfile(clubID: player.clubID));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                    child: Align(alignment:Alignment.topRight,child: Images().getEscudoWidget(player.clubName,55,55)),
                  ),
                ),

                //POSITION
                Padding(
                    padding: EdgeInsets.only(top:_heightCard*0.82, left:(Sized(context).width-16)/2-70),
                    child: positionContainer(player.position, size: 50, style: EstiloTextoBranco.text16)),

                //IDADE
                Padding(
                  padding: EdgeInsets.only(top:_heightCard*0.5),
                  child: Row(
                    children: [
                      const SizedBox(width: 4),
                      const Text("Idade", style: EstiloTextoBranco.negrito16),
                      const SizedBox(width: 10),
                      ageContainer(player.age),
                    ],
                  ),
                ),

                //MORAL
                Padding(
                  padding: EdgeInsets.only(top:_heightCard*0.8),
                  child: Row(
                    children: [
                      const SizedBox(width: 4),
                      const Text("Moral", style: EstiloTextoBranco.negrito16),
                      const SizedBox(width: 8),
                      moralContainer(player.moral),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:_heightCard*0.6, left: Sized(context).width*0.7),
                  child: lesoesCartoes(context, player),
                ),

              ],
            ),
          ),

          //NOME
          Container(
            color: clubColors.primaryColor.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //FLAG
                const SizedBox(width: 8),
                funcFlagsList(player.nationality, 26, 40),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(player.name, style: EstiloTextoBranco.negrito18),
                    ],
                  ),
                ),
                const SizedBox(width:34),
              ],
            ),
          ),


        ],
      ),
    );
}