import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class YearResume extends StatefulWidget {
  const YearResume({Key? key}) : super(key: key);

  @override
  State<YearResume> createState() => _YearResumeState();
}

class _YearResumeState extends State<YearResume> {

  List<String> possibleYears = ['2022','2021','2020'];
  String selectedYear = anoInicial.toString();
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
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
              backButtonText(context,'Resumo do ano'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dropDownButton(),
                    internationalChampions(),
                  ],
                ),
              ),

              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                      childAspectRatio: 2.8,
                    ),
                  itemCount: leaguesListRealIndex.length,
                  itemBuilder: (c,index)=> resumeLeague(League(index: leaguesListRealIndex[index]).name)
              ),
              ),


            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget dropDownButton(){
    return                   Container(
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
        child: DropdownButton<String>(
          value: selectedYear,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          iconEnabledColor: Colors.black, //Icon color
          underline: Container(), //empty line
          dropdownColor: Colors.white,
          items: possibleYears.map((value) {
            return DropdownMenuItem(
              child: Text(value,style: EstiloTextoPreto.text16),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {});
            selectedYear = value.toString();
          },
        ),
      ),
    );
  }

  Widget internationalChampions(){
    return Row(
      children: [
        Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().championsLeague),height: 40,width: 40),
        Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().libertadores),height: 40,width: 40),
      ],
    );
  }
Widget resumeLeague(String leagueName){

    List classification = Classification(leagueIndex: leaguesIndexFromName[leagueName]).classificationClubsIndexes;

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1, //                   <--- border width here
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            customToast(Translation(context).text.loading);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableNacional(choosenLeagueIndex: leaguesIndexFromName[leagueName])));
          },
          child: Stack(
            children: [

              SizedBox(
                width: Sized(context).width*0.45,
                child: Center(
                  child: SizedBox(
                    height: 70,width: 90,
                    child: Opacity(
                      opacity: 0.2,
                      child: AspectRatio(
                        aspectRatio: 350 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.center,
                                image: AssetImage(FIFAImages().campeonatoLogo(leagueName)),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    Images().getEscudoWidget(clubsAllNameList[classification[0]],45,45),
                    Images().getEscudoWidget(clubsAllNameList[classification[1]],30,30),
                    classification.length>=3 ? Images().getEscudoWidget(clubsAllNameList[classification[2]],20,20) : Container(),
                    classification.length>=4 ? Images().getEscudoWidget(clubsAllNameList[classification[3]],20,20) : Container(),
                    classification.length>=5 ? Images().getEscudoWidget(clubsAllNameList[classification[4]],20,20) : Container(),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
}

}
