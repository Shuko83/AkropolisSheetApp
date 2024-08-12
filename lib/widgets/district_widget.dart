import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';

class DistrictWidget extends StatefulWidget {
  const DistrictWidget({
    super.key,
    required this.districtModel,
  });

  final DistrictModel districtModel;

  
  void onStarChanged(String str){
      var nbStar = int.tryParse(str);
      if(nbStar != null)
      {
        districtModel.setNumberOfPlazas(nbStar);
      }
  }

  void onDistrictValueChanged(String str){
      var districtValues = int.tryParse(str);
      if(districtValues != null)
      {
        districtModel.setDistrictValues(districtValues);
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
            color: widget.districtModel.color,
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
                  score = widget.districtModel.getVictoryPoints().toString();
                }),
              ),
            ),
            Icon(Icons.hexagon,
            color: widget.districtModel.color,
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
                  score = widget.districtModel.getVictoryPoints().toString();
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

