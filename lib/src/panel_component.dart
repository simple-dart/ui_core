import 'dart:html';

import '../simple_dart_ui_core.dart';


abstract class PanelComponent extends Component {
  final DivElement _element = DivElement();

  List<Component> children = [];

  String _spacing = '0px';
  bool _vertical = false;
  bool _scrollable = false;
  Align _vAlign = Align.start;
  Align _hAlign = Align.stretch;

  PanelComponent(String className) : super(className) {
    element.style
      ..display = 'flex'
      ..flexShrink = '0'
      ..flexGrow = '0'
      ..overflow = 'hidden';
    vertical = false;
  }

  @override
  Element get element => _element;

  int indexOf(Component child) => children.indexOf(child);

  void add(Component component) {
    children.add(component);
    element.children.add(component.element);
    spacing = _spacing;
  }

  void insert(int index, Component component) {
    children.insert(index, component);
    element.children.insert(index, component.element);
    spacing = _spacing;
  }

  void addAll(List<Component> components) {
    children.addAll(components);
    element.children.addAll(components.map((c) => c.element));
    spacing = _spacing;
  }

  void removeComponent(Component component) {
    children.remove(component);
    element.children.remove(component.element);
    spacing = _spacing;
  }

  void clear() {
    element.children.clear();
    children.clear();
  }

  bool get vertical => _vertical;

  set vertical(bool _newVal) {
    _vertical = _newVal;
    if (_vertical) {
      element.style.flexDirection = 'column';
    } else {
      element.style.flexDirection = 'row';
    }

    spacing = _spacing;
    scrollable = _scrollable;
    vAlign = _vAlign;
    hAlign = _hAlign;
  }

  String get spacing => _spacing;

  set spacing(String _newVal) {
    if (_spacing == _newVal && _spacing == '0px') {
      return;
    }
    _spacing = _newVal;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final isLast = i == (children.length - 1);
      if (_vertical) {
        if (!isLast) {
          child.element.style.marginBottom = _spacing;
        } else {
          child.element.style.marginBottom = '';
        }
        if (wrap) {
          child.element.style.marginRight = _spacing;
        } else {
          child.element.style.marginRight = '';
        }
      } else {
        if (!isLast) {
          child.element.style.marginRight = _spacing;
        } else {
          child.element.style.marginRight = '';
        }

        if (wrap) {
          child.element.style.marginBottom = _spacing;
        } else {
          child.element.style.marginBottom = '';
        }
      }
    }
  }

  bool get scrollable => _scrollable;

  set scrollable(bool _newVal) {
    _scrollable = _newVal;
    if (_scrollable) {
      if (_vertical) {
        element.style.overflowY = 'scroll';
      } else {
        element.style.overflowX = 'scroll';
      }
    } else {
      if (_vertical) {
        element.style.overflowY = 'hidden';
      } else {
        element.style.overflowX = 'hidden';
      }
    }
  }

  @override
  Align get vAlign => _vAlign;

  @override
  set vAlign(Align newValue) {
    _vAlign = newValue;
    if (!vertical) {
      element.style.alignItems = _vAlign.name;
    } else {
      element.style.justifyContent = _vAlign.name;
    }
  }

  @override
  Align get hAlign => _hAlign;

  @override
  set hAlign(Align newValue) {
    _hAlign = newValue;
    if (!vertical) {
      element.style.justifyContent = _hAlign.name;
    } else {
      element.style.alignItems = _hAlign.name;
    }
  }

  @override
  void reRender() {
    for (final child in children) {
      child.reRender();
    }
  }
}
