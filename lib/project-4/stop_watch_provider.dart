import 'dart:async';
import 'package:flutter/foundation.dart';

class StopwatchProvider with ChangeNotifier {
  int _elapsedTime = 0; // in seconds
  Timer? _timer;
  bool _isRunning = false;

  int get elapsedTime => _elapsedTime;
  bool get isRunning => _isRunning;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedTime++;
        notifyListeners();
      });
    }
  }

  void stop() {
    if (_isRunning) {
      _isRunning = false;
      _timer?.cancel();
    }
  }

  void reset() {
    _elapsedTime = 0;
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }
}