import '../simple_dart_ui_core.dart';

abstract class StateComponent<T> {
  String get varName;

  set varName(String value);

  Stream<ValueChangeEvent<T>> get onValueChange;

  String get state;

  set state(String value);
}
