import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateProvider((ref) => TimerNotifier());

class TimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  TimerNotifier() : super(60);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state - 1;
      if (state <= 0) {
        _timer?.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
