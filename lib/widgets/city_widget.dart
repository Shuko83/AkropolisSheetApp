import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/models/city.dart';
import 'package:new_akropolis_sheets/widgets/district_widget.dart';
import 'package:new_akropolis_sheets/widgets/stone_widget.dart';
import 'package:provider/provider.dart';


class CityWidget extends StatefulWidget{
  CityWidget({
    required this.player,
  });
  final String player;

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
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
              Text(widget.player),
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
    );
  }
}
