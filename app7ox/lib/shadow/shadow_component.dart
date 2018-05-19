import 'dart:html';
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
    _main.classes.add('animate');
    _main.classes.add('animate_show');
    _main.classes.add('animate_fast');
    print(_main.className);
  }

  void hide() {
    var _main = main.nativeElement as HtmlElement;
    _main.classes.add('animate');
    _main.classes.add('animate_hide');
    _main.classes.add('animate_fast');
    _main.style.display = 'none';
  }

}
