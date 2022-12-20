import 'dart:html';

mixin MixinDisable {
  Element get element;

  List<Element> get disableElements => [element];

  bool _disabled = false;

  bool get disabled => _disabled;

  set disabled(bool newVal) {
    _disabled = newVal;
    for (final element in disableElements) {
      if (newVal) {
        element.setAttribute('disabled', '');
        element.classes.add('Disabled');
      } else {
        element.removeAttribute('disabled');
        element.classes.remove('Disabled');
      }
    }
  }

  bool get enabled => !disabled;

  set enabled(bool newVal) => disabled = !newVal;
}
