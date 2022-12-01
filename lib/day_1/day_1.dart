import 'dart:io';

// Written by Chinmay Kabi(Chinmay-KB) on 2/12/22 3:54 AM IST

void main() {
  final directory = Directory.current.path;
  final fileString =
      File('$directory/inputs/input_day_1.txt').readAsStringSync();
  final elvesGroups = fileString.split('\n\n');
  final elvesCalories = <int>[];
  for (int i = 0; i < elvesGroups.length; i++) {
    int elfCalories = 0;
    final elfCalorieList = elvesGroups[i].split('\n');
    for (int j = 0; j < elfCalorieList.length; j++) {
      elfCalories = elfCalories + int.parse(elfCalorieList[j]);
    }
    elvesCalories.add(elfCalories);
  }

  elvesCalories.sort();
  print('Most calories is ${elvesCalories[elvesCalories.length - 1]}');
  print(
      'Top 3 have  ${elvesCalories[elvesCalories.length - 1] + elvesCalories[elvesCalories.length - 2] + elvesCalories[elvesCalories.length - 3]}');
}
