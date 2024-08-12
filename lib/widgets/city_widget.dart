import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/models/city.dart';
import 'package:new_akropolis_sheets/models/player.dart';
import 'package:new_akropolis_sheets/widgets/district_widget.dart';
import 'package:new_akropolis_sheets/widgets/stone_widget.dart';


class CityWidget extends StatefulWidget{
  CityWidget({
    required this.player,
  });
  final String player;
  CityModel scoreModel = CityModel();

  @override
  State<CityWidget> createState() => _CityWidgetState();
}


class _CityWidgetState extends State<CityWidget> {

  final TextEditingController starsEditingController = TextEditingController();
  ValueNotifier<String> _totalScore = ValueNotifier<String>('');
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
              Text(widget.player),
              DistrictWidget(districtModel: widget.scoreModel.houses),
              DistrictWidget(districtModel: widget.scoreModel.barracks),
              DistrictWidget(districtModel: widget.scoreModel.markets),
              DistrictWidget(districtModel: widget.scoreModel.temples),
              DistrictWidget(districtModel: widget.scoreModel.gardens),
              //FamilyColorWidget(familyColor: widget.scoreModel.yellowFamily ),
              //FamilyColorWidget(familyColor: widget.scoreModel.purpleFamily),
             // FamilyColorWidget(familyColor: widget.scoreModel.redFamily),
              //FamilyColorWidget(familyColor: widget.scoreModel.greenFamily),
              StoneWidget(cityModel: widget.scoreModel,),
              Text(widget.scoreModel.getTotalScore().toString()),
        ],
      ),
    );
  }
}
