import 'package:fifa/classes/image_class.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/kits_crests/patterns.dart';
import 'package:flutter/material.dart';

class UniformCustom{

  ClubDetails clubDetails = ClubDetails();
  ClubPattern clubPattern = ClubPattern();

  late String clubName;
  late LinearGradient linearGradient;
  late Color sleeveColor;
  late ClubColors clubColors;
  late Color sportBrandColor;
  double scale = 1;

  bool paintMiddleBox = false;
  double heightMiddleBoxScale = 1;

  //CENTRAL BOX
  double spacingCentralBox = 20;
  double heightCentralBox = 90;
  double widthCentralBox = 50;
  //SLEEVES
  double angleSleeve = 70;
  double sleeveTopMargin = 7;
  double sleeveHeight = 20;
  double sleeveWidth = 30;
  double spacingRightSleeve = 60;

  UniformCustom(this.clubName,[this.scale = 1]){
    linearGradient = clubPattern.getGradient(clubDetails.getPattern(clubName), clubDetails.getColors(clubName));
    clubColors = clubDetails.getColors(clubName);

    setDefinitions(clubDetails.getPattern(clubName));

  }

bool compareLinearGradient(String patternStr){
    if(patternStr == clubDetails.getPattern(clubName)){
      return true;
    }
    return false;
}

setDefinitions(String patternStr){
  linearGradient = clubPattern.getGradient(patternStr, clubColors);
  if(patternStr == clubPattern.sleeves){
    sleeveColor = clubColors.secondColor;
  }else{
    sleeveColor = clubColors.primaryColor;
  }
  if(patternStr == clubPattern.stripesTricolor ||
      patternStr == clubPattern.stripes2 ||
      patternStr == clubPattern.stripes3 ||
      patternStr == clubPattern.stripes4 ||
      patternStr == clubPattern.stripesThin ||
      patternStr == clubPattern.divided ||
      patternStr == clubPattern.diagonal ||
      patternStr == clubPattern.diagonalInv ||
      patternStr == clubPattern.horStripes3 ||
      patternStr == clubPattern.horStripes4 ||
      patternStr == clubPattern.oneVertStripe
  ){
    paintMiddleBox = true;
  }

  if(patternStr == clubPattern.oneHorStripe){
    heightMiddleBoxScale = 0.7;
  }
  if(patternStr == clubPattern.stripes2 ||
      patternStr == clubPattern.stripes3 ||
      patternStr == clubPattern.stripesTricolor){
    sportBrandColor = clubColors.primaryColor;
  }else{
    sportBrandColor = clubColors.secondColor;
  }
}


Widget kit(){

  return Stack(
    children: [

      Container(
        padding: EdgeInsets.only(top:heightCentralBox*0.05, left: widthCentralBox*scale*0.5),
        child: Stack(
            children: [

              //Manga Esquerda
              Padding(
                padding: EdgeInsets.only(top:sleeveTopMargin*scale),
                child: Transform.rotate(
                  angle: -3.1415 * angleSleeve/ 360,
                  child: Container(
                    height: sleeveHeight*scale, width: sleeveWidth*scale,
                    decoration: BoxDecoration(
                      color: sleeveColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
                    ),
                  ),
                ),
              ),

              //Manga direita
              Padding(
                  padding: EdgeInsets.only(left: spacingRightSleeve*scale,top:sleeveTopMargin*scale),
                  child: Transform.rotate(
                    angle: 3.1415 * angleSleeve/ 360,
                    child: Container(
                      height: sleeveHeight*scale, width: sleeveWidth*scale,
                      decoration: BoxDecoration(
                        color: sleeveColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
                      ),
                    ),
                  )
              ),

              //Centro
              Padding(
                padding: EdgeInsets.only(left: spacingCentralBox*scale),
                child: Container(
                  height: heightCentralBox*scale, width: widthCentralBox*scale,
                  decoration: BoxDecoration(
                    color: clubColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(4*scale)),
                    gradient: linearGradient,
                  ),
                ),
              ),

              //clubDetails.getPattern(clubName) == clubPattern.solid ?
                //faixasLaterais() :
                //Container(),

              clubDetails.getPattern(clubName) == clubPattern.solid ?
                borderSleeves() :
                Container(),

              //upperPart(),

              curvedLine(),

              collar(),
              //LOGO
            Padding(
              padding: EdgeInsets.only(left: 50*scale,top: 12*scale),
                child: Images().getEscudoWidget(clubName,12*scale,12*scale),
            ),

              //MARCA ESPORTIVA
              Container(
                padding: EdgeInsets.only(left: 29*scale,top: 12*scale),
                child: Image.asset('assets/brands/sports/nike.png',
                  color: sportBrandColor,
                  height: 10*scale,width: 10*scale,),
              ),

              //PATROCINIO
              //Container(
              //  height: 22*scale,width: 32*scale,
              //  margin: EdgeInsets.only(left: 29*scale,top: 30*scale*heightMiddleBoxScale),
              //  color: paintMiddleBox ? clubColors.primaryColor : Colors.transparent,
              //),
              //Padding(
              //  padding: EdgeInsets.only(left: 29*scale,top: 25*scale*heightMiddleBoxScale),
              //  child: Image.asset('assets/brands/fly emirates.png',
              //      color: heightMiddleBoxScale==1 ?  clubColors.secondColor : clubColors.primaryColor,
              //      height: 32*scale,width: 32*scale,
              //  ),
              //),

            ],
          ),
      ),


      //adidasStripes(),
    ],
  );
}


////////////////////////////////////////////////////////////////////////////////
// CUSTOM KIT PARTS
//////////////////////////////////////////////////////////////////////////////
  Widget collar(){
    return Stack(
      children: [

        Padding(
          padding:  EdgeInsets.only(left: (spacingCentralBox+14)*scale),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100)),
              color: Colors.black38,
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 3*scale,
                color: clubColors.secondColor,
              ),
            ),
            height: 12*scale,
            width: 20*scale,
          ),
        ),

      ],
    );
  }


Widget borderSleeves(){
  double _width = 5;
    return   Stack(
      children: [

        //Manga Esquerda
        Padding(
          padding: EdgeInsets.only(top: (sleeveTopMargin+_width+3)*scale),
          child: Transform.rotate(
            angle: -3.1415 * angleSleeve/ 360,
            child: Container(
              height: sleeveHeight*scale, width: _width*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),


        //Manga direita
        Padding(
            padding: EdgeInsets.only(left: (spacingRightSleeve+23)*scale,top:(sleeveTopMargin+_width+2)*scale),
            child: Transform.rotate(
              angle: 3.1415 * angleSleeve/ 360,
              child: Container(
                height: sleeveHeight*scale, width: _width*scale,
                decoration: BoxDecoration(
                  color: clubColors.secondColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
                ),
              ),
            )
        ),

      ],
    );
}

Widget faixasLaterais(){
    double _height = 60;
    double _width = 5;
    return Stack(
      children: [
        //Faixa Esquerda
        Padding(
          padding: EdgeInsets.only(left: spacingCentralBox*scale,top: (heightCentralBox-_height)*scale),
          child: Container(
            height: _height*scale, width: _width*scale,
            decoration: BoxDecoration(
              color: clubColors.secondColor,
              borderRadius: BorderRadius.all(Radius.circular(2*scale)),
            ),
          ),
        ),

        //Faixa Direita
        Padding(
          padding: EdgeInsets.only(left: spacingCentralBox*scale+(50-_width)*scale,top: 20*scale),
          child: Container(
            height: _height*scale, width: _width*scale,
            decoration: BoxDecoration(
              color: clubColors.secondColor,
              borderRadius: BorderRadius.all(Radius.circular(2*scale)),
            ),
          ),
        ),

      ],
    );
}


  Widget upperPart(){
    return Stack(
      children: [

        Padding(
          padding: EdgeInsets.only(left: spacingCentralBox*scale),
          child: Container(
            height: heightCentralBox*scale*0.25, width: widthCentralBox*scale,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(4*scale)),
            ),
          ),
        ),

      ],
    );
  }

  Widget adidasStripes(){
    double _height = 3;
    return Stack(
      children: [

        //Manga Esquerda
        Padding(
          padding: EdgeInsets.only(left:1,top:(sleeveTopMargin+0.5)*scale),
          child: Transform.rotate(
            angle: -3.1415 * angleSleeve/ 360,
            child: Container(
              height: _height*scale, width: (sleeveWidth-6)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),
        //Manga Esquerda
        Padding(
          padding: EdgeInsets.only(left:2,top:(sleeveTopMargin+5.2)*scale),
          child: Transform.rotate(
            angle: -3.1415 * angleSleeve/ 360,
            child: Container(
              height: _height*scale, width: (sleeveWidth-6)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),


        //Manga direita
        Padding(
            padding: EdgeInsets.only(left: (spacingRightSleeve+9)*scale,top:(sleeveTopMargin)*scale),
            child: Transform.rotate(
              angle: 3.1415 * angleSleeve/ 360,
              child: Container(
                height: (_height)*scale, width:(sleeveWidth-5)*scale,
                decoration: BoxDecoration(
                  color: clubColors.secondColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
                ),
              ),
            )
        ),

        //Manga direita
        Padding(
            padding: EdgeInsets.only(left: (spacingRightSleeve+10)*scale,top:(sleeveTopMargin+5)*scale),
            child: Transform.rotate(
              angle: 3.1415 * angleSleeve/ 360,
              child: Container(
                height: (_height)*scale, width:(sleeveWidth-8)*scale,
                decoration: BoxDecoration(
                  color: clubColors.secondColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
                ),
              ),
            )
        ),

        //Linha 1
        Padding(
            padding: EdgeInsets.only(left: (spacingCentralBox+4)*scale),
            child: Container(
              height: (_height)*scale, width:(14.5)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
              ),
            )
        ),

        //Linha 2
        Padding(
            padding: EdgeInsets.only(left: (spacingCentralBox+4)*scale, top: 3),
            child: Container(
              height: (_height)*scale, width:(16)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
              ),
            )
        ),

        //Linha 1
        Padding(
            padding: EdgeInsets.only(left: (spacingCentralBox+37)*scale),
            child: Container(
              height: (_height)*scale, width:(14.5)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
              ),
            )
        ),
        //Linha 4
        Padding(
            padding: EdgeInsets.only(left: (spacingCentralBox+36)*scale, top: 3),
            child: Container(
              height: (_height)*scale, width:(16)*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
              ),
            )
        ),

      ],
    );
  }

  Widget curvedLine(){
    return Container(
      height: heightCentralBox*scale,width: widthCentralBox*scale,
      margin: EdgeInsets.only(left: spacingCentralBox*scale),
      padding: EdgeInsets.symmetric(horizontal: 2* scale),
      child: CustomPaint(
        painter: CurvePainter(clubColors.secondColor),
      ),
    );
  }

}


class CurvePainter extends CustomPainter {
//https://soonsantos.medium.com/how-to-draw-custom-shapes-in-flutter-aa197bda94bf
  late Color color;
  CurvePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke; // Change this to fill
    paint.strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.18);
    path.quadraticBezierTo(
        size.width*0.5, 0, size.width, size.height *0.18);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}