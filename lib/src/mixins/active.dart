import 'dart:html';

mixin MixinActive {
  List<Element> get activateElements => [element];

  bool _active = false;

  Element get element;

  bool get active => _active;

  set active(bool newVal) {
    _active = newVal;
    for (final element in activateElements) {
      if (newVal) {
        element.classes.add('Active');
      } else {
        element.classes.remove('Active');
      }
    }
  }
}
