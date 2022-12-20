import 'dart:html';

import '../simple_dart_ui_core.dart';

enum Align { stretch, start, end, center }

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

  Align get vAlign => _vAlign;

  set vAlign(Align newValue) {
    _vAlign = newValue;
    if (!vertical) {
      switch (_vAlign) {
        case Align.stretch:
          element.style.alignItems = 'stretch';
          break;
        case Align.start:
          element.style.alignItems = 'flex-start';
          break;
        case Align.end:
          element.style.alignItems = 'flex-end';
          break;
        case Align.center:
          element.style.alignItems = 'center';
          break;
      }
    } else {
      switch (_vAlign) {
        case Align.stretch:
          element.style.justifyContent = 'stretch';
          break;
        case Align.start:
          element.style.justifyContent = 'flex-start';
          break;
        case Align.end:
          element.style.justifyContent = 'flex-end';
          break;
        case Align.center:
          element.style.justifyContent = 'center';
          break;
      }
    }
  }

  Align get hAlign => _hAlign;

  set hAlign(Align newValue) {
    _hAlign = newValue;
    if (!vertical) {
      switch (_hAlign) {
        case Align.stretch:
          element.style.justifyContent = 'stretch';
          break;
        case Align.start:
          element.style.justifyContent = 'flex-start';
          break;
        case Align.end:
          element.style.justifyContent = 'flex-end';
          break;
        case Align.center:
          element.style.justifyContent = 'center';
          break;
      }
    } else {
      switch (_hAlign) {
        case Align.stretch:
          element.style.alignItems = 'stretch';
          break;
        case Align.start:
          element.style.alignItems = 'flex-start';
          break;
        case Align.end:
          element.style.alignItems = 'flex-end';
          break;
        case Align.center:
          element.style.alignItems = 'center';
          break;
      }
    }
  }

  @override
  void reRender() {
    for (final child in children) {
      child.reRender();
    }
  }
}
