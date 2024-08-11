import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  var scoreDistrict = 0.0;
  var stars = 0.0;
  final TextEditingController starsEditingController = TextEditingController();
  double getScore(){
    return stars * scoreDistrict;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.star,
        color: widget.color,
        ),
        SpinBox(  min: 0,
                  max: 100,
                  value: stars,
                  onChanged: (double value){
                    setState(() {
                      stars = value;
                    });
                  },
        ),
        Icon(Icons.hexagon,
        color: widget.color,
        ),
        SpinBox(  min: 0,
                  max: 100,
                  value: stars,
                  onChanged: (double value){
                    setState(() {
                      scoreDistrict = value;
                    });
                  },
        ),
        const Text('Score for color'),
      ],
    );
  }
}

