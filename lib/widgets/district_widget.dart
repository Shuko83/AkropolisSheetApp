import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/widgets/common_widgets.dart';

class DistrictWidget extends StatefulWidget {
  const DistrictWidget({
    super.key,
    required this.districtModelProvider,
  });

  final DistrictModelProvider districtModelProvider;

  
  void onStarChanged(String str){
      var nbStar = int.tryParse(str);
      if(nbStar != null)
      {
        districtModelProvider.numberOfPlazas= nbStar;
      }
  }

  void onDistrictValueChanged(String str){
      var districtValues = int.tryParse(str);
      if(districtValues != null)
      {
        districtModelProvider.districtValues =districtValues;
      }
  }

  @override
  State<DistrictWidget> createState() => _DistrictWidgetState();
}

class _DistrictWidgetState extends State<DistrictWidget> {

  final TextEditingController starsEditingController = TextEditingController();
  var score = "" ;

 var inputFieldWidth = 120.0;
 var inputFieldHeight = 30.0;

  @override
  Widget build(BuildContext context) {

     Color cardColor = Color.fromARGB(
      widget.districtModelProvider.color.alpha,
      (widget.districtModelProvider.color.red * 0.9).toInt(),
      (widget.districtModelProvider.color.green * 0.9).toInt(),
      (widget.districtModelProvider.color.blue * 0.9).toInt(),
      );

    return Card(
      shadowColor: Colors.black,
      //surfaceTintColor: widget.districtModelProvider.color,
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                AkropolisIcon(icon: Icons.star_rounded,
                color:widget.districtModelProvider.color,      
                ),
                SizedBox(
                  height: inputFieldHeight,
                  width: inputFieldWidth,
                  child: AkropolisTextInput(func : (value) => setState(() {
                        widget.onStarChanged(value);
                        score = widget.districtModelProvider.victoryPoints.toString();
                      })),
                ),
                AkropolisIcon(icon: Icons.hexagon,
                color:widget.districtModelProvider.color,
                ),
                SizedBox(
                  width: inputFieldWidth,
                  height: inputFieldHeight,
                  child: AkropolisTextInput(func: (value) => setState(() {
                      widget.onDistrictValueChanged(value);
                      score = widget.districtModelProvider.victoryPoints.toString();}),
                  ),
                ),
              ],  
            ),
            Row(
              children: [
                Text('=',),
                Text(score.toString()),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

