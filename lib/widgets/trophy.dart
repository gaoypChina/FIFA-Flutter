import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:flutter/material.dart';

class TrophyWidget extends StatelessWidget {
  final String name;
  final int qntd;
  final double scale;
  const TrophyWidget({Key? key, required this.name, required this.qntd, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = getTrophyImage(name);
    double _height = 120*scale;
    double _width = 100*scale;
    return Container(
      height: _height,
      width: _width,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: AppColors().greyTransparent,
      child: Stack(
        children: [
          //LOGO DE FUNDO OPACA
          SizedBox(
            height: _height,width: _width,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        alignment: FractionalOffset.center,
                        image: AssetImage('assets/trophy/$image.png')),
                  )
              ),
            ),
          ),
          Container(
            width: _width,
            padding: EdgeInsets.only(top: _height*0.25),
            child: Text(name, textAlign:TextAlign.center, style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 14*scale,
            )
            ),
          ),
          Container(
            width: _width,
            padding: EdgeInsets.only(top: _height*0.55),
            child: Text(qntd.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.negrito40),
          ),

        ],
      ),
    );
  }
}
