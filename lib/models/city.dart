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
  
}

class CityModelProvider extends ChangeNotifier
{
  final CityModel _cityModel = CityModel();
  CityModel get cityModel => _cityModel;

  void computeScore(){
    _cityModel._totalScore = 
    _cityModel._numberOfStones + 
    _cityModel.barracks.getVictoryPoints() + 
    _cityModel.houses.getVictoryPoints() + 
    _cityModel.markets.getVictoryPoints() +
    _cityModel.temples.getVictoryPoints() +
    _cityModel.gardens.getVictoryPoints();
    notifyListeners();
  }

  int get totalScore => _cityModel._totalScore;
  set numberOfStones(int value) {
  _cityModel._numberOfStones = value;
    computeScore();
  }

  int get numberOfStones => _cityModel._numberOfStones;
}
