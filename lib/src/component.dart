import 'dart:html';

abstract class Component {
  Element get element;

  bool _visible = true;
  bool _warp = false;
  bool _fillContent = false;
  bool _breakWords = false;
  bool _shrinkable = false;

  Component(String className) {
    addCssClass(className);
  }

  set varName(String varName) {
    element.setAttribute('varName', varName);
  }

  String get varName => element.getAttribute('varName') ?? '';

  bool get fillContent => _fillContent;

  set fillContent(bool newVal) {
    _fillContent = newVal;
    if (_fillContent) {
      element.style.flex = '1';
    } else {
      element.style.flex = '';
    }
  }

  bool get visible => _visible;

  set visible(bool _newVisible) {
    if (_visible != _newVisible) {
      _visible = _newVisible;
      if (_newVisible) {
        element.style.display = 'flex';
      } else {
        element.style.display = 'none';
      }
    }
  }

  set width(String _newWidth) {
    element.style.width = _newWidth;
  }

  String get width => element.style.width;

  set height(String _newHeight) {
    element.style.height = _newHeight;
  }

  String get height => element.style.height;

  void fullSize() {
    width = '100%';
    height = '100%';
  }

  void fullWidth() {
    width = '100%';
  }

  void fullHeight() {
    height = '100%';
  }

  bool get wrap => _warp;

  set wrap(bool _newVal) {
    _warp = _newVal;
    if (_warp) {
      element.style.flexWrap = 'wrap';
    } else {
      element.style.flexWrap = 'nowrap';
    }
  }

  bool get breakWords => _breakWords;

  set breakWords(bool _newVal) {
    _breakWords = _newVal;
    if (_breakWords) {
      element.style.overflowWrap = 'anywhere';
    } else {
      element.style.wordBreak = 'normal';
    }
  }

  bool get shrinkable => _shrinkable;

  set shrinkable(bool _newVal) {
    _shrinkable = _newVal;
    if (_shrinkable) {
      element.style.flexShrink = '1';
    } else {
      element.style.flexShrink = '0';
    }
  }

  set padding(String padding) => element.style.padding = padding;

  String get padding => (element.style.padding.isEmpty) ? '0px' : element.style.padding;

  void clearClasses() {
    element.classes.clear();
  }

  void addCssClasses(List<String> classNames) {
    element.classes.addAll(classNames);
  }

  void addCssClass(String className) {
    element.classes.add(className);
  }

  void setCssClass(String className) {
    element.classes
      ..clear()
      ..add(className);
  }

  bool hasCssClass(String className) => element.classes.contains(className);

  void removeCssClasses(List<String> className) {
    element.classes.removeAll(className);
  }

  void removeCssClass(String className) {
    element.classes.remove(className);
  }

  void remove() {
    element.remove();
  }

  void reRender() {}
}
