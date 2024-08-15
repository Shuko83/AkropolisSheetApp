import 'package:flutter/material.dart';

/// Represent a district for Akropolis.
class DistrictModel{
  DistrictModel({
    required this.districtCategory,
  });

  ///The category of the district
  final DistrictCategory districtCategory;

  int _districtValues = 0;
  int _numberOfStars = 0;

  /// Return the victory points
  int get victoryPoints => _numberOfStars * _districtValues;

  ///This method set the number of star with the [value]
  set numberOfStars(int value) => _numberOfStars = value;

  /// Use the [numberOfPlaza] to set internal number of star
  void setNumberOfPlaza(int numberOfPlaza){
    _numberOfStars = numberOfPlaza * getStarByPlaza(districtCategory);
  }

    ///This method set the district values with the [value]
  set numberDistrictValues(int value) => _districtValues = value;

}

///Return the number of star for one plaza for the [category]
int getStarByPlaza(category){
  switch(category)
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
    throw ('This category is not yet implemented');
  }
}
  
/// Return the associated color for a district [category]
Color getColor(category){
  switch(category)
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
    throw ('This category is not yet implemented');
  }
}

/// Represent the type of disstrict in Akropolis
enum DistrictCategory {
  houses,
  markets,
  barracks,
  temples,
  gardens,
}