import 'package:angular/angular.dart';
import '../press_button/press_button_component.dart';
import '../label/label_dark/label_dark_component.dart';
import '../label/label_green/label_green_component.dart';
import '../label/label_yellow/label_yellow_component.dart';
import '../label/label_light/label_light_component.dart';


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
  ]
)
class MainComponent {}
