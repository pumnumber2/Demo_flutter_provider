import 'package:mobx/mobx.dart';

// Include generated file
part 'transformStore.g.dart';

// This is the class used by rest of your codebase
class TransformText = _TransformText with _$TransformText;

// The store-class
abstract class _TransformText with Store {
  @observable
  String transform = '';

  @action
  void toggle() {
    transform = transform == 'lowercase' ? 'uppercase' : 'lowercase';
  }
}
