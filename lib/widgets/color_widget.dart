import 'package:flutter/material.dart';
import 'package:new_akropolis_sheets/enums/akropolis_colors.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
    required this.color,
  });

  final AkropolisColors color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('stars'),
        TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your stars',
            ),
          ),
        Text('districts score'),
        TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your score',
            ),
          ),
        Text('Score for color'),

      ],
    );
  }
}

