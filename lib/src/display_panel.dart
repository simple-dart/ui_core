import '../simple_dart_ui_core.dart';

abstract class DisplayPanel<T> extends PanelComponent {
  DisplayPanel(String name) : super(name);

  T get value;

  set value(T newValue);
}
