import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaming_database_app/counter_bloc.dart';
import 'package:gaming_database_app/counter_event.dart';
import 'package:gaming_database_app/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = CounterBloc();
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: CounterBlocWidget(),
      create: (context) => bloc,
    );
  }
}

class CounterBlocWidget extends StatelessWidget {
  const CounterBlocWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: BlocProvider.of<CounterBloc>(context),
            builder: (BuildContext context, int state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      "${state}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
