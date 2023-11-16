import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';

class TeamSelection extends StatefulWidget {
  const TeamSelection({Key? key}) : super(key: key);

  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {

  List clubs = ["Palmeiras", "Santos", "Boca Juniors", "Estudiantes", "LDU", "Racing", "Colo-Colo"];

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

    ClubDetails clubDetails = ClubDetails();

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Team Selection'),
              const Text('Team Selection',style: EstiloTextoBranco.text16),

              SizedBox(
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    crossAxisSpacing: 1, // Spacing between columns
                    mainAxisSpacing: 1,
                  ),
                  itemCount: clubs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return box(index, clubDetails);
                  },
                ),

          ),

              GestureDetector(
                onTap: (){

                },
                child: Container(
                  color: AppColors().greyTransparent,
                  child: Column(
                    children: const [
                      Text("Next", style: EstiloTextoBranco.text20),
                    ],
                  ),
                ),
              )

        ],
      ),
      ],
    )
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget box(index, ClubDetails clubdetails){

    String clubName = clubs[index];

    return InkWell(
      onTap: () async{
        String? selectedClub = await _showClubSelectionBottomSheet(context);
        if (selectedClub != null) {
          clubs[index] = selectedClub;
        }
        setState((){});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Images().getEscudoWidget(clubName),
            Text(clubName, style: EstiloTextoBranco.text16),
            starsWidgetFromOverall(clubdetails.getOverall(clubName),20),
          ],
        ),
      ),
    );
  }

  Future<String?> _showClubSelectionBottomSheet(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600, // Set the desired height of the bottom sheet
          child: ListView.builder(
            itemCount: clubsAllNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  children: [
                    Images().getEscudoWidget(clubsAllNameList[index]),
                    Text(clubsAllNameList[index]),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context, clubsAllNameList[index]);
                },
              );
            },
          ),
        );
      },
    );
  }

}
