import 'dart:html';
import 'dart:async';
import 'package:angular/angular.dart';


@Component(
  selector: 'dialog-window',
  templateUrl: 'dialog_window_component.html',
  styleUrls: const [ 'dialog_window_component.css' ],
)
class DialogWindowComponent {

  String message = '';

  @ViewChild('main')
  ElementRef main;

  void show() {
    var _main = main.nativeElement as HtmlElement;
    _main.parent.style.display = 'block';
    _main.classes.remove('animate_up');
    _main.classes.add('animate');
    _main.classes.add('animate_down');
    _main.classes.add('animate_fast');
  }

  void hide() {
    var _main = main.nativeElement as HtmlElement;
    new Timer(const Duration(milliseconds: 500), () {
      _main.parent.style.display = 'none';
    });
    _main.classes.remove('animate_down');
    _main.classes.add('animate');
    _main.classes.add('animate_up');
    _main.classes.add('animate_fast');
  }

}
