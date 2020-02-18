import 'package:demo_bloc_provider/bloc/search_view.dart';
import 'package:demo_bloc_provider/bloc_and_provider/search_bloc.dart';
import 'package:demo_bloc_provider/bloc_and_provider/search_box.dart';
import 'package:demo_bloc_provider/provider/basic.dart';
import 'package:demo_bloc_provider/provider/demo_change_notifier.dart';
import 'package:demo_bloc_provider/provider/demo_future_provider.dart';
import 'package:demo_bloc_provider/provider/demo_multiple_provider.dart';
import 'package:demo_bloc_provider/provider/demo_proxy_provider.dart';
import 'package:demo_bloc_provider/provider/demo_stream_provider.dart';
import 'package:demo_bloc_provider/provider/demo_value_listenable_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc_and_provider/search_view.dart';

// Reference: https://www.youtube.com/watch?v=TyMerwKXm30
void main() => runApp(DemoBlocProvider());

/// Demo Provider
class DemoProvider extends StatelessWidget {
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
        body: DemoStreamProvider(),
      ),
    );
  }
}

/// Demo Bloc
class DemoBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Bloc"),
        ),
        body: SearchView(),
      ),
    );
  }
}

/// Demo Bloc + Provider
class DemoBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Bloc"),
        ),
        // Use Bloc + Provider
        body: Provider<SearchBlocProvider>.value(
          value: SearchBlocProvider(),
          child: SearchView(),
        ),
      ),
    );
  }
}
