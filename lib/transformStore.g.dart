// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transformStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransformText on _TransformText, Store {
  final _$transformAtom = Atom(name: '_TransformText.transform');

  @override
  String get transform {
    _$transformAtom.reportRead();
    return super.transform;
  }

  @override
  set transform(String value) {
    _$transformAtom.reportWrite(value, super.transform, () {
      super.transform = value;
    });
  }

  final _$_TransformTextActionController =
      ActionController(name: '_TransformText');

  @override
  void toggle() {
    final _$actionInfo = _$_TransformTextActionController.startAction(
        name: '_TransformText.toggle');
    try {
      return super.toggle();
    } finally {
      _$_TransformTextActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transform: ${transform}
    ''';
  }
}
