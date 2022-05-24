// import 'dart:async';

// import 'package:gaming_database_app/counter_event.dart';

// class CounterBloc {
//   int _counter = 0;

//   final _counterStateController = StreamController<int>();
//   StreamSink<int> get _inCounter => _counterStateController.sink;
//   Stream<int> get counter => _counterStateController.stream;

//   final _counterEventController = StreamController<CounterEvent>();
//   Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

//   //listen to value of counter
//   CounterBloc() {
//     _counterEventController.stream.listen(_mapEventToState);
//   }
//   void _mapEventToState(CounterEvent event) {
//     if (event is IncrementEvent)
//       _counter++;
//     else
//       _counter--;
//     _inCounter.add(_counter);
//   }

//   void dispose() {
//     _counterStateController.close();
//     _counterEventController.close();
//   }
// }
import 'package:gaming_database_app/counter_event.dart';
import 'package:gaming_database_app/counter_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);
  void decrement() {
    if (state > 0)
      emit(state - 1);
    else
      emit(state);
  }

  @override
  CounterState get intialState => CounterState.intial();

  @override
  Stream<CounterState> mapEventToState(
      CounterEvent event, CounterState state) async* {
    if (event is IncrementEvent) {
      yield state..counter += 1;
    } else if (event is DecrementEvent) {
      yield state..counter -= 1;
    }
  }
}
