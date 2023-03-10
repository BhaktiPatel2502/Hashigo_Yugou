import "dart:math";

const maxRows = 9;
const maxColumns = 9;
const alphabet = 26;
var alphabets =
    List.generate(alphabet, (index) => String.fromCharCode(index + 65));
var listOfElement = List.generate(maxRows, (_) => List.filled(maxRows, ''));
Set resultSet = {"Y", "X", "AA"};

int movesCounter = 0;
int maxMoves = 5;
bool middleRowMatched = false;

var swipeSelection = [
  () => clickFunctionSwipeDownColumns(2),
  () => clickFunctionSwipeDownColumns(3),
  () => clickFunctionSwipeDownColumns(4),
  () => clickFunctionSwipeUpColumns(2),
  () => clickFunctionSwipeUpColumns(3),
  () => clickFunctionSwipeUpColumns(4),
  () => clickFunctionSwipeLeftRows(2),
  () => clickFunctionSwipeLeftRows(3),
  () => clickFunctionSwipeLeftRows(4),
  () => clickFunctionSwipeRightRows(2),
  () => clickFunctionSwipeRightRows(3),
  () => clickFunctionSwipeRightRows(4)
];

Random rnd = Random();

void main() {
  initialList();

  print("initial Matrix of Element: ");
  for (int i = 0; i < maxRows; i++) {
    print(
        ' ${listOfElement[i][0]} \t ${listOfElement[i][1]} \t ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} \t ${listOfElement[i][5]} \t ${listOfElement[i][6]}  ');
  }

  screenDisplayGrid();

  for (int i = 0; i < maxMoves; i++) {
    swipeSelection[rnd.nextInt(swipeSelection.length)]();

    if (middleRowMatched) {
      break;
    }

    if (i == maxMoves - 1) {
      print("Maximum ${maxMoves} moves reached");

      break;
    }
  }
}

// Add element into a List

void initialList() {
  var twoLetterCombinations = List.generate(alphabet * alphabet, (index) {
    int firstLetterIndex = (index ~/ alphabet);
    int secondLetterIndex = (index % alphabet);

    return '${alphabets[firstLetterIndex]}${alphabets[secondLetterIndex]}';
  });

  int index = 0;
  for (int i = 0; i < maxRows; i++) {
    for (int j = 0; j < maxRows; j++) {
      if (index < alphabet) {
        listOfElement[i][j] = alphabets[index];
      } else {
        listOfElement[i][j] = twoLetterCombinations[index - alphabet];
      }
      index++;
    }
  }
}

// Swape Down Columns and test their old value with new value

void clickFunctionSwipeDownColumns(int index) {
  listOfElement = swipeDownFunction(listOfElement, maxColumns, index);
  print("-------------------------------------------------");
  print("Swipe after ${index + 1} Column Down: ");

  for (int i = 0; i < maxRows; i++) {
    print(
        ' ${listOfElement[i][0]} \t ${listOfElement[i][1]} \t ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} \t ${listOfElement[i][5]} \t ${listOfElement[i][6]}  ');
  }
  screenDisplayGrid();
  resultMatchSet();
}

List<List<String>> swipeDownFunction(
    var listOfElement, int maxColumns, int index) {
  var lastElement = listOfElement[6][index];
  for (int i = maxColumns - 2; i >= 0; i--) {
    listOfElement[i + 1][index] = listOfElement[(i) % maxColumns][index];
  }
  listOfElement[0][index] = lastElement;
  return listOfElement;
}

// Swape Up Columns and test their old value with new value

void clickFunctionSwipeUpColumns(int index) {
  listOfElement = swipeUpFunction(listOfElement, maxColumns, index);
  print("-------------------------------------------------");
  print("Swipe after ${index + 1} Column Up: ");

  for (int i = 0; i < maxRows; i++) {
    print(
        ' ${listOfElement[i][0]} \t ${listOfElement[i][1]} \t ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} \t ${listOfElement[i][5]} \t ${listOfElement[i][6]}  ');
  }
  screenDisplayGrid();
  resultMatchSet();
}

List<List<String>> swipeUpFunction(
    var listOfElement, int maxColumns, int index) {
  var firstElement = listOfElement[0][index];
  for (int i = 0; i < maxRows; i++) {
    listOfElement[i][index] = listOfElement[(i + 1) % maxColumns][index];
  }
  listOfElement[6][index] = firstElement;
  return listOfElement;
}

// Swape Left Rows and test their old value with new value

void clickFunctionSwipeLeftRows(int index) {
  listOfElement = swipeLeftFunction(listOfElement, maxRows, index);
  print("-------------------------------------------------");
  print("Swipe after ${index + 1} Row Left: ");

  for (int i = 0; i < maxRows; i++) {
    print(
        ' ${listOfElement[i][0]} \t ${listOfElement[i][1]} \t ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} \t ${listOfElement[i][5]} \t ${listOfElement[i][6]}  ');
  }
  screenDisplayGrid();
  resultMatchSet();
}

List<List<String>> swipeLeftFunction(
    var listOfElement, int maxRows, int index) {
  var a = listOfElement[index][0];
  for (int i = 0; i < maxRows; i++) {
    listOfElement[index][i] = listOfElement[index][(i + 1) % maxRows];
  }
  listOfElement[index][6] = a;
  return listOfElement;
}

// Swape Right Rows and test their old value with new value

void clickFunctionSwipeRightRows(int index) {
  listOfElement = swipeRightFunction(listOfElement, maxRows, index);
  print("-------------------------------------------------");
  print("Swipe after ${index + 1} Row Right: ");

  for (int i = 0; i < maxRows; i++) {
    print(
        ' ${listOfElement[i][0]} \t ${listOfElement[i][1]} \t ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} \t ${listOfElement[i][5]} \t ${listOfElement[i][6]}  ');
  }
  screenDisplayGrid();
  resultMatchSet();
}

List<List<String>> swipeRightFunction(
    var listOfElement, int maxColumns, int index) {
  var a = listOfElement[index][6];
  for (int i = maxRows - 2; i >= 0; i--) {
    listOfElement[index][i + 1] = listOfElement[index][(i) % maxColumns];
  }
  listOfElement[index][0] = a;
  return listOfElement;
}

void screenDisplayGrid() {
  print(" ");
  print("----------Grid of 3*3----------");
  for (int i = 2; i < 5; i++) {
    print(
        ' ${listOfElement[i][2]} \t ${listOfElement[i][3]} \t ${listOfElement[i][4]} ');
  }
  matchingFunction();
}

void matchingFunction() {
  if (listOfElement[3][2] == resultSet.elementAt(0) ||
      listOfElement[3][2] == resultSet.elementAt(1) ||
      listOfElement[3][2] == resultSet.elementAt(2)) {
    print("Match Character");
  } else {
    print("Not Match Character");
  }

  if (listOfElement[3][3] == resultSet.elementAt(0) ||
      listOfElement[3][3] == resultSet.elementAt(1) ||
      listOfElement[3][3] == resultSet.elementAt(2)) {
    print("Match Character");
  } else {
    print("Not Match Character");
  }

  if (listOfElement[3][4] == resultSet.elementAt(0) ||
      listOfElement[3][4] == resultSet.elementAt(1) ||
      listOfElement[3][4] == resultSet.elementAt(2)) {
    print('Match Character');
  } else {
    print('Not Match Character');
  }
}

void resultMatchSet() {

  if ((listOfElement[3][2] == resultSet.elementAt(0) ||
      listOfElement[3][2] == resultSet.elementAt(1) ||
      listOfElement[3][2] == resultSet.elementAt(2)) &&
          (listOfElement[3][3] == resultSet.elementAt(0) ||
      listOfElement[3][3] == resultSet.elementAt(1) ||
      listOfElement[3][3] == resultSet.elementAt(2)) &&
          (listOfElement[3][4] == resultSet.elementAt(0) ||
      listOfElement[3][4] == resultSet.elementAt(1) ||
      listOfElement[3][4] == resultSet.elementAt(2))) {
    print("Middle row matched with result set");
    middleRowMatched = true;
  } else {
    print("Middle row does not matched with result set");
  }
}