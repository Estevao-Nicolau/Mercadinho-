import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Explo Contador'),
      ),
      body: Column(
        children: <Widget>[
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
              onPressed: () {
                provider?.state.inc();
              },
              icon: Icon(
                Icons.add,
              )),IconButton(
              onPressed: () {
                provider?.state.dec();
              },
              icon: Icon(
                Icons.remove
              )),
        ],
      ),
    );
  }
}
