class Popularmodels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool boxisSelected;

  Popularmodels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxisSelected,
  });

  static List<Popularmodels> getPopular() {
    List<Popularmodels> populars = [];
    populars.add(
      Popularmodels(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30mins',
        calories: '230kCal',
        boxisSelected: true,
      ),
    );
    populars.add(
      Popularmodels(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Medium',
        duration: '20mins',
        calories: '120kCal',
        boxisSelected: true,
      ),
    );
    return populars;
  }
}
