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

  List<List<bool>> getCells() {
    var result = new List<List<bool>>();
    var _main = main.nativeElement as HtmlElement;
    for (var row in _main.querySelectorAll('.gamefield__row')) {
      var line = <bool>[];
      for (var cell in row.querySelectorAll('.gamefield__cell')) {
        line.add(!cell.classes.contains('gamefield__cell_empty'));
      }
      result.add(line);
    }
    return result;
  }

  bool setCell(HtmlElement cell) {
    if (!cell.classes.contains('gamefield__cell_empty')) {
      return false;
    }
    cell.classes.remove('gamefield__cell_empty');
    cell.classes.add('gamefield__cell_user');
    return true;
  }

  void setCellXY(int x, int y) {
    var _main = main.nativeElement as HtmlElement;
    int y0 = 0;
    for (var row in _main.querySelectorAll('.gamefield__row')) {
      int x0 = 0;
      for (var cell in row.querySelectorAll('.gamefield__cell')) {
        if ((y0 == y) && (x0 == x)) {
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
        cell.classes.remove('gamefield__cell_ai');
        cell.classes.remove('gamefield__cell_user');
        cell.classes.add('gamefield__cell_empty');
      }
    }
  }

}
