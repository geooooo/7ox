import 'package:angular/angular.dart';
import '../press_button/press_button_component.dart';
import '../label/label_dark/label_dark_component.dart';
import '../label/label_green/label_green_component.dart';
import '../label/label_yellow/label_yellow_component.dart';
import '../label/label_light/label_light_component.dart';
import '../level_picker/level_picker_component.dart';
import '../color_picker/color_picker_component.dart';
import '../gamefield/gamefield_component.dart';
import '../dialog_window/dialog_window_component.dart';


@Component(
  selector: 'main',
  templateUrl: 'main_component.html',
  styleUrls: const [ 'main_component.css' ],
  directives: const [
    PressButtonComponent,
    LabelDarkComponent,
    LabelYellowComponent,
    LabelGreenComponent,
    LabelLightComponent,
    LevelPickerComponent,
    ColorPickerComponent,
    GamefieldComponent,
    DialogWindowComponent
  ],
)
class MainComponent {

  @ViewChild('levelPicker')
  ElementRef levelPicker;

  @ViewChild('colorPickerAI')
  ElementRef colorPickerAI;

  @ViewChild('colorPickerUser')
  ElementRef colorPickerUser;

  @ViewChild('menuButton')
  ElementRef menuButton;

  @ViewChild('gamefield')
  ElementRef gamefield;

  @ViewChild('dialogWindow')
  ElementRef dialogWindow;

}
