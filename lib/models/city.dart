import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';

class CityModel {
  /*DistrictModel barracks = DistrictModel(color: Colors.red, starByPlaza: 2);
  DistrictModel houses = DistrictModel(color: Colors.blue, starByPlaza: 1);
  DistrictModel markets = DistrictModel(color: Colors.yellow, starByPlaza: 2);
  DistrictModel temples = DistrictModel(color: Colors.purple, starByPlaza: 2);
  DistrictModel gardens = DistrictModel(color: Colors.green, starByPlaza: 3);*/
  List<DistrictModel> districts = [
    DistrictModel(color: Colors.blue, starByPlaza: 1),
    DistrictModel(color: Colors.red, starByPlaza: 2),
    DistrictModel(color: Colors.yellow, starByPlaza: 2),
    DistrictModel(color: Colors.purple, starByPlaza: 2),
    DistrictModel(color: Colors.green, starByPlaza: 3),
    ];
  int _numberOfStones = 0;
  int _totalScore = 0;
}

class CityModelProvider extends ChangeNotifier
{
  
  CityModelProvider(){
    for(var district in cityModel.districts){
      var provider = DistrictModelProvider(districtModel: district);
      providers.add(provider);
      provider.addListener(computeScore);
    }
  }

  final CityModel _cityModel = CityModel();
  CityModel get cityModel => _cityModel;

  List<DistrictModelProvider> providers = [];
   
  void computeScore(){
    _cityModel._totalScore = _cityModel._numberOfStones + _getVictoryPoints();
    notifyListeners();
  }

  int _getVictoryPoints(){
    var victoryPoints = 0;
    for(var district in cityModel.districts){
      victoryPoints += district.victoryPoints;      
    }
    return victoryPoints;
  }
  int get totalScore => _cityModel._totalScore;
  set numberOfStones(int value) {
  _cityModel._numberOfStones = value;
    computeScore();
  }

  int get numberOfStones => _cityModel._numberOfStones;
}
