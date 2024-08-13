import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AkropolisTextInput extends StatelessWidget {
  const AkropolisTextInput({
    super.key,
    required this.func,
  });

  final void Function(String) func;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 14),
      keyboardType: TextInputType.number,
      decoration:  InputDecoration(
        border : OutlineInputBorder(),
        contentPadding: EdgeInsets.all(0)
      ),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      onChanged: func,
    );
  }
}

class AkropolisIcon extends StatelessWidget {
  const AkropolisIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon,
    color: color,
    shadows: [Shadow(color:Colors.black,offset: Offset(2,2), blurRadius: 2)],
    );
  }
}

