import 'package:flutter/material.dart';

class Dietmodels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewisSelected;
  Color boxColor;

  Dietmodels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewisSelected,
    required this.boxColor,
  });

  static List<Dietmodels> getDiet() {
    List<Dietmodels> diets = [];
    diets.add(
      Dietmodels(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30mins',
        calories: '180kCal',
        viewisSelected: true,
        boxColor: const Color.fromARGB(255, 145, 206, 255),
      ),
    );
    diets.add(
      Dietmodels(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calories: '230kcal',
        viewisSelected: false,
        boxColor: const Color.fromARGB(255, 255, 152, 152),
      ),
    );
    return diets;
  }
}
