# Explanation for Day 2

Question can be found [here](https://adventofcode.com/2022/day/2)

## Interesting concepts

- Dealing with [Maps](https://api.dart.dev/be/180360/dart-core/Map-class.html)

## Approach

### Understand the input

In this question set, we get the input in this format

```
Opponent move 1   Your move 1
Opponent move 2   Your move 2
...
...
```

For each of the moves we have been given the necessary information about how to calculate the points scored in that round.
In Rock, Paper, Scissors, we can easily list down the appropriate response to opponent's moves to get the outcome we want (win/draw/lose).
Once we figure out a way of encoding this information, we can easily iterate over it and calculate the points.

A detailed description of now to read the input file was provided in [day_1 explanation](../day_1/explanation.md)

#### Listing down the outcomes

Let's say opponent plays Rock (A). Our options are

- Rock (X) - Draw
- Paper (Y) - Win
- Scissor (Z) - Loss

The same can be listed down for other moves as well. Let's look at how we can store this information in an efficient manner.

Here, Rock (A) is our primary identifier, we can store our data with respect to this.
Maps are a data structure for storing key/value pairs. Here "A" is our key and the outcomes are the values of this map.

```
{
    "A": <all possible outcomes against rock>,
    "B": <all possible outcomes against paper>,
    "C": <all possible outcomes against scissor>
}
```

Now let's consider opponent plays rock (A). We need something that gives us the points we score when we make different moves against this. Those are

- Rock (X), Draw | Points: 1 + 3 = 4
- Paper (Y), Win | Points 2 + 6 = 8
- Scissor (Z), Loss | Points 3 + 0 = 3

This can easily become a map, so let's have a map.

```dart
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
```

Here, `A`, `B` and `C` are the moves played by our opponent. For each move of opponent, we have 3 options. For each of those options, we score a certain amount of points.
Let's say opponent plays `B (Paper)`. We can play `X`, `Y` and `Z`, causing us to lose, draw and win in that order. All the data we need is now available to us, so if we want to access the points scored in this move, we can simply do this

```dart
MOVE_OUTCOMES_MAP_Q_1['B']['X'];
// Output 1
```

### Calculating total points

We can get information about each turn using `inputString.split('\n')` over the file string. Splitting this again over a `' '` gives us a list of two, first one being opponent's move and next being our move. We can get the corresponding points in the same way mentioned above.

### Improvements

The loop for calculating points can be made into a separate function itself. In the current code it is repeated twice.
