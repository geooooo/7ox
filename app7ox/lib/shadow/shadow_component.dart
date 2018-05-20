import 'dart:html';
import 'dart:async';
import 'package:angular/angular.dart';


@Component(
  selector: 'shadow',
  templateUrl: 'shadow_component.html',
  styleUrls: const [ 'shadow_component.css' ],
)
class ShadowComponent {

  @ViewChild('main')
  ElementRef main;

  void show() {
    var _main = main.nativeElement as HtmlElement;
    _main.style.display = 'block';
    _main.parent.style.display = 'block';
    _main.classes.remove('animate_hide');
    _main.classes.add('animate');
    _main.classes.add('animate_show');
    _main.classes.add('animate_fast');
  }

  void hide() {
    var _main = main.nativeElement as HtmlElement;
    new Timer(const Duration(milliseconds: 500), () {
      _main.style.display = 'none';
      _main.parent.style.display = 'none';
    });
    _main.classes.remove('animate_show');
    _main.classes.add('animate');
    _main.classes.add('animate_hide');
    _main.classes.add('animate_fast');

  }

}
