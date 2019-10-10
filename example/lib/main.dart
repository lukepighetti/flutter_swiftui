import 'package:flutter/material.dart';
import 'package:swiftui/swiftui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: _Home(),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("padded").padded(8),
        Text("offsetX").offsetX(100),
        Text("offsetY").offsetY(-200),
        Text("offsetDegrees").offsetDegrees(180, 100),
        Text("foo").border(Border.all()),
        Text("More padded").padded(40),
      ],
    );
  }
}
