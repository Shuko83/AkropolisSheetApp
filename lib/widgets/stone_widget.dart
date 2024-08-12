import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/models/city.dart';

class StoneWidget extends StatefulWidget {
  const StoneWidget({
    super.key,
    required this.cityModelProvider
  });

  final CityModelProvider cityModelProvider;


  void onStonesChanged(String str)
  {
    var stones = int.tryParse(str);
      if(stones != null)
      {
        cityModelProvider.numberOfStones = stones;
      }
      else
      {
        cityModelProvider.numberOfStones = 0;
      }
  }
  @override
  State<StoneWidget> createState() => _StoneWidgetState();
}

class _StoneWidgetState extends State<StoneWidget> {

  final TextEditingController starsEditingController = TextEditingController();

  var stones = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.square,
        color: Colors.grey,
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
                  widget.onStonesChanged(value);
                  stones = widget.cityModelProvider.numberOfStones.toString();
                }),
              ),
            ),
      ],
    );
  }
}

