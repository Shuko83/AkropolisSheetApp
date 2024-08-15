import 'package:new_akropolis_sheets/models/district.dart';

/// Represent a city in Akropolis.
class CityModel {
  final List<DistrictModel> _districts = DistrictCategory.values.map((category)=>DistrictModel(districtCategory: category)).toList();

  var numberOfStones = 0;

  /// Return the [score] of a city.
  /// 
  /// The [score] depends of the number of stone and the victorious points for districts.
  int get score => numberOfStones + _getDistrictsScore();  

  /// Return the score of all district
  int _getDistrictsScore(){
   var victoryPoints = 0;
    for(var district in _districts){
      victoryPoints += district.victoryPoints;      
    }
    return victoryPoints;
  }

  /// Return the score for the specific district of [category].
  int getDistrictScore(DistrictCategory category){
    DistrictModel? districtFound = _districts.firstWhere(
    (district) => district.districtCategory == category,
    );

    return districtFound != null? districtFound.victoryPoints : 0;
  }
}