class Popularmodels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewisSelected;

  Popularmodels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewisSelected,
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
        viewisSelected: true,
      ),
    );
    populars.add(
      Popularmodels(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Medium',
        duration: '20mins',
        calories: '120kCal',
        viewisSelected: true,
      ),
    );
    return populars;
  }
}
