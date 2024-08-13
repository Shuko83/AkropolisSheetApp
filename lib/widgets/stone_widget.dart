import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/models/city.dart';
import 'package:new_akropolis_sheets/widgets/common_widgets.dart';

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
    return Card(
      child: Container(
        margin: EdgeInsets.all(9),
        child: Row(
          
          children: [
            AkropolisIcon(icon: Icons.square,
            color: Colors.grey,
            ),
            SizedBox(
                  width: 120,
                  height: 30,
                  child: AkropolisTextInput(
                    func:(value) => setState(() {
                      widget.onStonesChanged(value);
                      stones = widget.cityModelProvider.numberOfStones.toString();
                    }),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

