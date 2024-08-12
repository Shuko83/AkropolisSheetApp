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
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.star,
            color: widget.districtModelProvider.color,
            ),
            SizedBox(
              width: 120,
              height: 50,
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
            ),
            SizedBox(
              width: 120,
              height: 50,
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
    );
  }
}

