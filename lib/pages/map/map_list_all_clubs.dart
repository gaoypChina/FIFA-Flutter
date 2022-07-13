import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapListAllClubs extends StatefulWidget {
  const MapListAllClubs({Key? key}) : super(key: key);

  @override
  State<MapListAllClubs> createState() => _MapListAllClubsState();
}

class _MapListAllClubsState extends State<MapListAllClubs> {

  List<String> countryOptions = [];
  String selectedCountry = Words.country.brazil;
  Iterable keysIterable = ClubDetails().map.keys;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getFlagsList();
    super.initState();
  }
  getFlagsList(){
    ClubDetails().map.forEach((key, value) {
      if(!countryOptions.contains(ClubDetails().getCountry(key))){
        countryOptions.add(ClubDetails().getCountry(key));
      }
    });
    setState((){});
    countryOptions.sort();
    setState((){});
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context, 'Lista de Clubes'),
              Expanded(
                child: ListView.builder(
                    itemCount: keysIterable.length,
                    itemBuilder: (c,i)=>clubRow(keysIterable.elementAt(i))
                ),
              ),
              selectCountryRow(),

            ],
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget clubRow(String clubName){
    if(selectedCountry != ClubDetails().getCountry(clubName)){
      return Container();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: ClubDetails().getColors(clubName).primaryColor.withOpacity(0.2),
      child: Stack(
            children: [

              SizedBox(
                height: 100,width: 150,
                child: Opacity(
                  opacity: 0.2,
                  child: AspectRatio(
                    aspectRatio: 350 / 451,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            alignment: FractionalOffset.center,
                            image: AssetImage(Images().getEscudo(clubName)),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(Images().getEscudo(clubName),height: 40,width: 40),
                                  const SizedBox(width: 12),
                                  Expanded(child: Text(clubName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.negrito18))
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  funcFlagsList(ClubDetails().getCountry(clubName), 15, 25),
                                  const SizedBox(width: 16),
                                  Text(ClubDetails().getFoundationYear(clubName).toString(),style: EstiloTextoBranco.text16),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image.asset(Images().getStadium(clubName),height: 80,width: 100,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          //Se o clube não tiver a imagem do estadio
                            return Image.asset('assets/clubs/generic0.jpg',height: 80,width: 100);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(ClubDetails().getStadium(clubName),style: EstiloTextoBranco.text14),
                        const Spacer(),
                        Text(ClubDetails().getStadiumCapacityPointFormat(clubName).toString(),style: EstiloTextoBranco.text16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Widget selectCountryRow(){
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: countryOptions.length,
          itemBuilder: (c,i)=>countrySelection(countryOptions[i])
      ),
    );
  }
  Widget countrySelection(String country){
    return GestureDetector(
      onTap: (){
        selectedCountry = country;
        setState((){});
      },
      child: Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: funcFlagsList(country, 40, 50),
      )),
    );
  }
}
