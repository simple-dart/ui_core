# Simple Dart UI Core

Core for creating GUI on Dart.

Read in other languages: [English](README.md), [Russian](README.ru.md).

## Components

- [Component](#component)
- [PanelComponent](#panelcomponent)
- [Panel](#panel)
- [Mixins](#mixins)
- [Events](#events)
- [StateComponent](#statecomponent)

## Component

Essentially Component is a wrapper over a DOM element. All components inherit from Component.
If you need to create a component that will contain other components, then you need to
use [PanelComponent](#panelcomponent).

Each component has a getter `element` - this is the DOM element that will be displayed on the page.
Component properties and methods:

- varName - variable name. Added as a 'varName' attribute to the DOM element. Used for debugging and for saving
  component state in Url.
- visible - component visibility.
- width - width of the component. Can be specified as a percentage or in pixels. There is a fullWidth() method for
  convenience.
- height - height of the component. Can be specified as a percentage or in pixels. There is a fullHeight() method for
  convenience.
- fillContent - the component will grow to fill all the available space with the component.
- shrinkable - the component will shrink when there is not enough space.
- padding - padding of the component. Can be specified as a percentage or in pixels.
- warp - line wrapping.
- wordWrap - word wrap.
- remove() - remove the component from the DOM tree.
- reRender() - component redrawing. Should be called when changing any parameters that are not directly
  are stored in the element - such as the language of the application or theme.
- clearClasses(), addCssClass() ... methods to simplify adding and removing CSS classes.

Direct access to a DOM element via `element` is not recommended.

## PanelComponent

PanelComponent is an abstract class designed to create components that will contain other
Components.
In the PanelComponent constructor, you must specify the class name for the CSS.

In essence, a PanelComponent is a wrapper over a DOM element to make it easier to work with the layout of components.
Contains a list of children components. And methods for adding and removing components.
Properties that are wrapped by the PanelComponent wrapper:

- vertical - vertical arrangement of components.
- spacing - distance between components. Specified as a percentage or in pixels.
- vAlign - vertical alignment of components.
- hAlign - horizontal alignment of components.
- scrollable - adds scroll on overflow.
  If there are components that are added to the panel dynamically, then you need to override the `reRender()` method for
  them
  redraws.

## Panel

Panel - inherits from [PanelComponent](#panelcomponent) without adding functionality.
The main tool for laying out components. Deriving from Panel is not recommended.

## Mixins

- MixinActivate - Mixes the Active style into the component.
- MixinDisable - Mixes the Disabled style and the disabled attribute into the component.

## Events

- ValueChangeEvent<T> - Component value change event. Passes the new and old values.
- mixin ValueChangeEventSource<T> - mixes the source of the ValueChangeEvent event into the class.

## StateComponent

StateComponent is a component interface whose state can be read and set from a string. Is used for
save the state of the component in the URL.

## Factories

- ComponentFactory - Component factory interface.
- PanelComponentFactory - Panel factory interface.