import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonState extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return true;
  }

  void changeVisibility() {
    state = !state;
  }
}

final buttonProvider =
    AutoDisposeNotifierProvider<ButtonState, bool>(ButtonState.new);
