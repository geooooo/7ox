import 'package:angular/angular.dart';
import '../press_button/press_button_component.dart';
import '../label/label_dark/label_dark_component.dart';
import '../label/label_green/label_green_component.dart';
import '../label/label_yellow/label_yellow_component.dart';
import '../level_picker/level_picker_component.dart';
import '../color_picker/color_picker_component.dart';
import '../gamefield/gamefield_component.dart';
import '../dialog_window/dialog_window_component.dart';


@Component(
  selector: 'app',
  templateUrl: 'app_component.html',
  styleUrls: const [ 'app_component.css' ],
  directives: const [
    PressButtonComponent,
    LabelDarkComponent,
    LabelYellowComponent,
    LabelGreenComponent,
    LevelPickerComponent,
    ColorPickerComponent,
    GamefieldComponent,
    DialogWindowComponent
  ],
)
class AppComponent {

  @ViewChild('level')
  ElementRef level;

  @ViewChild('colorAI')
  ElementRef colorAI;

  @ViewChild('colorUser')
  ElementRef colorUser;

  @ViewChild('gamefield')
  ElementRef gamefield;

  @ViewChild('labelStep')
  ElementRef labelStep;

  @ViewChild('labelLevel')
  ElementRef labelLevel;

  @ViewChild('dialogWindow')
  ElementRef dialogWindow;

}
