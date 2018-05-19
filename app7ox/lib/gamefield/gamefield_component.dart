import 'dart:html';
import 'package:angular/angular.dart';


@Component(
  selector: 'gamefield',
  templateUrl: 'gamefield_component.html',
  styleUrls: const [ 'gamefield_component.css' ],
)
class GamefieldComponent {

  @ViewChild('main')
  ElementRef main;

  List<List<int>> getCells() {
    var result = new List<List<int>>();
    var _main = main.nativeElement as HtmlElement;
    for (var row in _main.querySelectorAll('.gamefield__row')) {
      var line = <int>[];
      for (var cell in row.querySelectorAll('.gamefield__cell')) {
        int e;
        if (cell.classes.contains('gamefield__cell_empty')) e = 0;
        else if (cell.classes.contains('gamefield__cell_ai')) e = 1;
        else if (cell.classes.contains('gamefield__cell_user')) e = 2;
        line.add(e);
      }
      result.add(line);
    }
    return result;
  }

  bool setCell(HtmlElement cell, String color) {
    if (!cell.classes.contains('gamefield__cell_empty')) {
      return false;
    }
    cell.style.backgroundColor = color;
    cell.classes.remove('gamefield__cell_empty');
    cell.classes.add('gamefield__cell_user');
    return true;
  }

  void setCellXY(int x, int y, String color) {
    var _main = main.nativeElement as HtmlElement;
    int y0 = 0;
    for (var row in _main.querySelectorAll('.gamefield__row')) {
      int x0 = 0;
      for (var cell in row.querySelectorAll('.gamefield__cell')) {
        if ((y0 == y) && (x0 == x)) {
          cell.style.backgroundColor = color;
          cell.classes.remove('gamefield__cell_empty');
          cell.classes.add('gamefield__cell_ai');
          return;
        }
        x0++;
      }
      y0++;
    }
  }

  void clear() {
    var _main = main.nativeElement as HtmlElement;
    for (var row in _main.querySelectorAll('.gamefield__row')) {
      for (var cell in row.querySelectorAll('.gamefield__cell')) {
        cell.style.backgroundColor = '';
        cell.classes.remove('gamefield__cell_ai');
        cell.classes.remove('gamefield__cell_user');
        cell.classes.add('gamefield__cell_empty');
      }
    }
  }

}
