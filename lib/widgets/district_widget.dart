import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {

     HSVColor cardColor = HSVColor.fromColor(widget.districtModelProvider.color);
     //switch()
     cardColor = cardColor.withSaturation(cardColor.saturation * 0.5);
      //cardColor = cardColor.withHue(cardColor.hue + 15);

        HSVColor iconColor = HSVColor.fromColor(widget.districtModelProvider.color);
     //switch()
     iconColor = iconColor.withHue(cardColor.hue + 15);
    return Card(
      shadowColor: Colors.black,
      surfaceTintColor: widget.districtModelProvider.color,
      color: cardColor.toColor().withAlpha(170),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.star_rounded,
                color: iconColor.toColor(),
                shadows: [Shadow(color:Colors.black,offset: Offset(2,2), blurRadius: 4),
                  ],       
                ),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border : OutlineInputBorder(),
                    ),
                    onChanged:(value) => setState(() {
                      widget.onStarChanged(value);
                      score = widget.districtModelProvider.victoryPoints.toString();
                    }),
                  ),
                ),
                Icon(Icons.hexagon,
                color: iconColor.toColor(),
                shadows: [Shadow(color:Colors.black,offset: Offset(2,2), blurRadius: 4)],
                ),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border : OutlineInputBorder(),
                    ),
                    onChanged:(value) => setState(() {
                      widget.onDistrictValueChanged(value);
                      score = widget.districtModelProvider.victoryPoints.toString();
                    }),
                  ),
                ),
              ],  
            ),
            Row(
              children: [
                Text('='),
                Text(score.toString()),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

