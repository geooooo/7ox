import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import '../press_button/press_button_component.dart';
import '../label/label_dark/label_dark_component.dart';
import '../label/label_green/label_green_component.dart';
import '../label/label_yellow/label_yellow_component.dart';
import '../level_picker/level_picker_component.dart';
import '../color_picker/color_picker_component.dart';
import '../gamefield/gamefield_component.dart';
import '../dialog_window/dialog_window_component.dart';
import '../shadow/shadow_component.dart';


@Component(
  selector: 'app',
  templateUrl: 'app_component.html',
  styleUrls: const [ 'app_component.css' ],
  directives: const [
    NgFormModel,
    PressButtonComponent,
    LabelDarkComponent,
    LabelYellowComponent,
    LabelGreenComponent,
    LevelPickerComponent,
    ColorPickerComponent,
    GamefieldComponent,
    DialogWindowComponent,
    ShadowComponent,
  ],
)
class AppComponent implements OnInit {

  static const message_win_ai = 'Победил AI !';
  static const message_win_user = 'Победил Игрок !';

  String level = 'Средний';
  String levelNew = 'Средний';
  String step = '';
  String colorAI = '#9b59b6';
  String colorAINew = '#9b59b6';
  String colorUser = '#3498db';
  String colorUserNew = '#3498db';

  @ViewChild('levelPicker')
  LevelPickerComponent levelPicker;

  @ViewChild('colorPickerAI')
  ColorPickerComponent colorPickerAI;

  @ViewChild('colorPickerUser')
  ColorPickerComponent colorPickerUser;

  @ViewChild('gamefield')
  GamefieldComponent gamefield;

  @ViewChild('dialogWindow')
  DialogWindowComponent dialogWindow;

  @ViewChild('shadow')
  ShadowComponent shadow;

  @ViewChild('menu')
  ElementRef menu;

/*

FIXME: при изменении настроек какая-то хрень
FIXME: при появлении окна тень почему-то не исчезает иногда
TODO:  дописать привязку к backend

*/

  @override
  void ngOnInit() {
    colorPickerAI.setColor(colorAI);
    colorPickerUser.setColor(colorUser);
    levelPicker.setLevel(level);
    gamefield.clear();
    initGame();
  }

  void initGame() {
    if (new Random().nextInt(2) == 0) {
      step = 'AI';
      stepAI();
    } else {
      step = 'User';
    }
  }

  void stepAI() {
    var field = gamefield.getCells();
    // print(field);
    // gamefield.setCellXY(0, 0, colorAI);
    // if (new Random().nextInt(2) == 0) {
      // dialogWindow.message = message_win_ai;
      showWinner();
    // }
    step = 'User';
  }

  void onClickGamefield(Event event) {
    if (gamefield.setCell(event.target, colorUser)) {;
      step = 'AI';
      stepAI();
    }
  }

  void onChangeLevel(String value) {
    levelNew = value;
  }

  void onChangeColorAI(String color) {
    colorAINew = color;
  }

  void onChangeColorUser(String color) {
    colorUserNew = color;
  }

  void showWinner() {
    shadow.show();
    dialogWindow.show();
  }

  void hideWinner() {
    shadow.hide();
    dialogWindow.hide();
  }

  void showMenu() {
    var _menu = menu.nativeElement;
    _menu.classes.remove('animate_up');
    _menu.classes.add('animate');
    _menu.classes.add('animate_down');
    _menu.classes.add('animate_fast');
  }

  void hideMenu() {
    colorAINew = colorAI;
    colorUserNew = colorUser;
    levelNew = level;
    print(colorAINew);
    print(colorUserNew);
    print(levelNew);
    var _menu = menu.nativeElement;
    _menu.classes.remove('animate_down');
    _menu.classes.add('animate');
    _menu.classes.add('animate_up');
    _menu.classes.add('animate_fast');
  }

  void resetGame() {
    colorAI = colorAINew;
    colorUser = colorUserNew;
    level = levelNew;
    gamefield.clear();
    initGame();
    hideMenu();
  }

}
