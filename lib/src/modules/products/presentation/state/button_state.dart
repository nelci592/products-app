import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonState extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return true;
  }

  void hideButton() {
    state = false;
  }
}

final buttonProvider =
    AutoDisposeNotifierProvider<ButtonState, bool>(ButtonState.new);
