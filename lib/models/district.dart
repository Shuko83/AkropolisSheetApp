import 'package:flutter/material.dart';

class DistrictModel{
  DistrictModel({
    required this.districtCategory,
  });

  final DistrictCategory districtCategory;

  int _districtValues = 0;
  int _numberOfPlazas = 0;
  int _victoryPoints = 0;

  int get victoryPoints => _victoryPoints;

  int get starByPlaza
  {
    switch(districtCategory)
    {
      case DistrictCategory.houses:
        return 1;
      case DistrictCategory.temples:
      case DistrictCategory.markets:
      case DistrictCategory.barracks:
        return 2;
      case DistrictCategory.gardens:
        return 3;
      default:
      throw ('This color is not yet implemented');
    }
  }
  Color get color
  {
    switch(districtCategory)
    {
      case DistrictCategory.houses:
        return const Color.fromARGB(255, 95, 167, 226);
      case DistrictCategory.temples:
        return const Color.fromARGB(255, 226, 128, 243);
      case DistrictCategory.markets:
        return const Color.fromARGB(255, 241, 230, 125);
      case DistrictCategory.barracks:
        return const Color.fromARGB(255, 240, 97, 87);
      case DistrictCategory.gardens:
        return const Color.fromARGB(255, 126, 235, 129);
      default:
      throw ('This color is not yet implemented');
    }
  }
}

class DistrictModelProvider extends ChangeNotifier
{
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

enum DistrictCategory {
  houses,
  markets,
  barracks,
  temples,
  gardens,
}