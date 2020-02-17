import 'package:demo_bloc_provider/provider/basic.dart';
import 'package:demo_bloc_provider/provider/demo_change_notifier.dart';
import 'package:demo_bloc_provider/provider/demo_future_provider.dart';
import 'package:demo_bloc_provider/provider/demo_multiple_provider.dart';
import 'package:flutter/material.dart';

// Reference: https://www.youtube.com/watch?v=TyMerwKXm30
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider"),
        ),
        body: DemoMultipleProvider(),
      ),
    );
  }
}
