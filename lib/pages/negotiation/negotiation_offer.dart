import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_design.dart';
import 'package:fifa/widgets/player_card.dart';
import 'package:flutter/material.dart';

class NegotiationOfferPage extends StatefulWidget {
  final Jogador player;
  const NegotiationOfferPage({Key? key, required this.player}) : super(key: key);

  @override
  State<NegotiationOfferPage> createState() => _NegotiationOfferPageState();
}

class _NegotiationOfferPageState extends State<NegotiationOfferPage> {

  My my = My();
  String isBuy = Negotiation().typeBuy;

  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerSalary = TextEditingController();

  int sliderDuration = 1;

  void updateValueFromChild(double newValue) {
    setState(() {
      sliderDuration = newValue.toInt();
    });
  }
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _controllerPrice = TextEditingController(text: Negotiation().getPrice(widget.player.index).toStringAsFixed(3));
    _controllerSalary = TextEditingController(text: Negotiation().getSalary(widget.player.index).toStringAsFixed(3));
  }

  @override
  void dispose() {
    _controllerPrice.dispose();
    _controllerSalary.dispose();
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

                        playerCard(context, clubColors, widget.player),

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
                                    children: [
                                      const Text('Oferta',style: EstiloTextoBranco.negrito18),
                                      Text(selectEmojiFace(widget.player),style: const TextStyle(fontSize: 30)),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          isBuy==Negotiation().typeBuy ? typeValue("Compra", _controllerPrice, clubColors) : Container(),

                                          isBuy==Negotiation().typeBuy ? order() : Container(),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          typeValue("Salário", _controllerSalary, clubColors),
                                          propose(),
                                        ],
                                      ),

                                    ],
                                  ),

                                  //Slider
                                  FixedIntervalSlider(
                                    initialValue: Negotiation().getDuration(widget.player.index),
                                    clubColors: clubColors,
                                    onUpdateValue: updateValueFromChild,
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            buttonDesign2(title: 'Cancelar Negócio',
                                function: (){
                              Negotiation().cancelOffer(widget.player.index);
                              Navigator.of(context).pop();
                            }),

                            buttonDesign2(title: 'Negociar', 
                                function: (){
                              if(isBuy != Negotiation().typeBuy || double.parse(_controllerPrice.text.toString())<globalMyMoney){
                                Negotiation().saveNewOffer(
                                    widget.player.index,
                                    double.parse(_controllerPrice.text.toString()),
                                    double.parse(_controllerSalary.text.toString()),
                                    sliderDuration,
                                    Negotiation().typeBuy
                                );
                                Navigator.of(context).pop();
                              }else{
                                customToast("Sem dinheiro suficiente");
                              }
                            }),
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
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  String selectEmojiFace(Jogador player){
    const String emojiAngry = '\u{1F614}'; // Unicode value of the desired emoji
    const String emojiNeutral = '\u{1F610}'; // Unicode value of the desired emoji
    const String emojiHappy = '\u{1F600}'; // Unicode value of the desired emoji
    int price = 0;
    int salary = 0;
    try{
      price = double.parse(_controllerPrice.text.toString()).toInt();
      salary = double.parse(_controllerSalary.text.toString()).toInt();
    }catch(e){
      price = 0;
      salary = 0;
    }

    if(isBuy == Negotiation().typeRent){
      if(((salary/ player.salaryK)) <= 0.5){
        return emojiAngry;
      }else if(((salary/ player.salaryK)) >= 1) {
        return emojiHappy;
      }else {
        return emojiNeutral;
      }
    }

    if((price/ player.price) <= 0.6){
      return emojiAngry;
    }else if(((salary/ player.salaryK)) <= 0.5){
      return emojiAngry;
    }else if(((salary/ player.salaryK)) >= 3){
      return emojiHappy;
    }else if((price/ player.price) >= 0.6 && (price/ player.price) <=1){
      return emojiNeutral;
    }else if((price/ player.price) >= 1){
      return emojiHappy;
    }else if(((salary/ player.salaryK)) >= 1){
      return emojiHappy;
    }else{
      return emojiNeutral;
    }

  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////




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
    bool selected = false;
    if(isBuy==Negotiation().typeBuy && title=="Comprar" ){
      selected = true;
    }
    if(isBuy==Negotiation().typeRent && title!="Comprar" ){
      selected = true;
    }
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent2,
          border: Border.all(color: selected ? AppColors().green : Colors.transparent, width: 1),
        ),
        child: InkWell(
          onTap: (){
            if(title=="Comprar"){
              isBuy = Negotiation().typeBuy;
            }else{
              isBuy = Negotiation().typeRent;
            }
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
          const SizedBox(height: 12),
          Text('\$ '+widget.player.price.toStringAsFixed(3)+'mi',style: EstiloTextoBranco.text16),
          const SizedBox(height: 12),
        ],
      );
  }

  Widget propose(){
    return Column(
      children: [
        const Text('Salário',style: EstiloTextoBranco.negrito16),
        const SizedBox(height: 12),
        Text('\$ '+widget.player.salaryK.toStringAsFixed(3)+'k',style: EstiloTextoBranco.text16),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget typeValue(String hintText, TextEditingController _controller, ClubColors clubColors){
    return Container(
      width: Sized(context).width * 0.5,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(hintText,style: EstiloTextoBranco.negrito16),
          TextField(
            keyboardType: TextInputType.number,
            controller: _controller,
            cursorColor: AppColors().green,
            onChanged: (String value){

              setState((){});
            },
            style: TextStyle(color: clubColors.primaryColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: clubColors.secondColor.withOpacity(0.5), // Change background color
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors().green), // Change border color
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors().green,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: hintText,
            ),
            maxLines: 1, // Specify the number of lines for the text box
          ),
        ],
      ),
    );
  }


}






class FixedIntervalSlider extends StatefulWidget {
  final int initialValue;
  final ClubColors clubColors;
  final Function(double) onUpdateValue;
  const FixedIntervalSlider({Key? key, required this.initialValue, required this.clubColors, required this.onUpdateValue}) : super(key: key);
  @override
  _FixedIntervalSliderState createState() => _FixedIntervalSliderState();
}

class _FixedIntervalSliderState extends State<FixedIntervalSlider> {
  double _value = 1;

  void _updateParentValue() {
    widget.onUpdateValue(_value);
  }
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _value = widget.initialValue.toDouble();
  }
  ////////////////////////////////////////////////////////////////////////////
//                               WIDGET                                     //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  _updateParentValue();
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

