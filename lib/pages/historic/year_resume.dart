import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic_champions_league.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions.dart';
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

  List<String> possibleYears = [];
  String selectedYear = anoInicial.toString();
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    for(int i=anoInicial-65;i<=ano;i++){
      possibleYears.add(i.toString());
    }
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
                    internationalChampionsSelection(),
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

  Widget internationalChampionsSelection(){

    try {
      List clubs2ID = HistoricChampionsLeague().getFinalClubsIDOrdered(int.parse(selectedYear), LeagueOfficialNames().championsLeague);
      List clubs2IDLiberta = HistoricChampionsLeague().getFinalClubsIDOrdered(int.parse(selectedYear), LeagueOfficialNames().libertadores);

      return internationalChampionsWidget(clubsAllNameList[clubs2ID.first],clubsAllNameList[clubs2ID.last],clubsAllNameList[clubs2IDLiberta.first],clubsAllNameList[clubs2IDLiberta.last]);

    }catch(e){
      try{

        List clubs2ID = mapChampions(LeagueOfficialNames().championsLeague)[double.parse(selectedYear)];
        List clubs2IDLiberta = mapChampions(LeagueOfficialNames().libertadores)[double.parse(selectedYear)];

        return internationalChampionsWidget(clubs2ID.first,clubs2ID[1],clubs2IDLiberta.first,clubs2IDLiberta[1]);

      }catch(e){
        return Container();
      }
    }

  }

Widget internationalChampionsWidget(String c1,String c2,String c3,String c4){
  return Row(
    children: [
      Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().championsLeague),height: 40,width: 40),
      Images().getEscudoWidget(c1,40,40),
      Images().getEscudoWidget(c2,20,20),
      Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().libertadores),height: 40,width: 40),
      Images().getEscudoWidget(c3,40,40),
      Images().getEscudoWidget(c4,20,20),
    ],
  );
}

Widget resumeLeague(String leagueName){
  List classificationNames = [];
  if(int.parse(selectedYear) < anoInicial) {
    try {
      classificationNames = mapChampions(leagueName)[double.parse(selectedYear)];
    }catch(e){
      //print('LIGA $leagueName não tem histórico de classificação nesse ano);
    }
  }else{
    List classification = Classification(leagueIndex: leaguesIndexFromName[leagueName]).classificationClubsIndexes;
    for (var clubID in classification) { classificationNames.add(clubsAllNameList[clubID]); }
  }


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
            if(int.parse(selectedYear) == ano){
              customToast(Translation(context).text.loading);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableNacional(choosenLeagueIndex: leaguesIndexFromName[leagueName])));
            }else{
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                    context: context, builder: (c){
                      return SingleChildScrollView(
                          child: Column(
                        children: [

                          for(int i=0; i<classificationNames.length;i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    SizedBox(width:35,child: Text((i+1).toString()+'º ',textAlign: TextAlign.right,style:EstiloTextoPreto.text16)),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Images().getEscudoWidget(classificationNames[i],30,30),
                                    ),
                                    Text(classificationNames[i],style:EstiloTextoPreto.text16),
                                  ],
                                ),
                              ),
                        ],
                      ));
                    });
            }
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
                    classificationNames.isNotEmpty ? Images().getEscudoWidget(classificationNames[0],45,45) : Container(),
                    classificationNames.length>=2 ? Images().getEscudoWidget(classificationNames[1],30,30) : Container(),
                    classificationNames.length>=3 ? Images().getEscudoWidget(classificationNames[2],20,20) : Container(),
                    classificationNames.length>=4 ? Images().getEscudoWidget(classificationNames[3],20,20) : Container(),
                    classificationNames.length>=5 ? Images().getEscudoWidget(classificationNames[4],20,20) : Container(),
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
