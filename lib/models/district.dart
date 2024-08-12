import 'package:flutter/material.dart';

class DistrictModel{
  DistrictModel({
    required this.color,
    required this.starByPlaza,
  });
  final Color color;
  final int starByPlaza;

  int _districtValues = 0;
  int _numberOfPlazas = 0;
  int _victoryPoints = 0;

  int get victoryPoints => _victoryPoints;
}

class DistrictModelProvider extends ChangeNotifier
{
  //DistrictModelProvider(Color color, int starByPlaza) : districtModel = DistrictModel(color: color,starByPlaza: starByPlaza);  
  DistrictModelProvider({required this.districtModel,});
  final DistrictModel districtModel;

  DistrictModel get model => districtModel;

    void updateVictoryPoints(){
    districtModel._victoryPoints = districtModel._districtValues * districtModel.starByPlaza * districtModel._numberOfPlazas;
    notifyListeners();
  }

    set districtValues(int value){
    districtModel._districtValues = value;
    updateVictoryPoints();
  }

    set numberOfPlazas(int value){
    districtModel._numberOfPlazas = value;
    updateVictoryPoints();
  }

  int get victoryPoints => districtModel._victoryPoints;

  Color get color => districtModel.color;
}