import 'package:flutter/foundation.dart';

class CounterState {
  int counter = 0;
  CounterState._();
  factory CounterState.intial() {
    return CounterState._()..counter = 0;
  }
}
