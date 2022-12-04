import 'dart:io';

const POINTS_ROCK = 1;
const POINTS_PAPER = 2;
const POINTS_SCISSORS = 3;

const POINTS_WIN = 6;
const POINTS_DRAW = 3;
const POINTS_LOSS = 0;

/// A map of all the moves that should be played againt
/// the opponent depending on what they play.
///
/// Against each such move is also the total points that
/// will be earned.
///
const MOVE_OUTCOMES_MAP_Q_1 = {
  'A': {
    'X': POINTS_ROCK + POINTS_DRAW,
    'Y': POINTS_PAPER + POINTS_WIN,
    'Z': POINTS_SCISSORS + POINTS_LOSS,
  },
  'B': {
    'X': POINTS_ROCK + POINTS_LOSS,
    'Y': POINTS_PAPER + POINTS_DRAW,
    'Z': POINTS_SCISSORS + POINTS_WIN,
  },
  'C': {
    'X': POINTS_ROCK + POINTS_WIN,
    'Y': POINTS_PAPER + POINTS_LOSS,
    'Z': POINTS_SCISSORS + POINTS_DRAW,
  },
};
const MOVE_OUTCOMES_MAP_Q_2 = {
  'A': {
    'Y': POINTS_ROCK + POINTS_DRAW,
    'Z': POINTS_PAPER + POINTS_WIN,
    'X': POINTS_SCISSORS + POINTS_LOSS,
  },
  'B': {
    'X': POINTS_ROCK + POINTS_LOSS,
    'Y': POINTS_PAPER + POINTS_DRAW,
    'Z': POINTS_SCISSORS + POINTS_WIN,
  },
  'C': {
    'Z': POINTS_ROCK + POINTS_WIN,
    'X': POINTS_PAPER + POINTS_LOSS,
    'Y': POINTS_SCISSORS + POINTS_DRAW,
  },
};

void main() {
  final directory = Directory.current.path;
  final inputString =
      File('$directory/inputs/input_day_2.txt').readAsStringSync();
  int pointsScored = 0;
  for (String turn in inputString.split('\n')) {
    final opponentMove = turn.split(' ')[0];
    final myMove = turn.split(' ')[1];
    final points = MOVE_OUTCOMES_MAP_Q_1[opponentMove]![myMove]!;
    pointsScored = pointsScored + points;
  }
  print('Answer 1 - $pointsScored');

  pointsScored = 0;
  for (String turn in inputString.split('\n')) {
    final opponentMove = turn.split(' ')[0];
    final myMove = turn.split(' ')[1];
    final points = MOVE_OUTCOMES_MAP_Q_2[opponentMove]![myMove]!;
    pointsScored = pointsScored + points;
  }
  print('Answer 2 - $pointsScored');
}
