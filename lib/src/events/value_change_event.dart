import 'dart:async';

class ValueChangeEvent<T> {
  ValueChangeEvent(this.oldValue, this.newValue);

  late T oldValue;
  late T newValue;
}

mixin ValueChangeEventSource<T> {
  final StreamController<ValueChangeEvent<T>> _onValueChange = StreamController<ValueChangeEvent<T>>.broadcast();

  Stream<ValueChangeEvent<T>> get onValueChange => _onValueChange.stream;

  void fireValueChange(T oldValue, T newValue) {
    _onValueChange.sink.add(ValueChangeEvent(oldValue, newValue));
  }

  void dispose() {
    _onValueChange.close();
  }
}
