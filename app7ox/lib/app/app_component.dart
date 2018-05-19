import 'dart:html';
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
  static const message_step_ai = 'AI';
  static const message_step_user = 'Игрок';

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

  @override
  void ngOnInit() {
    colorPickerAI.setColor(colorAI);
    colorPickerUser.setColor(colorUser);
    levelPicker.setLevel(level);
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
    dialogWindow.show();
    shadow.show();
  }

  void hideWinner() {
    dialogWindow.hide();
    shadow.hide();
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
    // TODO:
    hideMenu();
  }

}
