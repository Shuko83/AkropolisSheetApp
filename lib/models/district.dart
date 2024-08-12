import 'package:flutter/material.dart';

class DistrictModel{
  DistrictModel({
    required this.color,
    required this.starByPlaza,
  });
  final Color color;
  final int starByPlaza;

  var _districtValues = 0;
  var _numberOfPlazas = 0;
  var _victoryPoints = 0;

  void setDistrictValues(int value){
    _districtValues = value;
    updateVictoryPoints();
  }

    void setNumberOfPlazas(int value){
    _numberOfPlazas = value;
    updateVictoryPoints();
  }

  void updateVictoryPoints(){
    _victoryPoints = _districtValues * starByPlaza * _numberOfPlazas;
  }

  int getVictoryPoints(){
    return _victoryPoints;
  }
}
