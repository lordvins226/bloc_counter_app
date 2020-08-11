import 'package:bloc_counter_app/counter_bloc.dart';
import 'package:flutter/material.dart';

import 'counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter BLoC Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (context, AsyncSnapshot<int> snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
