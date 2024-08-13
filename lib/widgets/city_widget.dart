import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/models/city.dart';
import 'package:new_akropolis_sheets/widgets/district_widget.dart';
import 'package:new_akropolis_sheets/widgets/stone_widget.dart';
import 'package:provider/provider.dart';


class CityWidget extends StatefulWidget{
  CityWidget({
    required this.playerName,
  });
  final String playerName;

  @override
  State<CityWidget> createState() => _CityWidgetState();
}


class _CityWidgetState extends State<CityWidget> {

  final TextEditingController starsEditingController = TextEditingController();
  final CityModelProvider cityProvider = CityModelProvider();
  int totalScore = 0;
  @override
  Widget build(BuildContext context) {
    


    cityProvider.addListener((){
      setState((){
        totalScore= cityProvider.totalScore;});
    });
    return Card(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.blueGrey,
      elevation: 30,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
                Text(widget.playerName),
                for(var provider in cityProvider.providers)
                    DistrictWidget(districtModelProvider: provider),
                //FamilyColorWidget(familyColor: widget.scoreModel.yellowFamily ),
                //FamilyColorWidget(familyColor: widget.scoreModel.purpleFamily),
               // FamilyColorWidget(familyColor: widget.scoreModel.redFamily),
                //FamilyColorWidget(familyColor: widget.scoreModel.greenFamily),
                StoneWidget(cityModelProvider: cityProvider),
                Text(totalScore.toString()),
          ],
        ),
      ),
    );
  }
}
