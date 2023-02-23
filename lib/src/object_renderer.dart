import '../simple_dart_ui_core.dart';

abstract class ObjectRenderer<T> extends PanelComponent {
  ObjectRenderer(String name) : super(name);

  T get object;

  set object(T newObject);
}
