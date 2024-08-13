import 'package:new_akropolis_sheets/models/district.dart';
import 'package:flutter/material.dart';

class CityModel {
  List<DistrictModel> districts = DistrictCategory.values.map((category)=>DistrictModel(districtCategory: category)).toList();

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
