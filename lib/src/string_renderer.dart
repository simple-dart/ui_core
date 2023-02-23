import '../simple_dart_ui_core.dart';

class StringRenderer<T> extends ObjectRenderer<T> {
  late T _object;

  StringRenderer() : super('LabelDisplayPanel');

  @override
  T get object => _object;

  @override
  set object(T newObject) {
    _object = newObject;
    element.text = newObject.toString();
  }
}
