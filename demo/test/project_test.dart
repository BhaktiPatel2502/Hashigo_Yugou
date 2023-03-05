import 'package:demo/demo.dart';
import 'package:test/test.dart';

var matrix = [
      ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
      ['H', 'I', 'J', 'K', 'L', 'M', 'N'],
      ['O', 'P', 'Q', 'R', 'S', 'T', 'U'],
      ['V', 'W', 'X', 'Y', 'Z', 'AA', 'AB'],
      ['AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI'],
      ['AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP'],
      ['AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW'],
    ];

void main() {
  group('swipeUpFunction', () {
    
    for (var col = 0; col < matrix[0].length; col++) {
      test('swipe up column $col', () {
        var expectedMatrix = List.generate(matrix.length, (row) {
          var newRow = List.from(matrix[row]);
          if (row == matrix.length - 1) {
            newRow[col] = matrix[0][col];
          } else {
            newRow[col] = matrix[row + 1][col];
          }
          return newRow;
        });

        var actualMatrix = swipeUpFunction(matrix, matrix[0].length, col);

        expect(actualMatrix, equals(expectedMatrix));
      });
    }
  });

group('swipeDownFunction', () {
    for (var col = 0; col < matrix[0].length; col++) {
      test('swipe down column $col', () {
        var expectedMatrix = List.generate(matrix.length, (row) {
          var newRow = List.from(matrix[row]);
          if (row == 0) {
            newRow[col] = matrix[matrix.length - 1][col];
          } else {
            newRow[col] = matrix[row - 1][col];
          }
          return newRow;
        });

        var actualMatrix = swipeDownFunction(matrix, matrix[0].length, col);

        expect(actualMatrix, equals(expectedMatrix));
      });
    }
  });

group('swipeLeftFunction', () {
    for (var row = 0; row < matrix.length; row++) {
      test('swipe left row $row', () {
        var expectedMatrix = List.generate(matrix.length, (i) {
          var newRow = List.from(matrix[i]);
          if (i == row) {
            newRow = matrix[row].sublist(1) + [matrix[row][0]];
          }
          return newRow;
        });

        var actualMatrix = swipeLeftFunction(matrix, matrix.length, row);

        expect(actualMatrix, equals(expectedMatrix));
      });
    }
  });
 
group('swipeRightFunction', () {
    for (var row = 0; row < matrix.length; row++) {
      test('swipe right row $row', () {
        var expectedMatrix = List.generate(matrix.length, (i) {
          var newRow = List.from(matrix[i]);
          if (i == row) {
            newRow = [matrix[row][matrix[row].length - 1]] + matrix[row].sublist(0, matrix[row].length - 1);
          }
          return newRow;
        });

        var actualMatrix = swipeRightFunction(matrix, matrix.length, row);

        expect(actualMatrix, equals(expectedMatrix));
      });
    }
  });


}
