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
                Icon(Icons.star_rounded,
                color: widget.districtModelProvider.color,
                shadows: [Shadow(color:Colors.black,offset: Offset(2,2), blurRadius: 2),
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
                color: widget.districtModelProvider.color,
                shadows: [Shadow(color:Colors.black,offset: Offset(2,2), blurRadius: 2)],
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

