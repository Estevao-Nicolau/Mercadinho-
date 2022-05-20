import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends InheritedWidget {
  CounterProvider({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}