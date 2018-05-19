import 'dart:html';
import 'dart:async';
import 'package:angular/angular.dart';


@Component(
  selector: 'level-picker',
  templateUrl: 'level_picker_component.html',
  styleUrls: const [ 'level_picker_component.css' ],
)
class LevelPickerComponent {

  final _onChange = new StreamController.broadcast();
  @Output()
  Stream get change => _onChange.stream;

  @ViewChild('select')
  ElementRef select;

  void onChange(String value) {
    _onChange.add(value);
  }

  void setLevel(level) {
    var _select = select.nativeElement as SelectElement;
    switch (level) {
      case 'Глупый': _select.selectedIndex = 0; break;
      case 'Лёгкий': _select.selectedIndex = 1; break;
      case 'Средний': _select.selectedIndex = 2; break;
      case 'Сложный': _select.selectedIndex = 3; break;
      case 'Умный': _select.selectedIndex = 4; break;
    }
  }

}
