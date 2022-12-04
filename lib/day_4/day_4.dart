import 'dart:io';

void main() {
  final directory = Directory.current.path;
  final inputString =
      File('$directory/inputs/input_day_4.txt').readAsStringSync();
  final elfPairList = inputString.split('\n');
  int fullyContained = 0;
  int partiallyContained = 0;
  for (String pair in elfPairList) {
    final firstElf = Section(pair.split(',')[0]);
    final secondElf = Section(pair.split(',')[1]);
    if (firstElf.fullyContains(secondElf) ||
        secondElf.fullyContains(firstElf)) {
      fullyContained = fullyContained + 1;
      partiallyContained = partiallyContained + 1;
    } else {
      if (firstElf.overlaps(secondElf) || secondElf.overlaps(firstElf)) {
        partiallyContained = partiallyContained + 1;
      }
    }
  }
  print('Full overlap $fullyContained, partial $partiallyContained');
}

class Section {
  final int start;
  final int end;
  late int size;
  Section(String data)
      : start = int.parse(data.split('-')[0]),
        end = int.parse(data.split('-')[1]) {
    size = end - start;
  }

  bool fullyContains(Section elfSection) {
    if (elfSection.size > size) return false;
    if (start <= elfSection.start && end >= elfSection.end) {
      return true;
    }
    return false;
  }

  bool overlaps(Section elfSection) {
    if (this.fullyContains(elfSection) || elfSection.fullyContains(this)) {
      return true;
    }
    if (elfSection.start <= start &&
        elfSection.end <= end &&
        elfSection.end >= start) {
      return true;
    }
    if (elfSection.start >= start &&
        elfSection.end >= end &&
        elfSection.start <= end) {
      return true;
    }
    return false;
  }
}
