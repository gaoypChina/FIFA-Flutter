import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/background_color/moral_icon.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/painter/colorize_image.dart';
import 'package:fifa/theme/painter/trapezoid.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/button_design.dart';
import 'package:flutter/material.dart';

class NegotiationOfferPage extends StatefulWidget {
  final Jogador player;
  const NegotiationOfferPage({Key? key, required this.player}) : super(key: key);

  @override
  State<NegotiationOfferPage> createState() => _NegotiationOfferPageState();
}

class _NegotiationOfferPageState extends State<NegotiationOfferPage> {

  My my = My();
  String isBuy = "Comprar";
  final String emoji = '\u{1F600}'; // Unicode value of the desired emoji

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.player.price.toStringAsFixed(3));
    _controller2 = TextEditingController(text: widget.player.salaryK.toStringAsFixed(3));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    ClubColors clubColors = ClubDetails().getColors(widget.player.clubName);

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                backButtonText(context,'Negotiation'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        playerCard(clubColors),

                        myFinanceBalance(),

                        Row(
                          children: [
                            selectionButton('Empréstimo'),
                            selectionButton('Comprar'),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: AppColors().greyTransparent,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('Oferta',style: EstiloTextoBranco.negrito18),
                                      Text('\u{1F600}',style: TextStyle(fontSize: 30)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          isBuy=="Comprar" ? typeValue("Compra", _controller1) : Container(),
                                          typeValue("Salário", _controller2),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          isBuy=="Comprar" ? order() : Container(),
                                          propose(),
                                        ],
                                      ),

                                    ],
                                  ),

                                  FixedIntervalSlider(clubColors: clubColors),

                                ],
                              ),
                            ],
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buttonDesign2(title: 'Cancelar', function: (){Navigator.of(context).pop();}),
                            buttonDesign2(title: 'Negociar', function: (){}),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget playerCard(ClubColors clubColors){
  return
    Container(
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(color: clubColors.secondColor, width:2),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: Sized(context).width,
            child: Stack(
              children: [

                ColorizedImage(
                  imagePath: 'assets/icons/background.png',
                  color: clubColors.primaryColor,
                  height: 100,
                  width: Sized(context).width,
                ),

                Align(alignment:Alignment.center,child: Images().getPlayerPictureWidget(widget.player,100,100)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.player.overall.toString(),style: EstiloTextoBranco.negrito40),
                ),
                //FLAG
                Padding(
                  padding: EdgeInsets.only(top:80, left:(Sized(context).width-16)/2+20),
                  child: funcFlagsList(widget.player.nationality, 30, 35),
                ),
                //TRAPEZOIDE
                Padding(
                  padding: const EdgeInsets.only(right:60.0),
                  child: Align(alignment:Alignment.topRight,
                    child: CustomPaint(
                      painter: TrapezoidPainter(color:clubColors.secondColor,size: 20),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:70.0),
                  child: Align(alignment:Alignment.topRight,
                    child: CustomPaint(
                      painter: TrapezoidPainter(color:clubColors.primaryColor,size: 20),
                    ),),
                ),

                //ESCUDO
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                  child: Align(alignment:Alignment.topRight,child: Images().getEscudoWidget(widget.player.clubName,55,55)),
                ),

                //POSITION
                Padding(
                    padding: EdgeInsets.only(top:80, left:(Sized(context).width-16)/2-70),
                    child: positionContainer(widget.player.position, size: 50, style: EstiloTextoBranco.text16)),

              ],
            ),
          ),

          Container(
            color: clubColors.primaryColor.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.player.name,style: EstiloTextoBranco.negrito16),
              ],
            ),
          ),

          Row(
            children: [
              const Text("Idade", style: EstiloTextoBranco.negrito16),
              const SizedBox(width: 10),
              ageContainer(widget.player.age),
            ],
          ),

          Row(
            children: [
              const Text("Moral", style: EstiloTextoBranco.negrito16),
              const SizedBox(width: 8),
              moralContainer(widget.player.moral),
            ],
          ),
        ],
      ),
    );
}


Widget myFinanceBalance(){
    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      width: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Saldo',style: EstiloTextoBranco.negrito16),
          Text('\$ ' + my.money.toStringAsFixed(2) + "mi",style: EstiloTextoBranco.text14),
        ],
      ),
    );
}

  Widget selectionButton(String title){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent2,
          border: Border.all(color: isBuy==title ? AppColors().green : Colors.transparent, width: 1),
        ),
        child: InkWell(
          onTap: (){
            isBuy = title;
            setState((){});
          },
          child: Center(child: Text(title,style: EstiloTextoBranco.negrito16)),

        ),
      ),
    );
  }

Widget order(){
    return Column(
        children: [
          const Text('Valor',style: EstiloTextoBranco.negrito16),
          Text('\$ '+widget.player.price.toStringAsFixed(3)+'mi',style: EstiloTextoBranco.text14),
        ],
      );
  }

  Widget propose(){
    return Column(
      children: [
        const Text('Salário',style: EstiloTextoBranco.negrito16),
        Text('\$ '+widget.player.salaryK.toStringAsFixed(3)+'k',style: EstiloTextoBranco.text14),
      ],
    );
  }

  Widget typeValue(String hintText, TextEditingController _controller){
    return Container(
      width: Sized(context).width*0.5,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(hintText,style: EstiloTextoBranco.negrito16),
          Container(
            padding: EdgeInsets.zero, // Remove padding
            child: TextField(
              controller: _controller,
              cursorColor: AppColors().green,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Change background color
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors().green), // Change border color
                ),
                hintText: hintText,
              ),
              maxLines: 1, // Specify the number of lines for the text box
            ),
          ),
        ],
      ),
    );
  }


}






class FixedIntervalSlider extends StatefulWidget {
  final ClubColors clubColors;
  const FixedIntervalSlider({Key? key, required this.clubColors}) : super(key: key);
  @override
  _FixedIntervalSliderState createState() => _FixedIntervalSliderState();
}

class _FixedIntervalSliderState extends State<FixedIntervalSlider> {
  double _value = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sized(context).width-50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Duração do Contrato', style: EstiloTextoBranco.negrito16),
          Slider(
                value: _value,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                activeColor: widget.clubColors.primaryColor,
                inactiveColor: widget.clubColors.secondColor,
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
          ),
          Text(_value.toStringAsFixed(0) + ' anos', style: EstiloTextoBranco.text14),
        ],
      ),
    );
  }
}

