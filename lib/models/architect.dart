/// Represent a player in Akropolis.
class ArchitectModel {
  ArchitectModel({
    required this.name,
  });
  
  /// The name of architect
  String name;

  var _numberOfPlayedGame = 0;
  var _numberOfWinGame = 0;

  void rename(String name){
    this.name = name;
  }
}