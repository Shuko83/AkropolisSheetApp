import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';

class CityModel {
  DistrictModel barracks = DistrictModel(color: Colors.red, starByPlaza: 2);
  DistrictModel houses = DistrictModel(color: Colors.blue, starByPlaza: 1);
  DistrictModel markets = DistrictModel(color: Colors.yellow, starByPlaza: 2);
  DistrictModel temples = DistrictModel(color: Colors.purple, starByPlaza: 2);
  DistrictModel gardens = DistrictModel(color: Colors.green, starByPlaza: 3);
  var _numberOfStones = 0;
  var _totalScore = 0;

  void computeScore(){
    _totalScore = _numberOfStones + 
    barracks.getVictoryPoints() + 
    houses.getVictoryPoints() + 
    markets.getVictoryPoints() +
    temples.getVictoryPoints() +
    gardens.getVictoryPoints();
  }

  int getTotalScore(){
    return _totalScore;
  }

  void setNumberofStones(int value){
    _numberOfStones = value;
    computeScore();
  }

  int getNumberOfStones(){
    return _numberOfStones;
  }
}