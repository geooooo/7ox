import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';


@Component(
  selector: 'color-picker',
  templateUrl: 'color_picker_component.html',
  styleUrls: const [ 'color_picker_component.css' ],
)
class ColorPickerComponent {

  final _onChange = new StreamController.broadcast();
  @Output()
  Stream get change => _onChange.stream;

  @ViewChild('color')
  ElementRef color;

  @ViewChild('input')
  ElementRef input;

  void onChange(String value) {
    setColor(value);
    _onChange.add(value);
  }

  setColor(String value) {
    var _color = color.nativeElement as HtmlElement;
    var _input = input.nativeElement as HtmlElement;
    _color.style.backgroundColor = value;
    _input.value = value;
  }

}
