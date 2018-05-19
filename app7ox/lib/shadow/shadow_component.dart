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
    _main.parent.style.display = 'block';
    _main.style.display = 'block';
    _main.classes.remove('animate_hide');
    _main.classes.add('animate');
    _main.classes.add('animate_show');
    _main.classes.add('animate_fast');

    print('+');
  }

  void hide() {
    var _main = main.nativeElement as HtmlElement;
    _main.classes.remove('animate_show');
    _main.classes.add('animate');
    _main.classes.add('animate_hide');
    _main.classes.add('animate_fast');
    _main.parent.style.display = 'none';
    _main.style.display = 'none';
  }

}
